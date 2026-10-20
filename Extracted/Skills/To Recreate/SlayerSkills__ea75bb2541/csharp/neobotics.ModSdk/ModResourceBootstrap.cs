using System;
using System.IO;
using System.Reflection;

namespace neobotics.ModSdk;

public static class ModResourceBootstrap
{
	public static string InitializeModResources(Type pluginType, string modName)
	{
		string orCreateModConfigFolder = ConfigFolderHelper.GetOrCreateModConfigFolder(modName);
		string? name = pluginType.Assembly.GetName().Name;
		if (!Directory.Exists(orCreateModConfigFolder))
		{
			Directory.CreateDirectory(orCreateModConfigFolder);
			Logging.Instance.Debug("Created subfolder layout: " + orCreateModConfigFolder);
		}
		string text = name + ".Resources.";
		Logging.Instance.Debug("Scanning assembly for standard prefix: " + text);
		ExtractResources(pluginType.Assembly, text, orCreateModConfigFolder);
		return orCreateModConfigFolder;
	}

	private static void ExtractResources(Assembly asm, string prefix, string targetFolder)
	{
		string[] manifestResourceNames = asm.GetManifestResourceNames();
		foreach (string text in manifestResourceNames)
		{
			if (!text.StartsWith(prefix, StringComparison.OrdinalIgnoreCase))
			{
				continue;
			}
			string text2 = text.Substring(prefix.Length);
			string text3 = Path.Combine(targetFolder, text2);
			if (File.Exists(text3))
			{
				continue;
			}
			try
			{
				Logging.Instance.Debug("Extracting asset: " + text2 + " -> " + text3);
				using Stream stream = asm.GetManifestResourceStream(text);
				if (stream == null)
				{
					Logging.Instance.Error("Could not access resource stream for: " + text);
					continue;
				}
				using FileStream destination = File.Create(text3);
				stream.CopyTo(destination);
			}
			catch (Exception ex)
			{
				Logging.Instance.Error("Failed to unpack embedded asset " + text2 + ": " + ex.Message);
			}
		}
	}
}
