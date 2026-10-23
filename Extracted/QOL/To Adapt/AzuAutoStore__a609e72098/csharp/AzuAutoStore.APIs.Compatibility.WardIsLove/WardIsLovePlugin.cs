using System;
using System.Runtime.CompilerServices;
using BepInEx.Bootstrap;
using BepInEx.Configuration;

namespace AzuAutoStore.APIs.Compatibility.WardIsLove;

[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
public class WardIsLovePlugin : WILCompat
{
	private const string GUID = "Azumatt.WardIsLove";

	private static readonly Version MinVersion = new Version(2, 3, 3);

	private static Type ClassType()
	{
		return Type.GetType("WardIsLove.WardIsLovePlugin, WardIsLove");
	}

	public static bool IsLoaded()
	{
		if (Chainloader.PluginInfos.ContainsKey("Azumatt.WardIsLove"))
		{
			return Chainloader.PluginInfos["Azumatt.WardIsLove"].Metadata.Version >= MinVersion;
		}
		return false;
	}

	[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(2)]
	public static ConfigEntry<bool> WardEnabled()
	{
		return WILCompat.GetField<ConfigEntry<bool>>(ClassType(), null, "WardEnabled");
	}
}
