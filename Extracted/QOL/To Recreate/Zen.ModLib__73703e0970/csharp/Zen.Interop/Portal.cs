using BepInEx.Bootstrap;

namespace Zen.Interop;

public static class Portal
{
	private const string ModID = "ZenDragon.ZenPortal";

	public static string Message_PortalSymbols => "PortalSymbols";

	public static bool IsLoaded => Chainloader.PluginInfos.ContainsKey("ZenDragon.ZenPortal");

	public static string? RequestPortalSymbols(ZDO portalZDO)
	{
		return (string)Message.Request("ZenDragon.ZenPortal", Message_PortalSymbols, portalZDO);
	}
}
