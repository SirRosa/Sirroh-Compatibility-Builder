using HarmonyLib;
using Jotunn.Managers;

namespace Zen.Lib;

[HarmonyPatch]
internal static class BuildAuthorInfo
{
	[HarmonyPrefix]
	[HarmonyPatch(typeof(Hud), "TryShowBuildPieceAuthorInfo")]
	private static bool Hud_TryShowBuildPieceAuthorInfo(Hud __instance)
	{
		if (ModLib.Configs.AdminOnlyShowBuildAuthor.Value)
		{
			return SynchronizationManager.Instance.PlayerIsAdmin;
		}
		return true;
	}
}
