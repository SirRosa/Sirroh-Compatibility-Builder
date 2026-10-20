using System.IO;
using BepInEx;

namespace Zen.Lib;

internal static class DataFile
{
	private static DirectoryInfo GetDataDir(string subPath)
	{
		return Directory.CreateDirectory(Path.Combine(Path.Combine(Paths.ConfigPath, "ZenDragon.Data"), subPath));
	}

	internal static bool TryGetFile(ZenMod mod, string filename, out FileInfo fileInfo)
	{
		fileInfo = new FileInfo(Path.Combine(GetDataDir(((BaseUnityPlugin)mod).Info.Metadata.Name).FullName, filename));
		return fileInfo.Exists;
	}
}
