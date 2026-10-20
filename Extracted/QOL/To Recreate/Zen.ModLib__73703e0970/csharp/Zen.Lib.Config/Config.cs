using System;
using System.Collections.Generic;
using System.Linq;
using BepInEx.Configuration;

namespace Zen.Lib.Config;

public static class Config
{
	internal static ConfigFile? File;

	public static IEnumerable<string> ContainersCommon => new _003C_003Ez__ReadOnlyArray<string>(new string[9] { "piece_chest_wood", "piece_chest", "piece_chest_barrel", "piece_chest_blackmetal", "piece_chest_grausten", "piece_chest_warderobe", "piece_pot1", "piece_pot2", "piece_pot3" });

	public static IEnumerable<string> ContainersAll => ContainersCommon.Concat(new _003C_003Ez__ReadOnlyArray<string>(new string[4] { "piece_chest_private", "piece_gift1", "piece_gift2", "piece_gift3" }));

	public static ConfigEntry<T> Define<T>(bool isAdmin, string section, string key, T defaultValue)
	{
		return Define(isAdmin, section, key, defaultValue, (AcceptableValueBase?)null, string.Empty);
	}

	public static ConfigEntry<T> Define<T>(bool isAdmin, string section, string key, T defaultValue, string description)
	{
		return Define(isAdmin, section, key, defaultValue, (AcceptableValueBase?)null, description);
	}

	public static ConfigEntry<T> Define<T>(bool isAdmin, string section, string key, T defaultValue, AcceptableValueRange<T>? acceptableValues, string description) where T : IComparable
	{
		return Define(isAdmin, section, key, defaultValue, (AcceptableValueBase?)(object)acceptableValues, description);
	}

	public static ConfigEntry<T> Define<T>(bool isAdmin, string section, string key, T defaultValue, AcceptableValueList<T>? acceptableValues, string description) where T : IEquatable<T>
	{
		return Define(isAdmin, section, key, defaultValue, (AcceptableValueBase?)(object)acceptableValues, description);
	}

	private static ConfigEntry<T> Define<T>(bool isAdmin, string section, string key, T defaultValue, AcceptableValueBase? acceptableValues, string description)
	{
		//IL_0012: Unknown result type (might be due to invalid IL or missing references)
		//IL_0017: Unknown result type (might be due to invalid IL or missing references)
		//IL_001f: Expected Obj, but got Unknown
		//IL_0049: Unknown result type (might be due to invalid IL or missing references)
		//IL_0053: Expected Obj, but got Unknown
		if (File == null)
		{
			throw new InvalidOperationException("Config file not set");
		}
		ConfigurationManagerAttributes val = new ConfigurationManagerAttributes
		{
			IsAdminOnly = isAdmin
		};
		return File.Bind<T>(section, key, defaultValue, new ConfigDescription((isAdmin ? "[Admin] " : string.Empty) + description, acceptableValues, new object[1] { val }));
	}

	public static AcceptableValueRange<T> AcceptRange<T>(T min, T max) where T : IComparable
	{
		return new AcceptableValueRange<T>(min, max);
	}

	public static AcceptableValueList<T> AcceptList<T>(params T[] list) where T : IEquatable<T>
	{
		return new AcceptableValueList<T>(list);
	}
}
