using HarmonyLib;
using UnityEngine;

namespace AzuAutoStore.Managers;

[HarmonyPatch(typeof(Game), "Start")]
public static class GameStartPatch
{
	private static void Postfix()
	{
		//IL_0012: Unknown result type (might be due to invalid IL or missing references)
		if (!Object.op_Implicit((Object)(object)AzuAutoStoreItemDropManager.Instance))
		{
			Object.DontDestroyOnLoad((Object)(object)new GameObject("AzuAutoStore_ItemDropManager").AddComponent<AzuAutoStoreItemDropManager>());
		}
	}
}
