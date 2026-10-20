using System;
using System.Collections;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Reflection.Emit;
using System.Runtime.CompilerServices;
using System.Text.RegularExpressions;
using BepInEx;
using BepInEx.Bootstrap;
using BepInEx.Configuration;
using HarmonyLib;
using JetBrains.Annotations;
using ServerSync;
using TMPro;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;
using YamlDotNet.Core;
using YamlDotNet.Serialization;

namespace CreatureLevelControl;

[BepInDependency(/*Could not decode attribute arguments.*/)]
[BepInIncompatibility("org.bepinex.plugins.valheim_plus")]
[BepInDependency(/*Could not decode attribute arguments.*/)]
[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(0)]
[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
[BepInPlugin("org.bepinex.plugins.creaturelevelcontrol", "Creature Level & Loot Control", "5.0.7")]
public class CreatureLevelControl : BaseUnityPlugin
{
	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	public enum Difficulty
	{
		[LocalizationWrapper.Localized(Difficulty.Custom)]
		Custom,
		[LocalizationWrapper.Localized(Difficulty.Very_easy)]
		Very_easy,
		[LocalizationWrapper.Localized(Difficulty.Easy)]
		Easy,
		[LocalizationWrapper.Localized(Difficulty.Medium)]
		Medium,
		[LocalizationWrapper.Localized(Difficulty.Hard)]
		Hard,
		[LocalizationWrapper.Localized(Difficulty.Very_hard)]
		Very_hard,
		[LocalizationWrapper.Localized(Difficulty.Insane)]
		Insane
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	public enum CreatureSectorAnnouncementScope
	{
		[LocalizationWrapper.Localized(CreatureSectorAnnouncementScope.Local)]
		Local,
		[LocalizationWrapper.Localized(CreatureSectorAnnouncementScope.Global)]
		Global,
		[LocalizationWrapper.Localized(CreatureSectorAnnouncementScope.Off)]
		Off
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	public enum LootSystem
	{
		[LocalizationWrapper.Localized(LootSystem.Vanilla)]
		Vanilla,
		[LocalizationWrapper.Localized(LootSystem.Linear)]
		Linear,
		[LocalizationWrapper.Localized(LootSystem.CalculateChance)]
		CalculateChance,
		[LocalizationWrapper.Localized(LootSystem.CalculateAmount)]
		CalculateAmount
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	private enum VisualLevelIndicator
	{
		[LocalizationWrapper.Localized(VisualLevelIndicator.Off)]
		Off,
		[LocalizationWrapper.Localized(VisualLevelIndicator.On)]
		On,
		[LocalizationWrapper.Localized(VisualLevelIndicator.BossesOff)]
		BossesOff,
		[LocalizationWrapper.Localized(VisualLevelIndicator.CreaturesOff)]
		CreaturesOff
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	private enum AllowedConsoleCommands
	{
		[LocalizationWrapper.Localized(AllowedConsoleCommands.CreatureCommands)]
		CreatureCommands,
		[LocalizationWrapper.Localized(AllowedConsoleCommands.InformationCommands)]
		InformationCommands,
		[LocalizationWrapper.Localized(AllowedConsoleCommands.None)]
		None
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	private enum VisualExtraEffectIndicator
	{
		[LocalizationWrapper.Localized(VisualExtraEffectIndicator.Color)]
		Color,
		[LocalizationWrapper.Localized(VisualExtraEffectIndicator.Text)]
		Text,
		[LocalizationWrapper.Localized(VisualExtraEffectIndicator.Both)]
		Both
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	public enum DifficultySecondFactor
	{
		[LocalizationWrapper.Localized(DifficultySecondFactor.None)]
		None,
		[LocalizationWrapper.Localized(DifficultySecondFactor.Age_of_world)]
		Age_of_world,
		[LocalizationWrapper.Localized(DifficultySecondFactor.Distance)]
		Distance,
		[LocalizationWrapper.Localized(DifficultySecondFactor.BossesKilled)]
		BossesKilled,
		[LocalizationWrapper.Localized(DifficultySecondFactor.Fluid)]
		Fluid
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	public enum SpawnLevel
	{
		[LocalizationWrapper.Localized(SpawnLevel.None)]
		None,
		[LocalizationWrapper.Localized(SpawnLevel.One)]
		One,
		[LocalizationWrapper.Localized(SpawnLevel.Two)]
		Two,
		[LocalizationWrapper.Localized(SpawnLevel.Three)]
		Three,
		[LocalizationWrapper.Localized(SpawnLevel.Four)]
		Four,
		[LocalizationWrapper.Localized(SpawnLevel.Five)]
		Five
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	public enum CreatureSectorWorldLevel
	{
		[LocalizationWrapper.Localized(CreatureSectorWorldLevel.Disabled)]
		Disabled = -1,
		[LocalizationWrapper.Localized(CreatureSectorWorldLevel.None)]
		None,
		[LocalizationWrapper.Localized(CreatureSectorWorldLevel.One)]
		One,
		[LocalizationWrapper.Localized(CreatureSectorWorldLevel.Two)]
		Two,
		[LocalizationWrapper.Localized(CreatureSectorWorldLevel.Three)]
		Three,
		[LocalizationWrapper.Localized(CreatureSectorWorldLevel.Four)]
		Four,
		[LocalizationWrapper.Localized(CreatureSectorWorldLevel.Five)]
		Five,
		[LocalizationWrapper.Localized(CreatureSectorWorldLevel.Six)]
		Six,
		[LocalizationWrapper.Localized(CreatureSectorWorldLevel.Seven)]
		Seven,
		[LocalizationWrapper.Localized(CreatureSectorWorldLevel.Eight)]
		Eight
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	public enum ModifyDamage
	{
		All,
		Fire,
		Frost,
		Poison,
		Lightning,
		Spirit,
		Elemental,
		Blunt,
		Slash,
		Pierce,
		Chop,
		Physical,
		Knives,
		Bows,
		Crossbows,
		ElementalMagic,
		BloodMagic,
		Swords,
		Spears,
		Pickaxes,
		Axes,
		Clubs,
		Polearms,
		Weapons,
		Unarmed
	}

	[HarmonyPatch(typeof(Game), "GetPlayerDifficulty")]
	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	private class PatchPlayerCount
	{
		[UsedImplicitly]
		private static void Postfix(ref int __result)
		{
			__result = Mathf.Min(maximumMultiplayerPlayerCount.Value, Mathf.Max(minimumMultiplayerPlayerCount.Value, additionalMultiplayerPlayerCount.Value + __result));
		}
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	[HarmonyPatch(typeof(Terminal), "TryRunCommand")]
	private class PatchTerminal
	{
		[UsedImplicitly]
		[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
		private static bool Prefix(Terminal __instance, string text)
		{
			//IL_059b: Unknown result type (might be due to invalid IL or missing references)
			//IL_05a2: Unknown result type (might be due to invalid IL or missing references)
			//IL_05ac: Unknown result type (might be due to invalid IL or missing references)
			//IL_05b1: Unknown result type (might be due to invalid IL or missing references)
			//IL_05b6: Unknown result type (might be due to invalid IL or missing references)
			//IL_05bb: Unknown result type (might be due to invalid IL or missing references)
			//IL_05c0: Unknown result type (might be due to invalid IL or missing references)
			if (!text.ToLower().StartsWith("cllc"))
			{
				return true;
			}
			bool flag = true;
			string[] array = text.ToLower().Split(new char[1] { ' ' });
			bool flag2 = !configSync.IsLocked;
			bool flag3 = false;
			if (array.Length > 1 && array[1] == "killhighstars")
			{
				flag = false;
				if (flag2 || allowedConsoleCommands.Value == AllowedConsoleCommands.CreatureCommands)
				{
					if (array.Length <= 2 || !int.TryParse(array[2], out var result))
					{
						result = 6;
					}
					Character[] array2 = Object.FindObjectsOfType<Character>();
					foreach (Character val in array2)
					{
						if (val.IsPlayer() || val.GetLevel() - 1 < result)
						{
							continue;
						}
						ZNetView component = ((Component)val).GetComponent<ZNetView>();
						if (component != null)
						{
							ZDO zDO = component.GetZDO();
							if (zDO != null)
							{
								zDO.SetOwner(ZDOMan.instance.m_sessionID);
							}
						}
						Object.Destroy((Object)(object)((Component)val).GetComponent<CharacterDrop>());
						ZNetScene.instance.Destroy(((Component)val).gameObject);
					}
					__instance.AddString("Removed all nearby creatures with at least " + result + " stars");
				}
				else
				{
					flag3 = true;
				}
			}
			else if (array.Length > 1 && array[1] == "killall")
			{
				flag = false;
				if (flag2 || allowedConsoleCommands.Value == AllowedConsoleCommands.CreatureCommands)
				{
					Character[] array3 = Object.FindObjectsOfType<Character>();
					foreach (Character val2 in array3)
					{
						if (val2.IsPlayer())
						{
							continue;
						}
						ZNetView component2 = ((Component)val2).GetComponent<ZNetView>();
						if (component2 != null)
						{
							ZDO zDO2 = component2.GetZDO();
							if (zDO2 != null)
							{
								zDO2.SetOwner(ZDOMan.instance.m_sessionID);
							}
						}
						Object.Destroy((Object)(object)((Component)val2).GetComponent<CharacterDrop>());
						ZNetScene.instance.Destroy(((Component)val2).gameObject);
					}
					__instance.AddString("Removed all nearby creatures");
				}
				else
				{
					flag3 = true;
				}
			}
			else if (array.Length > 1 && array[1] == "worldlevel")
			{
				flag = false;
				if (flag2 || allowedConsoleCommands.Value != AllowedConsoleCommands.None)
				{
					__instance.AddString("Current world level: " + API.GetWorldLevel());
				}
				else
				{
					flag3 = true;
				}
			}
			else if (array.Length > 1 && array[1] == "sectorkills")
			{
				flag = false;
				if (flag2 || allowedConsoleCommands.Value != AllowedConsoleCommands.None)
				{
					__instance.AddString("Kills in the current sector: " + (CreatureSector.currentSector(((Component)Player.m_localPlayer).GetComponent<ZNetView>())?.sectorKills ?? 0f));
				}
				else
				{
					flag3 = true;
				}
			}
			else if (array.Length > 1 && array[1] == "resetsector")
			{
				flag = false;
				if (flag2 || allowedConsoleCommands.Value == AllowedConsoleCommands.CreatureCommands)
				{
					CreatureSector.resetSectorKills(((Component)Player.m_localPlayer).GetComponent<ZNetView>());
					__instance.AddString("Reset all nearby creature sectors");
				}
				else
				{
					flag3 = true;
				}
			}
			else if (array.Length > 1 && array[1] == "starchance")
			{
				flag = false;
				if (flag2 || allowedConsoleCommands.Value != AllowedConsoleCommands.None)
				{
					object obj;
					if (array.Length <= 2)
					{
						obj = null;
					}
					else
					{
						GameObject prefab = ZNetScene.instance.GetPrefab(text.Split(new char[1] { ' ' })[2]);
						obj = ((prefab != null) ? prefab.GetComponent<Character>() : null);
					}
					Character val3 = (Character)obj;
					int num = 0;
					__instance.AddString("Current star chances" + ((val3 == null) ? "" : (" for " + Localization.instance.Localize(val3.m_name))) + ":");
					float[] array4 = API.LevelProbabilities(val3, API.GetWorldLevel(), includeZoneBonusLevel: true);
					foreach (float num2 in array4)
					{
						__instance.AddString(num++ + " star: " + num2.ToString(CultureInfo.InvariantCulture) + "%");
					}
				}
				else
				{
					flag3 = true;
				}
			}
			else if (array.Length > 2 && array[1] == "spawn")
			{
				flag = false;
				if (flag2 || allowedConsoleCommands.Value == AllowedConsoleCommands.CreatureCommands)
				{
					string text2 = text.Split(new char[1] { ' ' })[2];
					GameObject prefab2 = ZNetScene.instance.GetPrefab(text2);
					if ((Object)(object)prefab2 == (Object)null || !Object.op_Implicit((Object)(object)prefab2.GetComponent<Character>()))
					{
						__instance.AddString(text2 + " is not a creature");
						return false;
					}
					((Character)Player.m_localPlayer).Message((MessageType)1, "Spawning object " + ((Object)prefab2).name, 0, (Sprite)null, false);
					Transform transform = ((Component)Player.m_localPlayer).transform;
					Character character = Object.Instantiate<GameObject>(prefab2, transform.position + transform.forward * 2f + Vector3.up, Quaternion.identity).GetComponent<Character>();
					foreach (string item in array.Skip(3))
					{
						string effectName = item;
						if (int.TryParse(effectName, out var result2))
						{
							character.SetLevel(result2);
							continue;
						}
						bool matched = false;
						if (character.IsBoss())
						{
							loop<BossAffix>((BossAffix affix) =>
							{
								API.SetAffixBoss(character, affix);
							});
						}
						else
						{
							loop<CreatureInfusion>((CreatureInfusion infusion) =>
							{
								API.SetInfusionCreature(character, infusion);
							});
							loop<CreatureExtraEffect>((CreatureExtraEffect effect) =>
							{
								API.SetExtraEffectCreature(character, effect);
							});
						}
						if (!matched)
						{
							__instance.AddString("Unknown effect " + effectName);
						}
						void loop<T>([_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 0 })] Action<T> apply)
						{
							T[] array5 = (T[])Enum.GetValues(typeof(T));
							for (int l = 0; l < array5.Length; l++)
							{
								T obj2 = array5[l];
								if (string.Equals(obj2.ToString(), effectName, StringComparison.CurrentCultureIgnoreCase))
								{
									apply(obj2);
									matched = true;
								}
							}
						}
					}
				}
				else
				{
					flag3 = true;
				}
			}
			if (flag)
			{
				__instance.AddString("CLLC console commands - use 'cllc' followed by one of the following options");
				__instance.AddString("killhighstars [stars] - removes all nearby creatures with at least stars. Default stars is 6.");
				__instance.AddString("killall - removes all nearby creatures");
				__instance.AddString("worldlevel - displays the current world level");
				__instance.AddString("sectorkills - displays the creatures killed in the current sector");
				__instance.AddString("resetsector - resets all nearby creature sectors");
				__instance.AddString("starchance [creature] - displays the current star chances. Optionally for a specific creature.");
				__instance.AddString("spawn [creature] [level] [affix] [extraeffect] [infusion] - spawns a creature with the provided properties.");
			}
			if (flag3)
			{
				__instance.AddString("You are not allowed to use this command on this server.");
			}
			return false;
		}
	}

	[HarmonyPatch(typeof(Game), "GetDifficultyDamageScalePlayer")]
	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	private class PatchDamageFactor
	{
		[UsedImplicitly]
		private static void Postfix(ref float __result)
		{
			__result = (float)((double)(__result - 1f) / 0.04 * (double)multiplayerDMGfactor.Value / 100.0) + 1f;
		}
	}

	[HarmonyPatch(typeof(Game), "GetDifficultyDamageScaleEnemy")]
	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	private class PatchHealthFactor
	{
		[UsedImplicitly]
		private static void Postfix(ref float __result)
		{
			__result = 1f / ((float)((double)(1f / __result - 1f) / 0.4 * (double)multiplayerHPfactor.Value / 100.0) + 1f);
		}
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	[HarmonyPatch(typeof(Attack), "GetLevelDamageFactor")]
	private class PatchDamageStarFactor
	{
		[UsedImplicitly]
		[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
		private static void Postfix(Attack __instance, ref float __result)
		{
			//IL_001b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0021: Expected Obj, but got Unknown
			Humanoid val = (Humanoid)AccessTools.DeclaredField(typeof(Attack), "m_character").GetValue(__instance);
			if (!((Character)val).IsPlayer())
			{
				__result = 1f;
			}
		}
	}

	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(0)]
	[HarmonyPatch(typeof(Character), "SetupMaxHealth")]
	private class PatchHealthStarFactor
	{
		private static readonly MethodInfo HealthFactorApplier = AccessTools.DeclaredMethod(typeof(PatchHealthStarFactor), "applyHealthFactor", (Type[])null, (Type[])null);

		private static float applyHealthFactor(float level, Character character)
		{
			float num = Utils.ReadWithWorldLevelAndStarsFromConfig(character, [return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 2 })] (CreatureConfig c) => c.baseHealth, out var usedStars) ?? (creatureBaseHealth.Value / 100f);
			float num2 = Utils.ReadWithWorldLevelFromConfig(character, (CreatureConfig c) => c.healthGainPerStar) ?? ((character.IsBoss() ? bossHealthGainPerStar : creatureHealthGainPerStar).Value / 100f / Mathf.Max(1f, Mathf.Log10(1f + character.m_health / 100f) * logarithmicScaling.Value));
			return num + (level - 1f - (float)usedStars) * num2;
		}

		[UsedImplicitly]
		private static IEnumerable<CodeInstruction> Transpiler(IEnumerable<CodeInstruction> instructions)
		{
			foreach (CodeInstruction instruction in instructions)
			{
				yield return instruction;
				if (instruction.opcode == OpCodes.Conv_R4)
				{
					yield return new CodeInstruction(OpCodes.Ldarg_0, (object)null);
					yield return new CodeInstruction(OpCodes.Call, (object)HealthFactorApplier);
				}
			}
		}
	}

	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(0)]
	[HarmonyPatch(typeof(CharacterDrop), "GenerateDropList")]
	private class PatchDropChances
	{
		private static readonly MethodInfo AmountCalculator = AccessTools.DeclaredMethod(typeof(PatchDropChances), "CalculateAmount", (Type[])null, (Type[])null);

		private static readonly MethodInfo CheckDropMultiplier = AccessTools.DeclaredMethod(typeof(PatchDropChances), "DropMultiplierCheck", (Type[])null, (Type[])null);

		private static readonly MethodInfo CheckChanceMultiply = AccessTools.DeclaredMethod(typeof(PatchDropChances), "ShallMultiplyAmountWithDropchance", (Type[])null, (Type[])null);

		private static readonly MethodInfo ModifyOnePerPlayer = AccessTools.DeclaredMethod(typeof(PatchDropChances), "ChangeOnePerPlayer", (Type[])null, (Type[])null);

		private static int CalculateAmount(CharacterDrop instance, int calculatedAmount, Drop drop)
		{
			//IL_001b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0021: Expected Obj, but got Unknown
			//IL_0051: Unknown result type (might be due to invalid IL or missing references)
			//IL_0058: Invalid comparison between Unknown and I4
			Character val = (Character)AccessTools.DeclaredField(typeof(CharacterDrop), "m_character").GetValue(instance);
			float num2;
			if (lootSystem.Value != LootSystem.Vanilla && Object.op_Implicit((Object)(object)val))
			{
				ItemDrop component = drop.m_prefab.GetComponent<ItemDrop>();
				if (component == null || (int)component.m_itemData.m_shared.m_itemType != 13)
				{
					float? num = Utils.ReadWithWorldLevelAndStarsFromConfig(val, [return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 2 })] (CreatureConfig c) => c.worldLevelToLootAmount);
					if (num.HasValue)
					{
						num2 = num.GetValueOrDefault();
						if (true)
						{
							goto IL_0148;
						}
					}
					float value;
					float num3;
					if (val.IsBoss())
					{
						num3 = (float)additionalLootChancePerLevelBoss.Value / 100f;
						value = bossLootMultiplier.Value;
					}
					else
					{
						num3 = (float)additionalLootChancePerLevelCreature.Value / 100f;
						value = creatureLootMultiplier.Value;
					}
					num3 = Utils.ReadWithWorldLevelFromConfig(val, (CreatureConfig c) => c.worldLevelToLootPerStar) ?? num3;
					num2 = (1f + num3 * (float)(val.GetLevel() - 1)) * value;
					goto IL_0148;
				}
			}
			return calculatedAmount;
			IL_0148:
			return (int)(num2 + Random.Range(0f, 1f));
		}

		private static bool DropMultiplierCheck(Drop drop, CharacterDrop instance)
		{
			//IL_0037: Unknown result type (might be due to invalid IL or missing references)
			//IL_003d: Expected Obj, but got Unknown
			//IL_0079: Unknown result type (might be due to invalid IL or missing references)
			//IL_0087: Unknown result type (might be due to invalid IL or missing references)
			//IL_008e: Invalid comparison between Unknown and I4
			if (Object.op_Implicit((Object)(object)drop.m_prefab.GetComponent<Character>()))
			{
				return false;
			}
			Character val = (Character)AccessTools.DeclaredField(typeof(CharacterDrop), "m_character").GetValue(instance);
			ItemDrop component = drop.m_prefab.GetComponent<ItemDrop>();
			if (component != null && (int)(component.m_itemData?.m_shared?.m_itemType).GetValueOrDefault() == 13)
			{
				return val.IsBoss() ? multipleBossTrophies.GetToggle() : multipleTrophies.GetToggle();
			}
			LootSystem value = lootSystem.Value;
			if ((uint)value <= 1u)
			{
				return drop.m_levelMultiplier;
			}
			return true;
		}

		private static bool ShallMultiplyAmountWithDropchance(Drop drop, ref int amount, ref float chance)
		{
			//IL_0053: Unknown result type (might be due to invalid IL or missing references)
			//IL_005a: Invalid comparison between Unknown and I4
			LootSystem value = lootSystem.Value;
			if ((uint)value <= 1u)
			{
				return drop.m_levelMultiplier;
			}
			if (lootSystem.Value == LootSystem.CalculateAmount)
			{
				ItemDrop component = drop.m_prefab.GetComponent<ItemDrop>();
				if ((component == null || (int)component.m_itemData.m_shared.m_itemType != 13) && ((drop.m_chance > 0.3f && (int)((float)amount * drop.m_chance) != 0) || ZoneSystem.instance.GetGlobalKey((GlobalKeys)36)))
				{
					amount = (int)((float)amount * drop.m_chance + Random.Range(0f, 1f));
					chance = 1f;
				}
			}
			return false;
		}

		private static int ChangeOnePerPlayer(int players, CharacterDrop drop)
		{
			//IL_0017: Unknown result type (might be due to invalid IL or missing references)
			float num = ((limitBossDropRange.Value == Toggle.On) ? Player.GetPlayersInRangeXZ(((Component)drop).transform.position, 100f) : players);
			num *= bossLootMultiplier.Value;
			if (num - Mathf.Floor(num) > Random.value)
			{
				num++;
			}
			return Mathf.FloorToInt(num);
		}

		[UsedImplicitly]
		private static IEnumerable<CodeInstruction> Transpiler(IEnumerable<CodeInstruction> instructions)
		{
			//IL_00ca: Unknown result type (might be due to invalid IL or missing references)
			//IL_00d4: Expected Obj, but got Unknown
			//IL_00dd: Unknown result type (might be due to invalid IL or missing references)
			//IL_00e7: Expected Obj, but got Unknown
			//IL_00f0: Unknown result type (might be due to invalid IL or missing references)
			//IL_00fa: Expected Obj, but got Unknown
			//IL_0107: Unknown result type (might be due to invalid IL or missing references)
			//IL_0111: Expected Obj, but got Unknown
			//IL_011a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0124: Expected Obj, but got Unknown
			//IL_0201: Unknown result type (might be due to invalid IL or missing references)
			//IL_020b: Expected Obj, but got Unknown
			//IL_0218: Unknown result type (might be due to invalid IL or missing references)
			//IL_0222: Expected Obj, but got Unknown
			//IL_01ba: Unknown result type (might be due to invalid IL or missing references)
			//IL_01c4: Expected Obj, but got Unknown
			//IL_01d1: Unknown result type (might be due to invalid IL or missing references)
			//IL_01db: Expected Obj, but got Unknown
			//IL_016a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0174: Expected Obj, but got Unknown
			//IL_018c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0196: Expected Obj, but got Unknown
			//IL_01a3: Unknown result type (might be due to invalid IL or missing references)
			//IL_01ad: Expected Obj, but got Unknown
			MethodInfo methodInfo = AccessTools.DeclaredMethod(typeof(Object), "op_Equality", (Type[])null, (Type[])null);
			MethodInfo methodInfo2 = AccessTools.DeclaredMethod(typeof(ZNet), "GetNrOfPlayers", (Type[])null, (Type[])null);
			FieldInfo fieldInfo = AccessTools.DeclaredField(typeof(Drop), "m_levelMultiplier");
			bool flag = true;
			List<CodeInstruction> list = new List<CodeInstruction>();
			List<CodeInstruction> list2 = new List<CodeInstruction>(instructions);
			for (int i = 0; i < list2.Count; i++)
			{
				CodeInstruction val = list2[i];
				if (val.opcode == OpCodes.Brtrue && i > 0 && list2[i - 1].opcode == OpCodes.Call && CodeInstructionExtensions.OperandIs(list2[i - 1], (MemberInfo)methodInfo))
				{
					list.Add(val);
					list.Add(new CodeInstruction(OpCodes.Ldarg_0, (object)null));
					list.Add(new CodeInstruction(OpCodes.Ldloc_1, (object)null));
					list.Add(new CodeInstruction(OpCodes.Ldloc_3, (object)null));
					list.Add(new CodeInstruction(OpCodes.Call, (object)AmountCalculator));
					list.Add(new CodeInstruction(OpCodes.Stloc_1, (object)null));
				}
				else if (val.opcode == OpCodes.Ldfld && CodeInstructionExtensions.OperandIs(val, (MemberInfo)fieldInfo))
				{
					if (flag)
					{
						flag = false;
						list.Add(new CodeInstruction(OpCodes.Ldloca_S, (object)1));
						list.Add(new CodeInstruction(OpCodes.Ldloca_S, list2[i + 2].operand));
						list.Add(new CodeInstruction(OpCodes.Call, (object)CheckChanceMultiply));
					}
					else
					{
						list.Add(new CodeInstruction(OpCodes.Ldarg_0, (object)null));
						list.Add(new CodeInstruction(OpCodes.Call, (object)CheckDropMultiplier));
					}
				}
				else if (CodeInstructionExtensions.Calls(val, methodInfo2))
				{
					list.Add(val);
					list.Add(new CodeInstruction(OpCodes.Ldarg_0, (object)null));
					list.Add(new CodeInstruction(OpCodes.Call, (object)ModifyOnePerPlayer));
				}
				else
				{
					list.Add(val);
				}
			}
			return list;
		}
	}

	[HarmonyPatch(typeof(DropOnDestroyed), "OnDestroyed")]
	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	private class PatchSeagullDrops
	{
		[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
		[UsedImplicitly]
		private static void Prefix(DropOnDestroyed __instance)
		{
			//IL_003e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0043: Unknown result type (might be due to invalid IL or missing references)
			//IL_0046: Unknown result type (might be due to invalid IL or missing references)
			//IL_0060: Unknown result type (might be due to invalid IL or missing references)
			//IL_007a: Unknown result type (might be due to invalid IL or missing references)
			if (((Object)__instance).name.StartsWith("Seagal") || ((Object)__instance).name.StartsWith("Crow"))
			{
				List<DropData> drops = __instance.m_dropWhenDestroyed.m_drops;
				for (int i = 0; i < drops.Count; i++)
				{
					DropData val = drops[i];
					val.m_stackMin = (int)((float)val.m_stackMin * lootMultiplierPassive.Value);
					val.m_stackMax = (int)((float)val.m_stackMax * lootMultiplierPassive.Value);
					drops[i] = val;
				}
			}
		}
	}

	[HarmonyPatch]
	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(0)]
	private class PatchCreateSpawnerRepetition
	{
		[UsedImplicitly]
		private static IEnumerable<MethodInfo> TargetMethods()
		{
			return new MethodInfo[2]
			{
				AccessTools.DeclaredMethod(typeof(CreatureSpawner), "Awake", (Type[])null, (Type[])null),
				AccessTools.DeclaredMethod(typeof(CreatureSpawner), "UpdateSpawner", (Type[])null, (Type[])null)
			};
		}

		[UsedImplicitly]
		private static void Postfix(CreatureSpawner __instance)
		{
			//IL_004b: Unknown result type (might be due to invalid IL or missing references)
			ZDO zDO = __instance.m_nview.GetZDO();
			if (__instance.m_respawnTimeMinuts == 0f && zDO.GetLong("alive_time", long.MinValue) != long.MinValue)
			{
				__instance.m_respawnTimeMinuts = ((((Component)__instance).transform.position.y > 4500f) ? dungeonCreatureRespawnTime.Value : campCreatureRespawnTime.Value);
			}
		}
	}

	[HarmonyPatch(typeof(Character), "SetHealth")]
	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	private class PatchCharacterHealthSetter
	{
		[UsedImplicitly]
		[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
		private static void Postfix(Character __instance)
		{
			if (!__instance.IsBoss() || (API.GetAffixBoss(__instance) != BossAffix.Twin && API.GetAffixBoss(__instance) != BossAffix.Godlike))
			{
				return;
			}
			Character twinBoss = API.GetTwinBoss(__instance);
			if ((Object)(object)twinBoss != (Object)null && Math.Abs(twinBoss.GetHealth() - __instance.GetHealth()) > 0f)
			{
				twinBoss.m_nview.ClaimOwnership();
				if (__instance.GetHealth() <= 0f)
				{
					ZNetScene.instance.Destroy(((Component)twinBoss).gameObject);
				}
				else
				{
					twinBoss.SetHealth(__instance.GetHealth());
				}
			}
		}
	}

	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(0)]
	[HarmonyPatch(typeof(Character), "Damage")]
	private class PatchCharacterHit
	{
		private static bool IsApplyingReflectiveDmg;

		[UsedImplicitly]
		[HarmonyPrefix]
		private static void Prefix(Character __instance, HitData hit)
		{
			//IL_06c4: Unknown result type (might be due to invalid IL or missing references)
			//IL_06c9: Unknown result type (might be due to invalid IL or missing references)
			//IL_06cb: Unknown result type (might be due to invalid IL or missing references)
			//IL_06ce: Invalid comparison between Unknown and I4
			//IL_06d2: Unknown result type (might be due to invalid IL or missing references)
			//IL_06d6: Invalid comparison between Unknown and I4
			//IL_0a0f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0a14: Unknown result type (might be due to invalid IL or missing references)
			//IL_0a16: Unknown result type (might be due to invalid IL or missing references)
			//IL_0a1b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0a20: Unknown result type (might be due to invalid IL or missing references)
			//IL_0a22: Unknown result type (might be due to invalid IL or missing references)
			//IL_0a2c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0a31: Unknown result type (might be due to invalid IL or missing references)
			//IL_0a36: Unknown result type (might be due to invalid IL or missing references)
			//IL_0a3d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0a42: Unknown result type (might be due to invalid IL or missing references)
			//IL_0a47: Unknown result type (might be due to invalid IL or missing references)
			//IL_0a56: Expected Obj, but got Unknown
			if (detailedDamageLogging.GetToggle() && (Object)(object)hit.GetAttacker() != (Object)null)
			{
				Debug.Log((object)(buildCharacterDescription(hit.GetAttacker()) + " hits " + buildCharacterDescription(__instance)));
				Debug.Log((object)("Base Damage: " + buildHitDamageLogString(hit)));
			}
			Character attacker = hit.GetAttacker();
			if ((Object)(object)attacker != (Object)null && !attacker.IsPlayer())
			{
				Dictionary<ModifyDamage, float> dictionary = Utils.ReadEnumWithWorldLevelAndStarsFromConfig(attacker, [return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 1, 2 })] (CreatureConfig c) => c.baseDamage, out var usedStars);
				if (!usedStars.TryGetValue(ModifyDamage.All, out var value))
				{
					dictionary[ModifyDamage.All] = creatureBaseDamage.Value / 100f;
				}
				float num = (Utils.ReadWithWorldLevelFromConfig(attacker, (CreatureConfig c) => c.damageGainPerStar) ?? ((attacker.IsBoss() ? bossDamageGainPerStar : creatureDamageGainPerStar).Value / 100f)) / Mathf.Max(1f, Mathf.Log10(1f + (hit.GetTotalBlockableDamage() - hit.m_damage.m_spirit - hit.m_damage.m_nonPlayer) / 10f) * logarithmicScaling.Value);
				dictionary[ModifyDamage.All] += num * (float)Math.Max(attacker.GetLevel() - 1 - value, 0);
				ApplyDamageModifiers(hit, dictionary);
			}
			if ((Object)(object)attacker != (Object)null && !attacker.IsBoss() && API.GetInfusionCreature(attacker) != CreatureInfusion.None)
			{
				CreatureInfusion creatureInfusion;
				for (creatureInfusion = API.GetInfusionCreature(hit.GetAttacker()); creatureInfusion == CreatureInfusion.Chaos; creatureInfusion = (CreatureInfusion)Random.Range(1, Enum.GetValues(typeof(CreatureInfusion)).Length))
				{
				}
				float totalDamage = hit.GetTotalDamage();
				if (totalDamage > 0f)
				{
					float num2 = Math.Min(totalDamage, __instance.GetMaxHealth() * 0.33f);
					switch (creatureInfusion)
					{
					case CreatureInfusion.Fire:
						hit.ApplyModifier(1f - num2 / totalDamage);
						hit.m_damage.m_fire += num2;
						break;
					case CreatureInfusion.Frost:
						hit.ApplyModifier(1f - num2 / totalDamage);
						hit.m_damage.m_frost += num2;
						break;
					case CreatureInfusion.Lightning:
						hit.ApplyModifier(1f - num2 / totalDamage);
						hit.m_damage.m_lightning += num2;
						break;
					case CreatureInfusion.Spirit:
						hit.ApplyModifier(1f - num2 / totalDamage);
						hit.m_damage.m_damage += totalDamage * 0.2f;
						attacker.Heal(Math.Min(totalDamage, attacker.GetMaxHealth() * 0.2f), true);
						break;
					}
				}
			}
			if (!__instance.IsBoss() && API.GetInfusionCreature(__instance) != CreatureInfusion.None)
			{
				CreatureInfusion creatureInfusion2 = API.GetInfusionCreature(__instance);
				while (true)
				{
					switch (creatureInfusion2)
					{
					case CreatureInfusion.Chaos:
						goto IL_034b;
					case CreatureInfusion.Fire:
						hit.m_damage.m_fire /= 2f;
						hit.m_damage.m_frost *= 2f;
						break;
					case CreatureInfusion.Frost:
						hit.m_damage.m_frost /= 2f;
						hit.m_damage.m_fire *= 2f;
						break;
					case CreatureInfusion.Lightning:
						hit.m_damage.m_lightning /= 2f;
						hit.m_damage.m_spirit *= 2f;
						break;
					case CreatureInfusion.Spirit:
						hit.m_damage.m_spirit /= 2f;
						hit.m_damage.m_lightning *= 2f;
						break;
					case CreatureInfusion.Poison:
						hit.m_damage.m_poison = 0f;
						break;
					}
					break;
					IL_034b:
					creatureInfusion2 = (CreatureInfusion)Random.Range(1, Enum.GetValues(typeof(CreatureInfusion)).Length);
				}
			}
			if ((Object)(object)attacker != (Object)null && attacker.IsBoss() && (API.GetAffixBoss(attacker) == BossAffix.Elementalist || API.GetAffixBoss(attacker) == BossAffix.Godlike))
			{
				float num3 = 1f + (Utils.ReadValueFromEnumWithWorldLevelAndStarsFromConfig(attacker, BossAffix.Elementalist, [return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 2, 1, 2 })] (CreatureConfig c) => c.worldLevelToBossAffixFactor) ?? (bossAffixPowerElementalist.Value / 100f));
				hit.m_damage.m_fire *= num3;
				hit.m_damage.m_frost *= num3;
				hit.m_damage.m_spirit *= num3;
				hit.m_damage.m_poison *= num3;
				hit.m_damage.m_lightning *= num3;
			}
			if ((Object)(object)attacker != (Object)null && attacker.IsBoss() && (API.GetAffixBoss(attacker) == BossAffix.Enraged || API.GetAffixBoss(attacker) == BossAffix.Godlike))
			{
				float num4 = 1f + (Utils.ReadValueFromEnumWithWorldLevelAndStarsFromConfig(attacker, BossAffix.Enraged, [return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 2, 1, 2 })] (CreatureConfig c) => c.worldLevelToBossAffixFactor) ?? (bossAffixPowerEnraged.Value / 100f));
				hit.m_damage.m_blunt *= num4;
				hit.m_damage.m_chop *= num4;
				hit.m_damage.m_pierce *= num4;
				hit.m_damage.m_slash *= num4;
			}
			if ((Object)(object)attacker != (Object)null && attacker.IsBoss() && (API.GetAffixBoss(attacker) == BossAffix.Twin || API.GetAffixBoss(attacker) == BossAffix.Godlike))
			{
				float num5 = Utils.ReadValueFromEnumWithWorldLevelAndStarsFromConfig(attacker, BossAffix.Twin, [return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 2, 1, 2 })] (CreatureConfig c) => c.worldLevelToBossAffixFactor) ?? (bossAffixPowerTwin.Value / 100f);
				hit.ApplyModifier(num5);
			}
			if (__instance.IsBoss())
			{
				bool flag = API.GetAffixBoss(__instance) == BossAffix.Shielded || API.GetAffixBoss(__instance) == BossAffix.Godlike;
				bool flag2 = flag;
				if (flag2)
				{
					SkillType skill = hit.m_skill;
					bool flag3 = (((int)skill == 8 || (int)skill == 14) ? true : false);
					flag2 = flag3;
				}
				if (flag2)
				{
					float num6 = Utils.ReadValueFromEnumWithWorldLevelAndStarsFromConfig(__instance, BossAffix.Shielded, [return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 2, 1, 2 })] (CreatureConfig c) => c.worldLevelToBossAffixFactor) ?? (bossAffixPowerShielded.Value / 100f);
					hit.ApplyModifier(1f - num6);
				}
				else if (API.GetAffixBoss(__instance) == BossAffix.Sturdy || API.GetAffixBoss(__instance) == BossAffix.Godlike)
				{
					float num7 = Utils.ReadValueFromEnumWithWorldLevelAndStarsFromConfig(__instance, BossAffix.Sturdy, [return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 2, 1, 2 })] (CreatureConfig c) => c.worldLevelToBossAffixFactor) ?? (bossAffixPowerSturdy.Value / 100f);
					hit.ApplyModifier(1f - num7);
				}
			}
			else if (!__instance.IsBoss() && API.GetExtraEffectCreature(__instance) == CreatureExtraEffect.Armored)
			{
				float num8 = Utils.ReadEffectPowerFromConfig(__instance, CreatureExtraEffect.Armored) ?? 0.33f;
				hit.ApplyModifier(num8);
			}
			Dictionary<ModifyDamage, float> damageModifiers = Utils.ReadEnumWithWorldLevelAndStarsFromConfig(__instance, [return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 1, 2 })] (CreatureConfig c) => c.worldLevelToDamageTakenModifier);
			ApplyDamageModifiers(hit, damageModifiers);
			if (__instance.IsBoss() && API.GetAffixBoss(__instance) == BossAffix.Reflective && (Object)(object)attacker != (Object)null && (Object)(object)attacker != (Object)(object)__instance && !IsApplyingReflectiveDmg)
			{
				float num9 = Utils.ReadValueFromEnumWithWorldLevelAndStarsFromConfig(__instance, BossAffix.Reflective, [return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 2, 1, 2 })] (CreatureConfig c) => c.worldLevelToBossAffixFactor) ?? bossAffixPowerReflective.Value;
				if (((Object)__instance).name.StartsWith("Eikthyr", StringComparison.Ordinal))
				{
					num9 *= 1.2f;
				}
				if (((Object)__instance).name.StartsWith("gd_king", StringComparison.Ordinal))
				{
					num9 *= 2f;
				}
				if (((Object)__instance).name.StartsWith("Bonemass", StringComparison.Ordinal))
				{
					num9 *= 3f;
				}
				if (((Object)__instance).name.StartsWith("Dragon", StringComparison.Ordinal))
				{
					num9 *= 4f;
				}
				if (((Object)__instance).name.StartsWith("GoblinKing", StringComparison.Ordinal))
				{
					num9 *= 5f;
				}
				if (((Object)__instance).name.StartsWith("SeekerQueen", StringComparison.Ordinal) || (((Object)__instance).name.StartsWith("Crystal", StringComparison.Ordinal) && ((Object)__instance).name.EndsWith("Reaper", StringComparison.Ordinal)))
				{
					num9 *= 6f;
				}
				if (((Object)__instance).name.StartsWith("Fader", StringComparison.Ordinal))
				{
					num9 *= 7f;
				}
				if (((Object)__instance).name.StartsWith("FrozenKing", StringComparison.Ordinal))
				{
					num9 *= 8f;
				}
				num9 *= 1f + 0.2f * (float)(__instance.GetLevel() - 1);
				HitData val = new HitData
				{
					m_attacker = __instance.GetZDOID(),
					m_dir = hit.m_dir * -1f,
					m_point = ((Component)attacker).transform.localPosition,
					m_damage = 
					{
						m_damage = num9
					}
				};
				try
				{
					IsApplyingReflectiveDmg = true;
					attacker.Damage(val);
				}
				finally
				{
					IsApplyingReflectiveDmg = false;
				}
			}
			if (detailedDamageLogging.GetToggle() && (Object)(object)hit.GetAttacker() != (Object)null)
			{
				Debug.Log((object)("Modified Damage: " + buildHitDamageLogString(hit)));
			}
		}

		private static void ApplyDamageModifiers(HitData hit, Dictionary<ModifyDamage, float> damageModifiers)
		{
			//IL_0255: Unknown result type (might be due to invalid IL or missing references)
			//IL_025b: Invalid comparison between Unknown and I4
			//IL_01bf: Unknown result type (might be due to invalid IL or missing references)
			//IL_01c5: Invalid comparison between Unknown and I4
			//IL_0209: Unknown result type (might be due to invalid IL or missing references)
			//IL_0210: Invalid comparison between Unknown and I4
			//IL_022f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0236: Invalid comparison between Unknown and I4
			//IL_0199: Unknown result type (might be due to invalid IL or missing references)
			//IL_01a0: Invalid comparison between Unknown and I4
			//IL_02ea: Unknown result type (might be due to invalid IL or missing references)
			//IL_02f0: Invalid comparison between Unknown and I4
			//IL_02c5: Unknown result type (might be due to invalid IL or missing references)
			//IL_02cb: Invalid comparison between Unknown and I4
			//IL_027a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0281: Invalid comparison between Unknown and I4
			//IL_0174: Unknown result type (might be due to invalid IL or missing references)
			//IL_017a: Invalid comparison between Unknown and I4
			//IL_01e4: Unknown result type (might be due to invalid IL or missing references)
			//IL_01ea: Invalid comparison between Unknown and I4
			//IL_02a0: Unknown result type (might be due to invalid IL or missing references)
			//IL_02a6: Invalid comparison between Unknown and I4
			//IL_0441: Unknown result type (might be due to invalid IL or missing references)
			//IL_040c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0413: Invalid comparison between Unknown and I4
			foreach (KeyValuePair<ModifyDamage, float> damageModifier in damageModifiers)
			{
				switch (damageModifier.Key)
				{
				case ModifyDamage.All:
					hit.ApplyModifier(damageModifier.Value);
					break;
				case ModifyDamage.Blunt:
					hit.m_damage.m_blunt *= damageModifier.Value;
					break;
				case ModifyDamage.Chop:
					hit.m_damage.m_chop *= damageModifier.Value;
					break;
				case ModifyDamage.Pierce:
					hit.m_damage.m_pierce *= damageModifier.Value;
					break;
				case ModifyDamage.Slash:
					hit.m_damage.m_slash *= damageModifier.Value;
					break;
				case ModifyDamage.Physical:
					hit.m_damage.m_blunt *= damageModifier.Value;
					hit.m_damage.m_chop *= damageModifier.Value;
					hit.m_damage.m_pierce *= damageModifier.Value;
					hit.m_damage.m_slash *= damageModifier.Value;
					break;
				case ModifyDamage.Axes:
					if ((int)hit.m_skill == 7)
					{
						hit.ApplyModifier(damageModifier.Value);
					}
					break;
				case ModifyDamage.BloodMagic:
					if ((int)hit.m_skill == 10)
					{
						hit.ApplyModifier(damageModifier.Value);
					}
					break;
				case ModifyDamage.Bows:
					if ((int)hit.m_skill == 8)
					{
						hit.ApplyModifier(damageModifier.Value);
					}
					break;
				case ModifyDamage.Clubs:
					if ((int)hit.m_skill == 3)
					{
						hit.ApplyModifier(damageModifier.Value);
					}
					break;
				case ModifyDamage.Crossbows:
					if ((int)hit.m_skill == 14)
					{
						hit.ApplyModifier(damageModifier.Value);
					}
					break;
				case ModifyDamage.ElementalMagic:
					if ((int)hit.m_skill == 9)
					{
						hit.ApplyModifier(damageModifier.Value);
					}
					break;
				case ModifyDamage.Knives:
					if ((int)hit.m_skill == 2)
					{
						hit.ApplyModifier(damageModifier.Value);
					}
					break;
				case ModifyDamage.Pickaxes:
					if ((int)hit.m_skill == 12)
					{
						hit.ApplyModifier(damageModifier.Value);
					}
					break;
				case ModifyDamage.Polearms:
					if ((int)hit.m_skill == 4)
					{
						hit.ApplyModifier(damageModifier.Value);
					}
					break;
				case ModifyDamage.Spears:
					if ((int)hit.m_skill == 5)
					{
						hit.ApplyModifier(damageModifier.Value);
					}
					break;
				case ModifyDamage.Swords:
					if ((int)hit.m_skill == 1)
					{
						hit.ApplyModifier(damageModifier.Value);
					}
					break;
				case ModifyDamage.Fire:
					hit.m_damage.m_fire *= damageModifier.Value;
					break;
				case ModifyDamage.Frost:
					hit.m_damage.m_frost *= damageModifier.Value;
					break;
				case ModifyDamage.Lightning:
					hit.m_damage.m_lightning *= damageModifier.Value;
					break;
				case ModifyDamage.Poison:
					hit.m_damage.m_poison *= damageModifier.Value;
					break;
				case ModifyDamage.Spirit:
					hit.m_damage.m_spirit *= damageModifier.Value;
					break;
				case ModifyDamage.Elemental:
					hit.m_damage.m_fire *= damageModifier.Value;
					hit.m_damage.m_frost *= damageModifier.Value;
					hit.m_damage.m_lightning *= damageModifier.Value;
					hit.m_damage.m_poison *= damageModifier.Value;
					hit.m_damage.m_spirit *= damageModifier.Value;
					break;
				case ModifyDamage.Unarmed:
					if ((int)hit.m_skill == 11)
					{
						hit.ApplyModifier(damageModifier.Value);
					}
					break;
				case ModifyDamage.Weapons:
				{
					SkillType[] array = new SkillType[11];
					RuntimeHelpers.InitializeArray(array, __ldtoken(_003CPrivateImplementationDetails_003E._04C8860C76E89FA3419F988797F618CF7D19BA180EE7BE068FBE8B1A926918A0));
					if (((IEnumerable<SkillType>)array).Contains(hit.m_skill))
					{
						hit.ApplyModifier(damageModifier.Value);
					}
					break;
				}
				}
			}
		}
	}

	[HarmonyPatch(typeof(Character), "SetTamed")]
	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	private class PatchTameToBroadcast
	{
		[UsedImplicitly]
		[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
		private static void Postfix(bool tamed, bool ___m_tamed, ZNetView ___m_nview)
		{
			if (___m_nview.IsValid() && ___m_tamed != tamed)
			{
				___m_nview.InvokeRPC(0L, "SetTamed", new object[1] { tamed });
			}
		}
	}

	[HarmonyPatch(typeof(Character), "RPC_SetTamed")]
	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	private class HandleTamedCreaturePatch
	{
		[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
		[UsedImplicitly]
		private static void Postfix(Character __instance, bool tamed, out bool ___m_tamed, ZNetView ___m_nview)
		{
			bool flag = ___m_nview.GetZDO().GetBool("tamed", false);
			___m_nview.GetZDO().Set("tamed", ___m_tamed = tamed);
			UpdateCharacterAttributesFromConfig(__instance);
			___m_nview.GetZDO().Set("tamed", flag);
		}
	}

	[HarmonyPatch(typeof(ZNetScene), "Awake")]
	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	private class PatchSurtlingSpawn
	{
		[UsedImplicitly]
		private static void Postfix()
		{
			SpawnSystem component = ZNetScene.instance.GetPrefab("_ZoneCtrl").GetComponent<SpawnSystem>();
			SpawnData val = component.m_spawnLists.SelectMany((SpawnSystemList s) => s.m_spawners).FirstOrDefault((SpawnData c) => c.m_name == "" && ((Object)c.m_prefab).name == "Surtling");
			if (val != null)
			{
				val.m_minAltitude = 2f;
			}
		}
	}

	[HarmonyPatch(typeof(Player), "LateUpdate")]
	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	private class EnsureUniqueKeys
	{
		[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
		[UsedImplicitly]
		private static void Postfix(Player __instance)
		{
			__instance.AddQueuedKeys();
		}
	}

	[HarmonyPatch(typeof(Character), "GetSlideAngle")]
	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	private class ScaleSlideAngleWithSize
	{
		[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
		[UsedImplicitly]
		private static void Postfix(Character __instance, ref float __result)
		{
			//IL_0037: Unknown result type (might be due to invalid IL or missing references)
			if (__instance.HaveRider())
			{
				__result = 45f * (2f - 1f / (1f + Mathf.Max(0f, __instance.GetCollider().height * ((Component)__instance).transform.localScale.y - 3f)));
			}
		}
	}

	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(0)]
	[HarmonyPatch(typeof(Teleport), "Interact")]
	private class DungeonLoadCheck
	{
		[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(0)]
		private class UpdateDungeonFrameEnd : MonoBehaviour
		{
			public DungeonGenerator dungeonGenerator = null;

			public IEnumerator Start()
			{
				yield return (object)new WaitForEndOfFrame();
				Regen(dungeonGenerator);
				Object.Destroy((Object)(object)this);
			}
		}

		private static void Regen(DungeonGenerator dungeon)
		{
			//IL_0009: Unknown result type (might be due to invalid IL or missing references)
			//IL_000f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0019: Unknown result type (might be due to invalid IL or missing references)
			//IL_001e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0029: Unknown result type (might be due to invalid IL or missing references)
			//IL_002e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0057: Unknown result type (might be due to invalid IL or missing references)
			//IL_0071: Unknown result type (might be due to invalid IL or missing references)
			//IL_012e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0179: Unknown result type (might be due to invalid IL or missing references)
			Bounds val = new Bounds(((Component)dungeon).transform.position, dungeon.m_zoneSize * 2f);
			List<GameObject> list = new List<GameObject>();
			Scene activeScene = SceneManager.GetActiveScene();
			activeScene.GetRootGameObjects(list);
			foreach (GameObject item in list)
			{
				if (!(item.transform.position.y > 3500f) || !val.Contains(item.transform.position))
				{
					continue;
				}
				Piece component = item.GetComponent<Piece>();
				if (((component != null) ? component.GetCreator() : 0) != 0L || !((Object)(object)item != (Object)(object)((Component)dungeon).gameObject) || Object.op_Implicit((Object)(object)item.GetComponent<Player>()) || Object.op_Implicit((Object)(object)item.GetComponent<TombStone>()))
				{
					continue;
				}
				ZNetView component2 = item.GetComponent<ZNetView>();
				if (component2 != null)
				{
					ZDO zDO = component2.GetZDO();
					if (zDO != null)
					{
						zDO.SetOwner(ZDOMan.instance.m_sessionID);
					}
				}
				ZNetScene.instance.Destroy(item);
			}
			Location zoneLocation = Location.GetZoneLocation(((Component)dungeon).transform.position);
			if (zoneLocation != null && zoneLocation.m_useCustomInteriorTransform && Object.op_Implicit((Object)(object)zoneLocation.m_interiorTransform))
			{
				dungeon.m_originalPosition.y = ZNetScene.instance.GetPrefab(Utils.GetPrefabName(((Component)dungeon).gameObject)).transform.localPosition.y;
			}
			dungeon.Generate((SpawnMode)0);
		}

		[UsedImplicitly]
		private static void Prefix(Teleport __instance)
		{
			//IL_0021: Unknown result type (might be due to invalid IL or missing references)
			//IL_0026: Unknown result type (might be due to invalid IL or missing references)
			//IL_0095: Unknown result type (might be due to invalid IL or missing references)
			//IL_009a: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a4: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a9: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ae: Unknown result type (might be due to invalid IL or missing references)
			//IL_00bd: Unknown result type (might be due to invalid IL or missing references)
			if (dungeonRespawnTime.Value <= 0)
			{
				return;
			}
			List<GameObject> list = new List<GameObject>();
			Scene activeScene = SceneManager.GetActiveScene();
			activeScene.GetRootGameObjects(list);
			foreach (DungeonGenerator item in from g in list
				select g.GetComponent<DungeonGenerator>() into g
				where Object.op_Implicit((Object)(object)g)
				select g)
			{
				Bounds val = new Bounds(((Component)item).transform.position, Vector3.one * 20f);
				if (!val.Contains(((Component)__instance.m_targetPoint).transform.position))
				{
					continue;
				}
				long num = (long)ZNet.instance.GetTimeSeconds();
				ZDO zDO = ((Component)item).GetComponent<ZNetView>().GetZDO();
				long num2 = zDO.GetLong("cllc DungeonRegen", 0L);
				if (num > num2 + dungeonRespawnTime.Value * 60)
				{
					if (num2 != 0)
					{
						UpdateDungeonFrameEnd updateDungeonFrameEnd = ((Component)__instance).gameObject.AddComponent<UpdateDungeonFrameEnd>();
						updateDungeonFrameEnd.dungeonGenerator = item;
					}
					zDO.Set("cllc DungeonRegen", num);
				}
			}
		}
	}

	[HarmonyPatch(typeof(DungeonDB), "Start")]
	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	private static class RemoveQueen
	{
		[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
		private static void Postfix(DungeonDB __instance)
		{
			//IL_0024: Unknown result type (might be due to invalid IL or missing references)
			RoomData room = __instance.GetRoom(StringExtensionMethods.GetStableHashCode("dvergr_new_bossroom_ENTRANCE02"));
			room.m_prefab.HoldReference();
			room.m_prefab.Load();
			Transform val = room.m_prefab.Asset.transform.Find("Boss");
			if (val != null)
			{
				Object.Destroy((Object)(object)((Component)val).gameObject);
			}
		}
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	[HarmonyPatch(typeof(ZoneSystem), "SetupLocations")]
	private static class RemoveFrozenKing
	{
		[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
		private static void Postfix(ZoneSystem __instance)
		{
			//IL_001f: Unknown result type (might be due to invalid IL or missing references)
			ZoneLocation location = __instance.GetLocation("DN_Bossroom");
			location.m_prefab.HoldReference();
			location.m_prefab.Load();
			Character componentInChildren = ((Component)location.m_prefab.Asset.transform).GetComponentInChildren<Character>();
			if (componentInChildren != null && ((Object)componentInChildren).name == "FrozenKing")
			{
				Object.Destroy((Object)(object)((Component)componentInChildren).gameObject);
			}
		}
	}

	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(0)]
	[HarmonyPatch]
	private static class FirstQueenIsFree
	{
		private static IEnumerable<MethodInfo> TargetMethods()
		{
			return new MethodInfo[3]
			{
				AccessTools.DeclaredMethod(typeof(OfferingBowl), "GetHoverText", (Type[])null, (Type[])null),
				AccessTools.DeclaredMethod(typeof(OfferingBowl), "Interact", (Type[])null, (Type[])null),
				AccessTools.DeclaredMethod(typeof(OfferingBowl), "UseItem", (Type[])null, (Type[])null)
			};
		}

		private static void Prefix(OfferingBowl __instance, out Tuple<bool, string> __state)
		{
			__state = new Tuple<bool, string>(__instance.m_useItemStands, __instance.m_useItemText);
			if (Character.s_characters.Any([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (Character c) =>
			{
				string prefabName = Utils.GetPrefabName(((Component)c).gameObject);
				return (prefabName == "SeekerQueen" || prefabName == "FrozenKing") ? true : false;
			}))
			{
				return;
			}
			ZNetView val = findQueenDungeonGenerator(__instance) ?? findInteriorAltar(__instance);
			if (val == null)
			{
				return;
			}
			bool flag = !val.GetZDO().GetBool("CLLC boss free spawn used", false);
			bool flag2 = flag;
			bool flag3;
			if (flag2)
			{
				GameObject bossPrefab = __instance.m_bossPrefab;
				if (bossPrefab != null)
				{
					string name = ((Object)bossPrefab).name;
					if (name == "SeekerQueen" || name == "FrozenKing")
					{
						flag3 = true;
						goto IL_00b8;
					}
				}
				flag3 = false;
				goto IL_00b8;
			}
			goto IL_00bc;
			IL_00bc:
			if (flag2)
			{
				__instance.m_useItemStands = true;
				__instance.m_useItemText = "$piece_use";
			}
			return;
			IL_00b8:
			flag2 = flag3;
			goto IL_00bc;
		}

		private static void Finalizer(OfferingBowl __instance, Tuple<bool, string> __state)
		{
			__instance.m_useItemStands = __state.Item1;
			__instance.m_useItemText = __state.Item2;
		}
	}

	[HarmonyPatch(typeof(OfferingBowl), "SpawnBoss")]
	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	private static class UnmarkQueenFree
	{
		[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
		private static void Postfix(OfferingBowl __instance)
		{
			ZNetView val = findQueenDungeonGenerator(__instance) ?? findInteriorAltar(__instance);
			if (val != null)
			{
				val.GetZDO().Set("CLLC boss free spawn used", true);
			}
		}
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	[HarmonyPatch(typeof(CharacterAnimEvent), "CustomFixedUpdate")]
	private static class PatchCharacterAnimationSpeed
	{
		[UsedImplicitly]
		[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
		private static void Prefix(Character ___m_character, ref Animator ___m_animator)
		{
			if (___m_character.IsPlayer() || !___m_character.InAttack())
			{
				return;
			}
			double num = (double)___m_animator.speed * 10000000.0 % 100.0;
			if ((!(num < 30.0) || !(num > 10.0)) && !(___m_animator.speed <= 0.001f))
			{
				float num2 = (Utils.ReadWithWorldLevelAndStarsFromConfig(___m_character, [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)] [return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 2 })] (CreatureConfig c) => c.baseAttackSpeed, out var usedStars) ?? (creatureAttackSpeed.Value / 100f)) - 1f;
				float valueOrDefault = Utils.ReadWithWorldLevelFromConfig(___m_character, [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)] (CreatureConfig c) => c.attackSpeedGainPerStar).GetValueOrDefault();
				num2 += valueOrDefault * (float)(___m_character.GetLevel() - 1 - usedStars);
				if (!___m_character.IsBoss() && API.GetExtraEffectCreature(___m_character) == CreatureExtraEffect.Aggressive)
				{
					float num3 = Utils.ReadEffectPowerFromConfig(___m_character, CreatureExtraEffect.Armored) ?? 0.5f;
					num2 += num3 / 2f;
				}
				___m_animator.speed = ___m_animator.speed * (1f + num2) + 1.9E-06f;
			}
		}
	}

	[HarmonyPatch(typeof(Attack), "Start")]
	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	private static class PatchWeaponAttackTime
	{
		[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
		[UsedImplicitly]
		private static void Postfix(Humanoid character, ItemData weapon, bool __result)
		{
			if (!((Character)character).IsPlayer() && __result && !((Character)character).IsBoss() && API.GetExtraEffectCreature((Character)(object)character) == CreatureExtraEffect.Aggressive)
			{
				float num = Utils.ReadEffectPowerFromConfig((Character)(object)character, CreatureExtraEffect.Armored) ?? 0.5f;
				weapon.m_lastAttackTime -= weapon.m_shared.m_aiAttackInterval * Mathf.Max(0f, 0.5f - num / 3f);
			}
		}
	}

	[HarmonyPatch(typeof(EnemyHud), "ShowHud")]
	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(0)]
	public class ShowStar
	{
		[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
		public class CharacterCache
		{
			public int levelCache;

			[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(1)]
			public string nameCache = null;

			[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)]
			public string cachedName;
		}

		public static readonly ConditionalWeakTable<Character, CharacterCache> NeedsUpdate = new ConditionalWeakTable<Character, CharacterCache>();

		public static void ForceUpdate()
		{
			Character[] array = Object.FindObjectsOfType<Character>();
			foreach (Character key in array)
			{
				NeedsUpdate.Remove(key);
			}
		}

		[UsedImplicitly]
		private static void Prefix(Character c, Dictionary<Character, HudData> ___m_huds, out bool __state)
		{
			if (!NeedsUpdate.TryGetValue(c, out var value) || value.levelCache != c.m_level || value.nameCache != c.m_name || !___m_huds.ContainsKey(c))
			{
				NeedsUpdate.Remove(c);
				NeedsUpdate.Add(c, new CharacterCache
				{
					levelCache = c.m_level,
					nameCache = c.m_name
				});
				__state = true;
			}
			else
			{
				__state = false;
			}
		}

		[UsedImplicitly]
		private static void Postfix(Character c, Dictionary<Character, HudData> ___m_huds, GameObject ___m_baseHud, bool __state)
		{
			//IL_0098: Unknown result type (might be due to invalid IL or missing references)
			//IL_009f: Expected Obj, but got Unknown
			//IL_00ba: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c9: Unknown result type (might be due to invalid IL or missing references)
			//IL_04ed: Unknown result type (might be due to invalid IL or missing references)
			//IL_04f4: Expected Obj, but got Unknown
			//IL_0521: Unknown result type (might be due to invalid IL or missing references)
			//IL_0131: Unknown result type (might be due to invalid IL or missing references)
			//IL_0148: Unknown result type (might be due to invalid IL or missing references)
			//IL_0553: Unknown result type (might be due to invalid IL or missing references)
			//IL_0581: Unknown result type (might be due to invalid IL or missing references)
			//IL_0240: Unknown result type (might be due to invalid IL or missing references)
			//IL_040a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0430: Unknown result type (might be due to invalid IL or missing references)
			if (!__state)
			{
				return;
			}
			GameObject gui = ___m_huds[c].m_gui;
			if (Object.op_Implicit((Object)(object)gui.transform.Find("level_3")))
			{
				TextMeshProUGUI component = ((Component)gui.transform.Find("Name")).GetComponent<TextMeshProUGUI>();
				Transform val = gui.transform.Find("extraeffecttext");
				GameObject val2 = ((val != null) ? ((Component)val).gameObject : null);
				if (val2 == null)
				{
					val2 = new GameObject("extraeffecttext", new Type[1] { typeof(RectTransform) });
					val2.transform.SetParent(gui.transform, false);
					((RectTransform)val2.transform).sizeDelta = new Vector2(300f, 50f);
					Text val3 = val2.AddComponent<Text>();
					val3.font = Resources.FindObjectsOfTypeAll<Font>().FirstOrDefault([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (Font x) => ((Object)x).name == "AveriaSerifLibre-Bold");
					val3.fontSize = (int)((TMP_Text)component).fontSize;
					val3.alignment = (TextAnchor)4;
					Outline val4 = val2.AddComponent<Outline>();
					((Shadow)val4).effectColor = Color.black;
					((Shadow)val4).effectDistance = new Vector2(1f, -1f);
				}
				for (int num = 4; num <= 7; num++)
				{
					if (num == 7)
					{
						if (c.GetLevel() < 7)
						{
							break;
						}
						num = c.GetLevel();
					}
					if (!Object.op_Implicit((Object)(object)gui.transform.Find("level_" + num)))
					{
						GameObject val5 = Object.Instantiate<GameObject>(((Component)gui.transform.Find("level_3")).gameObject, gui.transform);
						val5.SetActive(false);
						((Object)val5).name = "level_" + num;
						for (int num2 = 3; num2 < num; num2++)
						{
							GameObject val6 = Object.Instantiate<GameObject>(((Component)val5.transform.Find("star")).gameObject, val5.transform);
							val6.transform.localPosition = new Vector3((float)(16 * ((num2 - 1) % 5) - 8), (float)((num2 - 1) / 5 * -16));
						}
					}
				}
				string creatureName = ((Object)c).name.Replace("(Clone)", "");
				Match match = Regex.Match(((TMP_Text)component).text, wrapRegex(LocalizationWrapper.getCreatureTranslationPattern(creatureName, boss: false)));
				string value = match.Groups["name"].Value;
				string value2 = match.Groups["start"].Value;
				string value3 = match.Groups["end"].Value;
				CreatureExtraEffect extraEffectCreature = API.GetExtraEffectCreature(c);
				CreatureInfusion value4 = (creatureInfusionName.GetToggle() ? API.GetInfusionCreature(c) : CreatureInfusion.None);
				CreatureInfusion? infusion = value4;
				string creatureTranslation = LocalizationWrapper.getCreatureTranslation(creatureName, value, null, null, infusion);
				bool flag = false;
				bool flag2 = false;
				((TMP_Text)component).text = value2 + creatureTranslation + value3;
				bool flag3 = extraEffectCreature != CreatureExtraEffect.None;
				bool flag4 = flag3;
				if (flag4)
				{
					VisualExtraEffectIndicator value5 = visualExtraEffectIndicator.Value;
					bool flag5 = (uint)(value5 - 1) <= 1u;
					flag4 = flag5;
				}
				if (flag4)
				{
					CreatureExtraEffect? effect = extraEffectCreature;
					infusion = value4;
					string creatureTranslation2 = LocalizationWrapper.getCreatureTranslation(creatureName, value, null, effect, infusion);
					flag2 = creatureTranslation2.StartsWith(creatureTranslation);
					flag = creatureTranslation2.EndsWith(creatureTranslation) | flag2;
					if (!flag)
					{
						((TMP_Text)component).text = value2 + creatureTranslation2 + value3;
					}
				}
				val2.transform.localPosition = new Vector3(0f, (float)(flag2 ? 48 : 68), 0f);
				((TMP_Text)component).transform.localPosition = new Vector3(0f, (float)(flag2 ? 68 : 48), 0f);
				val2.SetActive(flag);
				if (NeedsUpdate.TryGetValue(c, out var value6))
				{
					value6.cachedName = ((TMP_Text)component).text;
				}
			}
			else if (((Object)gui).name.StartsWith("HudBaseBoss", StringComparison.Ordinal))
			{
				GameObject gameObject = ((Component)___m_baseHud.transform.Find("level_3").Find("star")).gameObject;
				for (int num3 = 2; num3 <= 7; num3++)
				{
					if (num3 == 7)
					{
						if (c.GetLevel() < 7)
						{
							break;
						}
						num3 = c.GetLevel();
					}
					GameObject val7 = new GameObject("level_" + num3);
					val7.SetActive(false);
					val7.transform.parent = gui.transform;
					val7.transform.localPosition = new Vector3(0f, 0f);
					for (int num4 = 2; num4 <= num3; num4++)
					{
						GameObject val8 = Object.Instantiate<GameObject>(gameObject, val7.transform);
						val8.transform.localScale = new Vector3(2f, 2f);
						val8.transform.localPosition = new Vector3(32f * ((float)(num3 - 2) / 2f - (float)(num4 - 2)), 0f);
					}
				}
				string creatureName2 = ((Object)c).name.Replace("(Clone)", "");
				TextMeshProUGUI component2 = ((Component)gui.transform.Find("Name")).GetComponent<TextMeshProUGUI>();
				Match match2 = Regex.Match(((TMP_Text)component2).text, wrapRegex(LocalizationWrapper.getCreatureTranslationPattern(creatureName2, boss: true)));
				string value7 = match2.Groups["name"].Value;
				string value8 = match2.Groups["start"].Value;
				string value9 = match2.Groups["end"].Value;
				((TMP_Text)component2).text = value8 + LocalizationWrapper.getCreatureTranslation(creatureName2, value7, API.GetAffixBoss(c)) + value9;
				if (NeedsUpdate.TryGetValue(c, out var value10))
				{
					value10.cachedName = ((TMP_Text)component2).text;
				}
			}
			ColorEnemyStars(c);
			static string wrapRegex(string regex)
			{
				return "^(?<start>((\\s*(?'Open'<[^/>]+>)[^<>]*)+([^<>]*(?'Close-Open'</[^>]+>))+\\s*)*)(?(Open)(?!))" + regex + "(?<end>((\\s*(?'Open'<[^/>]+>)[^<>]*)+([^<>]*(?'Close-Open'</[^>]+>))+\\s*)*)(?(Open)(?!))$";
			}
		}
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	[HarmonyPatch(typeof(EnemyHud), "UpdateHuds")]
	public class StarVisibility
	{
		[UsedImplicitly]
		[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
		private static void Postfix(Dictionary<Character, HudData> ___m_huds)
		{
			foreach (KeyValuePair<Character, HudData> ___m_hud in ___m_huds)
			{
				Character key = ___m_hud.Key;
				if (key != null && Object.op_Implicit((Object)(object)___m_hud.Value.m_gui))
				{
					Transform val = ___m_hud.Value.m_gui.transform.Find("level_" + key.GetLevel());
					if (val != null)
					{
						((Component)val).gameObject.SetActive(visualLevelIndicator.Value == VisualLevelIndicator.On || visualLevelIndicator.Value == (VisualLevelIndicator)(key.IsBoss() ? 3 : 2));
					}
					if (ShowStar.NeedsUpdate.TryGetValue(key, out var value) && value.cachedName != null)
					{
						((TMP_Text)((Component)___m_hud.Value.m_gui.transform.Find("Name")).GetComponent<TextMeshProUGUI>()).text = value.cachedName;
					}
				}
			}
		}
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	[HarmonyPatch(typeof(EnemyHud), "TestShow")]
	private static class HideTwinBossHud
	{
		[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
		private static void Postfix(EnemyHud __instance, Character c, ref bool __result)
		{
			if (__result && c.IsBoss() && (API.GetAffixBoss(c) == BossAffix.Twin || API.GetAffixBoss(c) == BossAffix.Godlike))
			{
				Character twinBoss = API.GetTwinBoss(c);
				if (twinBoss != null && __instance.m_huds.ContainsKey(twinBoss))
				{
					__result = false;
				}
			}
		}
	}

	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(0)]
	[HarmonyPatch]
	private class VisEquipmentScaling
	{
		private static readonly Dictionary<string, string[]> methodEqMap = new Dictionary<string, string[]>
		{
			{
				"SetRightHandEquipped",
				new string[1] { "m_rightItemInstance" }
			},
			{
				"SetLeftHandEquipped",
				new string[1] { "m_leftItemInstance" }
			},
			{
				"SetChestEquipped",
				new string[1] { "m_chestItemInstances" }
			},
			{
				"SetLegEquipped",
				new string[1] { "m_legItemInstances" }
			},
			{
				"SetHelmetEquipped",
				new string[1] { "m_helmetItemInstance" }
			},
			{
				"SetShoulderEquipped",
				new string[1] { "m_shoulderItemInstances" }
			},
			{
				"SetUtilityEquipped",
				new string[1] { "m_utilityItemInstances" }
			},
			{
				"SetBeardEquipped",
				new string[1] { "m_beardItemInstance" }
			},
			{
				"SetBackEquipped",
				new string[2] { "m_leftBackItemInstance", "m_rightBackItemInstance" }
			},
			{
				"SetHairEquipped",
				new string[1] { "m_hairItemInstance" }
			}
		};

		private static readonly Dictionary<MethodInfo, string[]> methodInfoEqMap = methodEqMap.ToDictionary([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (KeyValuePair<string, string[]> p) => AccessTools.Method(typeof(VisEquipment), p.Key, (Type[])null, (Type[])null), [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (KeyValuePair<string, string[]> p) => p.Value);

		[UsedImplicitly]
		private static IEnumerable<MethodBase> TargetMethods()
		{
			return methodInfoEqMap.Keys;
		}

		[UsedImplicitly]
		private static void Postfix(VisEquipment __instance, MethodInfo __originalMethod, bool __result)
		{
			//IL_0069: Unknown result type (might be due to invalid IL or missing references)
			//IL_006f: Unknown result type (might be due to invalid IL or missing references)
			if (!__result)
			{
				return;
			}
			Character component = ((Component)__instance).GetComponent<Character>();
			if (component == null)
			{
				return;
			}
			float num = calculateSizeIncrease(component);
			string[] array = methodInfoEqMap[__originalMethod];
			foreach (string text in array)
			{
				object? value = AccessTools.DeclaredField(typeof(VisEquipment), text).GetValue(__instance);
				GameObject val = (GameObject)((value is GameObject) ? value : null);
				if (val != null)
				{
					Transform transform = val.transform;
					transform.localScale *= num;
				}
			}
		}
	}

	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(0)]
	[HarmonyPatch(typeof(LevelEffects), "SetupLevelVisualization")]
	private class HighLevelEnemyColoring
	{
		[HarmonyPriority(0)]
		[UsedImplicitly]
		private static void Prefix(LevelEffects __instance, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)] Character ___m_character, ref int level)
		{
			//IL_002d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0032: Unknown result type (might be due to invalid IL or missing references)
			if (___m_character != null && !Object.op_Implicit((Object)(object)((Component)___m_character).GetComponent<EnemyLevelData>()))
			{
				EnemyLevelData enemyLevelData = ((Component)___m_character).gameObject.AddComponent<EnemyLevelData>();
				enemyLevelData.localScale = ((Component)___m_character).transform.localScale;
			}
			if (__instance.m_levelSetups.Count == 0)
			{
				return;
			}
			VisualLevelIndicator value = visualLevelIndicator.Value;
			if ((value == VisualLevelIndicator.Off || value == VisualLevelIndicator.CreaturesOff) ? true : false)
			{
				level = 1;
				return;
			}
			if (__instance.m_levelSetups.Count == 2)
			{
				__instance.m_levelSetups.Insert(1, __instance.m_levelSetups[0]);
			}
			if (__instance.m_levelSetups.Count < level - 1)
			{
				int num = __instance.m_levelSetups.Count - 1;
				LevelSetup item = __instance.m_levelSetups[num];
				for (int i = num; i < level - 1; i++)
				{
					__instance.m_levelSetups.Add(item);
				}
			}
		}

		[UsedImplicitly]
		private static void Postfix(LevelEffects __instance, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)] Character ___m_character, int level)
		{
			if (___m_character != null)
			{
				PatchSize(((Component)___m_character).GetComponent<EnemyLevelData>());
				if (((Object)___m_character).name == "Surtling(Clone)" && API.GetInfusionCreature(___m_character) != CreatureInfusion.None && level >= 2 && level - 2 < __instance.m_levelSetups.Count)
				{
					LevelSetup val = __instance.m_levelSetups[level - 2];
					val.m_enableObject.SetActive(false);
				}
			}
		}
	}

	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(0)]
	[HarmonyPatch(typeof(Player), "FindHoverObject")]
	public class PatchPlayerHoverDistance
	{
		private static readonly MethodInfo RangeValueGetter = AccessTools.DeclaredMethod(typeof(PatchPlayerHoverDistance), "getRangeValue", (Type[])null, (Type[])null);

		private static float getRangeValue()
		{
			return Mathf.Max(50f, mouseOverNamePlateRange.Value);
		}

		[UsedImplicitly]
		private static IEnumerable<CodeInstruction> Transpiler(IEnumerable<CodeInstruction> instructions)
		{
			return instructions.Select([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (CodeInstruction instruction) =>
			{
				//IL_0035: Unknown result type (might be due to invalid IL or missing references)
				//IL_003b: Expected Obj, but got Unknown
				return (instruction.opcode == OpCodes.Ldc_R4 && CodeInstructionExtensions.OperandIs(instruction, (object)50f)) ? new CodeInstruction(OpCodes.Call, (object)RangeValueGetter) : instruction;
			});
		}
	}

	[HarmonyPatch(typeof(Game), "GetPlayerDifficulty")]
	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(0)]
	public class PatchPlayerDifficultyScalingDistance
	{
		private static readonly MethodInfo RangeValueGetter = AccessTools.DeclaredMethod(typeof(CreatureLevelControl), "getMultiplayerRangeValue", (Type[])null, (Type[])null);

		[UsedImplicitly]
		private static IEnumerable<CodeInstruction> Transpiler(IEnumerable<CodeInstruction> instructions)
		{
			return instructions.Select([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (CodeInstruction instruction) =>
			{
				//IL_0035: Unknown result type (might be due to invalid IL or missing references)
				//IL_003b: Expected Obj, but got Unknown
				return (instruction.opcode == OpCodes.Ldc_R4 && CodeInstructionExtensions.OperandIs(instruction, (object)200f)) ? new CodeInstruction(OpCodes.Call, (object)RangeValueGetter) : instruction;
			});
		}
	}

	[HarmonyPatch(typeof(Player), "GetPlayersInRangeXZ")]
	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	public class PatchPlayerDistanceChecks
	{
		[UsedImplicitly]
		private static void Postfix(Vector3 point, float range, ref int __result)
		{
			//IL_0007: Unknown result type (might be due to invalid IL or missing references)
			//IL_0008: Unknown result type (might be due to invalid IL or missing references)
			__result = Math.Max(__result, ZNet.instance.GetPlayerList().Count((PlayerInfo player) =>
			{
				//IL_0000: Unknown result type (might be due to invalid IL or missing references)
				//IL_0001: Unknown result type (might be due to invalid IL or missing references)
				//IL_0007: Unknown result type (might be due to invalid IL or missing references)
				return Utils.DistanceXZ(player.m_position, point) < range;
			}));
		}
	}

	[HarmonyPatch(typeof(EnemyHud), "Awake")]
	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	public class PatchEnemyHudDistance
	{
		[UsedImplicitly]
		[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
		private static void Postfix(EnemyHud __instance)
		{
			__instance.m_maxShowDistance = mouseOverNamePlateRange.Value;
		}
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	[HarmonyPatch(typeof(Tameable), "RPC_SetName")]
	private static class RefreshName
	{
		[UsedImplicitly]
		[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
		private static void Postfix(Tameable __instance)
		{
			ShowStar.NeedsUpdate.Remove(__instance.m_character);
			ShowStar.NeedsUpdate.Add(__instance.m_character, new ShowStar.CharacterCache
			{
				levelCache = __instance.m_character.m_level,
				nameCache = __instance.m_character.m_name
			});
		}
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	public class ChaosInfusion : MonoBehaviour
	{
		private float time = float.MaxValue;

		public void Update()
		{
			//IL_004d: Unknown result type (might be due to invalid IL or missing references)
			time += Time.deltaTime;
			if (time >= 5f)
			{
				SetInfusionColors(((Component)this).gameObject, infusionColors.Values.ToList()[Random.Range(0, infusionColors.Count)]);
				time = 0f;
			}
		}
	}

	[HarmonyPatch(typeof(Character), "SetLevel")]
	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(0)]
	private class UpdateExtraAccordingToLevelPatch
	{
		[HarmonyPriority(0)]
		private static void Prefix(Character __instance, out int __state)
		{
			__state = __instance.GetLevel();
		}

		[UsedImplicitly]
		private static void Postfix(int __state, Character __instance)
		{
			if (__state == __instance.GetLevel())
			{
				return;
			}
			OriginalCharacterData component = ((Component)__instance).GetComponent<OriginalCharacterData>();
			if ((!Object.op_Implicit((Object)(object)component) || !component.immutableExtra) && !__instance.IsBoss())
			{
				if (Object.op_Implicit((Object)(object)((Component)__instance).GetComponent<MonsterAI>()))
				{
					API.SetInfusionCreature(__instance);
					if (API.GetInfusionCreature(__instance) == CreatureInfusion.None)
					{
						Transform val = ((Component)__instance).transform.Find("infusion flames");
						if (val != null)
						{
							Object.Destroy((Object)(object)((Component)val).gameObject);
						}
					}
				}
				API.SetExtraEffectCreature(__instance);
				component.immutableExtra = false;
			}
			else
			{
				SetPersistedCharacterAttributes(__instance);
			}
		}
	}

	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(0)]
	[HarmonyPatch(typeof(Character), "Awake")]
	private class AttachLevelBehaviorToCharacters
	{
		[UsedImplicitly]
		private static void Prefix(Character __instance)
		{
			if (__instance.IsBoss() && (API.GetAffixBoss(__instance) == BossAffix.Twin || API.GetAffixBoss(__instance) == BossAffix.Godlike))
			{
				__instance.m_health *= Utils.ReadValueFromEnumWithWorldLevelAndStarsFromConfig(__instance, BossAffix.Twin, [return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 2, 1, 2 })] (CreatureConfig c) => c.worldLevelToBossAffixFactor) ?? (bossAffixPowerTwin.Value / 100f);
			}
		}

		[UsedImplicitly]
		private static void Postfix(Character __instance)
		{
			if (!Object.op_Implicit((Object)(object)((Component)__instance).gameObject.GetComponent<LevelEffects>()) && !(__instance is Player))
			{
				((Component)__instance).gameObject.AddComponent<LevelEffects>();
			}
			if (((Component)__instance).GetComponent<ZNetView>().GetZDO() == null || __instance is Player)
			{
				return;
			}
			int num = 2;
			if (__instance.IsBoss() || API.HasExtraEffectCreature(__instance))
			{
				SetPersistedCharacterAttributes(__instance);
			}
			else
			{
				API.SetExtraEffectCreature(__instance);
				num--;
			}
			if (!__instance.IsBoss() && Object.op_Implicit((Object)(object)((Component)__instance).GetComponent<MonsterAI>()))
			{
				if (API.HasInfusionCreature(__instance))
				{
					AttachInfusionFlames(__instance);
				}
				else
				{
					API.SetInfusionCreature(__instance);
					num--;
				}
			}
			else
			{
				num--;
			}
			if (num == 0)
			{
				((Component)__instance).GetComponent<OriginalCharacterData>().immutableExtra = false;
			}
		}
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	public class EnemyLevelData : MonoBehaviour
	{
		public Vector3 localScale;

		private void Awake()
		{
		}
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	[HarmonyPatch(typeof(SpawnSystem), "Awake")]
	private static class RemoveMinimumDistanceForStars
	{
		[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
		private static void Postfix(SpawnSystem __instance)
		{
			foreach (SpawnSystemList spawnList in __instance.m_spawnLists)
			{
				foreach (SpawnData spawner in spawnList.m_spawners)
				{
					spawner.m_levelUpMinCenterDistance = 0f;
				}
			}
		}
	}

	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(0)]
	[HarmonyPatch(typeof(SpawnSystem), "Spawn")]
	private class PatchSpawnLevelSpawnSystem
	{
		[UsedImplicitly]
		private static void Prefix(SpawnData critter)
		{
			critter.m_levelUpMinCenterDistance = 0f;
		}

		[UsedImplicitly]
		private static IEnumerable<CodeInstruction> Transpiler(IEnumerable<CodeInstruction> instructions, ILGenerator ilg)
		{
			//IL_0007: Unknown result type (might be due to invalid IL or missing references)
			//IL_001d: Expected Obj, but got Unknown
			return SpawnTranspiler(new CodeInstruction(OpCodes.Ldarg_1, (object)null), typeof(SpawnData), instructions, ilg);
		}

		[UsedImplicitly]
		private static void Postfix()
		{
			foreach (Character item in ProcessNewlySpawnedCreatures())
			{
			}
		}
	}

	[HarmonyPatch(typeof(CreatureSpawner), "Spawn")]
	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(0)]
	private class PatchSpawnLevelCreatureSpawner
	{
		[UsedImplicitly]
		private static IEnumerable<CodeInstruction> Transpiler(IEnumerable<CodeInstruction> instructions, ILGenerator ilg)
		{
			//IL_0007: Unknown result type (might be due to invalid IL or missing references)
			//IL_001d: Expected Obj, but got Unknown
			return SpawnTranspiler(new CodeInstruction(OpCodes.Ldarg_0, (object)null), typeof(CreatureSpawner), instructions, ilg);
		}

		[UsedImplicitly]
		private static void Postfix(CreatureSpawner __instance)
		{
			foreach (Character item in ProcessNewlySpawnedCreatures())
			{
				__instance.SpawnEffect(((Component)item).gameObject);
			}
		}
	}

	[HarmonyPatch(typeof(SpawnArea), "SpawnOne")]
	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(0)]
	private class PatchSpawnLevelSpawnArea
	{
		[UsedImplicitly]
		private static IEnumerable<CodeInstruction> Transpiler(IEnumerable<CodeInstruction> instructions, ILGenerator ilg, MethodBase original)
		{
			//IL_003f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0055: Expected Obj, but got Unknown
			return SpawnTranspiler(new CodeInstruction(OpCodes.Ldloc, (object)original.GetMethodBody().LocalVariables.First([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (LocalVariableInfo l) => l.LocalType == typeof(SpawnData)).LocalIndex), typeof(SpawnData), instructions, ilg);
		}

		[UsedImplicitly]
		private static void Postfix(SpawnArea __instance)
		{
			//IL_001e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0023: Unknown result type (might be due to invalid IL or missing references)
			//IL_0031: Unknown result type (might be due to invalid IL or missing references)
			//IL_0037: Unknown result type (might be due to invalid IL or missing references)
			foreach (Character item in ProcessNewlySpawnedCreatures())
			{
				__instance.m_spawnEffects.Create(item.GetCenterPoint(), Quaternion.identity, (Transform)null, 1f, -1, default(ZDOID));
			}
		}
	}

	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(0)]
	[HarmonyPatch(typeof(OfferingBowl), "DelayedSpawnBoss")]
	private class PatchBossLevel
	{
		private static readonly MethodInfo SpawnedBossPatcher = AccessTools.DeclaredMethod(typeof(PatchBossLevel), "PatchSpawnedBoss", (Type[])null, (Type[])null);

		private static void PatchSpawnedBoss(GameObject gameObject)
		{
			Character componentInChildren = gameObject.GetComponentInChildren<Character>();
			if (componentInChildren != null)
			{
				PatchSpawnedBoss_Impl(componentInChildren);
			}
		}

		public static void PatchSpawnedBoss_Impl(Character boss)
		{
			boss.SetLevel(API.LevelRand(boss));
			BossAffix? bossAffix = Utils.RandomWithProbabilityFromConfig(boss, [return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 2, 1, 2 })] (CreatureConfig c) => c.worldLevelToBoss, out var rand, out var processedProbabilities);
			BossAffix affix;
			if (bossAffix.HasValue)
			{
				affix = bossAffix.GetValueOrDefault();
				if (true)
				{
					goto IL_00cd;
				}
			}
			affix = BossAffix.None;
			foreach (BossAffix key in customBossAffixChances.Keys)
			{
				if (!processedProbabilities.Contains(key))
				{
					rand -= customBossAffixChances[key].Value;
					if (rand < 0f)
					{
						affix = key;
						break;
					}
				}
			}
			goto IL_00cd;
			IL_00cd:
			API.SetAffixBoss(boss, affix);
		}

		[UsedImplicitly]
		private static IEnumerable<CodeInstruction> Transpiler(IEnumerable<CodeInstruction> instructions)
		{
			//IL_0035: Unknown result type (might be due to invalid IL or missing references)
			//IL_003f: Expected Obj, but got Unknown
			//IL_004b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0055: Expected Obj, but got Unknown
			List<CodeInstruction> list = new List<CodeInstruction>();
			foreach (CodeInstruction instruction in instructions)
			{
				if (instruction.opcode == OpCodes.Ret)
				{
					list.Add(new CodeInstruction(OpCodes.Ldloc_1, (object)null));
					list.Add(new CodeInstruction(OpCodes.Call, (object)SpawnedBossPatcher));
				}
				list.Add(instruction);
			}
			return list;
		}
	}

	[HarmonyPatch(typeof(SpawnAbility), "Setup")]
	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	private class SetAspectLevel
	{
		[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
		[UsedImplicitly]
		private static void Postfix(SpawnAbility __instance)
		{
			//IL_006e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0073: Unknown result type (might be due to invalid IL or missing references)
			//IL_007a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0086: Unknown result type (might be due to invalid IL or missing references)
			//IL_0088: Unknown result type (might be due to invalid IL or missing references)
			//IL_008d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0099: Expected Obj, but got Unknown
			Character val = Character.s_characters.OrderBy((Character c) =>
			{
				//IL_0006: Unknown result type (might be due to invalid IL or missing references)
				//IL_0016: Unknown result type (might be due to invalid IL or missing references)
				return Utils.DistanceSqr(((Component)c).transform.position, ((Component)__instance).transform.position);
			}).FirstOrDefault((Character c) => c.IsBoss());
			if (val != null)
			{
				__instance.m_owner = (Character)(object)Player.m_localPlayer;
				__instance.m_levelUpSettings = new List<LevelUpSettings>
				{
					new LevelUpSettings
					{
						m_maxSpawns = 0,
						m_setLevel = val.GetLevel(),
						m_skill = (SkillType)1,
						m_skillLevel = 0
					}
				};
			}
		}
	}

	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(0)]
	[HarmonyPatch(typeof(Character), "OnDeath")]
	private class PatchCreatureDeath
	{
		private static readonly MethodInfo ragdollReader = AccessTools.DeclaredMethod(typeof(GameObject), "GetComponent", Array.Empty<Type>(), new Type[1] { typeof(Ragdoll) });

		[UsedImplicitly]
		private static void Prefix(Character __instance)
		{
			//IL_025a: Unknown result type (might be due to invalid IL or missing references)
			//IL_025f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0279: Unknown result type (might be due to invalid IL or missing references)
			//IL_007a: Unknown result type (might be due to invalid IL or missing references)
			//IL_007f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0081: Unknown result type (might be due to invalid IL or missing references)
			//IL_008b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0090: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b2: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b7: Unknown result type (might be due to invalid IL or missing references)
			//IL_00b9: Unknown result type (might be due to invalid IL or missing references)
			//IL_00be: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ec: Unknown result type (might be due to invalid IL or missing references)
			//IL_00f1: Unknown result type (might be due to invalid IL or missing references)
			//IL_0117: Unknown result type (might be due to invalid IL or missing references)
			//IL_0122: Unknown result type (might be due to invalid IL or missing references)
			//IL_02f6: Unknown result type (might be due to invalid IL or missing references)
			//IL_02fb: Unknown result type (might be due to invalid IL or missing references)
			//IL_030a: Expected Obj, but got Unknown
			if (!__instance.IsBoss() && CreatureExtraEffect.Splitting == API.GetExtraEffectCreature(__instance))
			{
				float num = Utils.ReadEffectPowerFromConfig(__instance, CreatureExtraEffect.Splitting) ?? 2f;
				int num2 = ((num <= 2f) ? 2 : ((int)(num + Random.Range(0f, 1f))));
				bool flag = __instance.IsTamed();
				for (int i = 0; i < num2; i++)
				{
					Quaternion val = Quaternion.Euler(0f, Random.Range(0f, 360f), 0f);
					Vector3 val2 = Random.insideUnitSphere * 0.5f;
					Character component = Object.Instantiate<GameObject>(ZNetScene.instance.GetPrefab(((Component)__instance).GetComponent<ZNetView>().GetZDO().GetPrefab()), ((Component)__instance).transform.localPosition + val2, val).GetComponent<Character>();
					Rigidbody component2 = ((Component)component).GetComponent<Rigidbody>();
					component2.AddForceAtPosition(Random.Range(80f, 130f) * ((Component)__instance).transform.right * (float)((i % 2 != 0 && (i != num2 - 1 || num2 % 2 != 1 || Random.Range(0, 2) != 0)) ? 1 : (-1)), ((Component)__instance).transform.position, (ForceMode)2);
					component.SetLevel((__instance.GetLevel() - 1) / 2 + 1);
					if (flag)
					{
						component.SetTamed(true);
					}
					if (num >= 2f || num + Random.Range(0f, 1f) >= (float)(i + 1))
					{
						API.SetExtraEffectCreature(component, CreatureExtraEffect.Splitting);
					}
					BaseAI baseAI = component.GetBaseAI();
					MonsterAI val3 = (MonsterAI)(object)((baseAI is MonsterAI) ? baseAI : null);
					if (val3 != null)
					{
						AccessTools.DeclaredField(typeof(MonsterAI), "m_targetCreature").SetValue(val3, Player.m_localPlayer);
						AccessTools.DeclaredMethod(typeof(MonsterAI), "SetAlerted", (Type[])null, (Type[])null).Invoke(val3, new object[1] { true });
					}
				}
			}
			if (!__instance.IsBoss() && (CreatureInfusion.Poison == API.GetInfusionCreature(__instance) || (CreatureInfusion.Chaos == API.GetInfusionCreature(__instance) && Random.Range(1, 3) == 1)))
			{
				GameObject prefab = ZNetScene.instance.GetPrefab("vfx_blob_attack");
				GameObject val4 = Object.Instantiate<GameObject>(prefab, ((Component)__instance).transform.localPosition, Quaternion.identity);
				List<Player> list = new List<Player>();
				Player.GetPlayersInRange(val4.transform.localPosition, 4f, list);
				foreach (Player item in list)
				{
					float num3 = ((Character)item).GetMaxHealth() / 3f;
					float bodyArmor = ((Character)item).GetBodyArmor();
					float num4 = ((bodyArmor > num3 / 4f) ? Mathf.Sqrt(4f * bodyArmor * num3) : num3);
					if (bodyArmor < num4 / 2f)
					{
						num4 = num3 + bodyArmor;
					}
					HitData val5 = new HitData
					{
						m_damage = 
						{
							m_poison = num4
						}
					};
					((Character)item).Damage(val5);
				}
			}
			if (!__instance.IsPlayer() && creatureSectorStartLevel.Value != CreatureSectorWorldLevel.Disabled && API.GetWorldLevel() >= (int)creatureSectorStartLevel.Value)
			{
				OriginalCharacterData component3 = ((Component)__instance).GetComponent<OriginalCharacterData>();
				if (component3 != null && component3.lastHitFromPlayerFaction)
				{
					CreatureSector.increaseSectorKills(__instance);
				}
			}
		}

		private static void transferEffects(GameObject maybeChar, Character previous)
		{
			Character component = maybeChar.GetComponent<Character>();
			if (component != null)
			{
				component.SetLevel(previous.GetLevel());
				if (component.IsBoss() && previous.IsBoss())
				{
					API.SetAffixBoss(component, API.GetAffixBoss(previous));
					return;
				}
				API.SetExtraEffectCreature(component, API.GetExtraEffectCreature(previous));
				API.SetInfusionCreature(component, API.GetInfusionCreature(previous));
				return;
			}
			Aoe component2 = maybeChar.GetComponent<Aoe>();
			if (component2 != null && ((Object)component2).name.StartsWith("aspect_aoe_explosion", StringComparison.Ordinal))
			{
				Character val = Character.s_characters.OrderBy([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (Character c) =>
				{
					//IL_0006: Unknown result type (might be due to invalid IL or missing references)
					//IL_0016: Unknown result type (might be due to invalid IL or missing references)
					return Utils.DistanceSqr(((Component)c).transform.position, maybeChar.transform.position);
				}).FirstOrDefault([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (Character c) => c.IsBoss());
				if (val != null)
				{
					component2.m_damage.m_nonPlayer = Mathf.CeilToInt(val.GetMaxHealth() / 7f);
				}
			}
		}

		[UsedImplicitly]
		private static IEnumerable<CodeInstruction> Transpiler(IEnumerable<CodeInstruction> instructions)
		{
			foreach (CodeInstruction instruction in instructions)
			{
				if (CodeInstructionExtensions.Calls(instruction, ragdollReader))
				{
					yield return new CodeInstruction(OpCodes.Dup, (object)null);
					yield return new CodeInstruction(OpCodes.Ldarg_0, (object)null);
					yield return new CodeInstruction(OpCodes.Call, (object)AccessTools.DeclaredMethod(typeof(PatchCreatureDeath), "transferEffects", (Type[])null, (Type[])null));
				}
				yield return instruction;
			}
		}
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	[HarmonyPatch(typeof(Character), "RPC_Damage")]
	private class SaveLastHitter
	{
		[UsedImplicitly]
		[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
		private static void Prefix(Character __instance, HitData hit)
		{
			OriginalCharacterData component = ((Component)__instance).GetComponent<OriginalCharacterData>();
			if (component != null && (Object)(object)hit.GetAttacker() != (Object)null)
			{
				component.lastHitFromPlayerFaction = hit.GetAttacker().IsPlayer() || hit.GetAttacker().IsTamed();
			}
		}
	}

	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(0)]
	[HarmonyPatch(typeof(Destructible), "Destroy")]
	private static class CheckDestructibleDrops
	{
		internal static GameObject CheckDrop(GameObject go)
		{
			Character component = go.GetComponent<Character>();
			if (component != null)
			{
				checkCreaturesAfterSpawn.Add(component);
			}
			return go;
		}

		private static IEnumerable<CodeInstruction> Transpiler(IEnumerable<CodeInstruction> instructions)
		{
			foreach (CodeInstruction instruction in instructions)
			{
				yield return instruction;
				if (instruction.opcode == OpCodes.Call && ((MethodInfo)instruction.operand).Name == "Instantiate")
				{
					yield return new CodeInstruction(OpCodes.Call, (object)AccessTools.DeclaredMethod(typeof(CheckDestructibleDrops), "CheckDrop", (Type[])null, (Type[])null));
				}
			}
		}

		private static void Postfix()
		{
			foreach (Character item in ProcessNewlySpawnedCreatures())
			{
			}
		}
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	[HarmonyPatch(typeof(Destructible), "CreateDestructionEffects")]
	private static class CheckDestructibleDropsFromEffects
	{
		[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
		private static IEnumerable<CodeInstruction> Transpiler(IEnumerable<CodeInstruction> instructions)
		{
			foreach (CodeInstruction instruction in instructions)
			{
				if (instruction.opcode == OpCodes.Callvirt && ((MethodInfo)instruction.operand).Name == "GetComponent")
				{
					yield return new CodeInstruction(OpCodes.Call, (object)AccessTools.DeclaredMethod(typeof(CheckDestructibleDrops), "CheckDrop", (Type[])null, (Type[])null));
				}
				yield return instruction;
			}
		}
	}

	private const int WindowId = -69;

	private Rect yamlWindowRect;

	private Dictionary<string, string> currentYamlInput = null;

	private readonly Dictionary<string, bool> collapsed = new Dictionary<string, bool>();

	private readonly Dictionary<string, Vector2> yamlTextareaScrollPosition = new Dictionary<string, Vector2>();

	private Vector2 yamlErrorsScrollPosition;

	private bool hasErrors = false;

	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 2, 1, 1 })]
	private CustomSyncedValue<List<string>> activeConfigFileData = null;

	private Func<ConfigFile> activeConfigFileDataInstantiator = null;

	public const string ModName = "Creature Level & Loot Control";

	[PublicAPI]
	public const string ModVersion = "5.0.7";

	public static readonly ConfigSync configSync = new ConfigSync("CL&LC")
	{
		DisplayName = "CL&LC",
		CurrentVersion = "5.0.7",
		MinimumRequiredVersion = "5.0.7"
	};

	private static ConfigEntry<Toggle> serverConfigLocked = null;

	public static ConfigEntry<Difficulty> difficulty = null;

	public static ConfigEntry<DifficultySecondFactor> difficultySecondFactor = null;

	private static ConfigEntry<int> minimumMultiplayerPlayerCount = null;

	private static ConfigEntry<int> maximumMultiplayerPlayerCount = null;

	private static ConfigEntry<int> additionalMultiplayerPlayerCount = null;

	private static ConfigEntry<float> multiplayerScalingRange = null;

	private static ConfigEntry<float> multiplayerHPfactor = null;

	private static ConfigEntry<float> multiplayerDMGfactor = null;

	private static ConfigEntry<float> mouseOverNamePlateRange = null;

	private static ConfigEntry<VisualLevelIndicator> visualLevelIndicator = null;

	private static ConfigEntry<AllowedConsoleCommands> allowedConsoleCommands = null;

	private static ConfigEntry<Toggle> detailedDamageLogging = null;

	private static ConfigEntry<LootSystem> lootSystem = null;

	private static ConfigEntry<int> additionalLootChancePerLevelCreature = null;

	private static ConfigEntry<int> additionalLootChancePerLevelBoss = null;

	private static ConfigEntry<Toggle> multipleTrophies = null;

	private static ConfigEntry<Toggle> multipleBossTrophies = null;

	private static ConfigEntry<Toggle> limitBossDropRange = null;

	private static ConfigEntry<float> creatureLootMultiplier = null;

	private static ConfigEntry<float> bossLootMultiplier = null;

	private static ConfigEntry<float> lootMultiplierPassive = null;

	private static ConfigEntry<int> dungeonRespawnTime = null;

	public static ConfigEntry<Toggle> creatureSpecialEffects = null;

	private static ConfigEntry<VisualExtraEffectIndicator> visualExtraEffectIndicator = null;

	public static ConfigEntry<Toggle> creatureInfusionEffects = null;

	private static ConfigEntry<float> creatureInfusionVisualEffects = null;

	private static ConfigEntry<Toggle> creatureInfusionName = null;

	public static ConfigEntry<SpawnLevel> minimumLevel = null;

	public static ConfigEntry<SpawnLevel> maximumLevel = null;

	private static ConfigEntry<int> dungeonCreatureRespawnTime = null;

	private static ConfigEntry<int> campCreatureRespawnTime = null;

	private static ConfigEntry<Toggle> enemyScalingDungeon = null;

	private static ConfigEntry<int> enemyScaling = null;

	private static ConfigEntry<float> creatureBaseHealth = null;

	private static ConfigEntry<float> creatureHealthGainPerStar = null;

	private static ConfigEntry<float> creatureBaseDamage = null;

	private static ConfigEntry<float> creatureDamageGainPerStar = null;

	private static ConfigEntry<float> creatureMovementSpeed = null;

	private static ConfigEntry<float> creatureAttackSpeed = null;

	private static ConfigEntry<CreatureSectorWorldLevel> creatureSectorStartLevel = null;

	public static ConfigEntry<int> creatureSectorResetTime = null;

	public static ConfigEntry<string> creatureSectorLevelUp = null;

	public static ConfigEntry<int> creatureSectorPingTime = null;

	public static ConfigEntry<CreatureSectorAnnouncementScope> creatureSectorAnnouncementScope = null;

	public static ConfigEntry<Toggle> displayCreatureSectorLevel = null;

	public static ConfigEntry<Toggle> displayDistanceFromSpawnCircles = null;

	public static ConfigEntry<int> noStarCreatureChanceShift = null;

	public static ConfigEntry<float> logarithmicScaling = null;

	public static ConfigEntry<string> customBossLevelChances = null;

	public static ConfigEntry<Toggle> bossSpecialEffects = null;

	public static ConfigEntry<Toggle> bossLevelUseCreatureLevel = null;

	private static ConfigEntry<int> bossScaling = null;

	private static ConfigEntry<float> bossAffixPowerReflective = null;

	private static ConfigEntry<float> bossAffixPowerShielded = null;

	public static ConfigEntry<float> bossAffixPowerMending = null;

	public static ConfigEntry<float> bossAffixPowerSturdy = null;

	private static ConfigEntry<float> bossAffixPowerEnraged = null;

	private static ConfigEntry<float> bossAffixPowerElementalist = null;

	public static ConfigEntry<int> bossAffixPowerSummoner = null;

	public static ConfigEntry<float> bossAffixPowerTwin = null;

	private static ConfigEntry<float> bossHealthGainPerStar = null;

	private static ConfigEntry<float> bossDamageGainPerStar = null;

	public static List<string> configFilePaths = null;

	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)]
	public static CreatureConfig.ConfigFile creatureConfigFile = null;

	public static readonly CustomSyncedValue<List<string>> creatureConfigFileData = new CustomSyncedValue<List<string>>(configSync, "creatureconfig", new List<string>());

	private static Dictionary<string, CreatureConfig> prefabConfig = new Dictionary<string, CreatureConfig>();

	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)]
	public static ItemConfig.ConfigFile itemConfigFile = null;

	public static readonly CustomSyncedValue<List<string>> itemConfigFileData = new CustomSyncedValue<List<string>>(configSync, "itemconfig", new List<string>());

	private static Dictionary<string, ItemConfig> itemConfig = new Dictionary<string, ItemConfig>();

	public static ConfigEntry<Toggle> creatureConfigFileActive = null;

	public static ConfigEntry<Toggle> itemConfigFileActive = null;

	public static readonly Dictionary<Difficulty, float[][]> levelConfig = new Dictionary<Difficulty, float[][]>
	{
		{
			Difficulty.Very_easy,
			new float[9][]
			{
				new float[5] { 5f, 0f, 0f, 0f, 0f },
				new float[5] { 8f, 1f, 0f, 0f, 0f },
				new float[5] { 10f, 2f, 0.05f, 0f, 0f },
				new float[5] { 15f, 5f, 1f, 0f, 0f },
				new float[5] { 20f, 10f, 3f, 1f, 0f },
				new float[5] { 25f, 12f, 4f, 2f, 0.5f },
				new float[5] { 25f, 12f, 4f, 2f, 0.5f },
				new float[5] { 25f, 12f, 4f, 2f, 0.5f },
				new float[5] { 25f, 12f, 4f, 2f, 0.5f }
			}
		},
		{
			Difficulty.Easy,
			new float[9][]
			{
				new float[5] { 8f, 0.5f, 0f, 0f, 0f },
				new float[5] { 10f, 2f, 0.5f, 0f, 0f },
				new float[5] { 12f, 4f, 1f, 0.05f, 0f },
				new float[5] { 18f, 7f, 2f, 0.3f, 0.05f },
				new float[5] { 22f, 11f, 4f, 0.5f, 0.2f },
				new float[5] { 28f, 14f, 6f, 2.5f, 0.75f },
				new float[5] { 28f, 14f, 6f, 2.5f, 0.75f },
				new float[5] { 28f, 14f, 6f, 2.5f, 0.75f },
				new float[5] { 28f, 14f, 6f, 2.5f, 0.75f }
			}
		},
		{
			Difficulty.Medium,
			new float[9][]
			{
				new float[5] { 10f, 2f, 0f, 0f, 0f },
				new float[5] { 15f, 5f, 1f, 0f, 0f },
				new float[5] { 18f, 8f, 2f, 0.3f, 0f },
				new float[5] { 22f, 10f, 3f, 0.5f, 0.3f },
				new float[5] { 25f, 12f, 5f, 1f, 0.5f },
				new float[5] { 30f, 15f, 8f, 3f, 1f },
				new float[5] { 30f, 15f, 8f, 3f, 1f },
				new float[5] { 30f, 15f, 8f, 3f, 1f },
				new float[5] { 30f, 15f, 8f, 3f, 1f }
			}
		},
		{
			Difficulty.Hard,
			new float[9][]
			{
				new float[5] { 15f, 4f, 1f, 0.05f, 0f },
				new float[5] { 18f, 6f, 2f, 1f, 0.3f },
				new float[5] { 22f, 8f, 3f, 2f, 0.8f },
				new float[5] { 26f, 10f, 5f, 3f, 1.5f },
				new float[5] { 30f, 12f, 8f, 4f, 2.2f },
				new float[5] { 33f, 16f, 10f, 6f, 3f },
				new float[5] { 33f, 16f, 10f, 6f, 3f },
				new float[5] { 33f, 16f, 10f, 6f, 3f },
				new float[5] { 33f, 16f, 10f, 6f, 3f }
			}
		},
		{
			Difficulty.Very_hard,
			new float[9][]
			{
				new float[5] { 20f, 6f, 2f, 0.5f, 0.3f },
				new float[5] { 25f, 8f, 4f, 1.5f, 0.6f },
				new float[5] { 30f, 10f, 6f, 2.5f, 1.2f },
				new float[5] { 35f, 12f, 8f, 4f, 2.6f },
				new float[5] { 40f, 15f, 10f, 6f, 3.8f },
				new float[5] { 45f, 18f, 12f, 8f, 5f },
				new float[5] { 45f, 18f, 12f, 8f, 5f },
				new float[5] { 45f, 18f, 12f, 8f, 5f },
				new float[5] { 45f, 18f, 12f, 8f, 5f }
			}
		},
		{
			Difficulty.Insane,
			new float[9][]
			{
				new float[5] { 10f, 30f, 30f, 10f, 2f },
				new float[5] { 5f, 25f, 50f, 15f, 4f },
				new float[5] { 0f, 22f, 50f, 20f, 8f },
				new float[5] { 0f, 10f, 40f, 35f, 15f },
				new float[5] { 0f, 5f, 20f, 55f, 20f },
				new float[5] { 0f, 0f, 5f, 65f, 30f },
				new float[5] { 0f, 0f, 5f, 65f, 30f },
				new float[5] { 0f, 0f, 5f, 65f, 30f },
				new float[5] { 0f, 0f, 5f, 65f, 30f }
			}
		}
	};

	public static readonly Dictionary<ConfigEntry<int>, int> worldLevels = new Dictionary<ConfigEntry<int>, int>();

	public static readonly int[] defaultWorldLevelDays = new int[8] { 10, 25, 50, 100, 250, 400, 600, 1000 };

	public static readonly Dictionary<ConfigEntry<int>, int> spawnDistance = new Dictionary<ConfigEntry<int>, int>();

	private static readonly int[] defaultSpawnDistance = new int[8] { 1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000 };

	public static readonly Dictionary<int, ConfigEntry<string>> customLevelChances = new Dictionary<int, ConfigEntry<string>>();

	private static readonly float[][] defaultCustomLevelChances = levelConfig[Difficulty.Medium];

	public static readonly Dictionary<CreatureExtraEffect, ConfigEntry<float>> customCreatureAffixChances = new Dictionary<CreatureExtraEffect, ConfigEntry<float>>();

	public static readonly Dictionary<CreatureInfusion, ConfigEntry<float>> customCreatureInfusionChances = new Dictionary<CreatureInfusion, ConfigEntry<float>>();

	private readonly Dictionary<CreatureExtraEffect, float> defaultCustomCreatureAffixChances = new Dictionary<CreatureExtraEffect, float>
	{
		{
			CreatureExtraEffect.Aggressive,
			10f
		},
		{
			CreatureExtraEffect.Curious,
			20f
		},
		{
			CreatureExtraEffect.Quick,
			10f
		},
		{
			CreatureExtraEffect.Regenerating,
			10f
		},
		{
			CreatureExtraEffect.Splitting,
			5f
		},
		{
			CreatureExtraEffect.Armored,
			3f
		}
	};

	private readonly Dictionary<CreatureInfusion, float> defaultCustomCreatureInfusionChances = new Dictionary<CreatureInfusion, float>
	{
		{
			CreatureInfusion.Fire,
			7f
		},
		{
			CreatureInfusion.Frost,
			7f
		},
		{
			CreatureInfusion.Poison,
			4f
		},
		{
			CreatureInfusion.Lightning,
			3f
		},
		{
			CreatureInfusion.Spirit,
			1.75f
		},
		{
			CreatureInfusion.Chaos,
			1.25f
		}
	};

	public static readonly Dictionary<BossAffix, ConfigEntry<float>> customBossAffixChances = new Dictionary<BossAffix, ConfigEntry<float>>();

	private readonly Dictionary<BossAffix, float> defaultCustomBossAffixChances = new Dictionary<BossAffix, float>
	{
		{
			BossAffix.Reflective,
			14.285714f
		},
		{
			BossAffix.Shielded,
			14.285714f
		},
		{
			BossAffix.Mending,
			0f
		},
		{
			BossAffix.Summoner,
			14.285714f
		},
		{
			BossAffix.Elementalist,
			14.285714f
		},
		{
			BossAffix.Enraged,
			14.285714f
		},
		{
			BossAffix.Twin,
			14.285714f
		},
		{
			BossAffix.Sturdy,
			14.285714f
		},
		{
			BossAffix.Godlike,
			0f
		}
	};

	private static readonly float[] defaultInfusionProbabilityModifiersByLevel = new float[6] { 0f, 0.3f, 0.6f, 1f, 1.3f, 1.6f };

	private static ConfigEntry<string> infusionProbabilityModifiersByLevelString = null;

	private readonly Dictionary<string, int> _configOrderCount = new Dictionary<string, int>();

	private readonly ConfigurationManagerAttributes customLevelSettingAttributes = new ConfigurationManagerAttributes();

	private readonly ConfigurationManagerAttributes worldLevelSettingAttributes = new ConfigurationManagerAttributes();

	private readonly ConfigurationManagerAttributes distanceLevelSettingAttributes = new ConfigurationManagerAttributes();

	private readonly ConfigurationManagerAttributes creatureAffixSettingAttributes = new ConfigurationManagerAttributes();

	private readonly ConfigurationManagerAttributes creatureInfusionSettingAttributes = new ConfigurationManagerAttributes();

	private readonly ConfigurationManagerAttributes bossAffixSettingAttributes = new ConfigurationManagerAttributes();

	private readonly ConfigurationManagerAttributes lootSystemSettingAttributes = new ConfigurationManagerAttributes();

	private readonly ConfigurationManagerAttributes bossLevelSettingAttributes = new ConfigurationManagerAttributes();

	private readonly ConfigurationManagerAttributes creatureSectorSettingAttributes = new ConfigurationManagerAttributes();

	private readonly ConfigurationManagerAttributes levelSpanSettingAttributes = new ConfigurationManagerAttributes();

	public static Localization englishLocalization = null;

	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)]
	private readonly Assembly bepinexConfigManager = AppDomain.CurrentDomain.GetAssemblies().FirstOrDefault([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (Assembly a) => a.GetName().Name == "ConfigurationManager");

	private static AssetBundle asset = null;

	private static readonly Dictionary<CreatureInfusion, GameObject> infusionVisuals = new Dictionary<CreatureInfusion, GameObject>();

	private static GameObject infusionList = null;

	private static readonly Dictionary<CreatureInfusion, Color> defaultInfusionColors = new Dictionary<CreatureInfusion, Color>
	{
		{
			CreatureInfusion.Fire,
			new Color(1f, 0.1f, 0f, 0.2f)
		},
		{
			CreatureInfusion.Frost,
			new Color(0f, 0f, 1f, 0.2f)
		},
		{
			CreatureInfusion.Lightning,
			new Color(0.8f, 0.75f, 1f, 0.7f)
		},
		{
			CreatureInfusion.Spirit,
			new Color(1f, 0f, 1f, 0.3f)
		},
		{
			CreatureInfusion.Poison,
			new Color(0f, 1f, 0f, 0.1f)
		}
	};

	private static Dictionary<CreatureInfusion, Color> infusionColors = new Dictionary<CreatureInfusion, Color>();

	private static readonly List<Character> checkCreaturesAfterSpawn = new List<Character>();

	private static readonly MethodInfo LevelUpdater = typeof(CreatureLevelControl).GetMethod("UpdateLevel");

	public static Dictionary<string, CreatureConfig> PrefabConfig
	{
		get
		{
			return prefabConfig;
		}
		set
		{
			prefabConfig = value;
			OriginalCharacterData[] array = Object.FindObjectsOfType<OriginalCharacterData>();
			foreach (OriginalCharacterData originalCharacterData in array)
			{
				UpdateCharacterAttributesFromConfig(((Component)originalCharacterData).GetComponent<Character>());
			}
		}
	}

	public static Dictionary<string, ItemConfig> ItemConfig
	{
		get
		{
			return itemConfig;
		}
		set
		{
			itemConfig = value;
			ItemControl.UpdateAllItemAttributesFromConfig();
		}
	}

	public static int maximumPossibleLevel => Mathf.Max(5, customLevelChances.Values.Max([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (ConfigEntry<string> c) => c.Value.Length));

	public static Dictionary<int, float> infusionProbabilityModifiersByLevel => infusionProbabilityModifiersByLevelString.Value.Split(new char[1] { ',' }).Select([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (string str, int i) => new Tuple<int, float>(i + 1, float.TryParse(str, NumberStyles.Float, CultureInfo.InvariantCulture, out var result) ? result : 1f)).ToDictionary([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (Tuple<int, float> k) => k.Item1, [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (Tuple<int, float> k) => k.Item2);

	private void DrawYamlEditorButton(ConfigEntryBase _)
	{
		//IL_016e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0174: Unknown result type (might be due to invalid IL or missing references)
		GUILayout.BeginVertical(Array.Empty<GUILayoutOption>());
		ConfigFile.Loader[] loaders = ConfigFile.loaders;
		foreach (ConfigFile.Loader loader in loaders)
		{
			if (loader.FileData.Value.Count <= 0 || !GUILayout.Button(loader.EditButtonName, new GUILayoutOption[1] { GUILayout.ExpandWidth(true) }))
			{
				continue;
			}
			activeConfigFileData = loader.FileData;
			activeConfigFileDataInstantiator = loader.InstantiateConfig;
			currentYamlInput = (from g in activeConfigFileData.Value.Select([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (string f, int index) => new { f, index })
				group g by g.index / 2).ToDictionary([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (g) => g.First().f, [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (g) => g.Last().f);
			foreach (string key in currentYamlInput.Keys)
			{
				if (!collapsed.ContainsKey(key))
				{
					collapsed[key] = collapsed.Count > 3;
					yamlTextareaScrollPosition[key] = default;
				}
			}
		}
		GUILayout.EndVertical();
	}

	private void Update()
	{
		if (activeConfigFileData != null)
		{
			Cursor.lockState = (CursorLockMode)0;
			Cursor.visible = true;
		}
	}

	private void LateUpdate()
	{
		Update();
	}

	private void OnGUI()
	{
		//IL_0035: Unknown result type (might be due to invalid IL or missing references)
		//IL_003a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0042: Unknown result type (might be due to invalid IL or missing references)
		//IL_004e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0062: Expected Obj, but got Unknown
		//IL_005d: Unknown result type (might be due to invalid IL or missing references)
		if (activeConfigFileData != null)
		{
			Update();
			yamlWindowRect = new Rect(10f, 10f, (float)(Screen.width - 20), (float)(Screen.height - 20));
			GUILayout.Window(-69, yamlWindowRect, (WindowFunction)yamlWindowDrawer, "Creature Level & Loot Control YAML Editor", Array.Empty<GUILayoutOption>());
		}
	}

	private void yamlWindowDrawer(int id)
	{
		//IL_0017: Unknown result type (might be due to invalid IL or missing references)
		//IL_0168: Unknown result type (might be due to invalid IL or missing references)
		//IL_016e: Invalid comparison between Unknown and I4
		//IL_06bf: Unknown result type (might be due to invalid IL or missing references)
		//IL_06d7: Unknown result type (might be due to invalid IL or missing references)
		//IL_06dc: Unknown result type (might be due to invalid IL or missing references)
		//IL_0175: Unknown result type (might be due to invalid IL or missing references)
		//IL_017b: Invalid comparison between Unknown and I4
		//IL_06fd: Unknown result type (might be due to invalid IL or missing references)
		//IL_0702: Unknown result type (might be due to invalid IL or missing references)
		//IL_0717: Unknown result type (might be due to invalid IL or missing references)
		//IL_0724: Expected Obj, but got Unknown
		//IL_0724: Unknown result type (might be due to invalid IL or missing references)
		//IL_0729: Unknown result type (might be due to invalid IL or missing references)
		//IL_073a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0753: Unknown result type (might be due to invalid IL or missing references)
		//IL_0199: Unknown result type (might be due to invalid IL or missing references)
		//IL_01a0: Invalid comparison between Unknown and I4
		//IL_03f3: Unknown result type (might be due to invalid IL or missing references)
		//IL_03f8: Unknown result type (might be due to invalid IL or missing references)
		//IL_0400: Unknown result type (might be due to invalid IL or missing references)
		//IL_0408: Unknown result type (might be due to invalid IL or missing references)
		//IL_0410: Unknown result type (might be due to invalid IL or missing references)
		//IL_042d: Expected Obj, but got Unknown
		//IL_0491: Unknown result type (might be due to invalid IL or missing references)
		//IL_04a5: Unknown result type (might be due to invalid IL or missing references)
		//IL_0224: Unknown result type (might be due to invalid IL or missing references)
		//IL_022e: Invalid comparison between Unknown and I4
		//IL_01bf: Unknown result type (might be due to invalid IL or missing references)
		//IL_01c5: Invalid comparison between Unknown and I4
		//IL_0235: Unknown result type (might be due to invalid IL or missing references)
		//IL_023c: Invalid comparison between Unknown and I4
		//IL_01e2: Unknown result type (might be due to invalid IL or missing references)
		//IL_01e9: Expected Obj, but got Unknown
		//IL_025e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0264: Invalid comparison between Unknown and I4
		//IL_0284: Unknown result type (might be due to invalid IL or missing references)
		//IL_028b: Expected Obj, but got Unknown
		GUI.Box(new Rect(0f, 0f, (float)Screen.width, (float)Screen.height), (Texture)(object)Texture2D.blackTexture);
		GUILayout.BeginHorizontal(Array.Empty<GUILayoutOption>());
		GUI.enabled = !hasErrors && (!configSync.IsLocked || configSync.IsSourceOfTruth);
		if (GUILayout.Button(LocalizationWrapper.getTranslation("ConfigEditorSave"), Array.Empty<GUILayoutOption>()) && !hasErrors)
		{
			save();
			activeConfigFileData = null;
		}
		if (configSync.IsSourceOfTruth && GUILayout.Button(LocalizationWrapper.getTranslation("ConfigEditorApplyNoSave"), Array.Empty<GUILayoutOption>()) && !hasErrors)
		{
			ConfigLoader.SkipSavingOfValueChange = true;
			save();
			ConfigLoader.SkipSavingOfValueChange = false;
			activeConfigFileData = null;
		}
		GUI.enabled = true;
		if (GUILayout.Button(LocalizationWrapper.getTranslation("ConfigEditorDiscard"), Array.Empty<GUILayoutOption>()))
		{
			activeConfigFileData = null;
		}
		GUILayout.EndHorizontal();
		hasErrors = false;
		string text = "";
		string text2 = "";
		foreach (string item in currentYamlInput.Keys.ToList())
		{
			if (GUI.GetNameOfFocusedControl() == "cllc yaml textarea for " + item && ((int)Event.current.type == 4 || (int)Event.current.type == 5) && Event.current.isKey)
			{
				if ((int)Event.current.keyCode == 9 || Event.current.character == '\t')
				{
					if ((int)Event.current.type == 5)
					{
						TextEditor val = (TextEditor)GUIUtility.GetStateObject(typeof(TextEditor), GUIUtility.keyboardControl);
						val.Insert(' ');
						val.Insert(' ');
						currentYamlInput[item] = val.text;
					}
					Event.current.Use();
				}
				if ((int)Event.current.keyCode == 271 || (int)Event.current.keyCode == 13 || Event.current.character == '\n')
				{
					if ((int)Event.current.type == 5)
					{
						TextEditor val2 = (TextEditor)GUIUtility.GetStateObject(typeof(TextEditor), GUIUtility.keyboardControl);
						string text3 = val2.text;
						int num = val2.cursorIndex;
						if (num > 0)
						{
							while (text3[num - 1] != '\n' && --num > 0)
							{
							}
						}
						int num2 = num;
						if (num2 < text3.Length && text3[num2] == ' ')
						{
							while (true)
							{
								if (num2 >= text3.Length || text3[num2] == '\n')
								{
									num2 = num;
									break;
								}
								if (text3[num2] != ' ')
								{
									break;
								}
								num2++;
							}
						}
						if (num2 > val2.cursorIndex)
						{
							num2 = num;
						}
						val2.Insert('\n');
						for (int num3 = num2 - num; num3 > 0; num3--)
						{
							val2.Insert(' ');
						}
						currentYamlInput[item] = val2.text;
					}
					Event.current.Use();
				}
			}
			if (currentYamlInput.Count > 1)
			{
				GUILayout.BeginVertical(GUI.skin.box, Array.Empty<GUILayoutOption>());
				if (GUILayout.Button(Path.GetFileName(item), new GUIStyle(GUI.skin.label)
				{
					alignment = (TextAnchor)1,
					wordWrap = true,
					stretchWidth = true,
					fontSize = 15
				}, new GUILayoutOption[1] { GUILayout.ExpandWidth(true) }))
				{
					collapsed[item] = !collapsed[item];
				}
			}
			else
			{
				collapsed[item] = false;
			}
			if (!collapsed[item])
			{
				yamlTextareaScrollPosition[item] = GUILayout.BeginScrollView(yamlTextareaScrollPosition[item], new GUILayoutOption[1] { GUILayout.ExpandHeight(true) });
				GUI.SetNextControlName("cllc yaml textarea for " + item);
				currentYamlInput[item] = GUILayout.TextArea(currentYamlInput[item], new GUILayoutOption[2]
				{
					GUILayout.ExpandWidth(true),
					GUILayout.ExpandHeight(true)
				});
				GUILayout.EndScrollView();
			}
			if (currentYamlInput.Count > 1)
			{
				GUILayout.EndVertical();
			}
			try
			{
				object configObj = new DeserializerBuilder().Build().Deserialize<object>(currentYamlInput[item]);
				ConfigFile configFile = activeConfigFileDataInstantiator();
				configFile.Parse(configObj);
				if (configFile.configErrors.Count > 0)
				{
					hasErrors = true;
					text = text + "There are errors in your " + Path.GetFileName(item) + " config:\n" + string.Join("\n", configFile.configErrors) + "\n";
				}
				if (configFile.configWarnings.Count > 0)
				{
					text2 = text2 + "Found some warnings while parsing your " + Path.GetFileName(item) + " config. These are not critical, but results may be unexpected.\n" + string.Join("\n", configFile.configWarnings) + "\n";
				}
			}
			catch (YamlException ex)
			{
				hasErrors = true;
				text = text + "The syntax of your " + Path.GetFileName(item) + " config is invalid, parsing failed:\n" + ex.Message + ((ex.InnerException != null) ? (": " + ex.InnerException.Message) : "") + "\n";
			}
		}
		GUILayout.BeginVertical(GUI.skin.box, Array.Empty<GUILayoutOption>());
		yamlErrorsScrollPosition = GUILayout.BeginScrollView(yamlErrorsScrollPosition, new GUILayoutOption[1] { GUILayout.Height(100f) });
		if (text != "")
		{
			GUIStyle val3 = new GUIStyle(GUI.skin.label);
			val3.normal.textColor = new Color(200f, 50f, 50f);
			GUIStyle val4 = val3;
			Color contentColor = GUI.contentColor;
			GUI.contentColor = new Color(200f, 50f, 50f);
			GUILayout.Label(text, val4, Array.Empty<GUILayoutOption>());
			GUI.contentColor = contentColor;
		}
		else
		{
			GUILayout.Label("Configuration syntax is valid.", Array.Empty<GUILayoutOption>());
		}
		if (text2 != "")
		{
			GUILayout.Label(text2, Array.Empty<GUILayoutOption>());
		}
		GUILayout.EndScrollView();
		GUILayout.EndVertical();
		void save()
		{
			activeConfigFileData.Value = currentYamlInput.SelectMany([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (KeyValuePair<string, string> kv) => new string[2] { kv.Key, kv.Value }).ToList();
		}
	}

	private ConfigEntry<T> config<[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)] T>(string group, string name, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)] string placeholderValue, T value, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)] AcceptableValueBase acceptableValue, bool synchronizedSetting, params object[] tags)
	{
		//IL_0107: Unknown result type (might be due to invalid IL or missing references)
		//IL_010e: Expected Obj, but got Unknown
		_configOrderCount.TryGetValue(group, out var value2);
		string value3 = Regex.Match(group, "\\d+ - ").Value;
		string category = value3 + LocalizationWrapper.getSettingGroupTranslation(group.Substring(value3.Length));
		string text = LocalizationWrapper.English.SettingTranslation(name).desc;
		LocalizationWrapper.SettingTexts settingTranslation = LocalizationWrapper.getSettingTranslation(name);
		string text2 = settingTranslation.desc;
		string text3 = settingTranslation.display ?? name;
		if (placeholderValue != null)
		{
			string value4 = Regex.Match(name, "\\{.+?\\}").Value;
			string newValue = LocalizationWrapper.English.getTranslationInternal(placeholderValue) ?? placeholderValue;
			placeholderValue = LocalizationWrapper.getTranslation(placeholderValue);
			name = name.Replace(value4, newValue);
			text = text.Replace(value4, newValue);
			text2 = text2.Replace(value4, placeholderValue);
			text3 = text3.Replace(value4, placeholderValue);
		}
		ConfigDescription val = new ConfigDescription(text, acceptableValue, CollectionExtensions.AddItem<object>((IEnumerable<object>)tags, (object)new ConfigurationManagerAttributes
		{
			Order = value2,
			Category = category,
			DispName = text3,
			Description = text2
		}).ToArray());
		value2 = (_configOrderCount[group] = value2 - 1);
		ConfigEntry<T> val2 = ((BaseUnityPlugin)this).Config.Bind<T>(group, name, value, val);
		SyncedConfigEntry<T> syncedConfigEntry = configSync.AddConfigEntry<T>(val2);
		syncedConfigEntry.SynchronizedConfig = synchronizedSetting;
		return val2;
	}

	private ConfigEntry<T> config<[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)] T>(string group, string name, string placeholder, T value, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)] AcceptableValueBase acceptableValue, params object[] tags)
	{
		return config(group, name, placeholder, value, acceptableValue, synchronizedSetting: true, tags);
	}

	private ConfigEntry<T> config<[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)] T>(string group, string name, string placeholderValue, T value, params object[] tags)
	{
		return config(group, name, placeholderValue, value, null, synchronizedSetting: true, tags);
	}

	private ConfigEntry<T> config<[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)] T>(string group, string name, T value, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)] AcceptableValueBase acceptableValue, params object[] tags)
	{
		return config(group, name, null, value, acceptableValue, synchronizedSetting: true, tags);
	}

	private ConfigEntry<T> config<[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)] T>(string group, string name, T value, bool synchronizedSetting, params object[] tags)
	{
		return config(group, name, null, value, null, synchronizedSetting, tags);
	}

	private ConfigEntry<T> config<[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)] T>(string group, string name, T value, params object[] tags)
	{
		return config(group, name, null, value, null, synchronizedSetting: true, tags);
	}

	public void Awake()
	{
		//IL_004a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0054: Expected Obj, but got Unknown
		//IL_0128: Unknown result type (might be due to invalid IL or missing references)
		//IL_0132: Expected Obj, but got Unknown
		//IL_133b: Unknown result type (might be due to invalid IL or missing references)
		//IL_1341: Expected Obj, but got Unknown
		configFilePaths = new List<string>
		{
			Path.GetDirectoryName(((BaseUnityPlugin)this).Config.ConfigFilePath),
			Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location)
		};
		infusionList = new GameObject("CLLC Infusion List");
		infusionList.SetActive(false);
		Object.DontDestroyOnLoad((Object)(object)infusionList);
		asset = Utils.GetAssetBundle("cllc_vfx");
		foreach (CreatureInfusion key2 in defaultInfusionColors.Keys)
		{
			infusionVisuals[key2] = Object.Instantiate<GameObject>(asset.LoadAsset<GameObject>("CLLC_Eff"), infusionList.transform);
		}
		infusionVisuals[CreatureInfusion.Chaos] = Object.Instantiate<GameObject>(asset.LoadAsset<GameObject>("CLLC_Eff"), infusionList.transform);
		infusionVisuals[CreatureInfusion.Chaos].AddComponent<ChaosInfusion>();
		LocalizationWrapper.LoadLanguage(Localization.instance.GetSelectedLanguage());
		englishLocalization = new Localization();
		AccessTools.DeclaredMethod(typeof(Localization), "SetupLanguage", (Type[])null, (Type[])null).Invoke(englishLocalization, new object[1] { "English" });
		Type configManagerType = bepinexConfigManager?.GetType("ConfigurationManager.ConfigurationManager");
		object configManager = ((configManagerType == null) ? null : Chainloader.ManagerObject.GetComponent(configManagerType));
		serverConfigLocked = config("1 - General", "Lock Configuration", Toggle.On);
		configSync.AddLockingConfigEntry<Toggle>(serverConfigLocked);
		creatureConfigFileActive = config("1 - General", "Use creature configuration yaml", Toggle.Off);
		creatureConfigFileActive.SettingChanged += [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (object _, EventArgs _) =>
		{
			PrefabConfig = PrefabConfig;
		};
		itemConfigFileActive = config("1 - General", "Use item configuration yaml", Toggle.Off);
		creatureConfigFileActive.SettingChanged += [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (object _, EventArgs _) =>
		{
			ItemControl.UpdateAllItemAttributesFromConfig();
		};
		config("1 - General", "nexusID", 495, false, new ConfigurationManagerAttributes
		{
			HideSettingName = true,
			HideDefaultButton = true,
			CustomDrawer = DrawYamlEditorButton
		});
		multiplayerHPfactor = config("1 - General", "HP increase per player in multiplayer (percentage)", 40f, (AcceptableValueBase)(object)new AcceptableValueRange<float>(0f, 200f));
		multiplayerDMGfactor = config("1 - General", "DMG increase per player in multiplayer (percentage)", 4f, (AcceptableValueBase)(object)new AcceptableValueRange<float>(0f, 200f));
		minimumMultiplayerPlayerCount = config("1 - General", "Minimum player count for multiplayer scaling", 1, (AcceptableValueBase)(object)new AcceptableValueRange<int>(1, 25));
		maximumMultiplayerPlayerCount = config("1 - General", "Maximum player count for multiplayer scaling", 10, (AcceptableValueBase)(object)new AcceptableValueRange<int>(1, 25));
		additionalMultiplayerPlayerCount = config("1 - General", "Player count to be added to the actual player count for multiplayer scaling (0 is disabled)", 0, (AcceptableValueBase)(object)new AcceptableValueRange<int>(0, 25));
		multiplayerScalingRange = config("1 - General", "Multiplayer scaling per player range (0 is unlimited)", 200f, (AcceptableValueBase)(object)new AcceptableValueRange<float>(0f, 10000f));
		mouseOverNamePlateRange = config("1 - General", "Nameplate display on mouseover range", 50f, (AcceptableValueBase)(object)new AcceptableValueRange<float>(0f, 100f));
		mouseOverNamePlateRange.SettingChanged += [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (object _, EventArgs _) =>
		{
			Object.FindObjectsOfType<EnemyHud>().ToList().ForEach([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (EnemyHud hud) =>
			{
				hud.m_maxShowDistance = mouseOverNamePlateRange.Value;
			});
		};
		visualLevelIndicator = config("1 - General", "Visual indicators for level", VisualLevelIndicator.On);
		visualLevelIndicator.SettingChanged += [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (object _, EventArgs _) =>
		{
			ShowStar.ForceUpdate();
		};
		allowedConsoleCommands = config("1 - General", "Console commands allowed to be used by users on a server", AllowedConsoleCommands.InformationCommands);
		detailedDamageLogging = config("1 - General", "Detailed damage log", Toggle.Off, false);
		difficulty = config("2 - Creatures", "Difficulty", Difficulty.Medium);
		difficultySecondFactor = config("2 - Creatures", "Second factor", DifficultySecondFactor.Fluid);
		difficultySecondFactor.SettingChanged += DistanceFromSpawnOnSettingChanged;
		displayDistanceFromSpawnCircles = config("2 - Creatures", "Display circles on the map for distance from spawn option", Toggle.On, new object[1] { distanceLevelSettingAttributes });
		displayDistanceFromSpawnCircles.SettingChanged += DistanceFromSpawnOnSettingChanged;
		creatureSpecialEffects = config("2 - Creatures", "Creatures can spawn with special effects", Toggle.On);
		visualExtraEffectIndicator = config("2 - Creatures", "Visual indicator for special effects", VisualExtraEffectIndicator.Both, false, creatureAffixSettingAttributes);
		visualExtraEffectIndicator.SettingChanged += [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (object _, EventArgs _) =>
		{
			ShowStar.ForceUpdate();
		};
		creatureInfusionEffects = config("2 - Creatures", "Creatures can spawn with elemental infusions", Toggle.On);
		creatureInfusionName = config("2 - Creatures", "Add the infusion to the creatures name", Toggle.On, new object[1] { creatureInfusionSettingAttributes });
		creatureInfusionVisualEffects = config("2 - Creatures", "Brightness for the elemental infusions visual indicator (percentage)", 100f, (AcceptableValueBase)(object)new AcceptableValueRange<float>(0f, 200f), creatureInfusionSettingAttributes);
		minimumLevel = config("2 - Creatures", "Minimum stars", SpawnLevel.None, new object[1] { levelSpanSettingAttributes });
		maximumLevel = config("2 - Creatures", "Maximum stars", SpawnLevel.Five, new object[1] { levelSpanSettingAttributes });
		noStarCreatureChanceShift = config("2 - Creatures", "Shift level up chance for no star vanilla creatures", 2);
		dungeonCreatureRespawnTime = config("2 - Creatures", "Time until creatures in dungeons respawn in minutes (0 means disabled, 30 is one ingame day)", 30);
		campCreatureRespawnTime = config("2 - Creatures", "Time until creatures in camps respawn in minutes (0 means disabled, 30 is one ingame day)", 30);
		enemyScaling = config("2 - Creatures", "Creature size increase per star (percentage)", 10, (AcceptableValueBase)(object)new AcceptableValueRange<int>(0, 40));
		enemyScalingDungeon = config("2 - Creatures", "Increase creature size even in dungeons (where they might get stuck)", Toggle.Off);
		creatureBaseHealth = config("2 - Creatures", "Base health for creatures (percentage)", 100f, (AcceptableValueBase)(object)new AcceptableValueRange<float>(1f, 500f));
		creatureHealthGainPerStar = config("2 - Creatures", "Health gained per star for creatures (percentage)", 100f, (AcceptableValueBase)(object)new AcceptableValueRange<float>(1f, 500f));
		creatureBaseDamage = config("2 - Creatures", "Base damage for creatures (percentage)", 100f, (AcceptableValueBase)(object)new AcceptableValueRange<float>(1f, 500f));
		creatureDamageGainPerStar = config("2 - Creatures", "Damage gained per star for creatures (percentage)", 50f, (AcceptableValueBase)(object)new AcceptableValueRange<float>(1f, 500f));
		creatureMovementSpeed = config("2 - Creatures", "Base movement speed for creatures (percentage)", 100f, (AcceptableValueBase)(object)new AcceptableValueRange<float>(1f, 300f));
		creatureAttackSpeed = config("2 - Creatures", "Base attack speed for creatures (percentage)", 100f, (AcceptableValueBase)(object)new AcceptableValueRange<float>(1f, 500f));
		logarithmicScaling = config("2 - Creatures", "Apply logarithmic power scaling", 2f, (AcceptableValueBase)(object)new AcceptableValueRange<float>(0f, 5f));
		creatureSectorStartLevel = config("2 - Creatures", "World level required to enable creature sectors", CreatureSectorWorldLevel.Disabled);
		creatureSectorResetTime = config("2 - Creatures", "Time until each creature sector is reset (0 is no reset)", 60, new object[1] { creatureSectorSettingAttributes });
		creatureSectorLevelUp = config("2 - Creatures", "Kills required in a sector for each bonus level", "20, 50, 100", new object[1] { creatureSectorSettingAttributes });
		creatureSectorAnnouncementScope = config("2 - Creatures", "Sets the scope for creature sector level up announcements", CreatureSectorAnnouncementScope.Local, new object[1] { creatureSectorSettingAttributes });
		creatureSectorPingTime = config("2 - Creatures", "Duration of the map ping for creature sector level ups in seconds (0 is disabled)", 0, new object[1] { creatureSectorSettingAttributes });
		displayCreatureSectorLevel = config("2 - Creatures", "Displays the current creature sector level on the minimap", Toggle.Off, new object[1] { creatureSectorSettingAttributes });
		lootSystem = config("3 - Loot", "Loot system to be used", LootSystem.CalculateChance);
		additionalLootChancePerLevelCreature = config("3 - Loot", "Chance for additional loot per star for creatures", 50, (AcceptableValueBase)(object)new AcceptableValueRange<int>(0, 100), lootSystemSettingAttributes);
		additionalLootChancePerLevelBoss = config("3 - Loot", "Chance for additional loot per star for bosses", 50, (AcceptableValueBase)(object)new AcceptableValueRange<int>(0, 100), lootSystemSettingAttributes);
		creatureLootMultiplier = config("3 - Loot", "Multiplier for dropped creature items", 1f, (AcceptableValueBase)(object)new AcceptableValueRange<float>(0f, 5f), lootSystemSettingAttributes);
		bossLootMultiplier = config("3 - Loot", "Multiplier for dropped boss items", 1f, (AcceptableValueBase)(object)new AcceptableValueRange<float>(0f, 5f), lootSystemSettingAttributes);
		multipleTrophies = config("3 - Loot", "Creatures can drop multiple trophies", Toggle.Off);
		multipleBossTrophies = config("3 - Loot", "Bosses can drop multiple trophies", Toggle.Off);
		limitBossDropRange = config("3 - Loot", "Limit boss drop range", Toggle.On);
		lootMultiplierPassive = config("3 - Loot", "Drop multiplier for passive creatures (like Seagulls and Crows)", 1f, (AcceptableValueBase)(object)new AcceptableValueRange<float>(1f, 5f));
		dungeonRespawnTime = config("3 - Loot", "Time until items in dungeons respawn in minutes (0 means disabled, 30 is one ingame day)", 150);
		bossSpecialEffects = config("4 - Bosses", "Bosses can spawn with special effects", Toggle.Off);
		bossLevelUseCreatureLevel = config("4 - Bosses", "Use creature level chances for bosses", Toggle.Off);
		customBossLevelChances = config("4 - Bosses", "Star chances for bosses (percentages)", "0, 0, 0, 0, 0, 0, 0, 0, 0", new object[1] { bossLevelSettingAttributes });
		bossScaling = config("4 - Bosses", "Boss size increase per star (percentage)", 5, (AcceptableValueBase)(object)new AcceptableValueRange<int>(0, 40));
		bossHealthGainPerStar = config("4 - Bosses", "Health gained per star for bosses (percentage)", 25f, (AcceptableValueBase)(object)new AcceptableValueRange<float>(1f, 500f));
		bossDamageGainPerStar = config("4 - Bosses", "Damage gained per star for bosses (percentage)", 10f, (AcceptableValueBase)(object)new AcceptableValueRange<float>(1f, 500f));
		worldLevelSettingAttributes.Browsable = difficultySecondFactor.Value == DifficultySecondFactor.Age_of_world;
		difficultySecondFactor.SettingChanged += [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (object _, EventArgs _) =>
		{
			worldLevelSettingAttributes.Browsable = difficultySecondFactor.Value == DifficultySecondFactor.Age_of_world;
			reloadConfigDisplay();
		};
		lootSystemSettingAttributes.Browsable = lootSystem.Value != LootSystem.Vanilla;
		lootSystem.SettingChanged += [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (object _, EventArgs _) =>
		{
			lootSystemSettingAttributes.Browsable = lootSystem.Value != LootSystem.Vanilla;
			reloadConfigDisplay();
		};
		creatureSectorSettingAttributes.Browsable = creatureSectorStartLevel.Value != CreatureSectorWorldLevel.Disabled;
		creatureSectorStartLevel.SettingChanged += [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (object _, EventArgs _) =>
		{
			creatureSectorSettingAttributes.Browsable = creatureSectorStartLevel.Value != CreatureSectorWorldLevel.Disabled;
			reloadConfigDisplay();
		};
		bossLevelSettingAttributes.Browsable = bossLevelUseCreatureLevel.Value == Toggle.Off;
		bossLevelUseCreatureLevel.SettingChanged += [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (object _, EventArgs _) =>
		{
			bossLevelSettingAttributes.Browsable = bossLevelUseCreatureLevel.Value == Toggle.Off;
			reloadConfigDisplay();
		};
		for (int num = 1; num <= defaultWorldLevelDays.Length; num++)
		{
			ConfigEntry<int> key = config("5 - Age of world", "World level {level} start (days)", num.ToString(), defaultWorldLevelDays[num - 1], new object[1] { worldLevelSettingAttributes });
			worldLevels.Add(key, num - 1);
		}
		distanceLevelSettingAttributes.Browsable = difficultySecondFactor.Value == DifficultySecondFactor.Distance;
		difficultySecondFactor.SettingChanged += [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (object _, EventArgs _) =>
		{
			distanceLevelSettingAttributes.Browsable = difficultySecondFactor.Value == DifficultySecondFactor.Distance;
			reloadConfigDisplay();
		};
		for (int num2 = 1; num2 <= defaultWorldLevelDays.Length; num2++)
		{
			ConfigEntry<int> val = config("5 - Distance from Spawn", "Distance from spawn for level {level} start", num2.ToString(), defaultSpawnDistance[num2 - 1], (AcceptableValueBase)(object)new AcceptableValueRange<int>(0, 25000), distanceLevelSettingAttributes);
			spawnDistance.Add(val, num2 - 1);
			val.SettingChanged += DistanceFromSpawnOnSettingChanged;
		}
		levelSpanSettingAttributes.Browsable = difficulty.Value != Difficulty.Custom;
		customLevelSettingAttributes.Browsable = difficulty.Value == Difficulty.Custom;
		difficulty.SettingChanged += [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (object _, EventArgs _) =>
		{
			customLevelSettingAttributes.Browsable = difficulty.Value == Difficulty.Custom;
			worldLevelSettingAttributes.Browsable = difficultySecondFactor.Value == DifficultySecondFactor.Age_of_world;
			distanceLevelSettingAttributes.Browsable = difficultySecondFactor.Value == DifficultySecondFactor.Distance;
			levelSpanSettingAttributes.Browsable = difficulty.Value != Difficulty.Custom;
			reloadConfigDisplay();
		};
		for (int num3 = 0; num3 < defaultCustomLevelChances.Length; num3++)
		{
			ConfigEntry<string> value = config("5 - Custom level chances", "Chances for stars at world level {level} (percent)", num3.ToString(), string.Join(", ", defaultCustomLevelChances[num3].Select([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (float f) => f.ToString(CultureInfo.InvariantCulture))), new object[1] { customLevelSettingAttributes });
			customLevelChances.Add(num3, value);
		}
		bossScaling.SettingChanged += enemyScaling_SettingChanged;
		enemyScaling.SettingChanged += enemyScaling_SettingChanged;
		enemyScalingDungeon.SettingChanged += enemyScaling_SettingChanged;
		creatureInfusionVisualEffects.SettingChanged += infusionVisualEffects_SettingChanged;
		calculateInfusionColors();
		creatureMovementSpeed.SettingChanged += creatureMovementSpeed_SettingChanged;
		foreach (KeyValuePair<CreatureExtraEffect, float> defaultCustomCreatureAffixChance in defaultCustomCreatureAffixChances)
		{
			string enumDescription = Utils.GetEnumDescription(defaultCustomCreatureAffixChance.Key);
			ConfigEntry<float> value2 = config("6 - Creature Affix chances", "Chance for {effect} effect to spawn (percentage)", enumDescription, defaultCustomCreatureAffixChance.Value, (AcceptableValueBase)(object)new AcceptableValueRange<float>(0f, 100f), creatureAffixSettingAttributes);
			customCreatureAffixChances.Add(defaultCustomCreatureAffixChance.Key, value2);
		}
		creatureAffixSettingAttributes.Browsable = creatureSpecialEffects.Value == Toggle.On;
		creatureSpecialEffects.SettingChanged += [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (object _, EventArgs _) =>
		{
			creatureAffixSettingAttributes.Browsable = creatureSpecialEffects.Value == Toggle.On;
			reloadConfigDisplay();
		};
		foreach (KeyValuePair<CreatureInfusion, float> defaultCustomCreatureInfusionChance in defaultCustomCreatureInfusionChances)
		{
			string enumDescription2 = Utils.GetEnumDescription(defaultCustomCreatureInfusionChance.Key);
			ConfigEntry<float> value3 = config("6 - Creature Infusion chances", "Chance for {infusionDescription} infusion to spawn (percentage)", enumDescription2, defaultCustomCreatureInfusionChance.Value, (AcceptableValueBase)(object)new AcceptableValueRange<float>(0f, 100f), creatureInfusionSettingAttributes);
			customCreatureInfusionChances.Add(defaultCustomCreatureInfusionChance.Key, value3);
		}
		creatureInfusionSettingAttributes.Browsable = creatureInfusionEffects.Value == Toggle.On;
		creatureInfusionEffects.SettingChanged += [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (object _, EventArgs _) =>
		{
			creatureInfusionSettingAttributes.Browsable = creatureInfusionEffects.Value == Toggle.On;
			reloadConfigDisplay();
		};
		infusionProbabilityModifiersByLevelString = config("6 - Creature Infusion chances", "Multiplier for infusion chances per star", string.Join(", ", defaultInfusionProbabilityModifiersByLevel.Select([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (float f) => f.ToString(CultureInfo.InvariantCulture))), new object[1] { creatureInfusionSettingAttributes });
		foreach (KeyValuePair<BossAffix, float> defaultCustomBossAffixChance in defaultCustomBossAffixChances)
		{
			string enumDescription3 = Utils.GetEnumDescription(defaultCustomBossAffixChance.Key);
			ConfigEntry<float> value4 = config("7 - Boss Affix chances", "Chance for {affix} affix to spawn (percentage)", enumDescription3, defaultCustomBossAffixChance.Value, (AcceptableValueBase)(object)new AcceptableValueRange<float>(0f, 100f), bossAffixSettingAttributes);
			customBossAffixChances.Add(defaultCustomBossAffixChance.Key, value4);
		}
		bossAffixPowerReflective = config("8 - Boss Affix power", "Reflective base damage", 1f, (AcceptableValueBase)(object)new AcceptableValueRange<float>(0.01f, 10f), bossAffixSettingAttributes);
		bossAffixPowerShielded = config("8 - Boss Affix power", "Shielded damage reduction (percentage)", 50f, (AcceptableValueBase)(object)new AcceptableValueRange<float>(1f, 100f), bossAffixSettingAttributes);
		bossAffixPowerMending = config("8 - Boss Affix power", "Mending healing factor", 1f, (AcceptableValueBase)(object)new AcceptableValueRange<float>(0.01f, 10f), bossAffixSettingAttributes);
		bossAffixPowerSummoner = config("8 - Boss Affix power", "Number of summons for Summoners", 3, (AcceptableValueBase)(object)new AcceptableValueRange<int>(1, 10), bossAffixSettingAttributes);
		bossAffixPowerElementalist = config("8 - Boss Affix power", "Elementalist damage increase (percentage)", 20f, (AcceptableValueBase)(object)new AcceptableValueRange<float>(1f, 200f), bossAffixSettingAttributes);
		bossAffixPowerEnraged = config("8 - Boss Affix power", "Enraged damage increase (percentage)", 20f, (AcceptableValueBase)(object)new AcceptableValueRange<float>(1f, 200f), bossAffixSettingAttributes);
		bossAffixPowerTwin = config("8 - Boss Affix power", "Twin damage and health (percentage)", 75f, (AcceptableValueBase)(object)new AcceptableValueRange<float>(25f, 200f), bossAffixSettingAttributes);
		bossAffixPowerSturdy = config("8 - Boss Affix power", "Sturdy damage taken reduction (percentage)", 25f, (AcceptableValueBase)(object)new AcceptableValueRange<float>(1f, 200f), bossAffixSettingAttributes);
		bossAffixSettingAttributes.Browsable = bossSpecialEffects.Value == Toggle.On;
		bossSpecialEffects.SettingChanged += [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (object _, EventArgs _) =>
		{
			bossAffixSettingAttributes.Browsable = bossSpecialEffects.Value == Toggle.On;
			reloadConfigDisplay();
		};
		Assembly executingAssembly = Assembly.GetExecutingAssembly();
		Harmony val2 = new Harmony("org.bepinex.plugins.creaturelevelcontrol");
		val2.PatchAll(executingAssembly);
		void reloadConfigDisplay()
		{
			configManagerType?.GetMethod("BuildSettingList").Invoke(configManager, Array.Empty<object>());
		}
	}

	private void DistanceFromSpawnOnSettingChanged(object sender, EventArgs e)
	{
		if (Object.op_Implicit((Object)(object)Minimap.instance))
		{
			WorldLevelMinimapCircles.RedrawDistanceCircles(Minimap.instance);
		}
	}

	private void FixedUpdate()
	{
		Utils.serverTime += new TimeSpan((long)(Time.fixedDeltaTime * 10000000f));
	}

	private static void calculateInfusionColors()
	{
		//IL_0078: Unknown result type (might be due to invalid IL or missing references)
		infusionColors = defaultInfusionColors.ToDictionary([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (KeyValuePair<CreatureInfusion, Color> kv) => kv.Key, [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (KeyValuePair<CreatureInfusion, Color> kv) =>
		{
			//IL_0002: Unknown result type (might be due to invalid IL or missing references)
			//IL_0007: Unknown result type (might be due to invalid IL or missing references)
			//IL_000c: Unknown result type (might be due to invalid IL or missing references)
			//IL_002c: Unknown result type (might be due to invalid IL or missing references)
			Color value = kv.Value;
			value.a = kv.Value.a * creatureInfusionVisualEffects.Value / 100f;
			return value;
		});
		foreach (KeyValuePair<CreatureInfusion, Color> infusionColor in infusionColors)
		{
			SetInfusionColors(infusionVisuals[infusionColor.Key], infusionColor.Value);
		}
	}

	private static void infusionVisualEffects_SettingChanged(object sender, EventArgs e)
	{
		//IL_0053: Unknown result type (might be due to invalid IL or missing references)
		calculateInfusionColors();
		Character[] array = Object.FindObjectsOfType<Character>();
		foreach (Character val in array)
		{
			CreatureInfusion infusionCreature = API.GetInfusionCreature(val);
			if (infusionCreature != CreatureInfusion.None && infusionCreature != CreatureInfusion.Chaos)
			{
				Transform val2 = ((Component)val).transform.Find("infusion flames");
				if (val2 != null)
				{
					SetInfusionColors(((Component)val2).gameObject, infusionColors[infusionCreature]);
				}
			}
		}
	}

	private static void enemyScaling_SettingChanged(object sender, EventArgs e)
	{
		EnemyLevelData[] array = Object.FindObjectsOfType<EnemyLevelData>();
		foreach (EnemyLevelData originalData in array)
		{
			PatchSize(originalData);
		}
	}

	private static void creatureMovementSpeed_SettingChanged(object sender, EventArgs e)
	{
		OriginalCharacterData[] array = Object.FindObjectsOfType<OriginalCharacterData>();
		foreach (OriginalCharacterData originalCharacterData in array)
		{
			Character component = ((Component)originalCharacterData).GetComponent<Character>();
			if (!component.IsBoss())
			{
				SetPersistedCharacterAttributes(component);
			}
		}
	}

	public static void SetPersistedCharacterAttributes(Character character)
	{
		OriginalCharacterData originalCharacterData = ((Component)character).GetComponent<OriginalCharacterData>();
		if (originalCharacterData == null)
		{
			originalCharacterData = ((Component)character).gameObject.AddComponent<OriginalCharacterData>();
			originalCharacterData.acceleration = character.m_acceleration;
			originalCharacterData.swimAcceleration = character.m_swimAcceleration;
			originalCharacterData.runSpeed = character.m_runSpeed;
			originalCharacterData.runTurnSpeed = character.m_runTurnSpeed;
			originalCharacterData.flySpeed = character.m_flyFastSpeed;
			originalCharacterData.flyTurnSpeed = character.m_flyTurnSpeed;
			originalCharacterData.swimSpeed = character.m_swimSpeed;
			originalCharacterData.swimTurnSpeed = character.m_swimTurnSpeed;
			originalCharacterData.hearRange = ((Component)character).GetComponent<BaseAI>().m_hearRange;
			originalCharacterData.viewRange = ((Component)character).GetComponent<BaseAI>().m_viewRange;
			originalCharacterData.viewAngle = ((Component)character).GetComponent<BaseAI>().m_viewAngle;
			originalCharacterData.minAttackInterval = ((Component)character).GetComponent<MonsterAI>()?.m_minAttackInterval ?? 0f;
			originalCharacterData.circleTargetDistance = ((Component)character).GetComponent<MonsterAI>()?.m_circleTargetDistance ?? 0f;
			originalCharacterData.circleTargetDuration = ((Component)character).GetComponent<MonsterAI>()?.m_circleTargetDuration ?? 0f;
			originalCharacterData.circleTargetInterval = ((Component)character).GetComponent<MonsterAI>()?.m_circleTargetInterval ?? 0f;
		}
		originalCharacterData.immutableExtra = true;
		float num = 0f;
		float num2 = 0f;
		float num3 = 0f;
		float num4 = 0f;
		if (!character.IsBoss())
		{
			CreatureExtraEffect extraEffectCreature = API.GetExtraEffectCreature(character);
			if (extraEffectCreature == CreatureExtraEffect.Aggressive)
			{
				num = Utils.ReadEffectPowerFromConfig(character, CreatureExtraEffect.Armored) ?? 0.5f;
			}
			if (extraEffectCreature == CreatureExtraEffect.Curious)
			{
				num3 = Utils.ReadEffectPowerFromConfig(character, CreatureExtraEffect.Curious) ?? 1f;
			}
			if (extraEffectCreature == CreatureExtraEffect.Quick)
			{
				num2 = Utils.ReadEffectPowerFromConfig(character, CreatureExtraEffect.Quick) ?? 0.4f;
			}
			if (extraEffectCreature == CreatureExtraEffect.Armored)
			{
				num4 = 0.5f;
			}
		}
		MonsterAI component = ((Component)character).GetComponent<MonsterAI>();
		if (component != null)
		{
			component.m_minAttackInterval = Mathf.Max(0f, originalCharacterData.minAttackInterval * (1f - num));
			component.m_circleTargetDistance = Mathf.Max(0f, originalCharacterData.circleTargetDistance * (1f - 0.4f * num));
			component.m_circleTargetDuration = Mathf.Max(0f, originalCharacterData.circleTargetDuration * (1f - num));
			component.m_circleTargetInterval = originalCharacterData.circleTargetInterval * (1f + 3f * num);
		}
		BaseAI component2 = ((Component)character).GetComponent<BaseAI>();
		if (component2 != null)
		{
			component2.m_hearRange = originalCharacterData.hearRange * (1f + num3);
			component2.m_viewRange = originalCharacterData.viewRange * (1f + num3);
			component2.m_viewAngle = ((num3 == 0f) ? originalCharacterData.viewAngle : 180f);
		}
		float num5 = Utils.ReadWithWorldLevelAndStarsFromConfig(character, [return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 2 })] (CreatureConfig c) => c.baseMovementSpeed, out var usedStars) ?? (character.IsBoss() ? 1f : (creatureMovementSpeed.Value / 100f));
		float valueOrDefault = Utils.ReadWithWorldLevelFromConfig(character, (CreatureConfig c) => c.movementSpeedGainPerStar).GetValueOrDefault();
		num5 += valueOrDefault * (float)(character.GetLevel() - 1 - usedStars);
		float num6 = Mathf.Max(0f, 1f + num2 - num4) * num5;
		character.m_acceleration = originalCharacterData.acceleration * num6;
		character.m_swimAcceleration = originalCharacterData.swimAcceleration * num6;
		character.m_runSpeed = originalCharacterData.runSpeed * num6;
		character.m_runTurnSpeed = originalCharacterData.runTurnSpeed * num6;
		character.m_flyFastSpeed = originalCharacterData.flySpeed * num6;
		character.m_flyTurnSpeed = originalCharacterData.flyTurnSpeed * num6;
		character.m_swimSpeed = originalCharacterData.swimSpeed * num6;
		character.m_swimTurnSpeed = originalCharacterData.swimTurnSpeed * num6;
	}

	public static void SetTwinBoss(Character boss, Character twinBoss)
	{
		//IL_0012: Unknown result type (might be due to invalid IL or missing references)
		//IL_002e: Unknown result type (might be due to invalid IL or missing references)
		((Component)boss).GetComponent<ZNetView>().GetZDO().Set("CL&LC twin boss", twinBoss.GetZDOID());
		((Component)twinBoss).GetComponent<ZNetView>().GetZDO().Set("CL&LC twin boss", boss.GetZDOID());
	}

	private static void UpdateCharacterAttributesFromConfig(Character character)
	{
		AccessTools.DeclaredMethod(typeof(Character), "SetupMaxHealth", (Type[])null, (Type[])null).Invoke(character, Array.Empty<object>());
		SetPersistedCharacterAttributes(character);
		EnemyLevelData component = ((Component)character).GetComponent<EnemyLevelData>();
		if (component != null)
		{
			PatchSize(component);
		}
	}

	[return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)]
	private static ZNetView findQueenDungeonGenerator(OfferingBowl offeringBowl)
	{
		return ((Component)offeringBowl).GetComponentInParent<DungeonGenerator>()?.m_nview;
	}

	[return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)]
	private static ZNetView findInteriorAltar(OfferingBowl offeringBowl)
	{
		Location componentInParent = ((Component)offeringBowl).GetComponentInParent<Location>();
		object obj;
		if (componentInParent == null)
		{
			obj = null;
		}
		else
		{
			Transform val = ((Component)componentInParent).transform.Find("Interior");
			obj = ((val != null) ? ((Component)val).GetComponentInChildren<OfferingBowl>() : null);
		}
		return ((Object)(object)offeringBowl == (Object)obj) ? null : offeringBowl.m_nview;
	}

	private static void ColorEnemyStars(Character c)
	{
		//IL_0048: Unknown result type (might be due to invalid IL or missing references)
		//IL_00b2: Unknown result type (might be due to invalid IL or missing references)
		//IL_00b7: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a9: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ae: Unknown result type (might be due to invalid IL or missing references)
		//IL_00bb: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c0: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c4: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c9: Unknown result type (might be due to invalid IL or missing references)
		//IL_00cd: Unknown result type (might be due to invalid IL or missing references)
		//IL_00d2: Unknown result type (might be due to invalid IL or missing references)
		//IL_00d6: Unknown result type (might be due to invalid IL or missing references)
		//IL_00db: Unknown result type (might be due to invalid IL or missing references)
		//IL_0223: Unknown result type (might be due to invalid IL or missing references)
		if (c.GetLevel() <= 1 || c.IsBoss() || !EnemyHud.instance.m_huds.TryGetValue(c, out var value))
		{
			return;
		}
		Color color = new Color(1f, 0.817f, 0.338f);
		VisualExtraEffectIndicator value2 = visualExtraEffectIndicator.Value;
		if ((value2 == VisualExtraEffectIndicator.Color || value2 == VisualExtraEffectIndicator.Both) ? true : false)
		{
			switch (API.GetExtraEffectCreature(c))
			{
			case CreatureExtraEffect.Quick:
				color = Color.magenta;
				break;
			case CreatureExtraEffect.Aggressive:
				color = Color.red;
				break;
			case CreatureExtraEffect.Regenerating:
				color = Color.green;
				break;
			case CreatureExtraEffect.Curious:
				color = Color.cyan;
				break;
			case CreatureExtraEffect.Splitting:
				color = Color.white;
				break;
			case CreatureExtraEffect.Armored:
				color = Color.blue;
				break;
			default:
				throw new ArgumentOutOfRangeException();
			case CreatureExtraEffect.None:
				break;
			}
		}
		GameObject gui = value.m_gui;
		Text component = ((Component)gui.transform.Find("extraeffecttext")).GetComponent<Text>();
		if (((Component)component).gameObject.activeSelf)
		{
			string creatureName = ((Object)c).name.Replace("(Clone)", "");
			CreatureExtraEffect extraEffectCreature = API.GetExtraEffectCreature(c);
			string creatureTranslation = LocalizationWrapper.getCreatureTranslation(creatureName, "<placeholder>");
			CreatureExtraEffect? effect = extraEffectCreature;
			string creatureTranslation2 = LocalizationWrapper.getCreatureTranslation(creatureName, "<placeholder>", null, effect);
			component.text = (creatureTranslation2.StartsWith(creatureTranslation) ? creatureTranslation2.Substring(creatureTranslation.Length) : creatureTranslation2.Substring(0, creatureTranslation2.Length - creatureTranslation.Length));
		}
		for (int i = 0; i < gui.transform.childCount; i++)
		{
			Transform child = gui.transform.GetChild(i);
			for (int j = 0; j < ((Component)child).transform.childCount; j++)
			{
				Transform child2 = ((Component)child).transform.GetChild(j);
				if (((Object)child2).name.StartsWith("star"))
				{
					((Graphic)((Component)child2.GetChild(0)).GetComponent<Image>()).color = color;
				}
			}
		}
	}

	private static float calculateSizeIncrease(Character character)
	{
		//IL_000d: Unknown result type (might be due to invalid IL or missing references)
		float num = 0f;
		if (((Component)character).transform.localPosition.y < 4500f || enemyScalingDungeon.GetToggle())
		{
			num = Utils.ReadFromConfig(character, (CreatureConfig c) => c.sizeScalingFactor) ?? ((float)(character.IsBoss() ? bossScaling : enemyScaling).Value / 100f);
		}
		return 1f + num * (float)(character.GetLevel() - 1);
	}

	private static void PatchSize(EnemyLevelData originalData)
	{
		//IL_0016: Unknown result type (might be due to invalid IL or missing references)
		//IL_001c: Unknown result type (might be due to invalid IL or missing references)
		Character component = ((Component)originalData).GetComponent<Character>();
		float num = calculateSizeIncrease(component);
		((Component)component).transform.localScale = originalData.localScale * num;
		Physics.SyncTransforms();
		SetInfusionFlamesSize(component);
	}

	public static float getMultiplayerRangeValue()
	{
		return (multiplayerScalingRange.Value == 0f) ? float.PositiveInfinity : multiplayerScalingRange.Value;
	}

	private static string buildCharacterDescription(Character character)
	{
		string hoverName = character.GetHoverName();
		if (character.IsPlayer())
		{
			return "Player " + hoverName;
		}
		string text = "";
		if (character.IsBoss())
		{
			text = hoverName;
			if (API.GetAffixBoss(character) != BossAffix.None)
			{
				text = text + " the " + API.GetAffixBoss(character);
			}
		}
		else
		{
			if (API.GetExtraEffectCreature(character) != CreatureExtraEffect.None)
			{
				text = text + API.GetExtraEffectCreature(character).ToString() + " ";
			}
			if (API.GetInfusionCreature(character) != CreatureInfusion.None)
			{
				text = text + API.GetInfusionCreature(character).ToString() + "-Infused ";
			}
			text += hoverName;
		}
		return $"{text} ({character.GetLevel()})";
	}

	private static string buildHitDamageLogString(HitData hit)
	{
		string text = $"{round(hit.GetTotalDamage())} damage:";
		if (hit.GetTotalPhysicalDamage() > 0f)
		{
			text += $" physical {round(hit.GetTotalPhysicalDamage())} (";
			string[] source = new string[3]
			{
				(hit.m_damage.m_blunt > 0f) ? $"blunt {round(hit.m_damage.m_blunt)}" : "",
				(hit.m_damage.m_pierce > 0f) ? $"pierce {round(hit.m_damage.m_pierce)}" : "",
				(hit.m_damage.m_slash > 0f) ? $"slash {round(hit.m_damage.m_slash)}" : ""
			};
			text = text + string.Join(";", source.Where([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (string x) => !string.IsNullOrEmpty(x))) + ")";
		}
		if (hit.m_damage.m_chop > 0f)
		{
			text += $"; chop {round(hit.m_damage.m_chop)}";
		}
		if (hit.m_damage.m_pickaxe > 0f)
		{
			text += $"; pickaxe {round(hit.m_damage.m_pickaxe)}";
		}
		if (hit.GetTotalElementalDamage() > 0f)
		{
			text += $"; elemental {round(hit.GetTotalElementalDamage())} (";
			string[] source2 = new string[3]
			{
				(hit.m_damage.m_fire > 0f) ? $"fire {round(hit.m_damage.m_fire)}" : "",
				(hit.m_damage.m_frost > 0f) ? $"frost {round(hit.m_damage.m_frost)}" : "",
				(hit.m_damage.m_lightning > 0f) ? $"lightning {round(hit.m_damage.m_lightning)}" : ""
			};
			text = text + string.Join(";", source2.Where([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (string x) => !string.IsNullOrEmpty(x))) + ")";
		}
		if (hit.m_damage.m_poison > 0f)
		{
			text += $"; poison {round(hit.m_damage.m_poison)}";
		}
		if (hit.m_damage.m_spirit > 0f)
		{
			text += $"; spirit {round(hit.m_damage.m_spirit)}";
		}
		if (hit.GetTotalBlockableDamage() > 0f)
		{
			text += $"; blockable amount {round(hit.GetTotalBlockableDamage())}";
		}
		return text;
		static double round(float number)
		{
			return Math.Round(number, 1);
		}
	}

	private static void SetInfusionFlamesSize(Character character)
	{
		//IL_0024: Unknown result type (might be due to invalid IL or missing references)
		//IL_0029: Unknown result type (might be due to invalid IL or missing references)
		//IL_0064: Unknown result type (might be due to invalid IL or missing references)
		//IL_0087: Unknown result type (might be due to invalid IL or missing references)
		//IL_008c: Unknown result type (might be due to invalid IL or missing references)
		//IL_008f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0094: Unknown result type (might be due to invalid IL or missing references)
		//IL_0098: Unknown result type (might be due to invalid IL or missing references)
		//IL_009f: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a7: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ae: Unknown result type (might be due to invalid IL or missing references)
		//IL_00b6: Unknown result type (might be due to invalid IL or missing references)
		//IL_00bd: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c5: Unknown result type (might be due to invalid IL or missing references)
		//IL_00cb: Unknown result type (might be due to invalid IL or missing references)
		//IL_00de: Unknown result type (might be due to invalid IL or missing references)
		//IL_00eb: Unknown result type (might be due to invalid IL or missing references)
		//IL_00fe: Unknown result type (might be due to invalid IL or missing references)
		//IL_010c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0111: Unknown result type (might be due to invalid IL or missing references)
		//IL_0116: Unknown result type (might be due to invalid IL or missing references)
		//IL_0125: Unknown result type (might be due to invalid IL or missing references)
		Transform val = ((Component)character).transform.Find("infusion flames");
		if (val != null)
		{
			Bounds bounds = ((Component)character).GetComponent<Collider>().bounds;
			Transform val2 = ((Component)character).transform.Find("Visual");
			Collider[] array = ((val2 != null) ? ((Component)val2).GetComponentsInChildren<Collider>() : null) ?? new Collider[0];
			foreach (Collider val3 in array)
			{
				bounds.Encapsulate(val3.bounds);
			}
			Transform transform = ((Component)character).transform;
			Vector3 size = bounds.size;
			Vector3 localScale = transform.localScale;
			size = new Vector3(size.x / localScale.x, size.y / localScale.y, size.z / localScale.z);
			val.localScale = new Vector3(size.x * 0.5f + 0.3f, size.y * 0.4f, size.z * 0.5f + 0.3f);
			Vector3 center = bounds.center;
			center.y = transform.position.y;
			val.position = center;
		}
	}

	public static void AttachInfusionFlames(Character character)
	{
		Transform val = ((Component)character).transform.Find("infusion flames");
		if (val != null)
		{
			Object.DestroyImmediate((Object)(object)((Component)val).gameObject);
		}
		if (infusionVisuals.TryGetValue(API.GetInfusionCreature(character), out var value))
		{
			GameObject val2 = Object.Instantiate<GameObject>(value, ((Component)character).transform);
			((Object)val2).name = "infusion flames";
			SetInfusionFlamesSize(character);
		}
	}

	private static void SetInfusionColors(GameObject visual, Color color)
	{
		//IL_0018: Unknown result type (might be due to invalid IL or missing references)
		//IL_001d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0020: Unknown result type (might be due to invalid IL or missing references)
		//IL_0021: Unknown result type (might be due to invalid IL or missing references)
		//IL_0050: Unknown result type (might be due to invalid IL or missing references)
		//IL_0055: Unknown result type (might be due to invalid IL or missing references)
		//IL_0058: Unknown result type (might be due to invalid IL or missing references)
		//IL_0059: Unknown result type (might be due to invalid IL or missing references)
		ParticleSystem component = ((Component)visual.transform.Find("Scaler/eff")).GetComponent<ParticleSystem>();
		MainModule main = component.main;
		main.startColor = MinMaxGradient.op_Implicit(color);
		main.simulationSpeed = 0.1f;
		component = ((Component)visual.transform.Find("Scaler/eff/Smoke")).GetComponent<ParticleSystem>();
		main = component.main;
		main.startColor = MinMaxGradient.op_Implicit(color);
		main.simulationSpeed = 0.1f;
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(2)]
	public static bool UpdateLevel(Character critter, int maxLevel)
	{
		if (critter == null)
		{
			return false;
		}
		int num = API.LevelRand(critter);
		if (maxLevel <= 1)
		{
			num -= noStarCreatureChanceShift.Value;
		}
		if (num > 1)
		{
			critter.SetLevel(num);
		}
		checkCreaturesAfterSpawn.Add(critter);
		return true;
	}

	private static IEnumerable<CodeInstruction> SpawnTranspiler(CodeInstruction SpawnDefinition, Type SpawnClass, IEnumerable<CodeInstruction> instructions, ILGenerator ilg)
	{
		//IL_0130: Unknown result type (might be due to invalid IL or missing references)
		//IL_013a: Expected Obj, but got Unknown
		//IL_023f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0249: Expected Obj, but got Unknown
		//IL_0256: Unknown result type (might be due to invalid IL or missing references)
		//IL_0260: Expected Obj, but got Unknown
		//IL_028f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0299: Expected Obj, but got Unknown
		int num = -1;
		FieldInfo fieldInfo = AccessTools.DeclaredField(SpawnClass, "m_maxLevel");
		FieldInfo fieldInfo2 = AccessTools.DeclaredField(SpawnClass, "m_minLevel");
		MethodInfo methodInfo = AccessTools.DeclaredMethod(typeof(Character), "SetLevel", (Type[])null, (Type[])null);
		MethodInfo methodInfo2 = AccessTools.DeclaredMethod(typeof(GameObject), "GetComponent", Array.Empty<Type>(), new Type[1] { typeof(Character) });
		List<CodeInstruction> list = new List<CodeInstruction>();
		List<CodeInstruction> list2 = new List<CodeInstruction>(instructions);
		for (int i = 0; i < list2.Count; i++)
		{
			CodeInstruction val = list2[i];
			if (num == -1 && i < list2.Count - 1 && list2[i + 1].opcode == OpCodes.Ldfld && CodeInstructionExtensions.OperandIs(list2[i + 1], (MemberInfo)fieldInfo2))
			{
				num = i;
			}
			else if (val.opcode == OpCodes.Ldc_I4_1 && i > 0 && list2[i - 1].opcode == OpCodes.Ldfld && CodeInstructionExtensions.OperandIs(list2[i - 1], (MemberInfo)fieldInfo))
			{
				list.Add(new CodeInstruction(OpCodes.Ldc_I4, (object)(-1)));
			}
			else if (num < 0)
			{
				list.Add(val);
			}
			else
			{
				if (!(val.opcode == OpCodes.Callvirt) || !CodeInstructionExtensions.OperandIs(val, (MemberInfo)methodInfo))
				{
					continue;
				}
				bool flag = false;
				List<Label> labels = list2[num].labels;
				for (int j = num; j < i; j++)
				{
					if (CodeInstructionExtensions.Calls(list2[j], methodInfo2))
					{
						list.Add(CodeInstructionExtensions.WithLabels(list2[j - 1].Clone(), (IEnumerable<Label>)labels));
						list.Add(list2[j]);
						flag = true;
					}
				}
				if (!flag)
				{
					list.Add(CodeInstructionExtensions.WithLabels(list2[i - 2].Clone(), (IEnumerable<Label>)labels));
				}
				labels.Clear();
				list.Add(SpawnDefinition);
				list.Add(new CodeInstruction(OpCodes.Ldfld, (object)fieldInfo));
				list.Add(new CodeInstruction(OpCodes.Call, (object)LevelUpdater));
				Label label = ilg.DefineLabel();
				list2[i + 1].labels.Add(label);
				list.Add(new CodeInstruction(OpCodes.Brtrue_S, (object)label));
				for (int k = num; k <= i; k++)
				{
					list.Add(list2[k]);
				}
				num = -2;
			}
		}
		return list;
	}

	private static IEnumerable<Character> ProcessNewlySpawnedCreatures()
	{
		float amount = default;
		MonsterAI newAI = default;
		Vector3 patrolPoint = default;
		foreach (Character c in checkCreaturesAfterSpawn.Where([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (Character val) => Object.op_Implicit((Object)(object)val)))
		{
			if (c.IsBoss())
			{
				PatchBossLevel.PatchSpawnedBoss_Impl(c);
				continue;
			}
			float? num = Utils.ReadWithWorldLevelAndStarsFromConfig(c, [return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 2 })] (CreatureConfig cfg) => cfg.spawnAmount);
			int num2;
			if (num.HasValue)
			{
				amount = num.GetValueOrDefault();
				num2 = 1;
			}
			else
			{
				num2 = 0;
			}
			if (num2 == 0)
			{
				continue;
			}
			int creaturesToSpawn = (int)(amount + Random.Range(0f, 1f));
			if (creaturesToSpawn == 0)
			{
				Object.Destroy((Object)(object)((Component)c).GetComponent<CharacterDrop>());
				ZNetScene.instance.Destroy(((Component)c).gameObject);
			}
			else
			{
				if (creaturesToSpawn <= 1)
				{
					continue;
				}
				GameObject creature = ZNetScene.instance.GetPrefab(((Component)c).GetComponent<ZNetView>().GetZDO().GetPrefab());
				int i = 1;
				while (i < creaturesToSpawn)
				{
					Quaternion rotation = Quaternion.Euler(0f, Random.Range(0f, 360f), 0f);
					Vector3 vector3 = Random.insideUnitSphere;
					GameObject spawnedCreature = Object.Instantiate<GameObject>(creature, ((Component)c).transform.localPosition + vector3, rotation);
					Vector3 insideUnitSphere = Random.insideUnitSphere;
					if (insideUnitSphere.y < 0f)
					{
						insideUnitSphere.y = 0f - insideUnitSphere.y;
					}
					MonsterAI originalAI = ((Component)c).GetComponent<MonsterAI>();
					int num3;
					if (originalAI != null)
					{
						newAI = spawnedCreature.GetComponent<MonsterAI>();
						num3 = ((newAI != null) ? 1 : 0);
					}
					else
					{
						num3 = 0;
					}
					if (num3 != 0)
					{
						if (originalAI.m_despawnInDay)
						{
							newAI.SetDespawnInDay(true);
						}
						if (originalAI.m_eventCreature)
						{
							newAI.SetEventCreature(true);
						}
					}
					Character newCharacter = spawnedCreature.GetComponent<Character>();
					newCharacter.SetLevel(c.GetLevel());
					spawnedCreature.GetComponent<Rigidbody>().AddForce(insideUnitSphere, (ForceMode)2);
					if (c.GetBaseAI().GetPatrolPoint(ref patrolPoint))
					{
						newCharacter.GetBaseAI().SetPatrolPoint(patrolPoint);
					}
					long alive_time = c.m_nview.GetZDO().GetLong("alive_time", -1L);
					if (alive_time >= 0)
					{
						newCharacter.m_nview.GetZDO().Set("alive_time", alive_time);
					}
					ZDOID spawn_id = c.m_nview.GetZDO().GetZDOID("spawn_id");
					if (spawn_id != ZDOID.None)
					{
						newCharacter.m_nview.GetZDO().Set("spawn_id", spawn_id);
					}
					yield return newCharacter;
					newAI = null;
					int num4 = i + 1;
					i = num4;
				}
			}
		}
		checkCreaturesAfterSpawn.Clear();
	}

	static CreatureLevelControl()
	{
		//IL_0785: Unknown result type (might be due to invalid IL or missing references)
		//IL_07a6: Unknown result type (might be due to invalid IL or missing references)
		//IL_07c7: Unknown result type (might be due to invalid IL or missing references)
		//IL_07e8: Unknown result type (might be due to invalid IL or missing references)
		//IL_0809: Unknown result type (might be due to invalid IL or missing references)
	}
}
