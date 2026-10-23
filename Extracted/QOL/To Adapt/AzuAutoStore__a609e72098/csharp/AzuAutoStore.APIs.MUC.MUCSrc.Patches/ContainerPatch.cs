using System.Runtime.CompilerServices;
using AzuAutoStore.APIs.MUC.MUCSrc.Patches.Compatibility;
using HarmonyLib;
using UnityEngine;

namespace AzuAutoStore.APIs.MUC.MUCSrc.Patches;

[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
[HarmonyPatch]
[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
public static class ContainerPatch
{
	public const string ItemMoveRPC = "MUC_RequestItemMove";

	public const string ItemMoveResponseRPC = "MUC_RequestItemMoveResponse";

	public const string ItemAddRPC = "MUC_RequestItemAdd";

	public const string ItemAddResponseRPC = "MUC_RequestItemAddResponse";

	public const string ItemRemoveRPC = "MUC_RequestItemRemove";

	public const string ItemRemoveResponseRPC = "MUC_RequestItemRemoveResponse";

	public const string ItemConsumeRPC = "MUC_RequestItemConsume";

	public const string ItemConsumeResponseRPC = "MUC_RequestItemConsumeResponse";

	public const string ItemDropRPC = "MUC_RequestItemDrop";

	public const string ItemDropResponseRPC = "MUC_RequestItemDropResponse";

	[HarmonyPostfix]
	[HarmonyPatch(typeof(Container), "Awake")]
	public static void ContainerAwakePatch(Container __instance)
	{
		if (!MUCCompat.DoNotPatch)
		{
			((Component)__instance).gameObject.AddComponent<ContainerExtend>();
			if (!__instance.IgnoreInventory() && !Object.op_Implicit((Object)(object)__instance.m_nview))
			{
				__instance.m_nview = (Object.op_Implicit((Object)(object)__instance.m_rootObjectOverride) ? ((Component)__instance.m_rootObjectOverride).GetComponent<ZNetView>() : ((Component)__instance).GetComponent<ZNetView>());
			}
		}
	}

	[HarmonyPatch(typeof(Container), "RPC_RequestOpen")]
	[HarmonyPrefix]
	public static bool ContainerRPC_RequestOpenPatch(Container __instance, long uid, long playerID)
	{
		//IL_0087: Unknown result type (might be due to invalid IL or missing references)
		if (MUCCompat.DoNotPatch)
		{
			return true;
		}
		if (__instance.IgnoreInventory() || !__instance.m_nview.IsOwner())
		{
			return true;
		}
		if (!__instance.CheckAccess(playerID))
		{
			__instance.m_nview.InvokeRPC(uid, "RPC_OpenResponse", new object[1] { false });
			return false;
		}
		if (IsContainerInUse(__instance, uid))
		{
			__instance.m_nview.InvokeRPC(uid, "RPC_OpenResponse", new object[1] { true });
			return false;
		}
		ZDOMan.instance.ForceSendZDO(uid, __instance.m_nview.GetZDO().m_uid);
		__instance.m_nview.GetZDO().SetOwner(uid);
		__instance.m_nview.InvokeRPC(uid, "RPC_OpenResponse", new object[1] { true });
		return false;
	}

	[HarmonyPrefix]
	[HarmonyPatch(typeof(Container), "RPC_RequestStack")]
	public static bool ContainerRPC_RequestStackPatch(Container __instance, long uid, long playerID)
	{
		//IL_0087: Unknown result type (might be due to invalid IL or missing references)
		if (MUCCompat.DoNotPatch)
		{
			return true;
		}
		if (__instance.IgnoreInventory() || !__instance.m_nview.IsOwner())
		{
			return true;
		}
		if (!__instance.CheckAccess(playerID))
		{
			__instance.m_nview.InvokeRPC(uid, "RPC_StackResponse", new object[1] { false });
			return false;
		}
		if (IsContainerInUse(__instance, uid))
		{
			__instance.m_nview.InvokeRPC(uid, "RPC_StackResponse", new object[1] { true });
			return false;
		}
		ZDOMan.instance.ForceSendZDO(uid, __instance.m_nview.GetZDO().m_uid);
		__instance.m_nview.GetZDO().SetOwner(uid);
		__instance.m_nview.InvokeRPC(uid, "RPC_StackResponse", new object[1] { true });
		return false;
	}

	private static bool IsContainerInUse(Container container, long playerId)
	{
		bool flag = container.IsInUse();
		bool flag2 = Object.op_Implicit((Object)(object)container.m_wagon) && container.m_wagon.InUse();
		bool flag3 = playerId == ZNet.GetUID();
		if (flag | flag2)
		{
			return !flag3;
		}
		return false;
	}
}
