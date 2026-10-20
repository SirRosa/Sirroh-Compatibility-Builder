using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using BepInEx;
using YamlDotNet.Serialization;

namespace QuickStackStore;

internal class LocalizationLoader
{
	private const string keyPrefix = "quickstackstore_";

	public static string[] supportedEmbeddedLanguages = new string[12]
	{
		"English", "Chinese", "Russian", "French", "Portuguese_Brazilian", "Polish", "Swedish", "Korean", "Italian", "Ukrainian",
		"Spanish", "German"
	};

	private const string embeddedLanguagePathFormat = "QuickStackStore.Translations.QuickStackStore.{0}.json";

	private const string loadingLog = "Loading {0} translation file for language: {1}";

	private const string failedLoadLog = "Failed loading {0} translation file for language: {1}";

	private const string external = "external";

	private const string embedded = "embedded";

	internal static void SetupTranslations()
	{
		string selectedLanguage = Localization.instance.GetSelectedLanguage();
		LocalizationConfig.FixTakeAllDefaultText(Localization.instance, selectedLanguage);
		string[] files = Directory.GetFiles(Path.GetDirectoryName(Paths.PluginPath), "QuickStackStore.*.json", SearchOption.AllDirectories);
		bool flag = false;
		string[] array = files;
		foreach (string path in array)
		{
			string text = Path.GetFileNameWithoutExtension(path).Split(new char[1] { '.' })[1];
			if (text == selectedLanguage)
			{
				Helper.Log(string.Format("Loading {0} translation file for language: {1}", "external", selectedLanguage), QSSConfig.DebugSeverity.Everything);
				if (!LoadExternalLanguageFile(selectedLanguage, path))
				{
					Helper.LogO(string.Format("Failed loading {0} translation file for language: {1}", "external", selectedLanguage));
				}
				else
				{
					flag = true;
				}
				break;
			}
		}
		if (!flag && selectedLanguage != "English" && supportedEmbeddedLanguages.Contains(selectedLanguage))
		{
			Helper.Log(string.Format("Loading {0} translation file for language: {1}", "embedded", selectedLanguage), QSSConfig.DebugSeverity.Everything);
			if (!LoadEmbeddedLanguageFile(selectedLanguage))
			{
				Helper.LogO(string.Format("Failed loading {0} translation file for language: {1}", "embedded", selectedLanguage));
			}
		}
		Helper.Log(string.Format("Loading {0} translation file for language: {1}", "embedded", "English"), QSSConfig.DebugSeverity.Everything);
		if (!LoadEmbeddedLanguageFile("English"))
		{
			Helper.LogO(string.Format("Failed loading {0} translation file for language: {1}", "embedded", "English"));
		}
	}

	internal static bool LoadExternalLanguageFile(string language, string path)
	{
		string text = File.ReadAllText(path);
		if (text == null)
		{
			return false;
		}
		return ParseStringToLanguage(language, text);
	}

	internal static bool LoadEmbeddedLanguageFile(string language)
	{
		string text = ReadEmbeddedTextFile($"QuickStackStore.Translations.QuickStackStore.{language}.json");
		if (text == null)
		{
			return false;
		}
		return ParseStringToLanguage(language, text);
	}

	internal static bool ParseStringToLanguage(string language, string translationAsString)
	{
		Dictionary<string, string> dictionary = new DeserializerBuilder().IgnoreFields().Build().Deserialize<Dictionary<string, string>>(translationAsString);
		if (dictionary == null || dictionary.Count == 0)
		{
			return false;
		}
		foreach (KeyValuePair<string, string> item in dictionary)
		{
			AddForLanguage(language, item.Key, item.Value);
		}
		return true;
	}

	internal static void AddForLanguage(string language, string key, string value)
	{
		string text = "quickstackstore_" + key.ToLower();
		bool flag = Localization.instance.GetSelectedLanguage() == language;
		bool flag2 = language == "English" && !Localization.instance.m_translations.ContainsKey(text);
		if (flag | flag2)
		{
			Localization.instance.AddWord(text, value);
		}
	}

	public static string ReadEmbeddedTextFile(string path)
	{
		Assembly executingAssembly = Assembly.GetExecutingAssembly();
		Stream manifestResourceStream = executingAssembly.GetManifestResourceStream(path);
		if (manifestResourceStream == null)
		{
			return null;
		}
		using MemoryStream memoryStream = new MemoryStream();
		manifestResourceStream.CopyTo(memoryStream);
		byte[] array = ((memoryStream.Length > 0) ? memoryStream.ToArray() : null);
		return (array != null) ? Encoding.UTF8.GetString(array) : null;
	}
}
