using System;
using System.Runtime.CompilerServices;
using AzuAutoStore.APIs.Compatibility.WardIsLove;
using AzuAutoStore.Util;
using HarmonyLib;
using UnityEngine;

namespace AzuAutoStore.Patches;

[HarmonyPatch(typeof(Container), "Awake")]
[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
internal static class ContainerAwakePatch
{
	internal static int pausedSeconds = 0;

	internal static readonly int storingPausedHash = StringExtensionMethods.GetStableHashCode("storingPaused");

	internal static bool TryAddContainer(Container container)
	{
		//IL_00b7: Unknown result type (might be due to invalid IL or missing references)
		//IL_0090: Unknown result type (might be due to invalid IL or missing references)
		if (!Object.op_Implicit((Object)(object)container) || (Object)(object)container.m_nview == (Object)null || container.m_nview.GetZDO() == null)
		{
			return false;
		}
		Character componentInParent = ((Component)container).GetComponentInParent<Character>();
		if ((Object)(object)componentInParent != (Object)null && (Object)(object)componentInParent != (Object)(object)Player.m_localPlayer)
		{
			return false;
		}
		if (!container.m_nview.IsValid() || container.GetInventory() == null)
		{
			return false;
		}
		if (container.m_nview.GetZDO().GetLong(ZDOVars.s_creator, 0L) == 0L)
		{
			return false;
		}
		try
		{
			if (WardIsLovePlugin.IsLoaded() && WardIsLovePlugin.WardEnabled().Value)
			{
				if (!WardMonoscript.CheckAccess(((Component)container).transform.position, 0f, flash: false, wardCheck: true))
				{
					return false;
				}
				Boxes.AddContainer(container);
				return true;
			}
			if (PrivateArea.CheckAccess(((Component)container).transform.position, 0f, false, true))
			{
				Boxes.AddContainer(container);
				return true;
			}
		}
		catch
		{
		}
		return false;
	}

	private static void Postfix(Container __instance)
	{
		Functions.LogContainerStatus(__instance);
		if (!((Object)(object)__instance.m_nview == (Object)null) && __instance.m_nview.GetZDO() != null)
		{
			__instance.m_nview.Unregister("RequestPause");
			__instance.m_nview.Register<bool>("RequestPause", (Action<long, bool>)((long sender, bool pause) =>
			{
				Boxes.RPC_RequestPause(sender, pause, __instance);
			}));
			TryAddContainer(__instance);
		}
	}
}
