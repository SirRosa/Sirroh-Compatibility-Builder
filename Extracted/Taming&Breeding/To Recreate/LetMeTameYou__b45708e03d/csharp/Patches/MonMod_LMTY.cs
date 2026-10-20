using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Reflection.Emit;
using HarmonyLib;
using LetMeTameYou;
using MonsterModifiers.Modifiers;
using UnityEngine;

namespace Patches;

public class MonMod_LMTY
{
	public enum CG_MonsterModifierTypes
	{
		StaminaSiphon,
		EitrSiphon,
		ShieldBreaker,
		FoodDrain,
		IgnoreArmor,
		PoisonDeath,
		FrostDeath,
		FireDeath,
		HealDeath,
		StaggerDeath,
		TarDeath,
		PersonalShield,
		SoulEater,
		StaggerImmune,
		FireInfused,
		PoisonInfused,
		FrostInfused,
		LightningInfused,
		ElementalImmunity,
		PierceImmunity,
		BluntImmunity,
		SlashImmunity,
		FastMovement,
		FastAttackSpeed,
		DistantDetection,
		BloodLoss,
		Absorption,
		Vampiric,
		Forceful,
		Wet,
		Quiet,
		Knockback,
		ArmorCharge,
		FireTrail,
		ResistanceNotification,
		SplitSpawn,
		EliteMonster
	}

	[HarmonyPatch(typeof(Character_OnDeath_SplitSpawn_Patch), "Prefix")]
	public static class Intercept_SplitSpawn
	{
		private static GameObject OnSplit(GameObject new_obj, Character dead_char)
		{
			DBG.blogDebug("inOnSplit");
			try
			{
				Character component = new_obj.GetComponent<Character>();
				if (!Object.op_Implicit((Object)(object)component))
				{
					DBG.blogWarning("Growup, No Adult");
					return new_obj;
				}
				if (!Object.op_Implicit((Object)(object)dead_char))
				{
					DBG.blogWarning("No Growup, setting tame and level manually");
					component.SetTamed(true);
					component.SetLevel(1);
					return new_obj;
				}
				if (dead_char.IsTamed())
				{
					component.SetTamed(true);
				}
			}
			catch (Exception o)
			{
				new_obj.GetComponent<Character>().SetTamed(true);
				DBG.blogWarning(o);
			}
			return new_obj;
		}

		private static IEnumerable<CodeInstruction> Transpiler(IEnumerable<CodeInstruction> instructions)
		{
			MethodInfo growupHook = AccessTools.DeclaredMethod(typeof(Intercept_SplitSpawn), "OnSplit", (Type[])null, (Type[])null);
			MethodInfo instantiator = typeof(Object).GetMethods().First((MethodInfo m) => m.Name == "Instantiate" && m.GetParameters().Length == 3 && m.GetParameters()[1].ParameterType == typeof(Vector3) && m.GetParameters()[2].ParameterType == typeof(Quaternion) && m.ContainsGenericParameters).MakeGenericMethod(typeof(GameObject));
			foreach (CodeInstruction instruction in instructions)
			{
				yield return instruction;
				if (instruction.opcode == OpCodes.Call && CodeInstructionExtensions.OperandIs(instruction, (MemberInfo)instantiator))
				{
					yield return new CodeInstruction(OpCodes.Ldarg_0, (object)null);
					yield return new CodeInstruction(OpCodes.Call, (object)growupHook);
				}
			}
		}
	}
}
