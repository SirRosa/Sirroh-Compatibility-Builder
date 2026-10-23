using System;
using System.Collections.Generic;
using System.Reflection;
using System.Reflection.Emit;
using System.Runtime.CompilerServices;
using AzuAutoStore.APIs.MUC.MUCSrc.Helper;
using HarmonyLib;

namespace AzuAutoStore.APIs.MUC.MUCSrc;

[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
public static class CodeMatcherExtensions
{
	public static CodeMatcher GetPosition(this CodeMatcher codeMatcher, out int position)
	{
		position = codeMatcher.Pos;
		return codeMatcher;
	}

	public static CodeMatcher AddLabel(this CodeMatcher codeMatcher, out Label label)
	{
		label = default;
		codeMatcher.AddLabels((IEnumerable<Label>)new Label[1] { label });
		return codeMatcher;
	}

	public static CodeMatcher GetOperand(this CodeMatcher codeMatcher, out object operand)
	{
		operand = codeMatcher.Operand;
		return codeMatcher;
	}

	internal static CodeMatcher Print(this CodeMatcher codeMatcher, int before, int after)
	{
		for (int i = -before; i <= after; i++)
		{
			int num = i;
			int num2 = codeMatcher.Pos + num;
			if (num2 > 0)
			{
				if (num2 >= codeMatcher.Length)
				{
					break;
				}
				try
				{
					CodeInstruction val = codeMatcher.InstructionAt(num);
					Log.LogCodeInstruction($"[{num}] " + ((object)val).ToString());
				}
				catch (Exception ex)
				{
					Log.LogCodeInstruction(ex.Message);
				}
			}
		}
		return codeMatcher;
	}

	public static bool IsVirtCall(this CodeInstruction i, string declaringType, string name)
	{
		if (i.opcode == OpCodes.Callvirt && i.operand is MethodInfo { DeclaringType: var declaringType2 } methodInfo && declaringType2?.Name == declaringType)
		{
			return methodInfo.Name == name;
		}
		return false;
	}
}
