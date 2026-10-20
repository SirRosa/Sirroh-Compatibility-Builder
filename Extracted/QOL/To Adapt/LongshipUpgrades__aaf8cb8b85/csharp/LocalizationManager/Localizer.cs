using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Text;
using BepInEx;
using BepInEx.Bootstrap;
using BepInEx.Configuration;
using HarmonyLib;
using JetBrains.Annotations;
using LongshipUpgrades;
using Splatform;
using UnityEngine;
using YamlDotNet.Serialization;

namespace LocalizationManager;

[PublicAPI]
public class Localizer
{
	private const string defaultLanguage = "English";

	private static readonly Dictionary<string, Dictionary<string, Func<string>>> PlaceholderProcessors = new Dictionary<string, Dictionary<string, Func<string>>>();

	private static readonly Dictionary<string, Dictionary<string, string>> loadedTexts = new Dictionary<string, Dictionary<string, string>>();

	private static readonly ConditionalWeakTable<Localization, string> localizationLanguage = new ConditionalWeakTable<Localization, string>();

	private static readonly List<WeakReference<Localization>> localizationObjects = new List<WeakReference<Localization>>();

	private static BaseUnityPlugin? _plugin;

	private static readonly List<string> fileExtensions = new List<string> { ".json", ".yml" };

	private static bool initialized;

	private static bool localizationEnabled;

	private static BaseUnityPlugin Plugin
	{
		get
		{
			//IL_00a8: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b2: Expected Obj, but got Unknown
			if (_plugin == null)
			{
				IEnumerable<TypeInfo> source;
				try
				{
					source = Assembly.GetExecutingAssembly().DefinedTypes.ToList();
				}
				catch (ReflectionTypeLoadException ex)
				{
					source = from t in ex.Types
						where t != null
						select t.GetTypeInfo();
				}
				_plugin = (BaseUnityPlugin)Chainloader.ManagerObject.GetComponent((Type)source.First((TypeInfo t) => t.IsClass && typeof(BaseUnityPlugin).IsAssignableFrom(t)));
			}
			return _plugin;
		}
	}

	private static void UpdatePlaceholderText(Localization localization, string key)
	{
		localizationLanguage.TryGetValue(localization, out string value);
		string text = loadedTexts[value][key];
		if (PlaceholderProcessors.TryGetValue(key, out Dictionary<string, Func<string>> value2))
		{
			text = value2.Aggregate(text, (string current, KeyValuePair<string, Func<string>> kv) => current.Replace("{" + kv.Key + "}", kv.Value()));
		}
		localization.AddWord(key, text);
	}

	public static void AddPlaceholder<T>(string key, string placeholder, ConfigEntry<T> config, Func<T, string>? convertConfigValue = null) where T : notnull
	{
		if (convertConfigValue == null)
		{
			convertConfigValue = (T val) => val.ToString();
		}
		if (!PlaceholderProcessors.ContainsKey(key))
		{
			PlaceholderProcessors[key] = new Dictionary<string, Func<string>>();
		}
		config.SettingChanged += (object _, EventArgs _) =>
		{
			UpdatePlaceholder();
		};
		if (loadedTexts.ContainsKey(Localization.instance.GetSelectedLanguage()))
		{
			UpdatePlaceholder();
		}
		void UpdatePlaceholder()
		{
			PlaceholderProcessors[key][placeholder] = () => convertConfigValue(config.Value);
			UpdatePlaceholderText(Localization.instance, key);
		}
	}

	public static void AddText(string key, string text)
	{
		List<WeakReference<Localization>> list = new List<WeakReference<Localization>>();
		foreach (WeakReference<Localization> localizationObject in localizationObjects)
		{
			if (localizationObject.TryGetTarget(out var target))
			{
				Dictionary<string, string> dictionary = loadedTexts[localizationLanguage.GetOrCreateValue(target)];
				if (!target.m_translations.ContainsKey(key))
				{
					dictionary[key] = text;
					target.AddWord(key, text);
				}
			}
			else
			{
				list.Add(localizationObject);
			}
		}
		foreach (WeakReference<Localization> item in list)
		{
			localizationObjects.Remove(item);
		}
	}

	public static void Initialize()
	{
		//IL_0012: Unknown result type (might be due to invalid IL or missing references)
		//IL_0018: Invalid comparison between Unknown and I4
		//IL_002b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0031: Expected Obj, but got Unknown
		//IL_005f: Unknown result type (might be due to invalid IL or missing references)
		//IL_006c: Expected Obj, but got Unknown
		if (!initialized)
		{
			initialized = true;
			if ((int)SystemInfo.graphicsDeviceType != 4)
			{
				EnsureYamlDotNetAvailable();
				Harmony val = new Harmony("org.bepinex.helpers.LocalizationManager");
				val.Patch((MethodBase)AccessTools.DeclaredMethod(typeof(Localization), "SetupLanguage", (Type[])null, (Type[])null), (HarmonyMethod)null, new HarmonyMethod(AccessTools.DeclaredMethod(typeof(Localizer), "LoadLocalization", (Type[])null, (Type[])null)), (HarmonyMethod)null, (HarmonyMethod)null, (HarmonyMethod)null);
				localizationEnabled = true;
			}
		}
	}

	public static void ApplyCurrentLocalization()
	{
		if (!localizationEnabled || Localization.m_instance == null)
		{
			return;
		}
		string language = "English";
		if (PlatformManager.DistributionPlatform != null && PlatformInitializer.PreferencesInitialized)
		{
			string selectedLanguage = Localization.m_instance.GetSelectedLanguage();
			if (string.IsNullOrEmpty(selectedLanguage))
			{
				PlatformPrefs.SetString("language", "English");
			}
			else
			{
				language = selectedLanguage;
			}
		}
		LoadLocalization(Localization.m_instance, language);
	}

