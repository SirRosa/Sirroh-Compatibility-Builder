using System.Runtime.CompilerServices;
using BepInEx.Bootstrap;

namespace AzuAutoStore.APIs.MUC.MUCSrc.Patches.Compatibility;

public static class OdinShip
{
	public static bool IsOdinShipInstalled()
	{
		if (!Chainloader.PluginInfos.ContainsKey("marlthon.OdinShipPlus"))
		{
			return Chainloader.PluginInfos.ContainsKey("marlthon.OdinShip");
		}
		return true;
	}

	[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
	public static bool IsOdinShipContainer(this Container container)
	{
		return ((object)container).GetType().FullName == "OdinShip.ShipContainer";
	}
}
