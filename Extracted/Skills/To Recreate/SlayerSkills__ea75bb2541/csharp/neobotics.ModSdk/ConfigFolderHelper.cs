using System.IO;
using BepInEx;

namespace neobotics.ModSdk;

public static class ConfigFolderHelper
{
	private const string ROOT = "Neobotics";

	public static string GetOrCreateModConfigFolder(string modName)
	{
		string text = Path.Combine(Paths.ConfigPath, "Neobotics", modName);
		Directory.CreateDirectory(text);
		return text;
	}
}
