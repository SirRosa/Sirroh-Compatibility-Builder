using System;
using HarmonyLib;
using UnityEngine;

namespace QuickStackStore;

[HarmonyPatch(typeof(Container))]
public static class ContainerPatch
{
	internal const string rpc_requestSort = "QuickStackStore_RequestSort";

	[HarmonyPatch("Awake")]
	[HarmonyPostfix]
	public static void ContainerAwakePatch(Container __instance)
	{
		if (!Object.op_Implicit((Object)(object)__instance.m_nview))
		{
			__instance.m_nview = (Object.op_Implicit((Object)(object)__instance.m_rootObjectOverride) ? ((Component)__instance.m_rootObjectOverride).GetComponent<ZNetView>() : ((Component)__instance).GetComponent<ZNetView>());
		}
		if (Object.op_Implicit((Object)(object)__instance.m_nview))
		{
			__instance.m_nview.Unregister("QuickStackStore_RequestSort");
			__instance.m_nview.Register("QuickStackStore_RequestSort", (Action<long>)((long l) =>
			{
				RPC_RequestSort(l, __instance);
			}));
		}
	}

	public static void RPC_RequestSort(long _, Container container)
	{
		if (container.m_nview.IsOwner())
		{
			SortModule.SortInternal(container.m_inventory);
		}
	}
}
