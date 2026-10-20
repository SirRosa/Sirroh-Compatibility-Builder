using System;
using System.Collections.Generic;
using System.Reflection;
using HarmonyLib;
using JetBrains.Annotations;
using Splatform;

namespace ZenUI.Section;

[HarmonyPatch]
internal static class ChatRules
{
	[UsedImplicitly]
	private static IEnumerable<MethodBase> TargetMethods()
	{
		return new _003C_003Ez__ReadOnlyArray<MethodBase>(new MethodBase[3]
		{
			AccessTools.DeclaredMethod(typeof(Chat), "AddInworldText", (Type[])null, (Type[])null),
			AccessTools.DeclaredMethod(typeof(Terminal), "AddString", new Type[4]
			{
				typeof(PlatformUserID),
				typeof(string),
				typeof(Type),
				typeof(bool)
			}, (Type[])null),
			AccessTools.DeclaredMethod(typeof(Terminal), "AddString", new Type[4]
			{
				typeof(string),
				typeof(string),
				typeof(Type),
				typeof(bool)
			}, (Type[])null)
		});
	}

	[HarmonyTranspiler]
	[UsedImplicitly]
	[HarmonyPriority(0)]
	[HarmonyBefore(new string[] { "MarketplaceAndServerNPCs" })]
	private static IEnumerable<CodeInstruction> PreventCaseChange(IEnumerable<CodeInstruction> codes)
	{
		MethodInfo methodInfo = AccessTools.DeclaredMethod(typeof(string), "ToUpper", Array.Empty<Type>(), (Type[])null);
		MethodInfo methodInfo2 = AccessTools.DeclaredMethod(typeof(string), "ToLowerInvariant", Array.Empty<Type>(), (Type[])null);
		Func<string, string> func = ToUpperBypass;
		Func<string, string> func2 = ToLowerBypass;
		return Transpilers.MethodReplacer(Transpilers.MethodReplacer(codes, (MethodBase)methodInfo, (MethodBase)func.Method), (MethodBase)methodInfo2, (MethodBase)func2.Method);
		static string ToLowerBypass(string self)
		{
			if (!Configs.ChatForceCase.Value)
			{
				return self;
			}
			return self.ToLowerInvariant();
		}
		static string ToUpperBypass(string self)
		{
			if (!Configs.ChatForceCase.Value)
			{
				return self;
			}
			return self.ToUpper();
		}
	}
}
