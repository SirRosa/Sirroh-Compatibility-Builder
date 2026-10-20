using System;
using HarmonyLib;
using UnityEngine;

namespace Zen.Compatibility;

[HarmonyPatch]
public static class MultiUserChest
{
	[AttributeUsage(AttributeTargets.Class)]
	public sealed class DisableAttribute : Attribute
	{
		public DisableAttribute(params Type[] types)
		{
			_disabledTypes = types;
		}
	}

	private static Type[] _disabledTypes = Array.Empty<Type>();

	[HarmonyBefore(new string[] { "com.maxsch.valheim.MultiUserChest" })]
	[HarmonyPostfix]
	[HarmonyPatch(typeof(Container), "Awake")]
	private static void Container_Awake(Container __instance)
	{
		Type[] disabledTypes = _disabledTypes;
		foreach (Type type in disabledTypes)
		{
			if (Object.op_Implicit((Object)(object)((Component)__instance).GetComponent(type)))
			{
				Disable(__instance);
			}
		}
	}

	private static void Disable(Container container)
	{
		if (container.IsOwner())
		{
			ZDO zDO = container.m_nview.GetZDO();
			if (!zDO.GetBool("MUC_Ignore", false))
			{
				zDO.Set("MUC_Ignore", true);
			}
			Logging<ModLib>.InterpolatedString msg = new Logging<ModLib>.InterpolatedString(28, 1, out var shouldAppend);
			if (shouldAppend)
			{
				msg.AppendLiteral("Disabled MultiUserChest for ");
				msg.AppendFormatted(((Object)container).name);
			}
			Logging<ModLib>.Debug(msg);
		}
	}
}
