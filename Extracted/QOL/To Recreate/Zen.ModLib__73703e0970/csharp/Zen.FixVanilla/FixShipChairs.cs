using System;
using System.Collections.Generic;
using System.Linq;
using HarmonyLib;
using UnityEngine;

namespace Zen.FixVanilla;

[HarmonyPatch]
internal static class FixShipChairs
{
	[HarmonyPostfix]
	[HarmonyPatch(typeof(ZNetScene), "Awake")]
	[HarmonyPriority(100)]
	private static void ZNetScene_Awake(ZNetScene __instance)
	{
		CollectionExtensions.Do<GameObject>(__instance.m_prefabs.Where((GameObject prefab) => Object.op_Implicit((Object)(object)prefab.GetComponentInChildren<Ship>())), (Action<GameObject>)((GameObject ship) =>
		{
			CollectionExtensions.Do<Chair>((IEnumerable<Chair>)ship.GetComponentsInChildren<Chair>(), (Action<Chair>)((Chair chair) =>
			{
				chair.m_inShip = true;
			}));
		}));
	}
}
