using System.IO;
using System.Reflection;

namespace Runic.Localization;

internal static class RunicText
{
	private static readonly Assembly Owner = typeof(RunicText).Assembly;

	private static readonly string Module = Owner.GetName().Name;

	private static readonly LanguageCatalog Catalog = Create();

	private static LanguageCatalog Create()
	{
		using Stream stream = Owner.GetManifestResourceStream("Runic.Localization.English.json");
		using StreamReader streamReader = ((stream == null) ? null : new StreamReader(stream));
		return new LanguageCatalog(streamReader?.ReadToEnd() ?? "{}", ReadLanguage);
	}

	private static string ReadLanguage(string language)
	{
		string path = Path.Combine(Path.Combine(Path.GetDirectoryName(Owner.Location), "Translations", Module), language + ".json");
		if (!File.Exists(path))
		{
			return null;
		}
		return File.ReadAllText(path);
	}

	private static void SelectLanguage()
	{
		string language = "English";
		try
		{
			Localization instance = Localization.instance;
			language = ((instance != null) ? instance.GetSelectedLanguage() : null) ?? "English";
		}
		catch
		{
		}
		Catalog.Select(language);
	}

	internal static string Get(string key)
	{
		SelectLanguage();
		return Catalog.Get(key);
	}

	internal static string English(string key)
	{
		return Catalog.English(key);
	}

	internal static string TranslateEnglish(string text)
	{
		SelectLanguage();
		return Catalog.TranslateEnglish(text);
	}

	internal static string Format(string key, params object[] args)
	{
		SelectLanguage();
		return Catalog.Format(key, args);
	}
}
