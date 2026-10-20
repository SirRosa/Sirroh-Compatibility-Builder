using System;
using HarmonyLib;
using UnityEngine;

namespace Zen.FixVanilla;

[HarmonyPatch]
internal class FixTitleScreenInventoryLoadWorldLevelDamage
{
	[HarmonyPrefix]
	[HarmonyPatch(typeof(ItemData), "GetDamage", new Type[] { })]
	private static bool ItemDrop_ItemData_GetDamage()
	{
		return Object.op_Implicit((Object)(object)Game.instance);
	}
}
