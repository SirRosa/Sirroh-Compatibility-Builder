using System.Reflection.Emit;
using HarmonyLib;

namespace Zen.Lib;

public static class HarmonyExt
{
	public static bool IsLdloc(this CodeInstruction code, int index)
	{
		if (CodeInstructionExtensions.IsLdloc(code, (LocalBuilder)null))
		{
			return code.IsLocal(index);
		}
		return false;
	}

	public static bool IsStloc(this CodeInstruction code, int index)
	{
		if (CodeInstructionExtensions.IsStloc(code, (LocalBuilder)null))
		{
			return code.IsLocal(index);
		}
		return false;
	}

	public static bool IsLocal(this CodeInstruction code, int index)
	{
		if (code.operand != null)
		{
			if ((!(code.operand is LocalBuilder localBuilder) || localBuilder.LocalIndex != index) && (!(code.operand is byte b) || b != index) && (!(code.operand is short num) || num != index))
			{
				if (code.operand is int num2)
				{
					return num2 == index;
				}
				return false;
			}
			return true;
		}
		return false;
	}
}
