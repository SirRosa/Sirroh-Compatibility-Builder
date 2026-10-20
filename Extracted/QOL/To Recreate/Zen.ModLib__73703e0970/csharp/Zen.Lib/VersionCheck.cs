using System.Linq;
using BepInEx;

namespace Zen.Lib;

internal static class VersionCheck
{
	private static bool _ignoreVersionCheck;

	private static readonly (Platforms Platform, GameVersion Version)[] RequiredVersions = new (Platforms, GameVersion)[3]
	{
		((Platforms)1, new GameVersion(1, 0, 20)),
		((Platforms)2, new GameVersion(1, 0, 20)),
		((Platforms)16, new GameVersion(1, 0, 20))
	};

	public static bool IsValid
	{
		get
		{
			//IL_003e: Unknown result type (might be due to invalid IL or missing references)
			if (_ignoreVersionCheck)
			{
				return true;
			}
			if (ModLib.Configs.EnableValheimVersionCheck.Value)
			{
				return RequiredVersions.Select(((Platforms Platform, GameVersion Version) v) =>
				{
					//IL_0001: Unknown result type (might be due to invalid IL or missing references)
					return v.Version;
				}).Contains(Version.CurrentVersion);
			}
			if (!_ignoreVersionCheck)
			{
				Logging<ModLib>.Warning("Valheim version check is disabled!");
			}
			return _ignoreVersionCheck = true;
		}
	}

	public static string GetVersions()
	{
		return string.Join(", ", RequiredVersions);
	}

	public static bool TryVerify(ZenMod mod)
	{
		if (IsValid)
		{
			return true;
		}
		Logging<ModLib>.Error(Message(mod), 0);
		return false;
	}

	private static string Message(ZenMod mod)
	{
		//IL_0020: Unknown result type (might be due to invalid IL or missing references)
		return string.Format("\r\n================================================================================\r\n{0}\r\n!!! VERSION MISMATCH !!!\r\nValheim installed: {1}, required: {2} \r\nChange the version of Valheim you have installed or upgrade your mods.\r\nSee the {3} config file for more info.\r\n================================================================================\r\n", new object[4]
		{
			((BaseUnityPlugin)mod).Info.Metadata.GUID,
			Version.CurrentVersion,
			GetVersions(),
			"Zen.ModLib"
		});
	}

	static VersionCheck()
	{
		//IL_000d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0023: Unknown result type (might be due to invalid IL or missing references)
		//IL_003a: Unknown result type (might be due to invalid IL or missing references)
	}
}
