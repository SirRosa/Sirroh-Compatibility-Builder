using BepInEx.Bootstrap;

namespace AzuAutoStore.APIs.MUC;

internal static class MUCCompat
{
	internal static bool DoNotPatch
	{
		get
		{
			if (!Chainloader.PluginInfos.ContainsKey("com.maxsch.valheim.MultiUserChest") && !Chainloader.PluginInfos.ContainsKey("org.bepinex.plugins.valheim.quick_stack") && !Chainloader.PluginInfos.ContainsKey("aedenthorn.SimpleSort"))
			{
				return Chainloader.PluginInfos.ContainsKey("aedenthorn.QuickStore");
			}
			return true;
		}
	}

	internal static bool MUCLoaded => Chainloader.PluginInfos.ContainsKey("com.maxsch.valheim.MultiUserChest");

	internal static bool CanRouteToOtherOwner
	{
		get
		{
			if (!MUCLoaded)
			{
				return !DoNotPatch;
			}
			return true;
		}
	}
}
