using System.Collections.Generic;
using HarmonyLib;
using UnityEngine;

namespace LongshipUpgrades;

public static class LongshipPropertyBlocks
{
	[HarmonyPatch(typeof(MaterialMan), "RegisterRenderers")]
	public static class MaterialMan_RegisterRenderers_KeepPropertyBlocks
	{
		public static void Postfix(MaterialMan __instance, GameObject gameObject)
		{
			if (LongshipCustomizableParts.HasShipComponent(gameObject) && __instance.m_blocks.TryGetValue(((Object)gameObject).GetInstanceID(), out var value))
			{
				s_objectProperties[value] = gameObject;
			}
		}
	}

	[HarmonyPatch(typeof(MaterialMan), "ResetValue")]
	public static class MaterialMan_ResetValue_KeepPropertyBlocks
	{
		public static void Postfix(MaterialMan __instance, GameObject go)
		{
			if (LongshipCustomizableParts.HasShipComponent(go) && __instance.m_blocks.TryGetValue(((Object)go).GetInstanceID(), out var value))
			{
				s_objectProperties[value] = go;
			}
		}
	}

	[HarmonyPatch(typeof(PropertyContainer), "UpdateBlock")]
	public static class MaterialMan_PropertyContainer_UpdateBlock_AfterPropertyBlock
	{
		public static void Postfix(PropertyContainer __instance, MaterialPropertyBlock ___m_propertyBlock)
		{
			if (s_objectProperties.TryGetValue(__instance, out var value))
			{
				if (!___m_propertyBlock.isEmpty)
				{
					LongshipCustomizableParts.CombinePropertyBlocks(value, ___m_propertyBlock);
				}
				else
				{
					LongshipCustomizableParts.UpdatePropertyBlocks(value);
				}
			}
		}
	}

	[HarmonyPatch(typeof(MaterialMan), "UnregisterRenderers")]
	public static class MaterialMan_UnregisterRenderers_Remove
	{
		public static void Prefix(MaterialMan __instance, GameObject gameObject)
		{
			if (__instance.m_blocks.TryGetValue(((Object)gameObject).GetInstanceID(), out var value))
			{
				s_objectProperties.Remove(value);
			}
		}
	}

	public static readonly int _StyleTex = Shader.PropertyToID("_StyleTex");

	private static readonly Dictionary<PropertyContainer, GameObject> s_objectProperties = new Dictionary<PropertyContainer, GameObject>();
}