	private static void EnsureYamlDotNetAvailable()
	{
		try
		{
			if (Type.GetType("YamlDotNet.Serialization.DeserializerBuilder, YamlDotNet", throwOnError: false) != null)
			{
				return;
			}
		}
		catch (Exception innerException)
		{
			throw new FileNotFoundException("YamlDotNet is required for localization but could not be loaded. Install ValheimModding-YamlDotNet.", innerException);
		}
		throw new FileNotFoundException("YamlDotNet is required for localization but could not be loaded. Install ValheimModding-YamlDotNet.");
	}

	private static void LoadLocalization(Localization __instance, string language)
	{
		//IL_00fb: Unknown result type (might be due to invalid IL or missing references)
		//IL_0105: Expected Obj, but got Unknown
		//IL_01e8: Unknown result type (might be due to invalid IL or missing references)
		//IL_01f2: Expected Obj, but got Unknown
		if (!localizationLanguage.Remove(__instance))
		{
			localizationObjects.Add(new WeakReference<Localization>(__instance));
		}
		localizationLanguage.Add(__instance, language);
		Dictionary<string, string> localizationFiles = new Dictionary<string, string>();
		string[] prefixes = new string[2]
		{
			Plugin.Info.Metadata.Name + ".",
			Plugin.Info.Metadata.Name.Replace(" ", "") + "."
		};
		Scan(Paths.ConfigPath, warn: true);
		Scan(Paths.PluginPath, warn: false);
		byte[] array = LoadTranslationFromAssembly("English");
		if (array == null)
		{
			throw new Exception("Found no English localizations in mod " + Plugin.Info.Metadata.Name + ". Expected an embedded resource Translations/English.json or Translations/English.yml.");
		}
		Dictionary<string, string> dictionary = ((BuilderSkeleton<DeserializerBuilder>)new DeserializerBuilder()).IgnoreFields().Build().Deserialize<Dictionary<string, string>>(Encoding.UTF8.GetString(array));
		if (dictionary == null)
		{
			throw new Exception("Localization for mod " + Plugin.Info.Metadata.Name + " failed: Localization file was empty.");
		}
		string text = null;
		if (language != "English")
		{
			if (localizationFiles.ContainsKey(language))
			{
				text = File.ReadAllText(localizationFiles[language]);
			}
			else
			{
				byte[] array2 = LoadTranslationFromAssembly(language);
				if (array2 != null)
				{
					text = Encoding.UTF8.GetString(array2);
				}
			}
		}
		if (text == null && localizationFiles.ContainsKey("English"))
		{
			text = File.ReadAllText(localizationFiles["English"]);
		}
		if (text != null)
		{
			Dictionary<string, string> dictionary2;
			try
			{
				dictionary2 = ((BuilderSkeleton<DeserializerBuilder>)new DeserializerBuilder()).IgnoreFields().Build().Deserialize<Dictionary<string, string>>(text) ?? new Dictionary<string, string>();
			}
			catch (Exception arg)
			{
				global::LongshipUpgrades.LongshipUpgrades.LogInfo($"Failed to deserialize localization for language '{language}'. Using base localization only.\n{arg}");
				dictionary2 = new Dictionary<string, string>();
			}
			foreach (KeyValuePair<string, string> item in dictionary2)
			{
				dictionary[item.Key] = item.Value;
			}
		}
		loadedTexts[language] = dictionary;
		foreach (KeyValuePair<string, string> item2 in dictionary)
		{
			UpdatePlaceholderText(__instance, item2.Key);
		}
		void Scan(string root, bool warn)
		{
			foreach (string item3 in from f in Directory.GetFiles(root, "*.*", SearchOption.AllDirectories)
				where fileExtensions.Contains(Path.GetExtension(f))
				select f)
			{
				string fileNameWithoutExtension = Path.GetFileNameWithoutExtension(item3);
				string[] array3 = prefixes;
				foreach (string text2 in array3)
				{
					if (fileNameWithoutExtension.StartsWith(text2))
					{
						string text3 = fileNameWithoutExtension.Substring(text2.Length);
						if (!string.IsNullOrWhiteSpace(text3))
						{
							if (localizationFiles.ContainsKey(text3))
							{
								if (warn)
								{
									global::LongshipUpgrades.LongshipUpgrades.LogWarning("Duplicate localization '" + text3 + "' for " + Plugin.Info.Metadata.Name + ". Skipping " + item3);
								}
							}
							else
							{
								localizationFiles[text3] = item3;
							}
						}
						break;
					}
				}
			}
		}
	}

	private static byte[]? LoadTranslationFromAssembly(string language)
	{
		foreach (string fileExtension in fileExtensions)
		{
			byte[] array = ReadEmbeddedFileBytes("translations." + language + fileExtension);
			if (array != null)
			{
				return array;
			}
		}
		return null;
	}

	public static byte[]? ReadEmbeddedFileBytes(string resourceFileName, Assembly? containingAssembly = null)
	{
		using MemoryStream memoryStream = new MemoryStream();
		if ((object)containingAssembly == null)
		{
			containingAssembly = Assembly.GetCallingAssembly();
		}
		string text = containingAssembly.GetManifestResourceNames().FirstOrDefault((string str) => str.EndsWith(resourceFileName, StringComparison.Ordinal));
		if (text != null)
		{
			containingAssembly.GetManifestResourceStream(text)?.CopyTo(memoryStream);
		}
		return (memoryStream.Length == 0L) ? null : memoryStream.ToArray();
	}
}
