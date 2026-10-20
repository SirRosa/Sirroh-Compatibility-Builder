using System;
using System.Collections.Generic;
using System.Reflection;
using System.Reflection.Emit;
using HarmonyLib;
using JetBrains.Annotations;
using Zen.Lib;

namespace ZenUI.Section;

[HarmonyPatch]
internal static class InventoryStackAmountText
{
	public enum FormatStyle
	{
		Vanilla,
		HideMaxWhenFull,
		HideMaxAlways
	}

	[UsedImplicitly]
	private static IEnumerable<MethodInfo> TargetMethods()
	{
		return new _003C_003Ez__ReadOnlyArray<MethodInfo>(new MethodInfo[2]
		{
			AccessTools.DeclaredMethod(typeof(HotkeyBar), "UpdateIcons", (Type[])null, (Type[])null),
			AccessTools.DeclaredMethod(typeof(InventoryGrid), "UpdateGui", (Type[])null, (Type[])null)
		});
	}

	[UsedImplicitly]
	private static IEnumerable<CodeInstruction> Transpiler(IEnumerable<CodeInstruction> codes)
	{
		//IL_0043: Unknown result type (might be due to invalid IL or missing references)
		//IL_0049: Expected Obj, but got Unknown
		//IL_0057: Unknown result type (might be due to invalid IL or missing references)
		//IL_005d: Expected Obj, but got Unknown
		//IL_00ac: Unknown result type (might be due to invalid IL or missing references)
		//IL_00b2: Expected Obj, but got Unknown
		//IL_00b5: Unknown result type (might be due to invalid IL or missing references)
		Func<string, object, object, string> func = FormatIntercept;
		CodeMatch[] array = new CodeMatch[3]
		{
			new CodeMatch((OpCode?)OpCodes.Ldfld, (object)AccessTools.DeclaredField(typeof(SharedData), "m_maxStackSize"), (string)null),
			new CodeMatch((OpCode?)OpCodes.Box, (object)null, (string)null),
			new CodeMatch((OpCode?)OpCodes.Call, (object)AccessTools.DeclaredMethod(typeof(string), "Format", new Type[3]
			{
				typeof(string),
				typeof(object),
				typeof(object)
			}, (Type[])null), (string)null)
		};
		return new CodeMatcher(codes, (ILGenerator)null).MatchEndForward(array).ThrowIfInvalid("Unable to match IL").Set(OpCodes.Call, (object)func.Method)
			.InstructionEnumeration();
		static string FormatIntercept(string s, object arg0, object arg1)
		{
			//IL_0037: Unknown result type (might be due to invalid IL or missing references)
			//IL_004d: Unknown result type (might be due to invalid IL or missing references)
			int num = (int)arg0;
			int num2 = (int)arg1;
			UIColor arg2 = UIColor.White;
			bool flag = false;
			if (num <= 0)
			{
				arg2 = UIColor.Red;
			}
			else if (num > num2)
			{
				arg2 = UIColor.Red;
			}
			else if (num < num2)
			{
				arg2 = Configs.ItemStackColorPartial.Value;
			}
			else if (num == num2)
			{
				arg2 = Configs.ItemStackColorFull.Value;
				flag = true;
			}
			bool flag2 = TooltipSummary.IsDetailKeyPressed();
			if (!flag2)
			{
				flag2 = Configs.ItemStackFormatStyle.Value switch
				{
					FormatStyle.Vanilla => true, 
					FormatStyle.HideMaxWhenFull => !flag, 
					FormatStyle.HideMaxAlways => false, 
					_ => throw new ArgumentOutOfRangeException(), 
				};
			}
			string text = (flag2 ? $"{num}/{num2}" : num.ToString());
			if (!Configs.ItemStackColorApply.Value)
			{
				return text;
			}
			return $"<color={arg2}>{text}</color>";
		}
	}
}
