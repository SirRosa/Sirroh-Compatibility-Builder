using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BepInEx;
using BepInEx.Bootstrap;
using BepInEx.Configuration;
using HarmonyLib;
using Jotunn.Configs;
using Jotunn.Entities;
using Jotunn.Managers;
using Jotunn.Utils;
using UnityEngine;

namespace ForsakenPowerOverhaul;

[BepInPlugin("JuneGame.Valheim.ForsakenPowerOverhaul", "Forsaken Power Overhaul", "2.2.0")]
[BepInDependency(/*Could not decode attribute arguments.*/)]
[NetworkCompatibility(/*Could not decode attribute arguments.*/)]
internal class ForsakenPowerOverhaul : BaseUnityPlugin
{
	private class BossStone_FPO : MonoBehaviour
	{
		public void Update_BossStones()
		{
			GlobalKeys_Update(((Component)this).GetComponent<BossStone>());
			PlayerKeys_Update();
			Update_Passive_Stats();
			Update_Active_Stats();
			if ((Object)(object)Player.m_localPlayer != (Object)null)
			{
				Power_Unlock_Spawn(Player.m_localPlayer);
			}
		}
	}

	[HarmonyPatch(typeof(BossStone), "Start")]
	private class Patch_BossStone_Start
	{
		private static void Postfix(ref BossStone __instance)
		{
			if ((Object)(object)__instance != (Object)null)
			{
				if (!Object.op_Implicit((Object)(object)((Component)__instance).GetComponent<BossStone_FPO>()))
				{
					((Component)__instance).gameObject.AddComponent<BossStone_FPO>();
				}
				((MonoBehaviour)((Component)__instance).GetComponent<BossStone_FPO>()).Invoke("Update_BossStones", 1f);
			}
		}
	}

	[HarmonyPatch(typeof(BossStone), "DelayedAttachEffects_Step3")]
	private class Patch_BossStone_DelayedAttachEffects_Step3
	{
		private static void Postfix(ref BossStone __instance)
		{
			if ((Object)(object)__instance != (Object)null)
			{
				GlobalKeys_Update(__instance);
				PlayerKeys_Update();
				Update_Passive_Stats();
				Update_Active_Stats();
				Power_Unlock(__instance);
			}
		}
	}

	[HarmonyPatch(typeof(ItemStand), "GetHoverText")]
	private class Patch_Item_Stand_GetHoverText
	{
		private static void Postfix(ref ItemStand __instance, ref string __result)
		{
			if (!((Object)(object)__instance != (Object)null) || !__instance.HaveAttachment() || __instance.m_canBeRemoved)
			{
				return;
			}
			if ((Object)(object)__instance.m_guardianPower != (Object)null && (Object)(object)ZoneSystem.instance != (Object)null && ZoneSystem.instance.GetGlobalKey(__instance.m_guardianPower.m_name.Replace("$se_", "GK_FPO_BossStone_").Replace("_name", "")))
			{
				__result = GetLocalization(GetBossStoneHoverText(GetBossName(__instance.m_currentItemName), New_Bool: true));
				if (!ConfigEntry_PowerCycle_Bool.Value && !__instance.IsGuardianPowerActive((Humanoid)(object)Player.m_localPlayer))
				{
					__result += GetLocalization("[<color=yellow><b>$KEY_Use</b></color>] $guardianstone_hook_activate");
				}
			}
			else
			{
				__result = "";
			}
		}
	}

	[HarmonyPatch(typeof(ItemStand), "IsGuardianPowerActive")]
	private class Patch_ItemStand_IsGuardianPowerActive
	{
		private static void Postfix(ref ItemStand __instance, ref bool __result)
		{
			if ((Object)(object)__instance != (Object)null && ConfigEntry_PowerCycle_Bool.Value)
			{
				__result = true;
			}
		}
	}

	[HarmonyPatch(typeof(Player), "OnSpawned", new Type[] { typeof(bool) })]
	private class Patch_Player_OnSpawned
	{
		private static void Postfix(ref Player __instance)
		{
			if ((Object)(object)__instance != (Object)null)
			{
				Config_SettingRead();
				PlayerKeys_Update();
				Update_Passive_Stats();
				Update_Active_Stats();
				Update_Equipped_Stats();
				Power_Lock(__instance);
				Power_Unlock_Spawn(__instance);
			}
		}
	}

	[HarmonyPatch(typeof(Player), "ActivateGuardianPower")]
	private class Patch_Player_ActivateGuardianPower
	{
		private static bool Prefix(ref Player __instance, ref bool __result)
		{
			if ((Object)(object)__instance != (Object)null)
			{
				if (__instance.m_guardianPowerCooldown > 0f || (Object)(object)__instance.m_guardianSE == (Object)null)
				{
					__result = false;
					return false;
				}
				string bossName = GetBossName(__instance.GetGuardianPowerName());
				string text = "SE_FPO_" + bossName;
				int hash = GetHash(text);
				if (Object.op_Implicit((Object)(object)((Character)__instance).m_seman.GetStatusEffect(hash)))
				{
					((Character)__instance).m_seman.RemoveStatusEffect(hash, false);
				}
				((Character)__instance).m_seman.AddStatusEffect(hash, true, 0, 0f, (short)(-1));
				__instance.m_guardianPowerCooldown = ConfigEntry_General_GuardianPower_CooldownDuration.Value;
				if (__instance.m_adrenalineGuardianPower > 0f)
				{
					((Character)__instance).AddAdrenaline(__instance.m_adrenalineGuardianPower);
				}
				foreach (StatusEffect statusEffect in ((Character)__instance).m_seman.GetStatusEffects())
				{
					if (((Object)statusEffect).name.StartsWith("SE_FPO_") && ((Object)statusEffect).name != "SE_FPO_Passive" && ((Object)statusEffect).name != text)
					{
						((Character)__instance).m_seman.RemoveStatusEffect(statusEffect, false);
						break;
					}
				}
				__result = true;
			}
			return false;
		}
	}

	[HarmonyPatch(typeof(Player), "SetMaxHealth", new Type[]
	{
		typeof(float),
		typeof(bool)
	})]
	private class Patch_Player_SetMaxHealth
	{
		private static bool Prefix(ref Player __instance, ref float health)
		{
			if ((Object)(object)__instance != (Object)null)
			{
				float num = 0f;
				num += Update_Player_BaseStats("MaxHealth", __instance);
				health += num;
			}
			return true;
		}
	}

	[HarmonyPatch(typeof(Player), "UpdateFood")]
	private class Patch_Player_UpdateFood
	{
		private static void Postfix(ref Player __instance)
		{
			if ((Object)(object)__instance != (Object)null && __instance.m_foodRegenTimer == 0f)
			{
				float num = 0f;
				num += Update_Player_BaseStats("HealthRegen", __instance);
				float num2 = 1f;
				((Character)__instance).m_seman.ModifyHealthRegen(ref num2);
				((Character)__instance).Heal(num * num2, true);
			}
		}
	}

	[HarmonyPatch(typeof(Player), "SetMaxStamina", new Type[]
	{
		typeof(float),
		typeof(bool)
	})]
	private class Patch_Player_SetMaxStamina
	{
		private static bool Prefix(ref Player __instance, ref float stamina)
		{
			if ((Object)(object)__instance != (Object)null)
			{
				float num = 0f;
				num += Update_Player_BaseStats("MaxStamina", __instance);
				stamina += num;
			}
			return true;
		}
	}

	[HarmonyPatch(typeof(Player), "SetMaxEitr", new Type[]
	{
		typeof(float),
		typeof(bool)
	})]
	private class Patch_Player_SetMaxEitr
	{
		private static bool Prefix(ref Player __instance, ref float eitr)
		{
			if ((Object)(object)__instance != (Object)null)
			{
				float num = 0f;
				num += Update_Player_BaseStats("MaxEitr", __instance);
				eitr += num;
			}
			return true;
		}
	}

	[HarmonyPatch(typeof(Player), "GetEquipmentMovementModifier")]
	private class Patch_Player_GetEquipmentMovementModifier
	{
		private static void Postfix(ref Player __instance, ref float __result)
		{
			if (!((Object)(object)__instance != (Object)null))
			{
				return;
			}
			float num = 0f;
			num += Update_Player_BaseStats("EquipmentSpeedModifier", __instance);
			if (num != 0f)
			{
				num = ((num < -1f) ? (-1f) : num);
				num = 1f + num;
				__instance.m_equipmentModifierValues[0] = 0f;
				if (((Humanoid)__instance).m_rightItem != null)
				{
					__instance.m_equipmentModifierValues[0] += ((((Humanoid)__instance).m_rightItem.m_shared.m_movementModifier < 0f) ? (((Humanoid)__instance).m_rightItem.m_shared.m_movementModifier * num) : ((Humanoid)__instance).m_rightItem.m_shared.m_movementModifier);
				}
				if (((Humanoid)__instance).m_leftItem != null)
				{
					__instance.m_equipmentModifierValues[0] += ((((Humanoid)__instance).m_leftItem.m_shared.m_movementModifier < 0f) ? (((Humanoid)__instance).m_leftItem.m_shared.m_movementModifier * num) : ((Humanoid)__instance).m_leftItem.m_shared.m_movementModifier);
				}
				if (((Humanoid)__instance).m_chestItem != null)
				{
					__instance.m_equipmentModifierValues[0] += ((((Humanoid)__instance).m_chestItem.m_shared.m_movementModifier < 0f) ? (((Humanoid)__instance).m_chestItem.m_shared.m_movementModifier * num) : ((Humanoid)__instance).m_chestItem.m_shared.m_movementModifier);
				}
				if (((Humanoid)__instance).m_legItem != null)
				{
					__instance.m_equipmentModifierValues[0] += ((((Humanoid)__instance).m_legItem.m_shared.m_movementModifier < 0f) ? (((Humanoid)__instance).m_legItem.m_shared.m_movementModifier * num) : ((Humanoid)__instance).m_legItem.m_shared.m_movementModifier);
				}
				if (((Humanoid)__instance).m_helmetItem != null)
				{
					__instance.m_equipmentModifierValues[0] += ((((Humanoid)__instance).m_helmetItem.m_shared.m_movementModifier < 0f) ? (((Humanoid)__instance).m_helmetItem.m_shared.m_movementModifier * num) : ((Humanoid)__instance).m_helmetItem.m_shared.m_movementModifier);
				}
				if (((Humanoid)__instance).m_shoulderItem != null)
				{
					__instance.m_equipmentModifierValues[0] += ((((Humanoid)__instance).m_shoulderItem.m_shared.m_movementModifier < 0f) ? (((Humanoid)__instance).m_shoulderItem.m_shared.m_movementModifier * num) : ((Humanoid)__instance).m_shoulderItem.m_shared.m_movementModifier);
				}
				if (((Humanoid)__instance).m_utilityItem != null)
				{
					__instance.m_equipmentModifierValues[0] += ((((Humanoid)__instance).m_utilityItem.m_shared.m_movementModifier < 0f) ? (((Humanoid)__instance).m_utilityItem.m_shared.m_movementModifier * num) : ((Humanoid)__instance).m_utilityItem.m_shared.m_movementModifier);
				}
				if (((Humanoid)__instance).m_trinketItem != null)
				{
					__instance.m_equipmentModifierValues[0] += ((((Humanoid)__instance).m_trinketItem.m_shared.m_movementModifier < 0f) ? (((Humanoid)__instance).m_trinketItem.m_shared.m_movementModifier * num) : ((Humanoid)__instance).m_trinketItem.m_shared.m_movementModifier);
				}
			}
			__result = __instance.m_equipmentModifierValues[0];
		}
	}

	[HarmonyPatch(typeof(Player), "GetEquipmentHeatResistanceModifier")]
	private class Patch_Player_GetEquipmentHeatResistanceModifier
	{
		private static void Postfix(ref Player __instance, ref float __result)
		{
			if ((Object)(object)__instance != (Object)null)
			{
				float num = 0f;
				num += Update_Player_BaseStats("HeatDamageModifier", __instance);
				__instance.m_equipmentModifierValues[2] -= num;
				__instance.m_equipmentModifierValues[2] = ((__instance.m_equipmentModifierValues[2] > 1f) ? 1f : __instance.m_equipmentModifierValues[2]);
				__result = __instance.m_equipmentModifierValues[2];
			}
		}
	}

	[HarmonyPatch(typeof(SEMan), "HaveStatusAttribute")]
	private class Patch_SEMan_HaveStatusAttribute
	{
		private static void Postfix(ref SEMan __instance, ref StatusAttribute value, ref bool __result)
		{
			if (__instance == null)
			{
				return;
			}
			bool flag = __result;
			foreach (StatusEffect statusEffect in __instance.GetStatusEffects())
			{
				if (((Object)statusEffect).name.StartsWith("SE_FPO_") && ((StatusEffect_FPO)(object)statusEffect).HaveAttribute(value))
				{
					flag = true;
				}
			}
			__result = flag;
		}
	}

	[HarmonyPatch(typeof(Ship), "GetSailForce")]
	private class Patch_Ship_SailForce
	{
		private static void Postfix(ref Ship __instance, ref Vector3 __result)
		{
			//IL_0059: Unknown result type (might be due to invalid IL or missing references)
			//IL_0065: Unknown result type (might be due to invalid IL or missing references)
			//IL_006a: Unknown result type (might be due to invalid IL or missing references)
			if (!((Object)(object)__instance != (Object)null) || !__instance.IsWindControllActive())
			{
				return;
			}
			float num = 0f;
			foreach (Player player in __instance.m_players)
			{
				num += Update_Player_BaseStats("WindSpeedModifier", player);
			}
			__result *= 1f + num;
		}
	}

	[HarmonyPatch(typeof(TextsDialog), "AddActiveEffects")]
	private class Patch_TextsDialog_AddActiveEffects
	{
		private static void Postfix(ref TextsDialog __instance)
		{
			//IL_022c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0236: Expected Obj, but got Unknown
			//IL_024e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0258: Expected Obj, but got Unknown
			if (!((Object)(object)__instance != (Object)null))
			{
				return;
			}
			StringBuilder stringBuilder = new StringBuilder(256);
			StringBuilder stringBuilder2 = new StringBuilder(256);
			List<StatusEffect> list = new List<StatusEffect>();
			((Character)Player.m_localPlayer).GetSEMan().GetHUDStatusEffects(list);
			foreach (StatusEffect item in list)
			{
				if (((Object)item).name.StartsWith("SE_FPO_") && !((Object)item).name.Contains("_Equipped") && !((Object)item).name.Contains("_Passive"))
				{
					stringBuilder.Append(GetToolTipFormat(item));
				}
			}
			foreach (StatusEffect item2 in list)
			{
				if (((Object)item2).name.StartsWith("SE_FPO_") && ((Object)item2).name.Contains("_Equipped"))
				{
					stringBuilder.Append(GetToolTipFormat(item2));
				}
			}
			foreach (StatusEffect item3 in list)
			{
				if (((Object)item3).name.StartsWith("SE_FPO_") && ((Object)item3).name.Contains("_Passive"))
				{
					stringBuilder.Append(GetToolTipFormat(item3));
				}
			}
			foreach (StatusEffect item4 in list)
			{
				if (!((Object)item4).name.StartsWith("SE_FPO_"))
				{
					stringBuilder.Append(GetToolTipFormat(item4));
				}
			}
			foreach (string item5 in GlobalKeys_Sort())
			{
				string bossName = GetBossName(item5);
				if (bossName != "")
				{
					stringBuilder2.Append(GetBossStoneHoverText(bossName, New_Bool: false));
				}
			}
			__instance.m_texts.RemoveAt(0);
			__instance.m_texts.Insert(0, new TextInfo(GetLocalization("$inventory_activeeffects"), GetLocalization(stringBuilder)));
			__instance.m_texts.Insert(1, new TextInfo(GetLocalization("$ui_fpo"), GetLocalization(stringBuilder2)));
		}
	}

	private class StatusEffect_FPO : SE_Stats
	{
		public float m_MaxHealth;

		public float m_HealthRegen;

		public float m_MaxStamina;

		public float m_MaxEitr;

		public float m_EquipmentSpeedModifier;

		public List<StatusAttribute> m_StatusAttributes = new List<StatusAttribute>();

		public float m_WindSpeedModifier;

		public List<SkillType> m_OutgoingDamageTypes = new List<SkillType>();

		public List<float> m_OutgoingDamageModifiers = new List<float>();

		public float m_HeatDamageModifier;

		public bool HaveAttribute(StatusAttribute New_StatusAttributeA)
		{
			//IL_0012: Unknown result type (might be due to invalid IL or missing references)
			//IL_0017: Unknown result type (might be due to invalid IL or missing references)
			//IL_0018: Unknown result type (might be due to invalid IL or missing references)
			//IL_0019: Unknown result type (might be due to invalid IL or missing references)
			bool result = false;
			foreach (StatusAttribute statusAttribute in m_StatusAttributes)
			{
				if (New_StatusAttributeA == statusAttribute)
				{
					result = true;
				}
			}
			return result;
		}

		public override void ModifyAttack(SkillType New_SkillTypeA, ref HitData New_HitData)
		{
			//IL_0010: Unknown result type (might be due to invalid IL or missing references)
			//IL_0015: Unknown result type (might be due to invalid IL or missing references)
			//IL_0016: Unknown result type (might be due to invalid IL or missing references)
			//IL_0017: Unknown result type (might be due to invalid IL or missing references)
			//IL_003a: Unknown result type (might be due to invalid IL or missing references)
			//IL_001a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0020: Invalid comparison between Unknown and I4
			foreach (SkillType outgoingDamageType in m_OutgoingDamageTypes)
			{
				if (outgoingDamageType == New_SkillTypeA || (int)outgoingDamageType == 999)
				{
					New_HitData.m_damage.Modify(1f + m_OutgoingDamageModifiers[m_OutgoingDamageTypes.IndexOf(outgoingDamageType)]);
				}
			}
		}

		public override string GetTooltipString()
		{
			StringBuilder stringBuilder = new StringBuilder(256);
			stringBuilder.Append(GetTooltipStats(this));
			return stringBuilder.ToString();
		}
	}

	private static ButtonConfig ButtonConfig_PowerCycle;

	private static ConfigEntry<KeyCode> ConfigEntry_Button_PowerCycle;

	private static ConfigEntry<string> ConfigEntry_General_Preset;

	private static ConfigEntry<int> ConfigEntry_General_GuardianPower_ActiveDuration;

	private static ConfigEntry<int> ConfigEntry_General_GuardianPower_CooldownDuration;

	private static ConfigEntry<bool> ConfigEntry_PowerCycle_Bool;

	private static ConfigEntry<int> ConfigEntry_Eikthyr_Passive_MaxHealth;

	private static ConfigEntry<int> ConfigEntry_Eikthyr_Passive_HealthRegen;

	private static ConfigEntry<float> ConfigEntry_Eikthyr_Passive_HealthRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Eikthyr_Passive_MaxStamina;

	private static ConfigEntry<float> ConfigEntry_Eikthyr_Passive_StaminaRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Eikthyr_Passive_MaxEitr;

	private static ConfigEntry<float> ConfigEntry_Eikthyr_Passive_EitrRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Eikthyr_Passive_MaxWeight;

	private static ConfigEntry<float> ConfigEntry_Eikthyr_Passive_MoveSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Eikthyr_Passive_JumpForceModifier;

	private static ConfigEntry<float> ConfigEntry_Eikthyr_Passive_MaxFallSpeed;

	private static ConfigEntry<float> ConfigEntry_Eikthyr_Passive_EquipmentSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Eikthyr_Passive_WindSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Eikthyr_Passive_RunStaminaCostModifier;

	private static ConfigEntry<float> ConfigEntry_Eikthyr_Passive_JumpStaminaCostModifier;

	private static ConfigEntry<float> ConfigEntry_Eikthyr_Passive_StealthModifier;

	private static ConfigEntry<float> ConfigEntry_Eikthyr_Passive_NoiseModifier;

	private static ConfigEntry<string> ConfigEntry_Eikthyr_Passive_StatusAttributes;

	private static ConfigEntry<string> ConfigEntry_Eikthyr_Passive_OutgoingDamageTypes;

	private static ConfigEntry<string> ConfigEntry_Eikthyr_Passive_OutgoingDamageModifiers;

	private static ConfigEntry<float> ConfigEntry_Eikthyr_Passive_FallDamageModifier;

	private static ConfigEntry<string> ConfigEntry_Eikthyr_Passive_IncomingDamageTypes;

	private static ConfigEntry<string> ConfigEntry_Eikthyr_Passive_IncomingDamageModifiers;

	private static ConfigEntry<float> ConfigEntry_Eikthyr_Passive_HeatDamageModifier;

	private static ConfigEntry<int> ConfigEntry_Eikthyr_Active_MaxHealth;

	private static ConfigEntry<int> ConfigEntry_Eikthyr_Active_HealthRegen;

	private static ConfigEntry<float> ConfigEntry_Eikthyr_Active_HealthRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Eikthyr_Active_MaxStamina;

	private static ConfigEntry<float> ConfigEntry_Eikthyr_Active_StaminaRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Eikthyr_Active_MaxEitr;

	private static ConfigEntry<float> ConfigEntry_Eikthyr_Active_EitrRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Eikthyr_Active_MaxWeight;

	private static ConfigEntry<float> ConfigEntry_Eikthyr_Active_MoveSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Eikthyr_Active_JumpForceModifier;

	private static ConfigEntry<float> ConfigEntry_Eikthyr_Active_MaxFallSpeed;

	private static ConfigEntry<float> ConfigEntry_Eikthyr_Active_EquipmentSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Eikthyr_Active_WindSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Eikthyr_Active_RunStaminaCostModifier;

	private static ConfigEntry<float> ConfigEntry_Eikthyr_Active_JumpStaminaCostModifier;

	private static ConfigEntry<float> ConfigEntry_Eikthyr_Active_StealthModifier;

	private static ConfigEntry<float> ConfigEntry_Eikthyr_Active_NoiseModifier;

	private static ConfigEntry<string> ConfigEntry_Eikthyr_Active_StatusAttributes;

	private static ConfigEntry<string> ConfigEntry_Eikthyr_Active_OutgoingDamageTypes;

	private static ConfigEntry<string> ConfigEntry_Eikthyr_Active_OutgoingDamageModifiers;

	private static ConfigEntry<float> ConfigEntry_Eikthyr_Active_FallDamageModifier;

	private static ConfigEntry<string> ConfigEntry_Eikthyr_Active_IncomingDamageTypes;

	private static ConfigEntry<string> ConfigEntry_Eikthyr_Active_IncomingDamageModifiers;

	private static ConfigEntry<float> ConfigEntry_Eikthyr_Active_HeatDamageModifier;

	private static ConfigEntry<int> ConfigEntry_Eikthyr_Shared_MaxHealth;

	private static ConfigEntry<int> ConfigEntry_Eikthyr_Shared_HealthRegen;

	private static ConfigEntry<float> ConfigEntry_Eikthyr_Shared_HealthRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Eikthyr_Shared_MaxStamina;

	private static ConfigEntry<float> ConfigEntry_Eikthyr_Shared_StaminaRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Eikthyr_Shared_MaxEitr;

	private static ConfigEntry<float> ConfigEntry_Eikthyr_Shared_EitrRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Eikthyr_Shared_MaxWeight;

	private static ConfigEntry<float> ConfigEntry_Eikthyr_Shared_MoveSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Eikthyr_Shared_JumpForceModifier;

	private static ConfigEntry<float> ConfigEntry_Eikthyr_Shared_MaxFallSpeed;

	private static ConfigEntry<float> ConfigEntry_Eikthyr_Shared_EquipmentSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Eikthyr_Shared_WindSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Eikthyr_Shared_RunStaminaCostModifier;

	private static ConfigEntry<float> ConfigEntry_Eikthyr_Shared_JumpStaminaCostModifier;

	private static ConfigEntry<float> ConfigEntry_Eikthyr_Shared_StealthModifier;

	private static ConfigEntry<float> ConfigEntry_Eikthyr_Shared_NoiseModifier;

	private static ConfigEntry<string> ConfigEntry_Eikthyr_Shared_StatusAttributes;

	private static ConfigEntry<string> ConfigEntry_Eikthyr_Shared_OutgoingDamageTypes;

	private static ConfigEntry<string> ConfigEntry_Eikthyr_Shared_OutgoingDamageModifiers;

	private static ConfigEntry<float> ConfigEntry_Eikthyr_Shared_FallDamageModifier;

	private static ConfigEntry<string> ConfigEntry_Eikthyr_Shared_IncomingDamageTypes;

	private static ConfigEntry<string> ConfigEntry_Eikthyr_Shared_IncomingDamageModifiers;

	private static ConfigEntry<float> ConfigEntry_Eikthyr_Shared_HeatDamageModifier;

	private static ConfigEntry<int> ConfigEntry_Eikthyr_Equipped_MaxHealth;

	private static ConfigEntry<int> ConfigEntry_Eikthyr_Equipped_HealthRegen;

	private static ConfigEntry<float> ConfigEntry_Eikthyr_Equipped_HealthRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Eikthyr_Equipped_MaxStamina;

	private static ConfigEntry<float> ConfigEntry_Eikthyr_Equipped_StaminaRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Eikthyr_Equipped_MaxEitr;

	private static ConfigEntry<float> ConfigEntry_Eikthyr_Equipped_EitrRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Eikthyr_Equipped_MaxWeight;

	private static ConfigEntry<float> ConfigEntry_Eikthyr_Equipped_MoveSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Eikthyr_Equipped_JumpForceModifier;

	private static ConfigEntry<float> ConfigEntry_Eikthyr_Equipped_MaxFallSpeed;

	private static ConfigEntry<float> ConfigEntry_Eikthyr_Equipped_EquipmentSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Eikthyr_Equipped_WindSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Eikthyr_Equipped_RunStaminaCostModifier;

	private static ConfigEntry<float> ConfigEntry_Eikthyr_Equipped_JumpStaminaCostModifier;

	private static ConfigEntry<float> ConfigEntry_Eikthyr_Equipped_StealthModifier;

	private static ConfigEntry<float> ConfigEntry_Eikthyr_Equipped_NoiseModifier;

	private static ConfigEntry<string> ConfigEntry_Eikthyr_Equipped_StatusAttributes;

	private static ConfigEntry<string> ConfigEntry_Eikthyr_Equipped_OutgoingDamageTypes;

	private static ConfigEntry<string> ConfigEntry_Eikthyr_Equipped_OutgoingDamageModifiers;

	private static ConfigEntry<float> ConfigEntry_Eikthyr_Equipped_FallDamageModifier;

	private static ConfigEntry<string> ConfigEntry_Eikthyr_Equipped_IncomingDamageTypes;

	private static ConfigEntry<string> ConfigEntry_Eikthyr_Equipped_IncomingDamageModifiers;

	private static ConfigEntry<float> ConfigEntry_Eikthyr_Equipped_HeatDamageModifier;

	private static ConfigEntry<int> ConfigEntry_TheElder_Passive_MaxHealth;

	private static ConfigEntry<int> ConfigEntry_TheElder_Passive_HealthRegen;

	private static ConfigEntry<float> ConfigEntry_TheElder_Passive_HealthRegenModifier;

	private static ConfigEntry<int> ConfigEntry_TheElder_Passive_MaxStamina;

	private static ConfigEntry<float> ConfigEntry_TheElder_Passive_StaminaRegenModifier;

	private static ConfigEntry<int> ConfigEntry_TheElder_Passive_MaxEitr;

	private static ConfigEntry<float> ConfigEntry_TheElder_Passive_EitrRegenModifier;

	private static ConfigEntry<int> ConfigEntry_TheElder_Passive_MaxWeight;

	private static ConfigEntry<float> ConfigEntry_TheElder_Passive_MoveSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_TheElder_Passive_JumpForceModifier;

	private static ConfigEntry<float> ConfigEntry_TheElder_Passive_MaxFallSpeed;

	private static ConfigEntry<float> ConfigEntry_TheElder_Passive_EquipmentSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_TheElder_Passive_WindSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_TheElder_Passive_RunStaminaCostModifier;

	private static ConfigEntry<float> ConfigEntry_TheElder_Passive_JumpStaminaCostModifier;

	private static ConfigEntry<float> ConfigEntry_TheElder_Passive_StealthModifier;

	private static ConfigEntry<float> ConfigEntry_TheElder_Passive_NoiseModifier;

	private static ConfigEntry<string> ConfigEntry_TheElder_Passive_StatusAttributes;

	private static ConfigEntry<string> ConfigEntry_TheElder_Passive_OutgoingDamageTypes;

	private static ConfigEntry<string> ConfigEntry_TheElder_Passive_OutgoingDamageModifiers;

	private static ConfigEntry<float> ConfigEntry_TheElder_Passive_FallDamageModifier;

	private static ConfigEntry<string> ConfigEntry_TheElder_Passive_IncomingDamageTypes;

	private static ConfigEntry<string> ConfigEntry_TheElder_Passive_IncomingDamageModifiers;

	private static ConfigEntry<float> ConfigEntry_TheElder_Passive_HeatDamageModifier;

	private static ConfigEntry<int> ConfigEntry_TheElder_Active_MaxHealth;

	private static ConfigEntry<int> ConfigEntry_TheElder_Active_HealthRegen;

	private static ConfigEntry<float> ConfigEntry_TheElder_Active_HealthRegenModifier;

	private static ConfigEntry<int> ConfigEntry_TheElder_Active_MaxStamina;

	private static ConfigEntry<float> ConfigEntry_TheElder_Active_StaminaRegenModifier;

	private static ConfigEntry<int> ConfigEntry_TheElder_Active_MaxEitr;

	private static ConfigEntry<float> ConfigEntry_TheElder_Active_EitrRegenModifier;

	private static ConfigEntry<int> ConfigEntry_TheElder_Active_MaxWeight;

	private static ConfigEntry<float> ConfigEntry_TheElder_Active_MoveSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_TheElder_Active_JumpForceModifier;

	private static ConfigEntry<float> ConfigEntry_TheElder_Active_MaxFallSpeed;

	private static ConfigEntry<float> ConfigEntry_TheElder_Active_EquipmentSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_TheElder_Active_WindSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_TheElder_Active_RunStaminaCostModifier;

	private static ConfigEntry<float> ConfigEntry_TheElder_Active_JumpStaminaCostModifier;

	private static ConfigEntry<float> ConfigEntry_TheElder_Active_StealthModifier;

	private static ConfigEntry<float> ConfigEntry_TheElder_Active_NoiseModifier;

	private static ConfigEntry<string> ConfigEntry_TheElder_Active_StatusAttributes;

	private static ConfigEntry<string> ConfigEntry_TheElder_Active_OutgoingDamageTypes;

	private static ConfigEntry<string> ConfigEntry_TheElder_Active_OutgoingDamageModifiers;

	private static ConfigEntry<float> ConfigEntry_TheElder_Active_FallDamageModifier;

	private static ConfigEntry<string> ConfigEntry_TheElder_Active_IncomingDamageTypes;

	private static ConfigEntry<string> ConfigEntry_TheElder_Active_IncomingDamageModifiers;

	private static ConfigEntry<float> ConfigEntry_TheElder_Active_HeatDamageModifier;

	private static ConfigEntry<int> ConfigEntry_TheElder_Shared_MaxHealth;

	private static ConfigEntry<int> ConfigEntry_TheElder_Shared_HealthRegen;

	private static ConfigEntry<float> ConfigEntry_TheElder_Shared_HealthRegenModifier;

	private static ConfigEntry<int> ConfigEntry_TheElder_Shared_MaxStamina;

	private static ConfigEntry<float> ConfigEntry_TheElder_Shared_StaminaRegenModifier;

	private static ConfigEntry<int> ConfigEntry_TheElder_Shared_MaxEitr;

	private static ConfigEntry<float> ConfigEntry_TheElder_Shared_EitrRegenModifier;

	private static ConfigEntry<int> ConfigEntry_TheElder_Shared_MaxWeight;

	private static ConfigEntry<float> ConfigEntry_TheElder_Shared_MoveSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_TheElder_Shared_JumpForceModifier;

	private static ConfigEntry<float> ConfigEntry_TheElder_Shared_MaxFallSpeed;

	private static ConfigEntry<float> ConfigEntry_TheElder_Shared_EquipmentSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_TheElder_Shared_WindSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_TheElder_Shared_RunStaminaCostModifier;

	private static ConfigEntry<float> ConfigEntry_TheElder_Shared_JumpStaminaCostModifier;

	private static ConfigEntry<float> ConfigEntry_TheElder_Shared_StealthModifier;

	private static ConfigEntry<float> ConfigEntry_TheElder_Shared_NoiseModifier;

	private static ConfigEntry<string> ConfigEntry_TheElder_Shared_StatusAttributes;

	private static ConfigEntry<string> ConfigEntry_TheElder_Shared_OutgoingDamageTypes;

	private static ConfigEntry<string> ConfigEntry_TheElder_Shared_OutgoingDamageModifiers;

	private static ConfigEntry<float> ConfigEntry_TheElder_Shared_FallDamageModifier;

	private static ConfigEntry<string> ConfigEntry_TheElder_Shared_IncomingDamageTypes;

	private static ConfigEntry<string> ConfigEntry_TheElder_Shared_IncomingDamageModifiers;

	private static ConfigEntry<float> ConfigEntry_TheElder_Shared_HeatDamageModifier;

	private static ConfigEntry<int> ConfigEntry_TheElder_Equipped_MaxHealth;

	private static ConfigEntry<int> ConfigEntry_TheElder_Equipped_HealthRegen;

	private static ConfigEntry<float> ConfigEntry_TheElder_Equipped_HealthRegenModifier;

	private static ConfigEntry<int> ConfigEntry_TheElder_Equipped_MaxStamina;

	private static ConfigEntry<float> ConfigEntry_TheElder_Equipped_StaminaRegenModifier;

	private static ConfigEntry<int> ConfigEntry_TheElder_Equipped_MaxEitr;

	private static ConfigEntry<float> ConfigEntry_TheElder_Equipped_EitrRegenModifier;

	private static ConfigEntry<int> ConfigEntry_TheElder_Equipped_MaxWeight;

	private static ConfigEntry<float> ConfigEntry_TheElder_Equipped_MoveSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_TheElder_Equipped_JumpForceModifier;

	private static ConfigEntry<float> ConfigEntry_TheElder_Equipped_MaxFallSpeed;

	private static ConfigEntry<float> ConfigEntry_TheElder_Equipped_EquipmentSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_TheElder_Equipped_WindSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_TheElder_Equipped_RunStaminaCostModifier;

	private static ConfigEntry<float> ConfigEntry_TheElder_Equipped_JumpStaminaCostModifier;

	private static ConfigEntry<float> ConfigEntry_TheElder_Equipped_StealthModifier;

	private static ConfigEntry<float> ConfigEntry_TheElder_Equipped_NoiseModifier;

	private static ConfigEntry<string> ConfigEntry_TheElder_Equipped_StatusAttributes;

	private static ConfigEntry<string> ConfigEntry_TheElder_Equipped_OutgoingDamageTypes;

	private static ConfigEntry<string> ConfigEntry_TheElder_Equipped_OutgoingDamageModifiers;

	private static ConfigEntry<float> ConfigEntry_TheElder_Equipped_FallDamageModifier;

	private static ConfigEntry<string> ConfigEntry_TheElder_Equipped_IncomingDamageTypes;

	private static ConfigEntry<string> ConfigEntry_TheElder_Equipped_IncomingDamageModifiers;

	private static ConfigEntry<float> ConfigEntry_TheElder_Equipped_HeatDamageModifier;

	private static ConfigEntry<int> ConfigEntry_Bonemass_Passive_MaxHealth;

	private static ConfigEntry<int> ConfigEntry_Bonemass_Passive_HealthRegen;

	private static ConfigEntry<float> ConfigEntry_Bonemass_Passive_HealthRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Bonemass_Passive_MaxStamina;

	private static ConfigEntry<float> ConfigEntry_Bonemass_Passive_StaminaRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Bonemass_Passive_MaxEitr;

	private static ConfigEntry<float> ConfigEntry_Bonemass_Passive_EitrRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Bonemass_Passive_MaxWeight;

	private static ConfigEntry<float> ConfigEntry_Bonemass_Passive_MoveSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Bonemass_Passive_JumpForceModifier;

	private static ConfigEntry<float> ConfigEntry_Bonemass_Passive_MaxFallSpeed;

	private static ConfigEntry<float> ConfigEntry_Bonemass_Passive_EquipmentSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Bonemass_Passive_WindSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Bonemass_Passive_RunStaminaCostModifier;

	private static ConfigEntry<float> ConfigEntry_Bonemass_Passive_JumpStaminaCostModifier;

	private static ConfigEntry<float> ConfigEntry_Bonemass_Passive_StealthModifier;

	private static ConfigEntry<float> ConfigEntry_Bonemass_Passive_NoiseModifier;

	private static ConfigEntry<string> ConfigEntry_Bonemass_Passive_StatusAttributes;

	private static ConfigEntry<string> ConfigEntry_Bonemass_Passive_OutgoingDamageTypes;

	private static ConfigEntry<string> ConfigEntry_Bonemass_Passive_OutgoingDamageModifiers;

	private static ConfigEntry<float> ConfigEntry_Bonemass_Passive_FallDamageModifier;

	private static ConfigEntry<string> ConfigEntry_Bonemass_Passive_IncomingDamageTypes;

	private static ConfigEntry<string> ConfigEntry_Bonemass_Passive_IncomingDamageModifiers;

	private static ConfigEntry<float> ConfigEntry_Bonemass_Passive_HeatDamageModifier;

	private static ConfigEntry<int> ConfigEntry_Bonemass_Active_MaxHealth;

	private static ConfigEntry<int> ConfigEntry_Bonemass_Active_HealthRegen;

	private static ConfigEntry<float> ConfigEntry_Bonemass_Active_HealthRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Bonemass_Active_MaxStamina;

	private static ConfigEntry<float> ConfigEntry_Bonemass_Active_StaminaRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Bonemass_Active_MaxEitr;

	private static ConfigEntry<float> ConfigEntry_Bonemass_Active_EitrRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Bonemass_Active_MaxWeight;

	private static ConfigEntry<float> ConfigEntry_Bonemass_Active_MoveSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Bonemass_Active_JumpForceModifier;

	private static ConfigEntry<float> ConfigEntry_Bonemass_Active_MaxFallSpeed;

	private static ConfigEntry<float> ConfigEntry_Bonemass_Active_EquipmentSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Bonemass_Active_WindSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Bonemass_Active_RunStaminaCostModifier;

	private static ConfigEntry<float> ConfigEntry_Bonemass_Active_JumpStaminaCostModifier;

	private static ConfigEntry<float> ConfigEntry_Bonemass_Active_StealthModifier;

	private static ConfigEntry<float> ConfigEntry_Bonemass_Active_NoiseModifier;

	private static ConfigEntry<string> ConfigEntry_Bonemass_Active_StatusAttributes;

	private static ConfigEntry<string> ConfigEntry_Bonemass_Active_OutgoingDamageTypes;

	private static ConfigEntry<string> ConfigEntry_Bonemass_Active_OutgoingDamageModifiers;

	private static ConfigEntry<float> ConfigEntry_Bonemass_Active_FallDamageModifier;

	private static ConfigEntry<string> ConfigEntry_Bonemass_Active_IncomingDamageTypes;

	private static ConfigEntry<string> ConfigEntry_Bonemass_Active_IncomingDamageModifiers;

	private static ConfigEntry<float> ConfigEntry_Bonemass_Active_HeatDamageModifier;

	private static ConfigEntry<int> ConfigEntry_Bonemass_Shared_MaxHealth;

	private static ConfigEntry<int> ConfigEntry_Bonemass_Shared_HealthRegen;

	private static ConfigEntry<float> ConfigEntry_Bonemass_Shared_HealthRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Bonemass_Shared_MaxStamina;

	private static ConfigEntry<float> ConfigEntry_Bonemass_Shared_StaminaRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Bonemass_Shared_MaxEitr;

	private static ConfigEntry<float> ConfigEntry_Bonemass_Shared_EitrRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Bonemass_Shared_MaxWeight;

	private static ConfigEntry<float> ConfigEntry_Bonemass_Shared_MoveSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Bonemass_Shared_JumpForceModifier;

	private static ConfigEntry<float> ConfigEntry_Bonemass_Shared_MaxFallSpeed;

	private static ConfigEntry<float> ConfigEntry_Bonemass_Shared_EquipmentSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Bonemass_Shared_WindSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Bonemass_Shared_RunStaminaCostModifier;

	private static ConfigEntry<float> ConfigEntry_Bonemass_Shared_JumpStaminaCostModifier;

	private static ConfigEntry<float> ConfigEntry_Bonemass_Shared_StealthModifier;

	private static ConfigEntry<float> ConfigEntry_Bonemass_Shared_NoiseModifier;

	private static ConfigEntry<string> ConfigEntry_Bonemass_Shared_StatusAttributes;

	private static ConfigEntry<string> ConfigEntry_Bonemass_Shared_OutgoingDamageTypes;

	private static ConfigEntry<string> ConfigEntry_Bonemass_Shared_OutgoingDamageModifiers;

	private static ConfigEntry<float> ConfigEntry_Bonemass_Shared_FallDamageModifier;

	private static ConfigEntry<string> ConfigEntry_Bonemass_Shared_IncomingDamageTypes;

	private static ConfigEntry<string> ConfigEntry_Bonemass_Shared_IncomingDamageModifiers;

	private static ConfigEntry<float> ConfigEntry_Bonemass_Shared_HeatDamageModifier;

	private static ConfigEntry<int> ConfigEntry_Bonemass_Equipped_MaxHealth;

	private static ConfigEntry<int> ConfigEntry_Bonemass_Equipped_HealthRegen;

	private static ConfigEntry<float> ConfigEntry_Bonemass_Equipped_HealthRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Bonemass_Equipped_MaxStamina;

	private static ConfigEntry<float> ConfigEntry_Bonemass_Equipped_StaminaRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Bonemass_Equipped_MaxEitr;

	private static ConfigEntry<float> ConfigEntry_Bonemass_Equipped_EitrRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Bonemass_Equipped_MaxWeight;

	private static ConfigEntry<float> ConfigEntry_Bonemass_Equipped_MoveSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Bonemass_Equipped_JumpForceModifier;

	private static ConfigEntry<float> ConfigEntry_Bonemass_Equipped_MaxFallSpeed;

	private static ConfigEntry<float> ConfigEntry_Bonemass_Equipped_EquipmentSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Bonemass_Equipped_WindSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Bonemass_Equipped_RunStaminaCostModifier;

	private static ConfigEntry<float> ConfigEntry_Bonemass_Equipped_JumpStaminaCostModifier;

	private static ConfigEntry<float> ConfigEntry_Bonemass_Equipped_StealthModifier;

	private static ConfigEntry<float> ConfigEntry_Bonemass_Equipped_NoiseModifier;

	private static ConfigEntry<string> ConfigEntry_Bonemass_Equipped_StatusAttributes;

	private static ConfigEntry<string> ConfigEntry_Bonemass_Equipped_OutgoingDamageTypes;

	private static ConfigEntry<string> ConfigEntry_Bonemass_Equipped_OutgoingDamageModifiers;

	private static ConfigEntry<float> ConfigEntry_Bonemass_Equipped_FallDamageModifier;

	private static ConfigEntry<string> ConfigEntry_Bonemass_Equipped_IncomingDamageTypes;

	private static ConfigEntry<string> ConfigEntry_Bonemass_Equipped_IncomingDamageModifiers;

	private static ConfigEntry<float> ConfigEntry_Bonemass_Equipped_HeatDamageModifier;

	private static ConfigEntry<int> ConfigEntry_Moder_Passive_MaxHealth;

	private static ConfigEntry<int> ConfigEntry_Moder_Passive_HealthRegen;

	private static ConfigEntry<float> ConfigEntry_Moder_Passive_HealthRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Moder_Passive_MaxStamina;

	private static ConfigEntry<float> ConfigEntry_Moder_Passive_StaminaRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Moder_Passive_MaxEitr;

	private static ConfigEntry<float> ConfigEntry_Moder_Passive_EitrRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Moder_Passive_MaxWeight;

	private static ConfigEntry<float> ConfigEntry_Moder_Passive_MoveSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Moder_Passive_JumpForceModifier;

	private static ConfigEntry<float> ConfigEntry_Moder_Passive_MaxFallSpeed;

	private static ConfigEntry<float> ConfigEntry_Moder_Passive_EquipmentSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Moder_Passive_WindSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Moder_Passive_RunStaminaCostModifier;

	private static ConfigEntry<float> ConfigEntry_Moder_Passive_JumpStaminaCostModifier;

	private static ConfigEntry<float> ConfigEntry_Moder_Passive_StealthModifier;

	private static ConfigEntry<float> ConfigEntry_Moder_Passive_NoiseModifier;

	private static ConfigEntry<string> ConfigEntry_Moder_Passive_StatusAttributes;

	private static ConfigEntry<string> ConfigEntry_Moder_Passive_OutgoingDamageTypes;

	private static ConfigEntry<string> ConfigEntry_Moder_Passive_OutgoingDamageModifiers;

	private static ConfigEntry<float> ConfigEntry_Moder_Passive_FallDamageModifier;

	private static ConfigEntry<string> ConfigEntry_Moder_Passive_IncomingDamageTypes;

	private static ConfigEntry<string> ConfigEntry_Moder_Passive_IncomingDamageModifiers;

	private static ConfigEntry<float> ConfigEntry_Moder_Passive_HeatDamageModifier;

	private static ConfigEntry<int> ConfigEntry_Moder_Active_MaxHealth;

	private static ConfigEntry<int> ConfigEntry_Moder_Active_HealthRegen;

	private static ConfigEntry<float> ConfigEntry_Moder_Active_HealthRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Moder_Active_MaxStamina;

	private static ConfigEntry<float> ConfigEntry_Moder_Active_StaminaRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Moder_Active_MaxEitr;

	private static ConfigEntry<float> ConfigEntry_Moder_Active_EitrRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Moder_Active_MaxWeight;

	private static ConfigEntry<float> ConfigEntry_Moder_Active_MoveSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Moder_Active_JumpForceModifier;

	private static ConfigEntry<float> ConfigEntry_Moder_Active_MaxFallSpeed;

	private static ConfigEntry<float> ConfigEntry_Moder_Active_EquipmentSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Moder_Active_WindSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Moder_Active_RunStaminaCostModifier;

	private static ConfigEntry<float> ConfigEntry_Moder_Active_JumpStaminaCostModifier;

	private static ConfigEntry<float> ConfigEntry_Moder_Active_StealthModifier;

	private static ConfigEntry<float> ConfigEntry_Moder_Active_NoiseModifier;

	private static ConfigEntry<string> ConfigEntry_Moder_Active_StatusAttributes;

	private static ConfigEntry<string> ConfigEntry_Moder_Active_OutgoingDamageTypes;

	private static ConfigEntry<string> ConfigEntry_Moder_Active_OutgoingDamageModifiers;

	private static ConfigEntry<float> ConfigEntry_Moder_Active_FallDamageModifier;

	private static ConfigEntry<string> ConfigEntry_Moder_Active_IncomingDamageTypes;

	private static ConfigEntry<string> ConfigEntry_Moder_Active_IncomingDamageModifiers;

	private static ConfigEntry<float> ConfigEntry_Moder_Active_HeatDamageModifier;

	private static ConfigEntry<int> ConfigEntry_Moder_Shared_MaxHealth;

	private static ConfigEntry<int> ConfigEntry_Moder_Shared_HealthRegen;

	private static ConfigEntry<float> ConfigEntry_Moder_Shared_HealthRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Moder_Shared_MaxStamina;

	private static ConfigEntry<float> ConfigEntry_Moder_Shared_StaminaRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Moder_Shared_MaxEitr;

	private static ConfigEntry<float> ConfigEntry_Moder_Shared_EitrRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Moder_Shared_MaxWeight;

	private static ConfigEntry<float> ConfigEntry_Moder_Shared_MoveSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Moder_Shared_JumpForceModifier;

	private static ConfigEntry<float> ConfigEntry_Moder_Shared_MaxFallSpeed;

	private static ConfigEntry<float> ConfigEntry_Moder_Shared_EquipmentSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Moder_Shared_WindSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Moder_Shared_RunStaminaCostModifier;

	private static ConfigEntry<float> ConfigEntry_Moder_Shared_JumpStaminaCostModifier;

	private static ConfigEntry<float> ConfigEntry_Moder_Shared_StealthModifier;

	private static ConfigEntry<float> ConfigEntry_Moder_Shared_NoiseModifier;

	private static ConfigEntry<string> ConfigEntry_Moder_Shared_StatusAttributes;

	private static ConfigEntry<string> ConfigEntry_Moder_Shared_OutgoingDamageTypes;

	private static ConfigEntry<string> ConfigEntry_Moder_Shared_OutgoingDamageModifiers;

	private static ConfigEntry<float> ConfigEntry_Moder_Shared_FallDamageModifier;

	private static ConfigEntry<string> ConfigEntry_Moder_Shared_IncomingDamageTypes;

	private static ConfigEntry<string> ConfigEntry_Moder_Shared_IncomingDamageModifiers;

	private static ConfigEntry<float> ConfigEntry_Moder_Shared_HeatDamageModifier;

	private static ConfigEntry<int> ConfigEntry_Moder_Equipped_MaxHealth;

	private static ConfigEntry<int> ConfigEntry_Moder_Equipped_HealthRegen;

	private static ConfigEntry<float> ConfigEntry_Moder_Equipped_HealthRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Moder_Equipped_MaxStamina;

	private static ConfigEntry<float> ConfigEntry_Moder_Equipped_StaminaRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Moder_Equipped_MaxEitr;

	private static ConfigEntry<float> ConfigEntry_Moder_Equipped_EitrRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Moder_Equipped_MaxWeight;

	private static ConfigEntry<float> ConfigEntry_Moder_Equipped_MoveSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Moder_Equipped_JumpForceModifier;

	private static ConfigEntry<float> ConfigEntry_Moder_Equipped_MaxFallSpeed;

	private static ConfigEntry<float> ConfigEntry_Moder_Equipped_EquipmentSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Moder_Equipped_WindSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Moder_Equipped_RunStaminaCostModifier;

	private static ConfigEntry<float> ConfigEntry_Moder_Equipped_JumpStaminaCostModifier;

	private static ConfigEntry<float> ConfigEntry_Moder_Equipped_StealthModifier;

	private static ConfigEntry<float> ConfigEntry_Moder_Equipped_NoiseModifier;

	private static ConfigEntry<string> ConfigEntry_Moder_Equipped_StatusAttributes;

	private static ConfigEntry<string> ConfigEntry_Moder_Equipped_OutgoingDamageTypes;

	private static ConfigEntry<string> ConfigEntry_Moder_Equipped_OutgoingDamageModifiers;

	private static ConfigEntry<float> ConfigEntry_Moder_Equipped_FallDamageModifier;

	private static ConfigEntry<string> ConfigEntry_Moder_Equipped_IncomingDamageTypes;

	private static ConfigEntry<string> ConfigEntry_Moder_Equipped_IncomingDamageModifiers;

	private static ConfigEntry<float> ConfigEntry_Moder_Equipped_HeatDamageModifier;

	private static ConfigEntry<int> ConfigEntry_Yagluth_Passive_MaxHealth;

	private static ConfigEntry<int> ConfigEntry_Yagluth_Passive_HealthRegen;

	private static ConfigEntry<float> ConfigEntry_Yagluth_Passive_HealthRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Yagluth_Passive_MaxStamina;

	private static ConfigEntry<float> ConfigEntry_Yagluth_Passive_StaminaRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Yagluth_Passive_MaxEitr;

	private static ConfigEntry<float> ConfigEntry_Yagluth_Passive_EitrRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Yagluth_Passive_MaxWeight;

	private static ConfigEntry<float> ConfigEntry_Yagluth_Passive_MoveSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Yagluth_Passive_JumpForceModifier;

	private static ConfigEntry<float> ConfigEntry_Yagluth_Passive_MaxFallSpeed;

	private static ConfigEntry<float> ConfigEntry_Yagluth_Passive_EquipmentSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Yagluth_Passive_WindSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Yagluth_Passive_RunStaminaCostModifier;

	private static ConfigEntry<float> ConfigEntry_Yagluth_Passive_JumpStaminaCostModifier;

	private static ConfigEntry<float> ConfigEntry_Yagluth_Passive_StealthModifier;

	private static ConfigEntry<float> ConfigEntry_Yagluth_Passive_NoiseModifier;

	private static ConfigEntry<string> ConfigEntry_Yagluth_Passive_StatusAttributes;

	private static ConfigEntry<string> ConfigEntry_Yagluth_Passive_OutgoingDamageTypes;

	private static ConfigEntry<string> ConfigEntry_Yagluth_Passive_OutgoingDamageModifiers;

	private static ConfigEntry<float> ConfigEntry_Yagluth_Passive_FallDamageModifier;

	private static ConfigEntry<string> ConfigEntry_Yagluth_Passive_IncomingDamageTypes;

	private static ConfigEntry<string> ConfigEntry_Yagluth_Passive_IncomingDamageModifiers;

	private static ConfigEntry<float> ConfigEntry_Yagluth_Passive_HeatDamageModifier;

	private static ConfigEntry<int> ConfigEntry_Yagluth_Active_MaxHealth;

	private static ConfigEntry<int> ConfigEntry_Yagluth_Active_HealthRegen;

	private static ConfigEntry<float> ConfigEntry_Yagluth_Active_HealthRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Yagluth_Active_MaxStamina;

	private static ConfigEntry<float> ConfigEntry_Yagluth_Active_StaminaRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Yagluth_Active_MaxEitr;

	private static ConfigEntry<float> ConfigEntry_Yagluth_Active_EitrRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Yagluth_Active_MaxWeight;

	private static ConfigEntry<float> ConfigEntry_Yagluth_Active_MoveSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Yagluth_Active_JumpForceModifier;

	private static ConfigEntry<float> ConfigEntry_Yagluth_Active_MaxFallSpeed;

	private static ConfigEntry<float> ConfigEntry_Yagluth_Active_EquipmentSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Yagluth_Active_WindSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Yagluth_Active_RunStaminaCostModifier;

	private static ConfigEntry<float> ConfigEntry_Yagluth_Active_JumpStaminaCostModifier;

	private static ConfigEntry<float> ConfigEntry_Yagluth_Active_StealthModifier;

	private static ConfigEntry<float> ConfigEntry_Yagluth_Active_NoiseModifier;

	private static ConfigEntry<string> ConfigEntry_Yagluth_Active_StatusAttributes;

	private static ConfigEntry<string> ConfigEntry_Yagluth_Active_OutgoingDamageTypes;

	private static ConfigEntry<string> ConfigEntry_Yagluth_Active_OutgoingDamageModifiers;

	private static ConfigEntry<float> ConfigEntry_Yagluth_Active_FallDamageModifier;

	private static ConfigEntry<string> ConfigEntry_Yagluth_Active_IncomingDamageTypes;

	private static ConfigEntry<string> ConfigEntry_Yagluth_Active_IncomingDamageModifiers;

	private static ConfigEntry<float> ConfigEntry_Yagluth_Active_HeatDamageModifier;

	private static ConfigEntry<int> ConfigEntry_Yagluth_Shared_MaxHealth;

	private static ConfigEntry<int> ConfigEntry_Yagluth_Shared_HealthRegen;

	private static ConfigEntry<float> ConfigEntry_Yagluth_Shared_HealthRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Yagluth_Shared_MaxStamina;

	private static ConfigEntry<float> ConfigEntry_Yagluth_Shared_StaminaRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Yagluth_Shared_MaxEitr;

	private static ConfigEntry<float> ConfigEntry_Yagluth_Shared_EitrRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Yagluth_Shared_MaxWeight;

	private static ConfigEntry<float> ConfigEntry_Yagluth_Shared_MoveSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Yagluth_Shared_JumpForceModifier;

	private static ConfigEntry<float> ConfigEntry_Yagluth_Shared_MaxFallSpeed;

	private static ConfigEntry<float> ConfigEntry_Yagluth_Shared_EquipmentSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Yagluth_Shared_WindSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Yagluth_Shared_RunStaminaCostModifier;

	private static ConfigEntry<float> ConfigEntry_Yagluth_Shared_JumpStaminaCostModifier;

	private static ConfigEntry<float> ConfigEntry_Yagluth_Shared_StealthModifier;

	private static ConfigEntry<float> ConfigEntry_Yagluth_Shared_NoiseModifier;

	private static ConfigEntry<string> ConfigEntry_Yagluth_Shared_StatusAttributes;

	private static ConfigEntry<string> ConfigEntry_Yagluth_Shared_OutgoingDamageTypes;

	private static ConfigEntry<string> ConfigEntry_Yagluth_Shared_OutgoingDamageModifiers;

	private static ConfigEntry<float> ConfigEntry_Yagluth_Shared_FallDamageModifier;

	private static ConfigEntry<string> ConfigEntry_Yagluth_Shared_IncomingDamageTypes;

	private static ConfigEntry<string> ConfigEntry_Yagluth_Shared_IncomingDamageModifiers;

	private static ConfigEntry<float> ConfigEntry_Yagluth_Shared_HeatDamageModifier;

	private static ConfigEntry<int> ConfigEntry_Yagluth_Equipped_MaxHealth;

	private static ConfigEntry<int> ConfigEntry_Yagluth_Equipped_HealthRegen;

	private static ConfigEntry<float> ConfigEntry_Yagluth_Equipped_HealthRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Yagluth_Equipped_MaxStamina;

	private static ConfigEntry<float> ConfigEntry_Yagluth_Equipped_StaminaRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Yagluth_Equipped_MaxEitr;

	private static ConfigEntry<float> ConfigEntry_Yagluth_Equipped_EitrRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Yagluth_Equipped_MaxWeight;

	private static ConfigEntry<float> ConfigEntry_Yagluth_Equipped_MoveSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Yagluth_Equipped_JumpForceModifier;

	private static ConfigEntry<float> ConfigEntry_Yagluth_Equipped_MaxFallSpeed;

	private static ConfigEntry<float> ConfigEntry_Yagluth_Equipped_EquipmentSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Yagluth_Equipped_WindSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Yagluth_Equipped_RunStaminaCostModifier;

	private static ConfigEntry<float> ConfigEntry_Yagluth_Equipped_JumpStaminaCostModifier;

	private static ConfigEntry<float> ConfigEntry_Yagluth_Equipped_StealthModifier;

	private static ConfigEntry<float> ConfigEntry_Yagluth_Equipped_NoiseModifier;

	private static ConfigEntry<string> ConfigEntry_Yagluth_Equipped_StatusAttributes;

	private static ConfigEntry<string> ConfigEntry_Yagluth_Equipped_OutgoingDamageTypes;

	private static ConfigEntry<string> ConfigEntry_Yagluth_Equipped_OutgoingDamageModifiers;

	private static ConfigEntry<float> ConfigEntry_Yagluth_Equipped_FallDamageModifier;

	private static ConfigEntry<string> ConfigEntry_Yagluth_Equipped_IncomingDamageTypes;

	private static ConfigEntry<string> ConfigEntry_Yagluth_Equipped_IncomingDamageModifiers;

	private static ConfigEntry<float> ConfigEntry_Yagluth_Equipped_HeatDamageModifier;

	private static ConfigEntry<int> ConfigEntry_Queen_Passive_MaxHealth;

	private static ConfigEntry<int> ConfigEntry_Queen_Passive_HealthRegen;

	private static ConfigEntry<float> ConfigEntry_Queen_Passive_HealthRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Queen_Passive_MaxStamina;

	private static ConfigEntry<float> ConfigEntry_Queen_Passive_StaminaRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Queen_Passive_MaxEitr;

	private static ConfigEntry<float> ConfigEntry_Queen_Passive_EitrRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Queen_Passive_MaxWeight;

	private static ConfigEntry<float> ConfigEntry_Queen_Passive_MoveSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Queen_Passive_JumpForceModifier;

	private static ConfigEntry<float> ConfigEntry_Queen_Passive_MaxFallSpeed;

	private static ConfigEntry<float> ConfigEntry_Queen_Passive_EquipmentSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Queen_Passive_WindSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Queen_Passive_RunStaminaCostModifier;

	private static ConfigEntry<float> ConfigEntry_Queen_Passive_JumpStaminaCostModifier;

	private static ConfigEntry<float> ConfigEntry_Queen_Passive_StealthModifier;

	private static ConfigEntry<float> ConfigEntry_Queen_Passive_NoiseModifier;

	private static ConfigEntry<string> ConfigEntry_Queen_Passive_StatusAttributes;

	private static ConfigEntry<string> ConfigEntry_Queen_Passive_OutgoingDamageTypes;

	private static ConfigEntry<string> ConfigEntry_Queen_Passive_OutgoingDamageModifiers;

	private static ConfigEntry<float> ConfigEntry_Queen_Passive_FallDamageModifier;

	private static ConfigEntry<string> ConfigEntry_Queen_Passive_IncomingDamageTypes;

	private static ConfigEntry<string> ConfigEntry_Queen_Passive_IncomingDamageModifiers;

	private static ConfigEntry<float> ConfigEntry_Queen_Passive_HeatDamageModifier;

	private static ConfigEntry<int> ConfigEntry_Queen_Active_MaxHealth;

	private static ConfigEntry<int> ConfigEntry_Queen_Active_HealthRegen;

	private static ConfigEntry<float> ConfigEntry_Queen_Active_HealthRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Queen_Active_MaxStamina;

	private static ConfigEntry<float> ConfigEntry_Queen_Active_StaminaRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Queen_Active_MaxEitr;

	private static ConfigEntry<float> ConfigEntry_Queen_Active_EitrRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Queen_Active_MaxWeight;

	private static ConfigEntry<float> ConfigEntry_Queen_Active_MoveSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Queen_Active_JumpForceModifier;

	private static ConfigEntry<float> ConfigEntry_Queen_Active_MaxFallSpeed;

	private static ConfigEntry<float> ConfigEntry_Queen_Active_EquipmentSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Queen_Active_WindSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Queen_Active_RunStaminaCostModifier;

	private static ConfigEntry<float> ConfigEntry_Queen_Active_JumpStaminaCostModifier;

	private static ConfigEntry<float> ConfigEntry_Queen_Active_StealthModifier;

	private static ConfigEntry<float> ConfigEntry_Queen_Active_NoiseModifier;

	private static ConfigEntry<string> ConfigEntry_Queen_Active_StatusAttributes;

	private static ConfigEntry<string> ConfigEntry_Queen_Active_OutgoingDamageTypes;

	private static ConfigEntry<string> ConfigEntry_Queen_Active_OutgoingDamageModifiers;

	private static ConfigEntry<float> ConfigEntry_Queen_Active_FallDamageModifier;

	private static ConfigEntry<string> ConfigEntry_Queen_Active_IncomingDamageTypes;

	private static ConfigEntry<string> ConfigEntry_Queen_Active_IncomingDamageModifiers;

	private static ConfigEntry<float> ConfigEntry_Queen_Active_HeatDamageModifier;

	private static ConfigEntry<int> ConfigEntry_Queen_Shared_MaxHealth;

	private static ConfigEntry<int> ConfigEntry_Queen_Shared_HealthRegen;

	private static ConfigEntry<float> ConfigEntry_Queen_Shared_HealthRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Queen_Shared_MaxStamina;

	private static ConfigEntry<float> ConfigEntry_Queen_Shared_StaminaRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Queen_Shared_MaxEitr;

	private static ConfigEntry<float> ConfigEntry_Queen_Shared_EitrRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Queen_Shared_MaxWeight;

	private static ConfigEntry<float> ConfigEntry_Queen_Shared_MoveSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Queen_Shared_JumpForceModifier;

	private static ConfigEntry<float> ConfigEntry_Queen_Shared_MaxFallSpeed;

	private static ConfigEntry<float> ConfigEntry_Queen_Shared_EquipmentSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Queen_Shared_WindSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Queen_Shared_RunStaminaCostModifier;

	private static ConfigEntry<float> ConfigEntry_Queen_Shared_JumpStaminaCostModifier;

	private static ConfigEntry<float> ConfigEntry_Queen_Shared_StealthModifier;

	private static ConfigEntry<float> ConfigEntry_Queen_Shared_NoiseModifier;

	private static ConfigEntry<string> ConfigEntry_Queen_Shared_StatusAttributes;

	private static ConfigEntry<string> ConfigEntry_Queen_Shared_OutgoingDamageTypes;

	private static ConfigEntry<string> ConfigEntry_Queen_Shared_OutgoingDamageModifiers;

	private static ConfigEntry<float> ConfigEntry_Queen_Shared_FallDamageModifier;

	private static ConfigEntry<string> ConfigEntry_Queen_Shared_IncomingDamageTypes;

	private static ConfigEntry<string> ConfigEntry_Queen_Shared_IncomingDamageModifiers;

	private static ConfigEntry<float> ConfigEntry_Queen_Shared_HeatDamageModifier;

	private static ConfigEntry<int> ConfigEntry_Queen_Equipped_MaxHealth;

	private static ConfigEntry<int> ConfigEntry_Queen_Equipped_HealthRegen;

	private static ConfigEntry<float> ConfigEntry_Queen_Equipped_HealthRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Queen_Equipped_MaxStamina;

	private static ConfigEntry<float> ConfigEntry_Queen_Equipped_StaminaRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Queen_Equipped_MaxEitr;

	private static ConfigEntry<float> ConfigEntry_Queen_Equipped_EitrRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Queen_Equipped_MaxWeight;

	private static ConfigEntry<float> ConfigEntry_Queen_Equipped_MoveSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Queen_Equipped_JumpForceModifier;

	private static ConfigEntry<float> ConfigEntry_Queen_Equipped_MaxFallSpeed;

	private static ConfigEntry<float> ConfigEntry_Queen_Equipped_EquipmentSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Queen_Equipped_WindSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Queen_Equipped_RunStaminaCostModifier;

	private static ConfigEntry<float> ConfigEntry_Queen_Equipped_JumpStaminaCostModifier;

	private static ConfigEntry<float> ConfigEntry_Queen_Equipped_StealthModifier;

	private static ConfigEntry<float> ConfigEntry_Queen_Equipped_NoiseModifier;

	private static ConfigEntry<string> ConfigEntry_Queen_Equipped_StatusAttributes;

	private static ConfigEntry<string> ConfigEntry_Queen_Equipped_OutgoingDamageTypes;

	private static ConfigEntry<string> ConfigEntry_Queen_Equipped_OutgoingDamageModifiers;

	private static ConfigEntry<float> ConfigEntry_Queen_Equipped_FallDamageModifier;

	private static ConfigEntry<string> ConfigEntry_Queen_Equipped_IncomingDamageTypes;

	private static ConfigEntry<string> ConfigEntry_Queen_Equipped_IncomingDamageModifiers;

	private static ConfigEntry<float> ConfigEntry_Queen_Equipped_HeatDamageModifier;

	private static ConfigEntry<int> ConfigEntry_Fader_Passive_MaxHealth;

	private static ConfigEntry<int> ConfigEntry_Fader_Passive_HealthRegen;

	private static ConfigEntry<float> ConfigEntry_Fader_Passive_HealthRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Fader_Passive_MaxStamina;

	private static ConfigEntry<float> ConfigEntry_Fader_Passive_StaminaRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Fader_Passive_MaxEitr;

	private static ConfigEntry<float> ConfigEntry_Fader_Passive_EitrRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Fader_Passive_MaxWeight;

	private static ConfigEntry<float> ConfigEntry_Fader_Passive_MoveSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Fader_Passive_JumpForceModifier;

	private static ConfigEntry<float> ConfigEntry_Fader_Passive_MaxFallSpeed;

	private static ConfigEntry<float> ConfigEntry_Fader_Passive_EquipmentSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Fader_Passive_WindSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Fader_Passive_RunStaminaCostModifier;

	private static ConfigEntry<float> ConfigEntry_Fader_Passive_JumpStaminaCostModifier;

	private static ConfigEntry<float> ConfigEntry_Fader_Passive_StealthModifier;

	private static ConfigEntry<float> ConfigEntry_Fader_Passive_NoiseModifier;

	private static ConfigEntry<string> ConfigEntry_Fader_Passive_StatusAttributes;

	private static ConfigEntry<string> ConfigEntry_Fader_Passive_OutgoingDamageTypes;

	private static ConfigEntry<string> ConfigEntry_Fader_Passive_OutgoingDamageModifiers;

	private static ConfigEntry<float> ConfigEntry_Fader_Passive_FallDamageModifier;

	private static ConfigEntry<string> ConfigEntry_Fader_Passive_IncomingDamageTypes;

	private static ConfigEntry<string> ConfigEntry_Fader_Passive_IncomingDamageModifiers;

	private static ConfigEntry<float> ConfigEntry_Fader_Passive_HeatDamageModifier;

	private static ConfigEntry<int> ConfigEntry_Fader_Active_MaxHealth;

	private static ConfigEntry<int> ConfigEntry_Fader_Active_HealthRegen;

	private static ConfigEntry<float> ConfigEntry_Fader_Active_HealthRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Fader_Active_MaxStamina;

	private static ConfigEntry<float> ConfigEntry_Fader_Active_StaminaRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Fader_Active_MaxEitr;

	private static ConfigEntry<float> ConfigEntry_Fader_Active_EitrRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Fader_Active_MaxWeight;

	private static ConfigEntry<float> ConfigEntry_Fader_Active_MoveSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Fader_Active_JumpForceModifier;

	private static ConfigEntry<float> ConfigEntry_Fader_Active_MaxFallSpeed;

	private static ConfigEntry<float> ConfigEntry_Fader_Active_EquipmentSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Fader_Active_WindSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Fader_Active_RunStaminaCostModifier;

	private static ConfigEntry<float> ConfigEntry_Fader_Active_JumpStaminaCostModifier;

	private static ConfigEntry<float> ConfigEntry_Fader_Active_StealthModifier;

	private static ConfigEntry<float> ConfigEntry_Fader_Active_NoiseModifier;

	private static ConfigEntry<string> ConfigEntry_Fader_Active_StatusAttributes;

	private static ConfigEntry<string> ConfigEntry_Fader_Active_OutgoingDamageTypes;

	private static ConfigEntry<string> ConfigEntry_Fader_Active_OutgoingDamageModifiers;

	private static ConfigEntry<float> ConfigEntry_Fader_Active_FallDamageModifier;

	private static ConfigEntry<string> ConfigEntry_Fader_Active_IncomingDamageTypes;

	private static ConfigEntry<string> ConfigEntry_Fader_Active_IncomingDamageModifiers;

	private static ConfigEntry<float> ConfigEntry_Fader_Active_HeatDamageModifier;

	private static ConfigEntry<int> ConfigEntry_Fader_Shared_MaxHealth;

	private static ConfigEntry<int> ConfigEntry_Fader_Shared_HealthRegen;

	private static ConfigEntry<float> ConfigEntry_Fader_Shared_HealthRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Fader_Shared_MaxStamina;

	private static ConfigEntry<float> ConfigEntry_Fader_Shared_StaminaRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Fader_Shared_MaxEitr;

	private static ConfigEntry<float> ConfigEntry_Fader_Shared_EitrRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Fader_Shared_MaxWeight;

	private static ConfigEntry<float> ConfigEntry_Fader_Shared_MoveSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Fader_Shared_JumpForceModifier;

	private static ConfigEntry<float> ConfigEntry_Fader_Shared_MaxFallSpeed;

	private static ConfigEntry<float> ConfigEntry_Fader_Shared_EquipmentSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Fader_Shared_WindSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Fader_Shared_RunStaminaCostModifier;

	private static ConfigEntry<float> ConfigEntry_Fader_Shared_JumpStaminaCostModifier;

	private static ConfigEntry<float> ConfigEntry_Fader_Shared_StealthModifier;

	private static ConfigEntry<float> ConfigEntry_Fader_Shared_NoiseModifier;

	private static ConfigEntry<string> ConfigEntry_Fader_Shared_StatusAttributes;

	private static ConfigEntry<string> ConfigEntry_Fader_Shared_OutgoingDamageTypes;

	private static ConfigEntry<string> ConfigEntry_Fader_Shared_OutgoingDamageModifiers;

	private static ConfigEntry<float> ConfigEntry_Fader_Shared_FallDamageModifier;

	private static ConfigEntry<string> ConfigEntry_Fader_Shared_IncomingDamageTypes;

	private static ConfigEntry<string> ConfigEntry_Fader_Shared_IncomingDamageModifiers;

	private static ConfigEntry<float> ConfigEntry_Fader_Shared_HeatDamageModifier;

	private static ConfigEntry<int> ConfigEntry_Fader_Equipped_MaxHealth;

	private static ConfigEntry<int> ConfigEntry_Fader_Equipped_HealthRegen;

	private static ConfigEntry<float> ConfigEntry_Fader_Equipped_HealthRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Fader_Equipped_MaxStamina;

	private static ConfigEntry<float> ConfigEntry_Fader_Equipped_StaminaRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Fader_Equipped_MaxEitr;

	private static ConfigEntry<float> ConfigEntry_Fader_Equipped_EitrRegenModifier;

	private static ConfigEntry<int> ConfigEntry_Fader_Equipped_MaxWeight;

	private static ConfigEntry<float> ConfigEntry_Fader_Equipped_MoveSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Fader_Equipped_JumpForceModifier;

	private static ConfigEntry<float> ConfigEntry_Fader_Equipped_MaxFallSpeed;

	private static ConfigEntry<float> ConfigEntry_Fader_Equipped_EquipmentSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Fader_Equipped_WindSpeedModifier;

	private static ConfigEntry<float> ConfigEntry_Fader_Equipped_RunStaminaCostModifier;

	private static ConfigEntry<float> ConfigEntry_Fader_Equipped_JumpStaminaCostModifier;

	private static ConfigEntry<float> ConfigEntry_Fader_Equipped_StealthModifier;

	private static ConfigEntry<float> ConfigEntry_Fader_Equipped_NoiseModifier;

	private static ConfigEntry<string> ConfigEntry_Fader_Equipped_StatusAttributes;

	private static ConfigEntry<string> ConfigEntry_Fader_Equipped_OutgoingDamageTypes;

	private static ConfigEntry<string> ConfigEntry_Fader_Equipped_OutgoingDamageModifiers;

	private static ConfigEntry<float> ConfigEntry_Fader_Equipped_FallDamageModifier;

	private static ConfigEntry<string> ConfigEntry_Fader_Equipped_IncomingDamageTypes;

	private static ConfigEntry<string> ConfigEntry_Fader_Equipped_IncomingDamageModifiers;

	private static ConfigEntry<float> ConfigEntry_Fader_Equipped_HeatDamageModifier;

	private static ConfigEntry<bool> Config_SE_CorpseRun_Bool;

	private static Dictionary<string, ConfigEntry<int>> Dictionary_ConfigEntry_Int = new Dictionary<string, ConfigEntry<int>>();

	private static Dictionary<string, ConfigEntry<float>> Dictionary_ConfigEntry_Float = new Dictionary<string, ConfigEntry<float>>();

	private static Dictionary<string, ConfigEntry<string>> Dictionary_ConfigEntry_String = new Dictionary<string, ConfigEntry<string>>();

	private const string PluginGUID = "JuneGame.Valheim.ForsakenPowerOverhaul";

	private const string PluginName = "Forsaken Power Overhaul";

	private const string PluginVersion = "2.2.0";

	private static List<string> List_BossNames = new List<string> { "Eikthyr", "TheElder", "Bonemass", "Moder", "Yagluth", "Queen", "Fader" };

	private static List<string> List_Components = new List<string> { "Passive", "Equipped", "Active", "Shared" };

	private static List<StatusEffect_FPO> List_StatusEffect_FPO = new List<StatusEffect_FPO>();

	private static List<StatusEffect_FPO> List_StatusEffect_FPO_Passive = new List<StatusEffect_FPO>();

	private static List<StatusEffect_FPO> List_StatusEffect_FPO_Equipped = new List<StatusEffect_FPO>();

	private static List<StatusEffect_FPO> List_StatusEffect_FPO_Active = new List<StatusEffect_FPO>();

	private static List<StatusEffect_FPO> List_StatusEffect_FPO_Shared = new List<StatusEffect_FPO>();

	private static bool Mod_Auga = false;

	private static bool Mod_EpicLoot = false;

	private static StatusEffect_FPO StatusEffect_FPO_Passive;

	private static StatusEffect_FPO StatusEffect_FPO_Eikthyr;

	private static StatusEffect_FPO StatusEffect_FPO_TheElder;

	private static StatusEffect_FPO StatusEffect_FPO_Bonemass;

	private static StatusEffect_FPO StatusEffect_FPO_Moder;

	private static StatusEffect_FPO StatusEffect_FPO_Yagluth;

	private static StatusEffect_FPO StatusEffect_FPO_Queen;

	private static StatusEffect_FPO StatusEffect_FPO_Fader;

	private static StatusEffect_FPO StatusEffect_FPO_Eikthyr_Passive;

	private static StatusEffect_FPO StatusEffect_FPO_TheElder_Passive;

	private static StatusEffect_FPO StatusEffect_FPO_Bonemass_Passive;

	private static StatusEffect_FPO StatusEffect_FPO_Moder_Passive;

	private static StatusEffect_FPO StatusEffect_FPO_Yagluth_Passive;

	private static StatusEffect_FPO StatusEffect_FPO_Queen_Passive;

	private static StatusEffect_FPO StatusEffect_FPO_Fader_Passive;

	private static StatusEffect_FPO StatusEffect_FPO_Eikthyr_Active;

	private static StatusEffect_FPO StatusEffect_FPO_TheElder_Active;

	private static StatusEffect_FPO StatusEffect_FPO_Bonemass_Active;

	private static StatusEffect_FPO StatusEffect_FPO_Moder_Active;

	private static StatusEffect_FPO StatusEffect_FPO_Yagluth_Active;

	private static StatusEffect_FPO StatusEffect_FPO_Queen_Active;

	private static StatusEffect_FPO StatusEffect_FPO_Fader_Active;

	private static StatusEffect_FPO StatusEffect_FPO_Eikthyr_Shared;

	private static StatusEffect_FPO StatusEffect_FPO_TheElder_Shared;

	private static StatusEffect_FPO StatusEffect_FPO_Bonemass_Shared;

	private static StatusEffect_FPO StatusEffect_FPO_Moder_Shared;

	private static StatusEffect_FPO StatusEffect_FPO_Yagluth_Shared;

	private static StatusEffect_FPO StatusEffect_FPO_Queen_Shared;

	private static StatusEffect_FPO StatusEffect_FPO_Fader_Shared;

	private static StatusEffect_FPO StatusEffect_FPO_Eikthyr_Equipped;

	private static StatusEffect_FPO StatusEffect_FPO_TheElder_Equipped;

	private static StatusEffect_FPO StatusEffect_FPO_Bonemass_Equipped;

	private static StatusEffect_FPO StatusEffect_FPO_Moder_Equipped;

	private static StatusEffect_FPO StatusEffect_FPO_Yagluth_Equipped;

	private static StatusEffect_FPO StatusEffect_FPO_Queen_Equipped;

	private static StatusEffect_FPO StatusEffect_FPO_Fader_Equipped;

	private static string GetBossStoneHoverText(string New_String, bool New_Bool)
	{
		StringBuilder stringBuilder = new StringBuilder(256);
		if (New_String != "")
		{
			stringBuilder.Append("<size=24><smallcaps><color=orange>" + GetLocalization("$se_" + New_String.ToLower() + "_name") + "</color></smallcaps></size><size=20>\n");
			stringBuilder.Append("<smallcaps>" + GetLocalization("$ui_fpo_passive") + "</smallcaps></size><size=16>\n" + GetToolTipStringFormat((StatusEffect)(object)(StatusEffect_FPO)(object)ObjectDB.m_instance.GetStatusEffect(GetHash("SE_FPO_" + New_String + "_Passive"))) + "</size><size=20>\n");
			if (Mod_EpicLoot && !New_Bool)
			{
				stringBuilder.Append("\t\n");
			}
			stringBuilder.Append("<smallcaps>" + GetLocalization("$ui_fpo_equipped $ui_fpo_passive") + "</smallcaps></size><size=16>\n" + GetToolTipStringFormat((StatusEffect)(object)(StatusEffect_FPO)(object)ObjectDB.m_instance.GetStatusEffect(GetHash("SE_FPO_" + New_String + "_Equipped"))) + "</size><size=20>\n");
			if (Mod_EpicLoot && !New_Bool)
			{
				stringBuilder.Append("\t\n");
			}
			stringBuilder.Append("<smallcaps>" + GetLocalization("$ui_fpo_active") + "</smallcaps></size><size=16>\n" + GetToolTipStringFormat((StatusEffect)(object)(StatusEffect_FPO)(object)ObjectDB.m_instance.GetStatusEffect(GetHash("SE_FPO_" + New_String + "_Active"))) + "</size><size=20>\n");
			if (Mod_EpicLoot && !New_Bool)
			{
				stringBuilder.Append("\t\n");
			}
			stringBuilder.Append("<smallcaps>" + GetLocalization("$ui_fpo_shared $ui_fpo_active") + "</smallcaps></size><size=16>\n" + GetToolTipStringFormat((StatusEffect)(object)(StatusEffect_FPO)(object)ObjectDB.m_instance.GetStatusEffect(GetHash("SE_FPO_" + New_String + "_Shared"))) + "</size><size=20>\n\n");
			if (Mod_EpicLoot && !New_Bool)
			{
				stringBuilder.Append("\t\n\t\n");
			}
		}
		return stringBuilder.ToString();
	}

	private static void Add_Buttons()
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_0005: Unknown result type (might be due to invalid IL or missing references)
		//IL_0010: Unknown result type (might be due to invalid IL or missing references)
		//IL_0020: Expected Obj, but got Unknown
		ButtonConfig_PowerCycle = new ButtonConfig
		{
			Name = "Button_PowerCycle",
			Config = ConfigEntry_Button_PowerCycle
		};
		InputManager.Instance.AddButton("JuneGame.Valheim.ForsakenPowerOverhaul", ButtonConfig_PowerCycle);
	}

	private void Add_ConfigEntries()
	{
		//IL_00e8: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ed: Unknown result type (might be due to invalid IL or missing references)
		//IL_00f6: Expected Obj, but got Unknown
		//IL_0101: Unknown result type (might be due to invalid IL or missing references)
		//IL_0108: Expected Obj, but got Unknown
		//IL_0143: Unknown result type (might be due to invalid IL or missing references)
		//IL_014a: Expected Obj, but got Unknown
		//IL_0162: Unknown result type (might be due to invalid IL or missing references)
		//IL_0169: Expected Obj, but got Unknown
		//IL_0181: Unknown result type (might be due to invalid IL or missing references)
		//IL_0188: Expected Obj, but got Unknown
		//IL_0199: Unknown result type (might be due to invalid IL or missing references)
		//IL_01a0: Expected Obj, but got Unknown
		//IL_01b1: Unknown result type (might be due to invalid IL or missing references)
		//IL_01b8: Expected Obj, but got Unknown
		//IL_01c9: Unknown result type (might be due to invalid IL or missing references)
		//IL_01d0: Expected Obj, but got Unknown
		//IL_01e8: Unknown result type (might be due to invalid IL or missing references)
		//IL_01ef: Expected Obj, but got Unknown
		//IL_0200: Unknown result type (might be due to invalid IL or missing references)
		//IL_0207: Expected Obj, but got Unknown
		//IL_021f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0226: Expected Obj, but got Unknown
		//IL_0237: Unknown result type (might be due to invalid IL or missing references)
		//IL_023e: Expected Obj, but got Unknown
		//IL_0256: Unknown result type (might be due to invalid IL or missing references)
		//IL_025d: Expected Obj, but got Unknown
		//IL_026e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0275: Expected Obj, but got Unknown
		//IL_028d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0294: Expected Obj, but got Unknown
		//IL_02ac: Unknown result type (might be due to invalid IL or missing references)
		//IL_02b3: Expected Obj, but got Unknown
		//IL_02c4: Unknown result type (might be due to invalid IL or missing references)
		//IL_02cb: Expected Obj, but got Unknown
		//IL_02e3: Unknown result type (might be due to invalid IL or missing references)
		//IL_02ea: Expected Obj, but got Unknown
		//IL_0302: Unknown result type (might be due to invalid IL or missing references)
		//IL_0309: Expected Obj, but got Unknown
		//IL_0321: Unknown result type (might be due to invalid IL or missing references)
		//IL_0328: Expected Obj, but got Unknown
		//IL_0340: Unknown result type (might be due to invalid IL or missing references)
		//IL_0347: Expected Obj, but got Unknown
		//IL_035f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0366: Expected Obj, but got Unknown
		//IL_037e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0385: Expected Obj, but got Unknown
		//IL_03a4: Unknown result type (might be due to invalid IL or missing references)
		//IL_03ab: Expected Obj, but got Unknown
		//IL_03ca: Unknown result type (might be due to invalid IL or missing references)
		//IL_03d1: Expected Obj, but got Unknown
		//IL_03f0: Unknown result type (might be due to invalid IL or missing references)
		//IL_03f7: Expected Obj, but got Unknown
		//IL_040f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0416: Expected Obj, but got Unknown
		//IL_042e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0435: Expected Obj, but got Unknown
		//IL_0454: Unknown result type (might be due to invalid IL or missing references)
		//IL_045b: Expected Obj, but got Unknown
		//IL_047a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0481: Expected Obj, but got Unknown
		//IL_0499: Unknown result type (might be due to invalid IL or missing references)
		//IL_04a0: Expected Obj, but got Unknown
		Add_Dictionaries();
		string text = "MaxHealth";
		string text2 = "HealthRegen";
		string text3 = "HealthRegenModifier";
		string text4 = "MaxStamina";
		string text5 = "StaminaRegenModifier";
		string text6 = "MaxEitr";
		string text7 = "EitrRegenModifier";
		string text8 = "MaxWeight";
		string text9 = "MoveSpeedModifier";
		string text10 = "JumpForceModifier";
		string text11 = "MaxFallSpeed";
		string text12 = "EquipmentSpeedModifier";
		string text13 = "WindSpeedModifier";
		string text14 = "RunStaminaCostModifier";
		string text15 = "JumpStaminaCostModifier";
		string text16 = "StealthModifier";
		string text17 = "NoiseModifier";
		string text18 = "StatusAttributes";
		string text19 = "OutgoingDamageTypes";
		string text20 = "OutgoingDamageModifiers";
		string text21 = "FallDamageModifier";
		string text22 = "HeatDamageModifier";
		string text23 = "IncomingDamageTypes";
		string text24 = "IncomingDamageModifiers";
		string text25 = "A value of \"12.34\" translates to a 12.34% Increase.";
		string text26 = "A value of \"12.34\" translates to a 12.34% Decrease.";
		string text27 = "Acceptable Values: [ColdResistance, DoubleImpactDamage, SailingPower].";
		string text28 = "Acceptable Values: [All, Unarmed, Clubs, Axes, Knives, Spears, Swords, Polearms, Bows, Crossbows, ElementalMagic, BloodMagic, WoodCutting, Pickaxes].";
		string text29 = "Acceptable Values: [Physical, Pierce, Slash, Blunt, Elemental, Lightning, Poison, Frost, Fire, Spirit, Chop, Pickaxe].";
		string text30 = "Acceptable Values: [0, 25, 50, 100, 150, 200] (0 = Immune, 25 = Very Resistant, 50 = Resistant, 100 = Neutral, 150 = Weak, 200 = Very Weak).";
		string text31 = "Multiple Values Acceptable with Format: \"ValueA,ValueB,ValueC\".";
		string text32 = "This Config may take priority over most mods.";
		string text33 = "This Config is for Game Balance.";
		ConfigurationManagerAttributes val = new ConfigurationManagerAttributes
		{
			IsAdminOnly = true
		};
		ConfigDescription val2 = new ConfigDescription("Input to Cycle through unlocked Forsaken Powers.", (AcceptableValueBase)null, Array.Empty<object>());
		ConfigDescription val3 = new ConfigDescription("Config Preset.\nAcceptable Values: [Custom, Vanilla, Vanilla+, Passive Powers].", (AcceptableValueBase)(object)new AcceptableValueList<string>(new string[4] { "Custom", "Vanilla", "Vanilla+", "Passive Powers" }), new object[1] { val });
		ConfigDescription val4 = new ConfigDescription("Forsaken Power's Active Duration in Seconds.\n" + text32, (AcceptableValueBase)null, new object[1] { val });
		ConfigDescription val5 = new ConfigDescription("Forsaken Power's Cooldown Duration in Seconds.\n" + text32, (AcceptableValueBase)null, new object[1] { val });
		ConfigDescription val6 = new ConfigDescription("Enable Power Cycling.", (AcceptableValueBase)null, new object[1] { val });
		ConfigDescription val7 = new ConfigDescription("Increase Max Health by Value.", (AcceptableValueBase)null, new object[1] { val });
		ConfigDescription val8 = new ConfigDescription("Increase Health Regeneration by Value.", (AcceptableValueBase)null, new object[1] { val });
		ConfigDescription val9 = new ConfigDescription("Increase Health Regeneration by Value Percent.\n" + text25, (AcceptableValueBase)null, new object[1] { val });
		ConfigDescription val10 = new ConfigDescription("Increase Max Stamina by Value.", (AcceptableValueBase)null, new object[1] { val });
		ConfigDescription val11 = new ConfigDescription("Increase Stamina Regeneration by Value Percent.\n" + text25, (AcceptableValueBase)null, new object[1] { val });
		ConfigDescription val12 = new ConfigDescription("Increase Max Eitr by Value.", (AcceptableValueBase)null, new object[1] { val });
		ConfigDescription val13 = new ConfigDescription("Increase Eitr Regeneration by Value Percent.\n" + text25, (AcceptableValueBase)null, new object[1] { val });
		ConfigDescription val14 = new ConfigDescription("Increase Max Weight Capacity by Value.", (AcceptableValueBase)null, new object[1] { val });
		ConfigDescription val15 = new ConfigDescription("Increase Movement Speed by Value Percent.\n" + text25, (AcceptableValueBase)null, new object[1] { val });
		ConfigDescription val16 = new ConfigDescription("Increase Jump Force by Value Percent.\n" + text25, (AcceptableValueBase)null, new object[1] { val });
		ConfigDescription val17 = new ConfigDescription("Limits Max Fall Speed to Value.", (AcceptableValueBase)null, new object[1] { val });
		ConfigDescription val18 = new ConfigDescription("Decrease Movement Speed Penalty from Equipment by Value Percent.\n" + text26, (AcceptableValueBase)null, new object[1] { val });
		ConfigDescription val19 = new ConfigDescription("Increase Wind Speed when Sailing.\n" + text25, (AcceptableValueBase)null, new object[1] { val });
		ConfigDescription val20 = new ConfigDescription("Decrease Run Stamina Cost by Value Percent.\n" + text26, (AcceptableValueBase)null, new object[1] { val });
		ConfigDescription val21 = new ConfigDescription("Decrease Jump Stamina Cost by Value Percent.\n" + text26, (AcceptableValueBase)null, new object[1] { val });
		ConfigDescription val22 = new ConfigDescription("Increase Stealth by Value Percent.\n" + text25, (AcceptableValueBase)null, new object[1] { val });
		ConfigDescription val23 = new ConfigDescription("Decrease Noise by Value Percent.\n" + text26, (AcceptableValueBase)null, new object[1] { val });
		ConfigDescription val24 = new ConfigDescription("Applies Attributes.\n" + text27 + "\n" + text31, (AcceptableValueBase)null, new object[1] { val });
		ConfigDescription val25 = new ConfigDescription("Modify Outgoing Damage Types.\n" + text28 + "\n" + text31, (AcceptableValueBase)null, new object[1] { val });
		ConfigDescription val26 = new ConfigDescription("Modify Outgoing Damage Types by Value Percent.\n" + text25 + "\n" + text31, (AcceptableValueBase)null, new object[1] { val });
		ConfigDescription val27 = new ConfigDescription("Decrease Fall Damage by Value Percent.\n" + text26, (AcceptableValueBase)null, new object[1] { val });
		ConfigDescription val28 = new ConfigDescription("Decrease Heat Damage by Value Percent.\n" + text26, (AcceptableValueBase)null, new object[1] { val });
		ConfigDescription val29 = new ConfigDescription("Modify Incoming Damage Types.\n" + text29 + "\n" + text31, (AcceptableValueBase)null, new object[1] { val });
		ConfigDescription val30 = new ConfigDescription("Modify Incoming Damage Types by Value Percent.\n" + text30 + "\n" + text31, (AcceptableValueBase)null, new object[1] { val });
		ConfigDescription val31 = new ConfigDescription("Corpse Run from Tombstones.\n" + text33, (AcceptableValueBase)null, new object[1] { val });
		ConfigEntry_Button_PowerCycle = ((BaseUnityPlugin)this).Config.Bind<KeyCode>("C00 Client", "PowerCycle", (KeyCode)103, val2);
		ConfigEntry_General_Preset = ((BaseUnityPlugin)this).Config.Bind<string>("S00 Server: General", "Preset", "Vanilla+", val3);
		ConfigEntry_General_GuardianPower_ActiveDuration = ((BaseUnityPlugin)this).Config.Bind<int>("S00 Server: General", "PowerActiveDuration", 60, val4);
		ConfigEntry_General_GuardianPower_CooldownDuration = ((BaseUnityPlugin)this).Config.Bind<int>("S00 Server: General", "PowerCooldownDuration", 240, val5);
		ConfigEntry_PowerCycle_Bool = ((BaseUnityPlugin)this).Config.Bind<bool>("S00 Server: General", "Enable Power Cycling", true, val6);
		Config_SE_CorpseRun_Bool = ((BaseUnityPlugin)this).Config.Bind<bool>("SX1 Server: Corpse Run", "Enabled", true, val31);
		foreach (string list_BossName in List_BossNames)
		{
			foreach (string list_Component in List_Components)
			{
				string text34 = "S" + (List_BossNames.IndexOf(list_BossName) + 1) + (List_Components.IndexOf(list_Component) + 1) + " Server: " + list_BossName + " (" + list_Component + ")";
				Dictionary_ConfigEntry_Int["ConfigEntry_" + list_BossName + "_" + list_Component + "_MaxHealth"] = ((BaseUnityPlugin)this).Config.Bind<int>(text34, text, 0, val7);
				Dictionary_ConfigEntry_Int["ConfigEntry_" + list_BossName + "_" + list_Component + "_MaxHealth"] = ((BaseUnityPlugin)this).Config.Bind<int>(text34, text, 0, val7);
				Dictionary_ConfigEntry_Int["ConfigEntry_" + list_BossName + "_" + list_Component + "_HealthRegen"] = ((BaseUnityPlugin)this).Config.Bind<int>(text34, text2, 0, val8);
				Dictionary_ConfigEntry_Float["ConfigEntry_" + list_BossName + "_" + list_Component + "_HealthRegenModifier"] = ((BaseUnityPlugin)this).Config.Bind<float>(text34, text3, 0f, val9);
				Dictionary_ConfigEntry_Int["ConfigEntry_" + list_BossName + "_" + list_Component + "_MaxStamina"] = ((BaseUnityPlugin)this).Config.Bind<int>(text34, text4, 0, val10);
				Dictionary_ConfigEntry_Float["ConfigEntry_" + list_BossName + "_" + list_Component + "_StaminaRegenModifier"] = ((BaseUnityPlugin)this).Config.Bind<float>(text34, text5, 0f, val11);
				Dictionary_ConfigEntry_Int["ConfigEntry_" + list_BossName + "_" + list_Component + "_MaxEitr"] = ((BaseUnityPlugin)this).Config.Bind<int>(text34, text6, 0, val12);
				Dictionary_ConfigEntry_Float["ConfigEntry_" + list_BossName + "_" + list_Component + "_EitrRegenModifier"] = ((BaseUnityPlugin)this).Config.Bind<float>(text34, text7, 0f, val13);
				Dictionary_ConfigEntry_Int["ConfigEntry_" + list_BossName + "_" + list_Component + "_MaxWeight"] = ((BaseUnityPlugin)this).Config.Bind<int>(text34, text8, 0, val14);
				Dictionary_ConfigEntry_Float["ConfigEntry_" + list_BossName + "_" + list_Component + "_MoveSpeedModifier"] = ((BaseUnityPlugin)this).Config.Bind<float>(text34, text9, 0f, val15);
				Dictionary_ConfigEntry_Float["ConfigEntry_" + list_BossName + "_" + list_Component + "_JumpForceModifier"] = ((BaseUnityPlugin)this).Config.Bind<float>(text34, text10, 0f, val16);
				Dictionary_ConfigEntry_Float["ConfigEntry_" + list_BossName + "_" + list_Component + "_MaxFallSpeed"] = ((BaseUnityPlugin)this).Config.Bind<float>(text34, text11, 0f, val17);
				Dictionary_ConfigEntry_Float["ConfigEntry_" + list_BossName + "_" + list_Component + "_EquipmentSpeedModifier"] = ((BaseUnityPlugin)this).Config.Bind<float>(text34, text12, 0f, val18);
				Dictionary_ConfigEntry_Float["ConfigEntry_" + list_BossName + "_" + list_Component + "_WindSpeedModifier"] = ((BaseUnityPlugin)this).Config.Bind<float>(text34, text13, 0f, val19);
				Dictionary_ConfigEntry_Float["ConfigEntry_" + list_BossName + "_" + list_Component + "_RunStaminaCostModifier"] = ((BaseUnityPlugin)this).Config.Bind<float>(text34, text14, 0f, val20);
				Dictionary_ConfigEntry_Float["ConfigEntry_" + list_BossName + "_" + list_Component + "_JumpStaminaCostModifier"] = ((BaseUnityPlugin)this).Config.Bind<float>(text34, text15, 0f, val21);
				Dictionary_ConfigEntry_Float["ConfigEntry_" + list_BossName + "_" + list_Component + "_StealthModifier"] = ((BaseUnityPlugin)this).Config.Bind<float>(text34, text16, 0f, val22);
				Dictionary_ConfigEntry_Float["ConfigEntry_" + list_BossName + "_" + list_Component + "_NoiseModifier"] = ((BaseUnityPlugin)this).Config.Bind<float>(text34, text17, 0f, val23);
				Dictionary_ConfigEntry_String["ConfigEntry_" + list_BossName + "_" + list_Component + "_StatusAttributes"] = ((BaseUnityPlugin)this).Config.Bind<string>(text34, text18, "", val24);
				Dictionary_ConfigEntry_String["ConfigEntry_" + list_BossName + "_" + list_Component + "_OutgoingDamageTypes"] = ((BaseUnityPlugin)this).Config.Bind<string>(text34, text19, "", val25);
				Dictionary_ConfigEntry_String["ConfigEntry_" + list_BossName + "_" + list_Component + "_OutgoingDamageModifiers"] = ((BaseUnityPlugin)this).Config.Bind<string>(text34, text20, "", val26);
				Dictionary_ConfigEntry_Float["ConfigEntry_" + list_BossName + "_" + list_Component + "_FallDamageModifier"] = ((BaseUnityPlugin)this).Config.Bind<float>(text34, text21, 0f, val27);
				Dictionary_ConfigEntry_Float["ConfigEntry_" + list_BossName + "_" + list_Component + "_HeatDamageModifier"] = ((BaseUnityPlugin)this).Config.Bind<float>(text34, text22, 0f, val28);
				Dictionary_ConfigEntry_String["ConfigEntry_" + list_BossName + "_" + list_Component + "_IncomingDamageTypes"] = ((BaseUnityPlugin)this).Config.Bind<string>(text34, text23, "", val29);
				Dictionary_ConfigEntry_String["ConfigEntry_" + list_BossName + "_" + list_Component + "_IncomingDamageModifiers"] = ((BaseUnityPlugin)this).Config.Bind<string>(text34, text24, "", val30);
			}
		}
		((BaseUnityPlugin)this).Config.SettingChanged += Config_SettingChanged;
		((BaseUnityPlugin)this).Config.SaveOnConfigSet = true;
		((BaseUnityPlugin)this).Config.Save();
	}

	private static void Config_SettingChanged(object New_Object, EventArgs New_EventArgs)
	{
		Config_SettingRead();
	}

	private static void Config_SettingRead()
	{
		//IL_09c0: Unknown result type (might be due to invalid IL or missing references)
		//IL_09c9: Unknown result type (might be due to invalid IL or missing references)
		//IL_09d1: Unknown result type (might be due to invalid IL or missing references)
		//IL_09d6: Unknown result type (might be due to invalid IL or missing references)
		//IL_09e0: Unknown result type (might be due to invalid IL or missing references)
		//IL_09e9: Unknown result type (might be due to invalid IL or missing references)
		//IL_09f1: Unknown result type (might be due to invalid IL or missing references)
		//IL_09f6: Unknown result type (might be due to invalid IL or missing references)
		//IL_0a00: Unknown result type (might be due to invalid IL or missing references)
		//IL_0a09: Unknown result type (might be due to invalid IL or missing references)
		//IL_0a11: Unknown result type (might be due to invalid IL or missing references)
		//IL_0a16: Unknown result type (might be due to invalid IL or missing references)
		//IL_0a45: Unknown result type (might be due to invalid IL or missing references)
		//IL_0a52: Unknown result type (might be due to invalid IL or missing references)
		//IL_0a5a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0a5f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0a69: Unknown result type (might be due to invalid IL or missing references)
		//IL_0a73: Unknown result type (might be due to invalid IL or missing references)
		//IL_0a7b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0a80: Unknown result type (might be due to invalid IL or missing references)
		//IL_0a8a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0a94: Unknown result type (might be due to invalid IL or missing references)
		//IL_0a9c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0aa1: Unknown result type (might be due to invalid IL or missing references)
		//IL_0b6a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0b74: Unknown result type (might be due to invalid IL or missing references)
		//IL_0b79: Unknown result type (might be due to invalid IL or missing references)
		//IL_0ca6: Unknown result type (might be due to invalid IL or missing references)
		//IL_0caf: Unknown result type (might be due to invalid IL or missing references)
		//IL_0cb7: Unknown result type (might be due to invalid IL or missing references)
		//IL_0cbc: Unknown result type (might be due to invalid IL or missing references)
		//IL_0cc6: Unknown result type (might be due to invalid IL or missing references)
		//IL_0ccf: Unknown result type (might be due to invalid IL or missing references)
		//IL_0cd7: Unknown result type (might be due to invalid IL or missing references)
		//IL_0cdc: Unknown result type (might be due to invalid IL or missing references)
		//IL_0ce6: Unknown result type (might be due to invalid IL or missing references)
		//IL_0cef: Unknown result type (might be due to invalid IL or missing references)
		//IL_0cf7: Unknown result type (might be due to invalid IL or missing references)
		//IL_0cfc: Unknown result type (might be due to invalid IL or missing references)
		//IL_0dd4: Unknown result type (might be due to invalid IL or missing references)
		//IL_0de1: Unknown result type (might be due to invalid IL or missing references)
		//IL_0de9: Unknown result type (might be due to invalid IL or missing references)
		//IL_0dee: Unknown result type (might be due to invalid IL or missing references)
		//IL_0df8: Unknown result type (might be due to invalid IL or missing references)
		//IL_0e02: Unknown result type (might be due to invalid IL or missing references)
		//IL_0e0a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0e0f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0e19: Unknown result type (might be due to invalid IL or missing references)
		//IL_0e23: Unknown result type (might be due to invalid IL or missing references)
		//IL_0e2b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0e30: Unknown result type (might be due to invalid IL or missing references)
		//IL_0fae: Unknown result type (might be due to invalid IL or missing references)
		//IL_0fb7: Unknown result type (might be due to invalid IL or missing references)
		//IL_0fbf: Unknown result type (might be due to invalid IL or missing references)
		//IL_0fc4: Unknown result type (might be due to invalid IL or missing references)
		//IL_0fce: Unknown result type (might be due to invalid IL or missing references)
		//IL_0fd7: Unknown result type (might be due to invalid IL or missing references)
		//IL_0fdf: Unknown result type (might be due to invalid IL or missing references)
		//IL_0fe4: Unknown result type (might be due to invalid IL or missing references)
		//IL_0fee: Unknown result type (might be due to invalid IL or missing references)
		//IL_0ff7: Unknown result type (might be due to invalid IL or missing references)
		//IL_0fff: Unknown result type (might be due to invalid IL or missing references)
		//IL_1004: Unknown result type (might be due to invalid IL or missing references)
		//IL_1033: Unknown result type (might be due to invalid IL or missing references)
		//IL_1040: Unknown result type (might be due to invalid IL or missing references)
		//IL_1048: Unknown result type (might be due to invalid IL or missing references)
		//IL_104d: Unknown result type (might be due to invalid IL or missing references)
		//IL_1057: Unknown result type (might be due to invalid IL or missing references)
		//IL_1061: Unknown result type (might be due to invalid IL or missing references)
		//IL_1069: Unknown result type (might be due to invalid IL or missing references)
		//IL_106e: Unknown result type (might be due to invalid IL or missing references)
		//IL_1078: Unknown result type (might be due to invalid IL or missing references)
		//IL_1082: Unknown result type (might be due to invalid IL or missing references)
		//IL_108a: Unknown result type (might be due to invalid IL or missing references)
		//IL_108f: Unknown result type (might be due to invalid IL or missing references)
		//IL_04b0: Unknown result type (might be due to invalid IL or missing references)
		//IL_04f6: Unknown result type (might be due to invalid IL or missing references)
		//IL_04a9: Unknown result type (might be due to invalid IL or missing references)
		//IL_04fb: Unknown result type (might be due to invalid IL or missing references)
		if (ConfigEntry_General_Preset.Value == "Custom")
		{
			foreach (string list_BossName in List_BossNames)
			{
				int index = list_BossName switch
				{
					"Eikthyr" => 0, 
					"TheElder" => 1, 
					"Bonemass" => 2, 
					"Moder" => 3, 
					"Yagluth" => 4, 
					"Queen" => 5, 
					"Fader" => 6, 
					_ => 0, 
				};
				foreach (string list_Component in List_Components)
				{
					StatusEffect_FPO statusEffect_FPO = list_Component switch
					{
						"Passive" => List_StatusEffect_FPO_Passive[index], 
						"Equipped" => List_StatusEffect_FPO_Equipped[index], 
						"Active" => List_StatusEffect_FPO_Active[index], 
						"Shared" => List_StatusEffect_FPO_Shared[index], 
						_ => null, 
					};
					if ((Object)(object)statusEffect_FPO != (Object)null)
					{
						statusEffect_FPO.m_MaxHealth = Dictionary_ConfigEntry_Int["ConfigEntry_" + list_BossName + "_" + list_Component + "_MaxHealth"].Value;
						statusEffect_FPO.m_HealthRegen = Dictionary_ConfigEntry_Int["ConfigEntry_" + list_BossName + "_" + list_Component + "_HealthRegen"].Value;
						((SE_Stats)statusEffect_FPO).m_healthRegenMultiplier = 1f + Dictionary_ConfigEntry_Float["ConfigEntry_" + list_BossName + "_" + list_Component + "_HealthRegenModifier"].Value / 100f;
						statusEffect_FPO.m_MaxStamina = Dictionary_ConfigEntry_Int["ConfigEntry_" + list_BossName + "_" + list_Component + "_MaxStamina"].Value;
						((SE_Stats)statusEffect_FPO).m_staminaRegenMultiplier = 1f + Dictionary_ConfigEntry_Float["ConfigEntry_" + list_BossName + "_" + list_Component + "_StaminaRegenModifier"].Value / 100f;
						statusEffect_FPO.m_MaxEitr = Dictionary_ConfigEntry_Int["ConfigEntry_" + list_BossName + "_" + list_Component + "_MaxEitr"].Value;
						((SE_Stats)statusEffect_FPO).m_eitrRegenMultiplier = 1f + Dictionary_ConfigEntry_Float["ConfigEntry_" + list_BossName + "_" + list_Component + "_EitrRegenModifier"].Value / 100f;
						((SE_Stats)statusEffect_FPO).m_addMaxCarryWeight = Dictionary_ConfigEntry_Int["ConfigEntry_" + list_BossName + "_" + list_Component + "_MaxWeight"].Value;
						((SE_Stats)statusEffect_FPO).m_speedModifier = 0f + Dictionary_ConfigEntry_Float["ConfigEntry_" + list_BossName + "_" + list_Component + "_MoveSpeedModifier"].Value / 100f;
						((SE_Stats)statusEffect_FPO).m_jumpModifier = ((Dictionary_ConfigEntry_Float["ConfigEntry_" + list_BossName + "_" + list_Component + "_JumpForceModifier"].Value != 0f) ? (Vector3.one * (Dictionary_ConfigEntry_Float["ConfigEntry_" + list_BossName + "_" + list_Component + "_JumpForceModifier"].Value / 200f)) : Vector3.zero);
						((SE_Stats)statusEffect_FPO).m_maxMaxFallSpeed = 0f + Dictionary_ConfigEntry_Float["ConfigEntry_" + list_BossName + "_" + list_Component + "_MaxFallSpeed"].Value;
						statusEffect_FPO.m_EquipmentSpeedModifier = 0f - Dictionary_ConfigEntry_Float["ConfigEntry_" + list_BossName + "_" + list_Component + "_EquipmentSpeedModifier"].Value / 100f;
						statusEffect_FPO.m_WindSpeedModifier = 0f + Dictionary_ConfigEntry_Float["ConfigEntry_" + list_BossName + "_" + list_Component + "_WindSpeedModifier"].Value / 100f;
						((SE_Stats)statusEffect_FPO).m_runStaminaDrainModifier = 0f - Dictionary_ConfigEntry_Float["ConfigEntry_" + list_BossName + "_" + list_Component + "_RunStaminaCostModifier"].Value / 100f;
						((SE_Stats)statusEffect_FPO).m_jumpStaminaUseModifier = 0f - Dictionary_ConfigEntry_Float["ConfigEntry_" + list_BossName + "_" + list_Component + "_JumpStaminaCostModifier"].Value / 100f;
						((SE_Stats)statusEffect_FPO).m_stealthModifier = 0f - Dictionary_ConfigEntry_Float["ConfigEntry_" + list_BossName + "_" + list_Component + "_StealthModifier"].Value / 100f;
						((SE_Stats)statusEffect_FPO).m_noiseModifier = 0f - Dictionary_ConfigEntry_Float["ConfigEntry_" + list_BossName + "_" + list_Component + "_NoiseModifier"].Value / 100f;
						statusEffect_FPO.m_StatusAttributes = GetStatusAttributes(Dictionary_ConfigEntry_String["ConfigEntry_" + list_BossName + "_" + list_Component + "_StatusAttributes"].Value);
						statusEffect_FPO.m_OutgoingDamageTypes = GetOutgoingDamages(Dictionary_ConfigEntry_String["ConfigEntry_" + list_BossName + "_" + list_Component + "_OutgoingDamageTypes"].Value, Dictionary_ConfigEntry_String["ConfigEntry_" + list_BossName + "_" + list_Component + "_OutgoingDamageModifiers"].Value, out var Out_OutgoingDamageModifiers);
						statusEffect_FPO.m_OutgoingDamageModifiers = Out_OutgoingDamageModifiers;
						((SE_Stats)statusEffect_FPO).m_fallDamageModifier = 0f - Dictionary_ConfigEntry_Float["ConfigEntry_" + list_BossName + "_" + list_Component + "_FallDamageModifier"].Value / 100f;
						statusEffect_FPO.m_HeatDamageModifier = 0f - Dictionary_ConfigEntry_Float["ConfigEntry_" + list_BossName + "_" + list_Component + "_HeatDamageModifier"].Value / 100f;
						((SE_Stats)statusEffect_FPO).m_mods = GetIncomingDamages(Dictionary_ConfigEntry_String["ConfigEntry_" + list_BossName + "_" + list_Component + "_IncomingDamageTypes"].Value, Dictionary_ConfigEntry_String["ConfigEntry_" + list_BossName + "_" + list_Component + "_IncomingDamageModifiers"].Value);
					}
				}
			}
		}
		if (ConfigEntry_General_Preset.Value == "Vanilla")
		{
			Config_SettingReset();
			((SE_Stats)StatusEffect_FPO_Eikthyr_Active).m_runStaminaDrainModifier = -0.6f;
			((SE_Stats)StatusEffect_FPO_Eikthyr_Active).m_jumpStaminaUseModifier = -0.6f;
			StatusEffect_FPO_TheElder_Active.m_OutgoingDamageTypes = new List<SkillType> { (SkillType)13 };
			StatusEffect_FPO_TheElder_Active.m_OutgoingDamageModifiers = new List<float> { 0.6f };
			((SE_Stats)StatusEffect_FPO_Bonemass_Active).m_mods = new List<DamageModPair>
			{
				new DamageModPair
				{
					m_type = (DamageType)4,
					m_modifier = (DamageModifier)1
				},
				new DamageModPair
				{
					m_type = (DamageType)2,
					m_modifier = (DamageModifier)1
				},
				new DamageModPair
				{
					m_type = (DamageType)1,
					m_modifier = (DamageModifier)1
				}
			};
			StatusEffect_FPO_Moder_Active.m_StatusAttributes = new List<StatusAttribute> { (StatusAttribute)4 };
			((SE_Stats)StatusEffect_FPO_Yagluth_Active).m_mods = new List<DamageModPair>
			{
				new DamageModPair
				{
					m_type = (DamageType)128,
					m_modifier = (DamageModifier)1
				},
				new DamageModPair
				{
					m_type = (DamageType)64,
					m_modifier = (DamageModifier)1
				},
				new DamageModPair
				{
					m_type = (DamageType)32,
					m_modifier = (DamageModifier)1
				}
			};
			((SE_Stats)StatusEffect_FPO_Queen_Active).m_eitrRegenMultiplier = 2f;
			StatusEffect_FPO_Queen_Active.m_OutgoingDamageTypes = new List<SkillType> { (SkillType)12 };
			StatusEffect_FPO_Queen_Active.m_OutgoingDamageModifiers = new List<float> { 0.6f };
			((SE_Stats)StatusEffect_FPO_Fader_Active).m_addMaxCarryWeight = 300f;
			((SE_Stats)StatusEffect_FPO_Fader_Active).m_speedModifier = 0.1f;
		}
		if (ConfigEntry_General_Preset.Value == "Vanilla+")
		{
			Config_SettingReset();
			StatusEffect_FPO_Eikthyr_Passive.m_MaxStamina = 25f;
			StatusEffect_FPO_Eikthyr_Passive.m_EquipmentSpeedModifier = -0.5f;
			((SE_Stats)StatusEffect_FPO_Eikthyr_Equipped).m_staminaRegenMultiplier = 2f;
			((SE_Stats)StatusEffect_FPO_Eikthyr_Equipped).m_speedModifier = 0.1f;
			((SE_Stats)StatusEffect_FPO_Eikthyr_Equipped).m_jumpModifier = Vector3.one * 0.25f;
			StatusEffect_FPO_Eikthyr_Active.m_EquipmentSpeedModifier = -0.5f;
			((SE_Stats)StatusEffect_FPO_Eikthyr_Active).m_runStaminaDrainModifier = -0.5f;
			((SE_Stats)StatusEffect_FPO_Eikthyr_Active).m_jumpStaminaUseModifier = -0.5f;
			((SE_Stats)StatusEffect_FPO_Eikthyr_Shared).m_staminaRegenMultiplier = 1.5f;
			StatusEffect_FPO_TheElder_Passive.m_MaxHealth = 10f;
			StatusEffect_FPO_TheElder_Passive.m_HealthRegen = 1f;
			((SE_Stats)StatusEffect_FPO_TheElder_Passive).m_addMaxCarryWeight = 50f;
			StatusEffect_FPO_TheElder_Equipped.m_OutgoingDamageTypes = new List<SkillType> { (SkillType)13 };
			StatusEffect_FPO_TheElder_Equipped.m_OutgoingDamageModifiers = new List<float> { 3f };
			StatusEffect_FPO_TheElder_Active.m_OutgoingDamageTypes = new List<SkillType>
			{
				(SkillType)7,
				(SkillType)2,
				(SkillType)1
			};
			StatusEffect_FPO_TheElder_Active.m_OutgoingDamageModifiers = new List<float> { 1f, 1f, 1f };
			((SE_Stats)StatusEffect_FPO_TheElder_Shared).m_healthRegenMultiplier = 1.5f;
			StatusEffect_FPO_Bonemass_Passive.m_MaxHealth = 15f;
			((SE_Stats)StatusEffect_FPO_Bonemass_Equipped).m_healthRegenMultiplier = 2f;
			((SE_Stats)StatusEffect_FPO_Bonemass_Active).m_mods = new List<DamageModPair>
			{
				new DamageModPair
				{
					m_type = (DamageType)4,
					m_modifier = (DamageModifier)1
				},
				new DamageModPair
				{
					m_type = (DamageType)2,
					m_modifier = (DamageModifier)1
				},
				new DamageModPair
				{
					m_type = (DamageType)1,
					m_modifier = (DamageModifier)1
				}
			};
			((SE_Stats)StatusEffect_FPO_Bonemass_Shared).m_healthRegenMultiplier = 1.5f;
			((SE_Stats)StatusEffect_FPO_Moder_Passive).m_fallDamageModifier = -0.5f;
			StatusEffect_FPO_Moder_Equipped.m_WindSpeedModifier = 1f;
			StatusEffect_FPO_Moder_Equipped.m_StatusAttributes = new List<StatusAttribute> { (StatusAttribute)4 };
			((SE_Stats)StatusEffect_FPO_Moder_Active).m_maxMaxFallSpeed = 5f;
			((SE_Stats)StatusEffect_FPO_Moder_Active).m_fallDamageModifier = -1f;
			((SE_Stats)StatusEffect_FPO_Moder_Shared).m_speedModifier = 0.1f;
			StatusEffect_FPO_Yagluth_Passive.m_MaxEitr = 20f;
			((SE_Stats)StatusEffect_FPO_Yagluth_Equipped).m_eitrRegenMultiplier = 2f;
			StatusEffect_FPO_Yagluth_Active.m_OutgoingDamageTypes = new List<SkillType> { (SkillType)9 };
			StatusEffect_FPO_Yagluth_Active.m_OutgoingDamageModifiers = new List<float> { 1f };
			((SE_Stats)StatusEffect_FPO_Yagluth_Active).m_mods = new List<DamageModPair>
			{
				new DamageModPair
				{
					m_type = (DamageType)128,
					m_modifier = (DamageModifier)1
				},
				new DamageModPair
				{
					m_type = (DamageType)64,
					m_modifier = (DamageModifier)1
				},
				new DamageModPair
				{
					m_type = (DamageType)32,
					m_modifier = (DamageModifier)1
				}
			};
			((SE_Stats)StatusEffect_FPO_Yagluth_Shared).m_eitrRegenMultiplier = 1.5f;
			StatusEffect_FPO_Queen_Passive.m_MaxEitr = 30f;
			((SE_Stats)StatusEffect_FPO_Queen_Passive).m_addMaxCarryWeight = 50f;
			StatusEffect_FPO_Queen_Equipped.m_OutgoingDamageTypes = new List<SkillType> { (SkillType)12 };
			StatusEffect_FPO_Queen_Equipped.m_OutgoingDamageModifiers = new List<float> { 3f };
			StatusEffect_FPO_Queen_Active.m_OutgoingDamageTypes = new List<SkillType> { (SkillType)10 };
			StatusEffect_FPO_Queen_Active.m_OutgoingDamageModifiers = new List<float> { 1f };
			((SE_Stats)StatusEffect_FPO_Queen_Shared).m_eitrRegenMultiplier = 1.5f;
			StatusEffect_FPO_Fader_Passive.m_MaxStamina = 50f;
			((SE_Stats)StatusEffect_FPO_Fader_Passive).m_addMaxCarryWeight = 200f;
			StatusEffect_FPO_Fader_Equipped.m_HeatDamageModifier = -0.6f;
			StatusEffect_FPO_Fader_Active.m_HeatDamageModifier = -1f;
			((SE_Stats)StatusEffect_FPO_Fader_Shared).m_speedModifier = 0.1f;
			((SE_Stats)StatusEffect_FPO_Fader_Shared).m_staminaRegenMultiplier = 1.5f;
		}
		if (ConfigEntry_General_Preset.Value == "Passive Powers")
		{
			Config_SettingReset();
			((SE_Stats)StatusEffect_FPO_Eikthyr_Passive).m_runStaminaDrainModifier = -0.6f;
			((SE_Stats)StatusEffect_FPO_Eikthyr_Passive).m_jumpStaminaUseModifier = -0.6f;
			StatusEffect_FPO_TheElder_Passive.m_OutgoingDamageTypes = new List<SkillType> { (SkillType)13 };
			StatusEffect_FPO_TheElder_Passive.m_OutgoingDamageModifiers = new List<float> { 0.6f };
			((SE_Stats)StatusEffect_FPO_Bonemass_Passive).m_mods = new List<DamageModPair>
			{
				new DamageModPair
				{
					m_type = (DamageType)4,
					m_modifier = (DamageModifier)1
				},
				new DamageModPair
				{
					m_type = (DamageType)2,
					m_modifier = (DamageModifier)1
				},
				new DamageModPair
				{
					m_type = (DamageType)1,
					m_modifier = (DamageModifier)1
				}
			};
			StatusEffect_FPO_Moder_Passive.m_StatusAttributes = new List<StatusAttribute> { (StatusAttribute)4 };
			((SE_Stats)StatusEffect_FPO_Yagluth_Passive).m_mods = new List<DamageModPair>
			{
				new DamageModPair
				{
					m_type = (DamageType)128,
					m_modifier = (DamageModifier)1
				},
				new DamageModPair
				{
					m_type = (DamageType)64,
					m_modifier = (DamageModifier)1
				},
				new DamageModPair
				{
					m_type = (DamageType)32,
					m_modifier = (DamageModifier)1
				}
			};
			((SE_Stats)StatusEffect_FPO_Queen_Passive).m_eitrRegenMultiplier = 2f;
			StatusEffect_FPO_Queen_Passive.m_OutgoingDamageTypes = new List<SkillType> { (SkillType)12 };
			StatusEffect_FPO_Queen_Passive.m_OutgoingDamageModifiers = new List<float> { 0.6f };
			((SE_Stats)StatusEffect_FPO_Fader_Passive).m_addMaxCarryWeight = 300f;
			((SE_Stats)StatusEffect_FPO_Fader_Passive).m_speedModifier = 0.1f;
		}
		Update_Passive_Stats();
		Update_Active_Stats();
	}

	private static void Config_SettingReset()
	{
		//IL_0233: Unknown result type (might be due to invalid IL or missing references)
		//IL_0238: Unknown result type (might be due to invalid IL or missing references)
		foreach (string list_BossName in List_BossNames)
		{
			int index = list_BossName switch
			{
				"Eikthyr" => 0, 
				"TheElder" => 1, 
				"Bonemass" => 2, 
				"Moder" => 3, 
				"Yagluth" => 4, 
				"Queen" => 5, 
				"Fader" => 6, 
				_ => 0, 
			};
			foreach (string list_Component in List_Components)
			{
				StatusEffect_FPO statusEffect_FPO = list_Component switch
				{
					"Passive" => List_StatusEffect_FPO_Passive[index], 
					"Equipped" => List_StatusEffect_FPO_Equipped[index], 
					"Active" => List_StatusEffect_FPO_Active[index], 
					"Shared" => List_StatusEffect_FPO_Shared[index], 
					_ => null, 
				};
				if ((Object)(object)statusEffect_FPO != (Object)null)
				{
					statusEffect_FPO.m_MaxHealth = 0f;
					statusEffect_FPO.m_HealthRegen = 0f;
					((SE_Stats)statusEffect_FPO).m_healthRegenMultiplier = 1f;
					statusEffect_FPO.m_MaxStamina = 0f;
					((SE_Stats)statusEffect_FPO).m_staminaRegenMultiplier = 1f;
					statusEffect_FPO.m_MaxEitr = 0f;
					((SE_Stats)statusEffect_FPO).m_eitrRegenMultiplier = 1f;
					((SE_Stats)statusEffect_FPO).m_addMaxCarryWeight = 0f;
					((SE_Stats)statusEffect_FPO).m_speedModifier = 0f;
					((SE_Stats)statusEffect_FPO).m_jumpModifier = Vector3.zero;
					((SE_Stats)statusEffect_FPO).m_maxMaxFallSpeed = 0f;
					statusEffect_FPO.m_EquipmentSpeedModifier = 0f;
					statusEffect_FPO.m_WindSpeedModifier = 0f;
					((SE_Stats)statusEffect_FPO).m_runStaminaDrainModifier = 0f;
					((SE_Stats)statusEffect_FPO).m_jumpStaminaUseModifier = 0f;
					((SE_Stats)statusEffect_FPO).m_stealthModifier = 0f;
					((SE_Stats)statusEffect_FPO).m_noiseModifier = 0f;
					statusEffect_FPO.m_StatusAttributes = new List<StatusAttribute>();
					statusEffect_FPO.m_OutgoingDamageTypes = new List<SkillType>();
					statusEffect_FPO.m_OutgoingDamageModifiers = new List<float>();
					((SE_Stats)statusEffect_FPO).m_fallDamageModifier = 0f;
					statusEffect_FPO.m_HeatDamageModifier = 0f;
					((SE_Stats)statusEffect_FPO).m_mods = new List<DamageModPair>();
				}
			}
		}
	}

	private static void Add_Dictionaries()
	{
		Dictionary_ConfigEntry_Int.Clear();
		Dictionary_ConfigEntry_Float.Clear();
		Dictionary_ConfigEntry_String.Clear();
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Eikthyr_Passive_MaxHealth", ConfigEntry_Eikthyr_Passive_MaxHealth);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Eikthyr_Passive_HealthRegen", ConfigEntry_Eikthyr_Passive_HealthRegen);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Eikthyr_Passive_HealthRegenModifier", ConfigEntry_Eikthyr_Passive_HealthRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Eikthyr_Passive_MaxStamina", ConfigEntry_Eikthyr_Passive_MaxStamina);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Eikthyr_Passive_StaminaRegenModifier", ConfigEntry_Eikthyr_Passive_StaminaRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Eikthyr_Passive_MaxEitr", ConfigEntry_Eikthyr_Passive_MaxEitr);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Eikthyr_Passive_EitrRegenModifier", ConfigEntry_Eikthyr_Passive_EitrRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Eikthyr_Passive_MaxWeight", ConfigEntry_Eikthyr_Passive_MaxWeight);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Eikthyr_Passive_MoveSpeedModifier", ConfigEntry_Eikthyr_Passive_MoveSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Eikthyr_Passive_JumpForceModifier", ConfigEntry_Eikthyr_Passive_JumpForceModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Eikthyr_Passive_MaxFallSpeed", ConfigEntry_Eikthyr_Passive_MaxFallSpeed);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Eikthyr_Passive_EquipmentSpeedModifier", ConfigEntry_Eikthyr_Passive_EquipmentSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Eikthyr_Passive_WindSpeedModifier", ConfigEntry_Eikthyr_Passive_WindSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Eikthyr_Passive_RunStaminaCostModifier", ConfigEntry_Eikthyr_Passive_RunStaminaCostModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Eikthyr_Passive_JumpStaminaCostModifier", ConfigEntry_Eikthyr_Passive_JumpStaminaCostModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Eikthyr_Passive_StealthModifier", ConfigEntry_Eikthyr_Passive_StealthModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Eikthyr_Passive_NoiseModifier", ConfigEntry_Eikthyr_Passive_NoiseModifier);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Eikthyr_Passive_StatusAttributes", ConfigEntry_Eikthyr_Passive_StatusAttributes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Eikthyr_Passive_OutgoingDamageTypes", ConfigEntry_Eikthyr_Passive_OutgoingDamageTypes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Eikthyr_Passive_OutgoingDamageModifiers", ConfigEntry_Eikthyr_Passive_OutgoingDamageModifiers);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Eikthyr_Passive_FallDamageModifier", ConfigEntry_Eikthyr_Passive_FallDamageModifier);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Eikthyr_Passive_IncomingDamageTypes", ConfigEntry_Eikthyr_Passive_IncomingDamageTypes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Eikthyr_Passive_IncomingDamageModifiers", ConfigEntry_Eikthyr_Passive_IncomingDamageModifiers);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Eikthyr_Passive_HeatDamageModifier", ConfigEntry_Eikthyr_Passive_HeatDamageModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Eikthyr_Active_MaxHealth", ConfigEntry_Eikthyr_Active_MaxHealth);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Eikthyr_Active_HealthRegen", ConfigEntry_Eikthyr_Active_HealthRegen);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Eikthyr_Active_HealthRegenModifier", ConfigEntry_Eikthyr_Active_HealthRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Eikthyr_Active_MaxStamina", ConfigEntry_Eikthyr_Active_MaxStamina);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Eikthyr_Active_StaminaRegenModifier", ConfigEntry_Eikthyr_Active_StaminaRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Eikthyr_Active_MaxEitr", ConfigEntry_Eikthyr_Active_MaxEitr);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Eikthyr_Active_EitrRegenModifier", ConfigEntry_Eikthyr_Active_EitrRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Eikthyr_Active_MaxWeight", ConfigEntry_Eikthyr_Active_MaxWeight);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Eikthyr_Active_MoveSpeedModifier", ConfigEntry_Eikthyr_Active_MoveSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Eikthyr_Active_JumpForceModifier", ConfigEntry_Eikthyr_Active_JumpForceModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Eikthyr_Active_MaxFallSpeed", ConfigEntry_Eikthyr_Active_MaxFallSpeed);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Eikthyr_Active_EquipmentSpeedModifier", ConfigEntry_Eikthyr_Active_EquipmentSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Eikthyr_Active_WindSpeedModifier", ConfigEntry_Eikthyr_Active_WindSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Eikthyr_Active_RunStaminaCostModifier", ConfigEntry_Eikthyr_Active_RunStaminaCostModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Eikthyr_Active_JumpStaminaCostModifier", ConfigEntry_Eikthyr_Active_JumpStaminaCostModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Eikthyr_Active_StealthModifier", ConfigEntry_Eikthyr_Active_StealthModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Eikthyr_Active_NoiseModifier", ConfigEntry_Eikthyr_Active_NoiseModifier);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Eikthyr_Active_StatusAttributes", ConfigEntry_Eikthyr_Active_StatusAttributes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Eikthyr_Active_OutgoingDamageTypes", ConfigEntry_Eikthyr_Active_OutgoingDamageTypes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Eikthyr_Active_OutgoingDamageModifiers", ConfigEntry_Eikthyr_Active_OutgoingDamageModifiers);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Eikthyr_Active_FallDamageModifier", ConfigEntry_Eikthyr_Active_FallDamageModifier);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Eikthyr_Active_IncomingDamageTypes", ConfigEntry_Eikthyr_Active_IncomingDamageTypes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Eikthyr_Active_IncomingDamageModifiers", ConfigEntry_Eikthyr_Active_IncomingDamageModifiers);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Eikthyr_Active_HeatDamageModifier", ConfigEntry_Eikthyr_Active_HeatDamageModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Eikthyr_Shared_MaxHealth", ConfigEntry_Eikthyr_Shared_MaxHealth);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Eikthyr_Shared_HealthRegen", ConfigEntry_Eikthyr_Shared_HealthRegen);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Eikthyr_Shared_HealthRegenModifier", ConfigEntry_Eikthyr_Shared_HealthRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Eikthyr_Shared_MaxStamina", ConfigEntry_Eikthyr_Shared_MaxStamina);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Eikthyr_Shared_StaminaRegenModifier", ConfigEntry_Eikthyr_Shared_StaminaRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Eikthyr_Shared_MaxEitr", ConfigEntry_Eikthyr_Shared_MaxEitr);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Eikthyr_Shared_EitrRegenModifier", ConfigEntry_Eikthyr_Shared_EitrRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Eikthyr_Shared_MaxWeight", ConfigEntry_Eikthyr_Shared_MaxWeight);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Eikthyr_Shared_MoveSpeedModifier", ConfigEntry_Eikthyr_Shared_MoveSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Eikthyr_Shared_JumpForceModifier", ConfigEntry_Eikthyr_Shared_JumpForceModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Eikthyr_Shared_MaxFallSpeed", ConfigEntry_Eikthyr_Shared_MaxFallSpeed);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Eikthyr_Shared_EquipmentSpeedModifier", ConfigEntry_Eikthyr_Shared_EquipmentSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Eikthyr_Shared_WindSpeedModifier", ConfigEntry_Eikthyr_Shared_WindSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Eikthyr_Shared_RunStaminaCostModifier", ConfigEntry_Eikthyr_Shared_RunStaminaCostModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Eikthyr_Shared_JumpStaminaCostModifier", ConfigEntry_Eikthyr_Shared_JumpStaminaCostModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Eikthyr_Shared_StealthModifier", ConfigEntry_Eikthyr_Shared_StealthModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Eikthyr_Shared_NoiseModifier", ConfigEntry_Eikthyr_Shared_NoiseModifier);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Eikthyr_Shared_StatusAttributes", ConfigEntry_Eikthyr_Shared_StatusAttributes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Eikthyr_Shared_OutgoingDamageTypes", ConfigEntry_Eikthyr_Shared_OutgoingDamageTypes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Eikthyr_Shared_OutgoingDamageModifiers", ConfigEntry_Eikthyr_Shared_OutgoingDamageModifiers);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Eikthyr_Shared_FallDamageModifier", ConfigEntry_Eikthyr_Shared_FallDamageModifier);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Eikthyr_Shared_IncomingDamageTypes", ConfigEntry_Eikthyr_Shared_IncomingDamageTypes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Eikthyr_Shared_IncomingDamageModifiers", ConfigEntry_Eikthyr_Shared_IncomingDamageModifiers);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Eikthyr_Shared_HeatDamageModifier", ConfigEntry_Eikthyr_Shared_HeatDamageModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Eikthyr_Equipped_MaxHealth", ConfigEntry_Eikthyr_Equipped_MaxHealth);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Eikthyr_Equipped_HealthRegen", ConfigEntry_Eikthyr_Equipped_HealthRegen);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Eikthyr_Equipped_HealthRegenModifier", ConfigEntry_Eikthyr_Equipped_HealthRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Eikthyr_Equipped_MaxStamina", ConfigEntry_Eikthyr_Equipped_MaxStamina);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Eikthyr_Equipped_StaminaRegenModifier", ConfigEntry_Eikthyr_Equipped_StaminaRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Eikthyr_Equipped_MaxEitr", ConfigEntry_Eikthyr_Equipped_MaxEitr);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Eikthyr_Equipped_EitrRegenModifier", ConfigEntry_Eikthyr_Equipped_EitrRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Eikthyr_Equipped_MaxWeight", ConfigEntry_Eikthyr_Equipped_MaxWeight);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Eikthyr_Equipped_MoveSpeedModifier", ConfigEntry_Eikthyr_Equipped_MoveSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Eikthyr_Equipped_JumpForceModifier", ConfigEntry_Eikthyr_Equipped_JumpForceModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Eikthyr_Equipped_MaxFallSpeed", ConfigEntry_Eikthyr_Equipped_MaxFallSpeed);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Eikthyr_Equipped_EquipmentSpeedModifier", ConfigEntry_Eikthyr_Equipped_EquipmentSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Eikthyr_Equipped_WindSpeedModifier", ConfigEntry_Eikthyr_Equipped_WindSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Eikthyr_Equipped_RunStaminaCostModifier", ConfigEntry_Eikthyr_Equipped_RunStaminaCostModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Eikthyr_Equipped_JumpStaminaCostModifier", ConfigEntry_Eikthyr_Equipped_JumpStaminaCostModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Eikthyr_Equipped_StealthModifier", ConfigEntry_Eikthyr_Equipped_StealthModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Eikthyr_Equipped_NoiseModifier", ConfigEntry_Eikthyr_Equipped_NoiseModifier);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Eikthyr_Equipped_StatusAttributes", ConfigEntry_Eikthyr_Equipped_StatusAttributes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Eikthyr_Equipped_OutgoingDamageTypes", ConfigEntry_Eikthyr_Equipped_OutgoingDamageTypes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Eikthyr_Equipped_OutgoingDamageModifiers", ConfigEntry_Eikthyr_Equipped_OutgoingDamageModifiers);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Eikthyr_Equipped_FallDamageModifier", ConfigEntry_Eikthyr_Equipped_FallDamageModifier);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Eikthyr_Equipped_IncomingDamageTypes", ConfigEntry_Eikthyr_Equipped_IncomingDamageTypes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Eikthyr_Equipped_IncomingDamageModifiers", ConfigEntry_Eikthyr_Equipped_IncomingDamageModifiers);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Eikthyr_Equipped_HeatDamageModifier", ConfigEntry_Eikthyr_Equipped_HeatDamageModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_TheElder_Passive_MaxHealth", ConfigEntry_TheElder_Passive_MaxHealth);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_TheElder_Passive_HealthRegen", ConfigEntry_TheElder_Passive_HealthRegen);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_TheElder_Passive_HealthRegenModifier", ConfigEntry_TheElder_Passive_HealthRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_TheElder_Passive_MaxStamina", ConfigEntry_TheElder_Passive_MaxStamina);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_TheElder_Passive_StaminaRegenModifier", ConfigEntry_TheElder_Passive_StaminaRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_TheElder_Passive_MaxEitr", ConfigEntry_TheElder_Passive_MaxEitr);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_TheElder_Passive_EitrRegenModifier", ConfigEntry_TheElder_Passive_EitrRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_TheElder_Passive_MaxWeight", ConfigEntry_TheElder_Passive_MaxWeight);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_TheElder_Passive_MoveSpeedModifier", ConfigEntry_TheElder_Passive_MoveSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_TheElder_Passive_JumpForceModifier", ConfigEntry_TheElder_Passive_JumpForceModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_TheElder_Passive_MaxFallSpeed", ConfigEntry_TheElder_Passive_MaxFallSpeed);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_TheElder_Passive_EquipmentSpeedModifier", ConfigEntry_TheElder_Passive_EquipmentSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_TheElder_Passive_WindSpeedModifier", ConfigEntry_TheElder_Passive_WindSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_TheElder_Passive_RunStaminaCostModifier", ConfigEntry_TheElder_Passive_RunStaminaCostModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_TheElder_Passive_JumpStaminaCostModifier", ConfigEntry_TheElder_Passive_JumpStaminaCostModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_TheElder_Passive_StealthModifier", ConfigEntry_TheElder_Passive_StealthModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_TheElder_Passive_NoiseModifier", ConfigEntry_TheElder_Passive_NoiseModifier);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_TheElder_Passive_StatusAttributes", ConfigEntry_TheElder_Passive_StatusAttributes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_TheElder_Passive_OutgoingDamageTypes", ConfigEntry_TheElder_Passive_OutgoingDamageTypes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_TheElder_Passive_OutgoingDamageModifiers", ConfigEntry_TheElder_Passive_OutgoingDamageModifiers);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_TheElder_Passive_FallDamageModifier", ConfigEntry_TheElder_Passive_FallDamageModifier);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_TheElder_Passive_IncomingDamageTypes", ConfigEntry_TheElder_Passive_IncomingDamageTypes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_TheElder_Passive_IncomingDamageModifiers", ConfigEntry_TheElder_Passive_IncomingDamageModifiers);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_TheElder_Passive_HeatDamageModifier", ConfigEntry_TheElder_Passive_HeatDamageModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_TheElder_Active_MaxHealth", ConfigEntry_TheElder_Active_MaxHealth);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_TheElder_Active_HealthRegen", ConfigEntry_TheElder_Active_HealthRegen);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_TheElder_Active_HealthRegenModifier", ConfigEntry_TheElder_Active_HealthRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_TheElder_Active_MaxStamina", ConfigEntry_TheElder_Active_MaxStamina);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_TheElder_Active_StaminaRegenModifier", ConfigEntry_TheElder_Active_StaminaRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_TheElder_Active_MaxEitr", ConfigEntry_TheElder_Active_MaxEitr);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_TheElder_Active_EitrRegenModifier", ConfigEntry_TheElder_Active_EitrRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_TheElder_Active_MaxWeight", ConfigEntry_TheElder_Active_MaxWeight);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_TheElder_Active_MoveSpeedModifier", ConfigEntry_TheElder_Active_MoveSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_TheElder_Active_JumpForceModifier", ConfigEntry_TheElder_Active_JumpForceModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_TheElder_Active_MaxFallSpeed", ConfigEntry_TheElder_Active_MaxFallSpeed);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_TheElder_Active_EquipmentSpeedModifier", ConfigEntry_TheElder_Active_EquipmentSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_TheElder_Active_WindSpeedModifier", ConfigEntry_TheElder_Active_WindSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_TheElder_Active_RunStaminaCostModifier", ConfigEntry_TheElder_Active_RunStaminaCostModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_TheElder_Active_JumpStaminaCostModifier", ConfigEntry_TheElder_Active_JumpStaminaCostModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_TheElder_Active_StealthModifier", ConfigEntry_TheElder_Active_StealthModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_TheElder_Active_NoiseModifier", ConfigEntry_TheElder_Active_NoiseModifier);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_TheElder_Active_StatusAttributes", ConfigEntry_TheElder_Active_StatusAttributes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_TheElder_Active_OutgoingDamageTypes", ConfigEntry_TheElder_Active_OutgoingDamageTypes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_TheElder_Active_OutgoingDamageModifiers", ConfigEntry_TheElder_Active_OutgoingDamageModifiers);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_TheElder_Active_FallDamageModifier", ConfigEntry_TheElder_Active_FallDamageModifier);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_TheElder_Active_IncomingDamageTypes", ConfigEntry_TheElder_Active_IncomingDamageTypes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_TheElder_Active_IncomingDamageModifiers", ConfigEntry_TheElder_Active_IncomingDamageModifiers);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_TheElder_Active_HeatDamageModifier", ConfigEntry_TheElder_Active_HeatDamageModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_TheElder_Shared_MaxHealth", ConfigEntry_TheElder_Shared_MaxHealth);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_TheElder_Shared_HealthRegen", ConfigEntry_TheElder_Shared_HealthRegen);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_TheElder_Shared_HealthRegenModifier", ConfigEntry_TheElder_Shared_HealthRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_TheElder_Shared_MaxStamina", ConfigEntry_TheElder_Shared_MaxStamina);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_TheElder_Shared_StaminaRegenModifier", ConfigEntry_TheElder_Shared_StaminaRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_TheElder_Shared_MaxEitr", ConfigEntry_TheElder_Shared_MaxEitr);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_TheElder_Shared_EitrRegenModifier", ConfigEntry_TheElder_Shared_EitrRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_TheElder_Shared_MaxWeight", ConfigEntry_TheElder_Shared_MaxWeight);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_TheElder_Shared_MoveSpeedModifier", ConfigEntry_TheElder_Shared_MoveSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_TheElder_Shared_JumpForceModifier", ConfigEntry_TheElder_Shared_JumpForceModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_TheElder_Shared_MaxFallSpeed", ConfigEntry_TheElder_Shared_MaxFallSpeed);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_TheElder_Shared_EquipmentSpeedModifier", ConfigEntry_TheElder_Shared_EquipmentSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_TheElder_Shared_WindSpeedModifier", ConfigEntry_TheElder_Shared_WindSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_TheElder_Shared_RunStaminaCostModifier", ConfigEntry_TheElder_Shared_RunStaminaCostModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_TheElder_Shared_JumpStaminaCostModifier", ConfigEntry_TheElder_Shared_JumpStaminaCostModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_TheElder_Shared_StealthModifier", ConfigEntry_TheElder_Shared_StealthModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_TheElder_Shared_NoiseModifier", ConfigEntry_TheElder_Shared_NoiseModifier);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_TheElder_Shared_StatusAttributes", ConfigEntry_TheElder_Shared_StatusAttributes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_TheElder_Shared_OutgoingDamageTypes", ConfigEntry_TheElder_Shared_OutgoingDamageTypes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_TheElder_Shared_OutgoingDamageModifiers", ConfigEntry_TheElder_Shared_OutgoingDamageModifiers);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_TheElder_Shared_FallDamageModifier", ConfigEntry_TheElder_Shared_FallDamageModifier);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_TheElder_Shared_IncomingDamageTypes", ConfigEntry_TheElder_Shared_IncomingDamageTypes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_TheElder_Shared_IncomingDamageModifiers", ConfigEntry_TheElder_Shared_IncomingDamageModifiers);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_TheElder_Shared_HeatDamageModifier", ConfigEntry_TheElder_Shared_HeatDamageModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_TheElder_Equipped_MaxHealth", ConfigEntry_TheElder_Equipped_MaxHealth);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_TheElder_Equipped_HealthRegen", ConfigEntry_TheElder_Equipped_HealthRegen);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_TheElder_Equipped_HealthRegenModifier", ConfigEntry_TheElder_Equipped_HealthRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_TheElder_Equipped_MaxStamina", ConfigEntry_TheElder_Equipped_MaxStamina);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_TheElder_Equipped_StaminaRegenModifier", ConfigEntry_TheElder_Equipped_StaminaRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_TheElder_Equipped_MaxEitr", ConfigEntry_TheElder_Equipped_MaxEitr);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_TheElder_Equipped_EitrRegenModifier", ConfigEntry_TheElder_Equipped_EitrRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_TheElder_Equipped_MaxWeight", ConfigEntry_TheElder_Equipped_MaxWeight);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_TheElder_Equipped_MoveSpeedModifier", ConfigEntry_TheElder_Equipped_MoveSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_TheElder_Equipped_JumpForceModifier", ConfigEntry_TheElder_Equipped_JumpForceModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_TheElder_Equipped_MaxFallSpeed", ConfigEntry_TheElder_Equipped_MaxFallSpeed);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_TheElder_Equipped_EquipmentSpeedModifier", ConfigEntry_TheElder_Equipped_EquipmentSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_TheElder_Equipped_WindSpeedModifier", ConfigEntry_TheElder_Equipped_WindSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_TheElder_Equipped_RunStaminaCostModifier", ConfigEntry_TheElder_Equipped_RunStaminaCostModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_TheElder_Equipped_JumpStaminaCostModifier", ConfigEntry_TheElder_Equipped_JumpStaminaCostModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_TheElder_Equipped_StealthModifier", ConfigEntry_TheElder_Equipped_StealthModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_TheElder_Equipped_NoiseModifier", ConfigEntry_TheElder_Equipped_NoiseModifier);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_TheElder_Equipped_StatusAttributes", ConfigEntry_TheElder_Equipped_StatusAttributes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_TheElder_Equipped_OutgoingDamageTypes", ConfigEntry_TheElder_Equipped_OutgoingDamageTypes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_TheElder_Equipped_OutgoingDamageModifiers", ConfigEntry_TheElder_Equipped_OutgoingDamageModifiers);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_TheElder_Equipped_FallDamageModifier", ConfigEntry_TheElder_Equipped_FallDamageModifier);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_TheElder_Equipped_IncomingDamageTypes", ConfigEntry_TheElder_Equipped_IncomingDamageTypes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_TheElder_Equipped_IncomingDamageModifiers", ConfigEntry_TheElder_Equipped_IncomingDamageModifiers);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_TheElder_Equipped_HeatDamageModifier", ConfigEntry_TheElder_Equipped_HeatDamageModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Bonemass_Passive_MaxHealth", ConfigEntry_Bonemass_Passive_MaxHealth);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Bonemass_Passive_HealthRegen", ConfigEntry_Bonemass_Passive_HealthRegen);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Bonemass_Passive_HealthRegenModifier", ConfigEntry_Bonemass_Passive_HealthRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Bonemass_Passive_MaxStamina", ConfigEntry_Bonemass_Passive_MaxStamina);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Bonemass_Passive_StaminaRegenModifier", ConfigEntry_Bonemass_Passive_StaminaRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Bonemass_Passive_MaxEitr", ConfigEntry_Bonemass_Passive_MaxEitr);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Bonemass_Passive_EitrRegenModifier", ConfigEntry_Bonemass_Passive_EitrRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Bonemass_Passive_MaxWeight", ConfigEntry_Bonemass_Passive_MaxWeight);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Bonemass_Passive_MoveSpeedModifier", ConfigEntry_Bonemass_Passive_MoveSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Bonemass_Passive_JumpForceModifier", ConfigEntry_Bonemass_Passive_JumpForceModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Bonemass_Passive_MaxFallSpeed", ConfigEntry_Bonemass_Passive_MaxFallSpeed);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Bonemass_Passive_EquipmentSpeedModifier", ConfigEntry_Bonemass_Passive_EquipmentSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Bonemass_Passive_WindSpeedModifier", ConfigEntry_Bonemass_Passive_WindSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Bonemass_Passive_RunStaminaCostModifier", ConfigEntry_Bonemass_Passive_RunStaminaCostModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Bonemass_Passive_JumpStaminaCostModifier", ConfigEntry_Bonemass_Passive_JumpStaminaCostModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Bonemass_Passive_StealthModifier", ConfigEntry_Bonemass_Passive_StealthModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Bonemass_Passive_NoiseModifier", ConfigEntry_Bonemass_Passive_NoiseModifier);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Bonemass_Passive_StatusAttributes", ConfigEntry_Bonemass_Passive_StatusAttributes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Bonemass_Passive_OutgoingDamageTypes", ConfigEntry_Bonemass_Passive_OutgoingDamageTypes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Bonemass_Passive_OutgoingDamageModifiers", ConfigEntry_Bonemass_Passive_OutgoingDamageModifiers);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Bonemass_Passive_FallDamageModifier", ConfigEntry_Bonemass_Passive_FallDamageModifier);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Bonemass_Passive_IncomingDamageTypes", ConfigEntry_Bonemass_Passive_IncomingDamageTypes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Bonemass_Passive_IncomingDamageModifiers", ConfigEntry_Bonemass_Passive_IncomingDamageModifiers);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Bonemass_Passive_HeatDamageModifier", ConfigEntry_Bonemass_Passive_HeatDamageModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Bonemass_Active_MaxHealth", ConfigEntry_Bonemass_Active_MaxHealth);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Bonemass_Active_HealthRegen", ConfigEntry_Bonemass_Active_HealthRegen);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Bonemass_Active_HealthRegenModifier", ConfigEntry_Bonemass_Active_HealthRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Bonemass_Active_MaxStamina", ConfigEntry_Bonemass_Active_MaxStamina);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Bonemass_Active_StaminaRegenModifier", ConfigEntry_Bonemass_Active_StaminaRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Bonemass_Active_MaxEitr", ConfigEntry_Bonemass_Active_MaxEitr);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Bonemass_Active_EitrRegenModifier", ConfigEntry_Bonemass_Active_EitrRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Bonemass_Active_MaxWeight", ConfigEntry_Bonemass_Active_MaxWeight);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Bonemass_Active_MoveSpeedModifier", ConfigEntry_Bonemass_Active_MoveSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Bonemass_Active_JumpForceModifier", ConfigEntry_Bonemass_Active_JumpForceModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Bonemass_Active_MaxFallSpeed", ConfigEntry_Bonemass_Active_MaxFallSpeed);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Bonemass_Active_EquipmentSpeedModifier", ConfigEntry_Bonemass_Active_EquipmentSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Bonemass_Active_WindSpeedModifier", ConfigEntry_Bonemass_Active_WindSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Bonemass_Active_RunStaminaCostModifier", ConfigEntry_Bonemass_Active_RunStaminaCostModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Bonemass_Active_JumpStaminaCostModifier", ConfigEntry_Bonemass_Active_JumpStaminaCostModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Bonemass_Active_StealthModifier", ConfigEntry_Bonemass_Active_StealthModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Bonemass_Active_NoiseModifier", ConfigEntry_Bonemass_Active_NoiseModifier);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Bonemass_Active_StatusAttributes", ConfigEntry_Bonemass_Active_StatusAttributes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Bonemass_Active_OutgoingDamageTypes", ConfigEntry_Bonemass_Active_OutgoingDamageTypes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Bonemass_Active_OutgoingDamageModifiers", ConfigEntry_Bonemass_Active_OutgoingDamageModifiers);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Bonemass_Active_FallDamageModifier", ConfigEntry_Bonemass_Active_FallDamageModifier);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Bonemass_Active_IncomingDamageTypes", ConfigEntry_Bonemass_Active_IncomingDamageTypes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Bonemass_Active_IncomingDamageModifiers", ConfigEntry_Bonemass_Active_IncomingDamageModifiers);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Bonemass_Active_HeatDamageModifier", ConfigEntry_Bonemass_Active_HeatDamageModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Bonemass_Shared_MaxHealth", ConfigEntry_Bonemass_Shared_MaxHealth);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Bonemass_Shared_HealthRegen", ConfigEntry_Bonemass_Shared_HealthRegen);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Bonemass_Shared_HealthRegenModifier", ConfigEntry_Bonemass_Shared_HealthRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Bonemass_Shared_MaxStamina", ConfigEntry_Bonemass_Shared_MaxStamina);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Bonemass_Shared_StaminaRegenModifier", ConfigEntry_Bonemass_Shared_StaminaRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Bonemass_Shared_MaxEitr", ConfigEntry_Bonemass_Shared_MaxEitr);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Bonemass_Shared_EitrRegenModifier", ConfigEntry_Bonemass_Shared_EitrRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Bonemass_Shared_MaxWeight", ConfigEntry_Bonemass_Shared_MaxWeight);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Bonemass_Shared_MoveSpeedModifier", ConfigEntry_Bonemass_Shared_MoveSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Bonemass_Shared_JumpForceModifier", ConfigEntry_Bonemass_Shared_JumpForceModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Bonemass_Shared_MaxFallSpeed", ConfigEntry_Bonemass_Shared_MaxFallSpeed);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Bonemass_Shared_EquipmentSpeedModifier", ConfigEntry_Bonemass_Shared_EquipmentSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Bonemass_Shared_WindSpeedModifier", ConfigEntry_Bonemass_Shared_WindSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Bonemass_Shared_RunStaminaCostModifier", ConfigEntry_Bonemass_Shared_RunStaminaCostModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Bonemass_Shared_JumpStaminaCostModifier", ConfigEntry_Bonemass_Shared_JumpStaminaCostModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Bonemass_Shared_StealthModifier", ConfigEntry_Bonemass_Shared_StealthModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Bonemass_Shared_NoiseModifier", ConfigEntry_Bonemass_Shared_NoiseModifier);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Bonemass_Shared_StatusAttributes", ConfigEntry_Bonemass_Shared_StatusAttributes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Bonemass_Shared_OutgoingDamageTypes", ConfigEntry_Bonemass_Shared_OutgoingDamageTypes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Bonemass_Shared_OutgoingDamageModifiers", ConfigEntry_Bonemass_Shared_OutgoingDamageModifiers);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Bonemass_Shared_FallDamageModifier", ConfigEntry_Bonemass_Shared_FallDamageModifier);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Bonemass_Shared_IncomingDamageTypes", ConfigEntry_Bonemass_Shared_IncomingDamageTypes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Bonemass_Shared_IncomingDamageModifiers", ConfigEntry_Bonemass_Shared_IncomingDamageModifiers);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Bonemass_Shared_HeatDamageModifier", ConfigEntry_Bonemass_Shared_HeatDamageModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Bonemass_Equipped_MaxHealth", ConfigEntry_Bonemass_Equipped_MaxHealth);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Bonemass_Equipped_HealthRegen", ConfigEntry_Bonemass_Equipped_HealthRegen);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Bonemass_Equipped_HealthRegenModifier", ConfigEntry_Bonemass_Equipped_HealthRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Bonemass_Equipped_MaxStamina", ConfigEntry_Bonemass_Equipped_MaxStamina);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Bonemass_Equipped_StaminaRegenModifier", ConfigEntry_Bonemass_Equipped_StaminaRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Bonemass_Equipped_MaxEitr", ConfigEntry_Bonemass_Equipped_MaxEitr);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Bonemass_Equipped_EitrRegenModifier", ConfigEntry_Bonemass_Equipped_EitrRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Bonemass_Equipped_MaxWeight", ConfigEntry_Bonemass_Equipped_MaxWeight);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Bonemass_Equipped_MoveSpeedModifier", ConfigEntry_Bonemass_Equipped_MoveSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Bonemass_Equipped_JumpForceModifier", ConfigEntry_Bonemass_Equipped_JumpForceModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Bonemass_Equipped_MaxFallSpeed", ConfigEntry_Bonemass_Equipped_MaxFallSpeed);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Bonemass_Equipped_EquipmentSpeedModifier", ConfigEntry_Bonemass_Equipped_EquipmentSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Bonemass_Equipped_WindSpeedModifier", ConfigEntry_Bonemass_Equipped_WindSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Bonemass_Equipped_RunStaminaCostModifier", ConfigEntry_Bonemass_Equipped_RunStaminaCostModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Bonemass_Equipped_JumpStaminaCostModifier", ConfigEntry_Bonemass_Equipped_JumpStaminaCostModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Bonemass_Equipped_StealthModifier", ConfigEntry_Bonemass_Equipped_StealthModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Bonemass_Equipped_NoiseModifier", ConfigEntry_Bonemass_Equipped_NoiseModifier);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Bonemass_Equipped_StatusAttributes", ConfigEntry_Bonemass_Equipped_StatusAttributes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Bonemass_Equipped_OutgoingDamageTypes", ConfigEntry_Bonemass_Equipped_OutgoingDamageTypes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Bonemass_Equipped_OutgoingDamageModifiers", ConfigEntry_Bonemass_Equipped_OutgoingDamageModifiers);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Bonemass_Equipped_FallDamageModifier", ConfigEntry_Bonemass_Equipped_FallDamageModifier);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Bonemass_Equipped_IncomingDamageTypes", ConfigEntry_Bonemass_Equipped_IncomingDamageTypes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Bonemass_Equipped_IncomingDamageModifiers", ConfigEntry_Bonemass_Equipped_IncomingDamageModifiers);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Bonemass_Equipped_HeatDamageModifier", ConfigEntry_Bonemass_Equipped_HeatDamageModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Moder_Passive_MaxHealth", ConfigEntry_Moder_Passive_MaxHealth);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Moder_Passive_HealthRegen", ConfigEntry_Moder_Passive_HealthRegen);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Moder_Passive_HealthRegenModifier", ConfigEntry_Moder_Passive_HealthRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Moder_Passive_MaxStamina", ConfigEntry_Moder_Passive_MaxStamina);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Moder_Passive_StaminaRegenModifier", ConfigEntry_Moder_Passive_StaminaRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Moder_Passive_MaxEitr", ConfigEntry_Moder_Passive_MaxEitr);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Moder_Passive_EitrRegenModifier", ConfigEntry_Moder_Passive_EitrRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Moder_Passive_MaxWeight", ConfigEntry_Moder_Passive_MaxWeight);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Moder_Passive_MoveSpeedModifier", ConfigEntry_Moder_Passive_MoveSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Moder_Passive_JumpForceModifier", ConfigEntry_Moder_Passive_JumpForceModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Moder_Passive_MaxFallSpeed", ConfigEntry_Moder_Passive_MaxFallSpeed);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Moder_Passive_EquipmentSpeedModifier", ConfigEntry_Moder_Passive_EquipmentSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Moder_Passive_WindSpeedModifier", ConfigEntry_Moder_Passive_WindSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Moder_Passive_RunStaminaCostModifier", ConfigEntry_Moder_Passive_RunStaminaCostModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Moder_Passive_JumpStaminaCostModifier", ConfigEntry_Moder_Passive_JumpStaminaCostModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Moder_Passive_StealthModifier", ConfigEntry_Moder_Passive_StealthModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Moder_Passive_NoiseModifier", ConfigEntry_Moder_Passive_NoiseModifier);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Moder_Passive_StatusAttributes", ConfigEntry_Moder_Passive_StatusAttributes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Moder_Passive_OutgoingDamageTypes", ConfigEntry_Moder_Passive_OutgoingDamageTypes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Moder_Passive_OutgoingDamageModifiers", ConfigEntry_Moder_Passive_OutgoingDamageModifiers);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Moder_Passive_FallDamageModifier", ConfigEntry_Moder_Passive_FallDamageModifier);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Moder_Passive_IncomingDamageTypes", ConfigEntry_Moder_Passive_IncomingDamageTypes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Moder_Passive_IncomingDamageModifiers", ConfigEntry_Moder_Passive_IncomingDamageModifiers);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Moder_Passive_HeatDamageModifier", ConfigEntry_Moder_Passive_HeatDamageModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Moder_Active_MaxHealth", ConfigEntry_Moder_Active_MaxHealth);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Moder_Active_HealthRegen", ConfigEntry_Moder_Active_HealthRegen);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Moder_Active_HealthRegenModifier", ConfigEntry_Moder_Active_HealthRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Moder_Active_MaxStamina", ConfigEntry_Moder_Active_MaxStamina);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Moder_Active_StaminaRegenModifier", ConfigEntry_Moder_Active_StaminaRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Moder_Active_MaxEitr", ConfigEntry_Moder_Active_MaxEitr);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Moder_Active_EitrRegenModifier", ConfigEntry_Moder_Active_EitrRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Moder_Active_MaxWeight", ConfigEntry_Moder_Active_MaxWeight);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Moder_Active_MoveSpeedModifier", ConfigEntry_Moder_Active_MoveSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Moder_Active_JumpForceModifier", ConfigEntry_Moder_Active_JumpForceModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Moder_Active_MaxFallSpeed", ConfigEntry_Moder_Active_MaxFallSpeed);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Moder_Active_EquipmentSpeedModifier", ConfigEntry_Moder_Active_EquipmentSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Moder_Active_WindSpeedModifier", ConfigEntry_Moder_Active_WindSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Moder_Active_RunStaminaCostModifier", ConfigEntry_Moder_Active_RunStaminaCostModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Moder_Active_JumpStaminaCostModifier", ConfigEntry_Moder_Active_JumpStaminaCostModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Moder_Active_StealthModifier", ConfigEntry_Moder_Active_StealthModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Moder_Active_NoiseModifier", ConfigEntry_Moder_Active_NoiseModifier);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Moder_Active_StatusAttributes", ConfigEntry_Moder_Active_StatusAttributes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Moder_Active_OutgoingDamageTypes", ConfigEntry_Moder_Active_OutgoingDamageTypes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Moder_Active_OutgoingDamageModifiers", ConfigEntry_Moder_Active_OutgoingDamageModifiers);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Moder_Active_FallDamageModifier", ConfigEntry_Moder_Active_FallDamageModifier);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Moder_Active_IncomingDamageTypes", ConfigEntry_Moder_Active_IncomingDamageTypes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Moder_Active_IncomingDamageModifiers", ConfigEntry_Moder_Active_IncomingDamageModifiers);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Moder_Active_HeatDamageModifier", ConfigEntry_Moder_Active_HeatDamageModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Moder_Shared_MaxHealth", ConfigEntry_Moder_Shared_MaxHealth);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Moder_Shared_HealthRegen", ConfigEntry_Moder_Shared_HealthRegen);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Moder_Shared_HealthRegenModifier", ConfigEntry_Moder_Shared_HealthRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Moder_Shared_MaxStamina", ConfigEntry_Moder_Shared_MaxStamina);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Moder_Shared_StaminaRegenModifier", ConfigEntry_Moder_Shared_StaminaRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Moder_Shared_MaxEitr", ConfigEntry_Moder_Shared_MaxEitr);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Moder_Shared_EitrRegenModifier", ConfigEntry_Moder_Shared_EitrRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Moder_Shared_MaxWeight", ConfigEntry_Moder_Shared_MaxWeight);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Moder_Shared_MoveSpeedModifier", ConfigEntry_Moder_Shared_MoveSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Moder_Shared_JumpForceModifier", ConfigEntry_Moder_Shared_JumpForceModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Moder_Shared_MaxFallSpeed", ConfigEntry_Moder_Shared_MaxFallSpeed);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Moder_Shared_EquipmentSpeedModifier", ConfigEntry_Moder_Shared_EquipmentSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Moder_Shared_WindSpeedModifier", ConfigEntry_Moder_Shared_WindSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Moder_Shared_RunStaminaCostModifier", ConfigEntry_Moder_Shared_RunStaminaCostModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Moder_Shared_JumpStaminaCostModifier", ConfigEntry_Moder_Shared_JumpStaminaCostModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Moder_Shared_StealthModifier", ConfigEntry_Moder_Shared_StealthModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Moder_Shared_NoiseModifier", ConfigEntry_Moder_Shared_NoiseModifier);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Moder_Shared_StatusAttributes", ConfigEntry_Moder_Shared_StatusAttributes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Moder_Shared_OutgoingDamageTypes", ConfigEntry_Moder_Shared_OutgoingDamageTypes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Moder_Shared_OutgoingDamageModifiers", ConfigEntry_Moder_Shared_OutgoingDamageModifiers);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Moder_Shared_FallDamageModifier", ConfigEntry_Moder_Shared_FallDamageModifier);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Moder_Shared_IncomingDamageTypes", ConfigEntry_Moder_Shared_IncomingDamageTypes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Moder_Shared_IncomingDamageModifiers", ConfigEntry_Moder_Shared_IncomingDamageModifiers);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Moder_Shared_HeatDamageModifier", ConfigEntry_Moder_Shared_HeatDamageModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Moder_Equipped_MaxHealth", ConfigEntry_Moder_Equipped_MaxHealth);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Moder_Equipped_HealthRegen", ConfigEntry_Moder_Equipped_HealthRegen);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Moder_Equipped_HealthRegenModifier", ConfigEntry_Moder_Equipped_HealthRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Moder_Equipped_MaxStamina", ConfigEntry_Moder_Equipped_MaxStamina);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Moder_Equipped_StaminaRegenModifier", ConfigEntry_Moder_Equipped_StaminaRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Moder_Equipped_MaxEitr", ConfigEntry_Moder_Equipped_MaxEitr);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Moder_Equipped_EitrRegenModifier", ConfigEntry_Moder_Equipped_EitrRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Moder_Equipped_MaxWeight", ConfigEntry_Moder_Equipped_MaxWeight);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Moder_Equipped_MoveSpeedModifier", ConfigEntry_Moder_Equipped_MoveSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Moder_Equipped_JumpForceModifier", ConfigEntry_Moder_Equipped_JumpForceModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Moder_Equipped_MaxFallSpeed", ConfigEntry_Moder_Equipped_MaxFallSpeed);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Moder_Equipped_EquipmentSpeedModifier", ConfigEntry_Moder_Equipped_EquipmentSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Moder_Equipped_WindSpeedModifier", ConfigEntry_Moder_Equipped_WindSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Moder_Equipped_RunStaminaCostModifier", ConfigEntry_Moder_Equipped_RunStaminaCostModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Moder_Equipped_JumpStaminaCostModifier", ConfigEntry_Moder_Equipped_JumpStaminaCostModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Moder_Equipped_StealthModifier", ConfigEntry_Moder_Equipped_StealthModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Moder_Equipped_NoiseModifier", ConfigEntry_Moder_Equipped_NoiseModifier);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Moder_Equipped_StatusAttributes", ConfigEntry_Moder_Equipped_StatusAttributes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Moder_Equipped_OutgoingDamageTypes", ConfigEntry_Moder_Equipped_OutgoingDamageTypes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Moder_Equipped_OutgoingDamageModifiers", ConfigEntry_Moder_Equipped_OutgoingDamageModifiers);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Moder_Equipped_FallDamageModifier", ConfigEntry_Moder_Equipped_FallDamageModifier);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Moder_Equipped_IncomingDamageTypes", ConfigEntry_Moder_Equipped_IncomingDamageTypes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Moder_Equipped_IncomingDamageModifiers", ConfigEntry_Moder_Equipped_IncomingDamageModifiers);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Moder_Equipped_HeatDamageModifier", ConfigEntry_Moder_Equipped_HeatDamageModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Yagluth_Passive_MaxHealth", ConfigEntry_Yagluth_Passive_MaxHealth);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Yagluth_Passive_HealthRegen", ConfigEntry_Yagluth_Passive_HealthRegen);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Yagluth_Passive_HealthRegenModifier", ConfigEntry_Yagluth_Passive_HealthRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Yagluth_Passive_MaxStamina", ConfigEntry_Yagluth_Passive_MaxStamina);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Yagluth_Passive_StaminaRegenModifier", ConfigEntry_Yagluth_Passive_StaminaRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Yagluth_Passive_MaxEitr", ConfigEntry_Yagluth_Passive_MaxEitr);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Yagluth_Passive_EitrRegenModifier", ConfigEntry_Yagluth_Passive_EitrRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Yagluth_Passive_MaxWeight", ConfigEntry_Yagluth_Passive_MaxWeight);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Yagluth_Passive_MoveSpeedModifier", ConfigEntry_Yagluth_Passive_MoveSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Yagluth_Passive_JumpForceModifier", ConfigEntry_Yagluth_Passive_JumpForceModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Yagluth_Passive_MaxFallSpeed", ConfigEntry_Yagluth_Passive_MaxFallSpeed);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Yagluth_Passive_EquipmentSpeedModifier", ConfigEntry_Yagluth_Passive_EquipmentSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Yagluth_Passive_WindSpeedModifier", ConfigEntry_Yagluth_Passive_WindSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Yagluth_Passive_RunStaminaCostModifier", ConfigEntry_Yagluth_Passive_RunStaminaCostModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Yagluth_Passive_JumpStaminaCostModifier", ConfigEntry_Yagluth_Passive_JumpStaminaCostModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Yagluth_Passive_StealthModifier", ConfigEntry_Yagluth_Passive_StealthModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Yagluth_Passive_NoiseModifier", ConfigEntry_Yagluth_Passive_NoiseModifier);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Yagluth_Passive_StatusAttributes", ConfigEntry_Yagluth_Passive_StatusAttributes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Yagluth_Passive_OutgoingDamageTypes", ConfigEntry_Yagluth_Passive_OutgoingDamageTypes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Yagluth_Passive_OutgoingDamageModifiers", ConfigEntry_Yagluth_Passive_OutgoingDamageModifiers);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Yagluth_Passive_FallDamageModifier", ConfigEntry_Yagluth_Passive_FallDamageModifier);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Yagluth_Passive_IncomingDamageTypes", ConfigEntry_Yagluth_Passive_IncomingDamageTypes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Yagluth_Passive_IncomingDamageModifiers", ConfigEntry_Yagluth_Passive_IncomingDamageModifiers);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Yagluth_Passive_HeatDamageModifier", ConfigEntry_Yagluth_Passive_HeatDamageModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Yagluth_Active_MaxHealth", ConfigEntry_Yagluth_Active_MaxHealth);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Yagluth_Active_HealthRegen", ConfigEntry_Yagluth_Active_HealthRegen);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Yagluth_Active_HealthRegenModifier", ConfigEntry_Yagluth_Active_HealthRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Yagluth_Active_MaxStamina", ConfigEntry_Yagluth_Active_MaxStamina);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Yagluth_Active_StaminaRegenModifier", ConfigEntry_Yagluth_Active_StaminaRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Yagluth_Active_MaxEitr", ConfigEntry_Yagluth_Active_MaxEitr);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Yagluth_Active_EitrRegenModifier", ConfigEntry_Yagluth_Active_EitrRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Yagluth_Active_MaxWeight", ConfigEntry_Yagluth_Active_MaxWeight);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Yagluth_Active_MoveSpeedModifier", ConfigEntry_Yagluth_Active_MoveSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Yagluth_Active_JumpForceModifier", ConfigEntry_Yagluth_Active_JumpForceModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Yagluth_Active_MaxFallSpeed", ConfigEntry_Yagluth_Active_MaxFallSpeed);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Yagluth_Active_EquipmentSpeedModifier", ConfigEntry_Yagluth_Active_EquipmentSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Yagluth_Active_WindSpeedModifier", ConfigEntry_Yagluth_Active_WindSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Yagluth_Active_RunStaminaCostModifier", ConfigEntry_Yagluth_Active_RunStaminaCostModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Yagluth_Active_JumpStaminaCostModifier", ConfigEntry_Yagluth_Active_JumpStaminaCostModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Yagluth_Active_StealthModifier", ConfigEntry_Yagluth_Active_StealthModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Yagluth_Active_NoiseModifier", ConfigEntry_Yagluth_Active_NoiseModifier);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Yagluth_Active_StatusAttributes", ConfigEntry_Yagluth_Active_StatusAttributes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Yagluth_Active_OutgoingDamageTypes", ConfigEntry_Yagluth_Active_OutgoingDamageTypes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Yagluth_Active_OutgoingDamageModifiers", ConfigEntry_Yagluth_Active_OutgoingDamageModifiers);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Yagluth_Active_FallDamageModifier", ConfigEntry_Yagluth_Active_FallDamageModifier);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Yagluth_Active_IncomingDamageTypes", ConfigEntry_Yagluth_Active_IncomingDamageTypes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Yagluth_Active_IncomingDamageModifiers", ConfigEntry_Yagluth_Active_IncomingDamageModifiers);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Yagluth_Active_HeatDamageModifier", ConfigEntry_Yagluth_Active_HeatDamageModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Yagluth_Shared_MaxHealth", ConfigEntry_Yagluth_Shared_MaxHealth);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Yagluth_Shared_HealthRegen", ConfigEntry_Yagluth_Shared_HealthRegen);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Yagluth_Shared_HealthRegenModifier", ConfigEntry_Yagluth_Shared_HealthRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Yagluth_Shared_MaxStamina", ConfigEntry_Yagluth_Shared_MaxStamina);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Yagluth_Shared_StaminaRegenModifier", ConfigEntry_Yagluth_Shared_StaminaRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Yagluth_Shared_MaxEitr", ConfigEntry_Yagluth_Shared_MaxEitr);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Yagluth_Shared_EitrRegenModifier", ConfigEntry_Yagluth_Shared_EitrRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Yagluth_Shared_MaxWeight", ConfigEntry_Yagluth_Shared_MaxWeight);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Yagluth_Shared_MoveSpeedModifier", ConfigEntry_Yagluth_Shared_MoveSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Yagluth_Shared_JumpForceModifier", ConfigEntry_Yagluth_Shared_JumpForceModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Yagluth_Shared_MaxFallSpeed", ConfigEntry_Yagluth_Shared_MaxFallSpeed);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Yagluth_Shared_EquipmentSpeedModifier", ConfigEntry_Yagluth_Shared_EquipmentSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Yagluth_Shared_WindSpeedModifier", ConfigEntry_Yagluth_Shared_WindSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Yagluth_Shared_RunStaminaCostModifier", ConfigEntry_Yagluth_Shared_RunStaminaCostModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Yagluth_Shared_JumpStaminaCostModifier", ConfigEntry_Yagluth_Shared_JumpStaminaCostModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Yagluth_Shared_StealthModifier", ConfigEntry_Yagluth_Shared_StealthModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Yagluth_Shared_NoiseModifier", ConfigEntry_Yagluth_Shared_NoiseModifier);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Yagluth_Shared_StatusAttributes", ConfigEntry_Yagluth_Shared_StatusAttributes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Yagluth_Shared_OutgoingDamageTypes", ConfigEntry_Yagluth_Shared_OutgoingDamageTypes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Yagluth_Shared_OutgoingDamageModifiers", ConfigEntry_Yagluth_Shared_OutgoingDamageModifiers);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Yagluth_Shared_FallDamageModifier", ConfigEntry_Yagluth_Shared_FallDamageModifier);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Yagluth_Shared_IncomingDamageTypes", ConfigEntry_Yagluth_Shared_IncomingDamageTypes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Yagluth_Shared_IncomingDamageModifiers", ConfigEntry_Yagluth_Shared_IncomingDamageModifiers);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Yagluth_Shared_HeatDamageModifier", ConfigEntry_Yagluth_Shared_HeatDamageModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Yagluth_Equipped_MaxHealth", ConfigEntry_Yagluth_Equipped_MaxHealth);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Yagluth_Equipped_HealthRegen", ConfigEntry_Yagluth_Equipped_HealthRegen);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Yagluth_Equipped_HealthRegenModifier", ConfigEntry_Yagluth_Equipped_HealthRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Yagluth_Equipped_MaxStamina", ConfigEntry_Yagluth_Equipped_MaxStamina);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Yagluth_Equipped_StaminaRegenModifier", ConfigEntry_Yagluth_Equipped_StaminaRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Yagluth_Equipped_MaxEitr", ConfigEntry_Yagluth_Equipped_MaxEitr);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Yagluth_Equipped_EitrRegenModifier", ConfigEntry_Yagluth_Equipped_EitrRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Yagluth_Equipped_MaxWeight", ConfigEntry_Yagluth_Equipped_MaxWeight);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Yagluth_Equipped_MoveSpeedModifier", ConfigEntry_Yagluth_Equipped_MoveSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Yagluth_Equipped_JumpForceModifier", ConfigEntry_Yagluth_Equipped_JumpForceModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Yagluth_Equipped_MaxFallSpeed", ConfigEntry_Yagluth_Equipped_MaxFallSpeed);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Yagluth_Equipped_EquipmentSpeedModifier", ConfigEntry_Yagluth_Equipped_EquipmentSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Yagluth_Equipped_WindSpeedModifier", ConfigEntry_Yagluth_Equipped_WindSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Yagluth_Equipped_RunStaminaCostModifier", ConfigEntry_Yagluth_Equipped_RunStaminaCostModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Yagluth_Equipped_JumpStaminaCostModifier", ConfigEntry_Yagluth_Equipped_JumpStaminaCostModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Yagluth_Equipped_StealthModifier", ConfigEntry_Yagluth_Equipped_StealthModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Yagluth_Equipped_NoiseModifier", ConfigEntry_Yagluth_Equipped_NoiseModifier);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Yagluth_Equipped_StatusAttributes", ConfigEntry_Yagluth_Equipped_StatusAttributes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Yagluth_Equipped_OutgoingDamageTypes", ConfigEntry_Yagluth_Equipped_OutgoingDamageTypes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Yagluth_Equipped_OutgoingDamageModifiers", ConfigEntry_Yagluth_Equipped_OutgoingDamageModifiers);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Yagluth_Equipped_FallDamageModifier", ConfigEntry_Yagluth_Equipped_FallDamageModifier);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Yagluth_Equipped_IncomingDamageTypes", ConfigEntry_Yagluth_Equipped_IncomingDamageTypes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Yagluth_Equipped_IncomingDamageModifiers", ConfigEntry_Yagluth_Equipped_IncomingDamageModifiers);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Yagluth_Equipped_HeatDamageModifier", ConfigEntry_Yagluth_Equipped_HeatDamageModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Queen_Passive_MaxHealth", ConfigEntry_Queen_Passive_MaxHealth);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Queen_Passive_HealthRegen", ConfigEntry_Queen_Passive_HealthRegen);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Queen_Passive_HealthRegenModifier", ConfigEntry_Queen_Passive_HealthRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Queen_Passive_MaxStamina", ConfigEntry_Queen_Passive_MaxStamina);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Queen_Passive_StaminaRegenModifier", ConfigEntry_Queen_Passive_StaminaRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Queen_Passive_MaxEitr", ConfigEntry_Queen_Passive_MaxEitr);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Queen_Passive_EitrRegenModifier", ConfigEntry_Queen_Passive_EitrRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Queen_Passive_MaxWeight", ConfigEntry_Queen_Passive_MaxWeight);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Queen_Passive_MoveSpeedModifier", ConfigEntry_Queen_Passive_MoveSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Queen_Passive_JumpForceModifier", ConfigEntry_Queen_Passive_JumpForceModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Queen_Passive_MaxFallSpeed", ConfigEntry_Queen_Passive_MaxFallSpeed);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Queen_Passive_EquipmentSpeedModifier", ConfigEntry_Queen_Passive_EquipmentSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Queen_Passive_WindSpeedModifier", ConfigEntry_Queen_Passive_WindSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Queen_Passive_RunStaminaCostModifier", ConfigEntry_Queen_Passive_RunStaminaCostModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Queen_Passive_JumpStaminaCostModifier", ConfigEntry_Queen_Passive_JumpStaminaCostModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Queen_Passive_StealthModifier", ConfigEntry_Queen_Passive_StealthModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Queen_Passive_NoiseModifier", ConfigEntry_Queen_Passive_NoiseModifier);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Queen_Passive_StatusAttributes", ConfigEntry_Queen_Passive_StatusAttributes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Queen_Passive_OutgoingDamageTypes", ConfigEntry_Queen_Passive_OutgoingDamageTypes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Queen_Passive_OutgoingDamageModifiers", ConfigEntry_Queen_Passive_OutgoingDamageModifiers);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Queen_Passive_FallDamageModifier", ConfigEntry_Queen_Passive_FallDamageModifier);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Queen_Passive_IncomingDamageTypes", ConfigEntry_Queen_Passive_IncomingDamageTypes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Queen_Passive_IncomingDamageModifiers", ConfigEntry_Queen_Passive_IncomingDamageModifiers);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Queen_Passive_HeatDamageModifier", ConfigEntry_Queen_Passive_HeatDamageModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Queen_Active_MaxHealth", ConfigEntry_Queen_Active_MaxHealth);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Queen_Active_HealthRegen", ConfigEntry_Queen_Active_HealthRegen);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Queen_Active_HealthRegenModifier", ConfigEntry_Queen_Active_HealthRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Queen_Active_MaxStamina", ConfigEntry_Queen_Active_MaxStamina);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Queen_Active_StaminaRegenModifier", ConfigEntry_Queen_Active_StaminaRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Queen_Active_MaxEitr", ConfigEntry_Queen_Active_MaxEitr);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Queen_Active_EitrRegenModifier", ConfigEntry_Queen_Active_EitrRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Queen_Active_MaxWeight", ConfigEntry_Queen_Active_MaxWeight);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Queen_Active_MoveSpeedModifier", ConfigEntry_Queen_Active_MoveSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Queen_Active_JumpForceModifier", ConfigEntry_Queen_Active_JumpForceModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Queen_Active_MaxFallSpeed", ConfigEntry_Queen_Active_MaxFallSpeed);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Queen_Active_EquipmentSpeedModifier", ConfigEntry_Queen_Active_EquipmentSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Queen_Active_WindSpeedModifier", ConfigEntry_Queen_Active_WindSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Queen_Active_RunStaminaCostModifier", ConfigEntry_Queen_Active_RunStaminaCostModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Queen_Active_JumpStaminaCostModifier", ConfigEntry_Queen_Active_JumpStaminaCostModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Queen_Active_StealthModifier", ConfigEntry_Queen_Active_StealthModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Queen_Active_NoiseModifier", ConfigEntry_Queen_Active_NoiseModifier);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Queen_Active_StatusAttributes", ConfigEntry_Queen_Active_StatusAttributes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Queen_Active_OutgoingDamageTypes", ConfigEntry_Queen_Active_OutgoingDamageTypes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Queen_Active_OutgoingDamageModifiers", ConfigEntry_Queen_Active_OutgoingDamageModifiers);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Queen_Active_FallDamageModifier", ConfigEntry_Queen_Active_FallDamageModifier);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Queen_Active_IncomingDamageTypes", ConfigEntry_Queen_Active_IncomingDamageTypes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Queen_Active_IncomingDamageModifiers", ConfigEntry_Queen_Active_IncomingDamageModifiers);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Queen_Active_HeatDamageModifier", ConfigEntry_Queen_Active_HeatDamageModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Queen_Shared_MaxHealth", ConfigEntry_Queen_Shared_MaxHealth);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Queen_Shared_HealthRegen", ConfigEntry_Queen_Shared_HealthRegen);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Queen_Shared_HealthRegenModifier", ConfigEntry_Queen_Shared_HealthRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Queen_Shared_MaxStamina", ConfigEntry_Queen_Shared_MaxStamina);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Queen_Shared_StaminaRegenModifier", ConfigEntry_Queen_Shared_StaminaRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Queen_Shared_MaxEitr", ConfigEntry_Queen_Shared_MaxEitr);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Queen_Shared_EitrRegenModifier", ConfigEntry_Queen_Shared_EitrRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Queen_Shared_MaxWeight", ConfigEntry_Queen_Shared_MaxWeight);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Queen_Shared_MoveSpeedModifier", ConfigEntry_Queen_Shared_MoveSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Queen_Shared_JumpForceModifier", ConfigEntry_Queen_Shared_JumpForceModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Queen_Shared_MaxFallSpeed", ConfigEntry_Queen_Shared_MaxFallSpeed);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Queen_Shared_EquipmentSpeedModifier", ConfigEntry_Queen_Shared_EquipmentSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Queen_Shared_WindSpeedModifier", ConfigEntry_Queen_Shared_WindSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Queen_Shared_RunStaminaCostModifier", ConfigEntry_Queen_Shared_RunStaminaCostModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Queen_Shared_JumpStaminaCostModifier", ConfigEntry_Queen_Shared_JumpStaminaCostModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Queen_Shared_StealthModifier", ConfigEntry_Queen_Shared_StealthModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Queen_Shared_NoiseModifier", ConfigEntry_Queen_Shared_NoiseModifier);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Queen_Shared_StatusAttributes", ConfigEntry_Queen_Shared_StatusAttributes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Queen_Shared_OutgoingDamageTypes", ConfigEntry_Queen_Shared_OutgoingDamageTypes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Queen_Shared_OutgoingDamageModifiers", ConfigEntry_Queen_Shared_OutgoingDamageModifiers);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Queen_Shared_FallDamageModifier", ConfigEntry_Queen_Shared_FallDamageModifier);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Queen_Shared_IncomingDamageTypes", ConfigEntry_Queen_Shared_IncomingDamageTypes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Queen_Shared_IncomingDamageModifiers", ConfigEntry_Queen_Shared_IncomingDamageModifiers);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Queen_Shared_HeatDamageModifier", ConfigEntry_Queen_Shared_HeatDamageModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Queen_Equipped_MaxHealth", ConfigEntry_Queen_Equipped_MaxHealth);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Queen_Equipped_HealthRegen", ConfigEntry_Queen_Equipped_HealthRegen);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Queen_Equipped_HealthRegenModifier", ConfigEntry_Queen_Equipped_HealthRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Queen_Equipped_MaxStamina", ConfigEntry_Queen_Equipped_MaxStamina);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Queen_Equipped_StaminaRegenModifier", ConfigEntry_Queen_Equipped_StaminaRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Queen_Equipped_MaxEitr", ConfigEntry_Queen_Equipped_MaxEitr);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Queen_Equipped_EitrRegenModifier", ConfigEntry_Queen_Equipped_EitrRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Queen_Equipped_MaxWeight", ConfigEntry_Queen_Equipped_MaxWeight);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Queen_Equipped_MoveSpeedModifier", ConfigEntry_Queen_Equipped_MoveSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Queen_Equipped_JumpForceModifier", ConfigEntry_Queen_Equipped_JumpForceModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Queen_Equipped_MaxFallSpeed", ConfigEntry_Queen_Equipped_MaxFallSpeed);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Queen_Equipped_EquipmentSpeedModifier", ConfigEntry_Queen_Equipped_EquipmentSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Queen_Equipped_WindSpeedModifier", ConfigEntry_Queen_Equipped_WindSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Queen_Equipped_RunStaminaCostModifier", ConfigEntry_Queen_Equipped_RunStaminaCostModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Queen_Equipped_JumpStaminaCostModifier", ConfigEntry_Queen_Equipped_JumpStaminaCostModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Queen_Equipped_StealthModifier", ConfigEntry_Queen_Equipped_StealthModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Queen_Equipped_NoiseModifier", ConfigEntry_Queen_Equipped_NoiseModifier);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Queen_Equipped_StatusAttributes", ConfigEntry_Queen_Equipped_StatusAttributes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Queen_Equipped_OutgoingDamageTypes", ConfigEntry_Queen_Equipped_OutgoingDamageTypes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Queen_Equipped_OutgoingDamageModifiers", ConfigEntry_Queen_Equipped_OutgoingDamageModifiers);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Queen_Equipped_FallDamageModifier", ConfigEntry_Queen_Equipped_FallDamageModifier);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Queen_Equipped_IncomingDamageTypes", ConfigEntry_Queen_Equipped_IncomingDamageTypes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Queen_Equipped_IncomingDamageModifiers", ConfigEntry_Queen_Equipped_IncomingDamageModifiers);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Queen_Equipped_HeatDamageModifier", ConfigEntry_Queen_Equipped_HeatDamageModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Fader_Passive_MaxHealth", ConfigEntry_Fader_Passive_MaxHealth);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Fader_Passive_HealthRegen", ConfigEntry_Fader_Passive_HealthRegen);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Fader_Passive_HealthRegenModifier", ConfigEntry_Fader_Passive_HealthRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Fader_Passive_MaxStamina", ConfigEntry_Fader_Passive_MaxStamina);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Fader_Passive_StaminaRegenModifier", ConfigEntry_Fader_Passive_StaminaRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Fader_Passive_MaxEitr", ConfigEntry_Fader_Passive_MaxEitr);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Fader_Passive_EitrRegenModifier", ConfigEntry_Fader_Passive_EitrRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Fader_Passive_MaxWeight", ConfigEntry_Fader_Passive_MaxWeight);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Fader_Passive_MoveSpeedModifier", ConfigEntry_Fader_Passive_MoveSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Fader_Passive_JumpForceModifier", ConfigEntry_Fader_Passive_JumpForceModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Fader_Passive_MaxFallSpeed", ConfigEntry_Fader_Passive_MaxFallSpeed);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Fader_Passive_EquipmentSpeedModifier", ConfigEntry_Fader_Passive_EquipmentSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Fader_Passive_WindSpeedModifier", ConfigEntry_Fader_Passive_WindSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Fader_Passive_RunStaminaCostModifier", ConfigEntry_Fader_Passive_RunStaminaCostModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Fader_Passive_JumpStaminaCostModifier", ConfigEntry_Fader_Passive_JumpStaminaCostModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Fader_Passive_StealthModifier", ConfigEntry_Fader_Passive_StealthModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Fader_Passive_NoiseModifier", ConfigEntry_Fader_Passive_NoiseModifier);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Fader_Passive_StatusAttributes", ConfigEntry_Fader_Passive_StatusAttributes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Fader_Passive_OutgoingDamageTypes", ConfigEntry_Fader_Passive_OutgoingDamageTypes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Fader_Passive_OutgoingDamageModifiers", ConfigEntry_Fader_Passive_OutgoingDamageModifiers);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Fader_Passive_FallDamageModifier", ConfigEntry_Fader_Passive_FallDamageModifier);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Fader_Passive_IncomingDamageTypes", ConfigEntry_Fader_Passive_IncomingDamageTypes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Fader_Passive_IncomingDamageModifiers", ConfigEntry_Fader_Passive_IncomingDamageModifiers);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Fader_Passive_HeatDamageModifier", ConfigEntry_Fader_Passive_HeatDamageModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Fader_Active_MaxHealth", ConfigEntry_Fader_Active_MaxHealth);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Fader_Active_HealthRegen", ConfigEntry_Fader_Active_HealthRegen);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Fader_Active_HealthRegenModifier", ConfigEntry_Fader_Active_HealthRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Fader_Active_MaxStamina", ConfigEntry_Fader_Active_MaxStamina);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Fader_Active_StaminaRegenModifier", ConfigEntry_Fader_Active_StaminaRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Fader_Active_MaxEitr", ConfigEntry_Fader_Active_MaxEitr);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Fader_Active_EitrRegenModifier", ConfigEntry_Fader_Active_EitrRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Fader_Active_MaxWeight", ConfigEntry_Fader_Active_MaxWeight);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Fader_Active_MoveSpeedModifier", ConfigEntry_Fader_Active_MoveSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Fader_Active_JumpForceModifier", ConfigEntry_Fader_Active_JumpForceModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Fader_Active_MaxFallSpeed", ConfigEntry_Fader_Active_MaxFallSpeed);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Fader_Active_EquipmentSpeedModifier", ConfigEntry_Fader_Active_EquipmentSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Fader_Active_WindSpeedModifier", ConfigEntry_Fader_Active_WindSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Fader_Active_RunStaminaCostModifier", ConfigEntry_Fader_Active_RunStaminaCostModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Fader_Active_JumpStaminaCostModifier", ConfigEntry_Fader_Active_JumpStaminaCostModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Fader_Active_StealthModifier", ConfigEntry_Fader_Active_StealthModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Fader_Active_NoiseModifier", ConfigEntry_Fader_Active_NoiseModifier);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Fader_Active_StatusAttributes", ConfigEntry_Fader_Active_StatusAttributes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Fader_Active_OutgoingDamageTypes", ConfigEntry_Fader_Active_OutgoingDamageTypes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Fader_Active_OutgoingDamageModifiers", ConfigEntry_Fader_Active_OutgoingDamageModifiers);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Fader_Active_FallDamageModifier", ConfigEntry_Fader_Active_FallDamageModifier);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Fader_Active_IncomingDamageTypes", ConfigEntry_Fader_Active_IncomingDamageTypes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Fader_Active_IncomingDamageModifiers", ConfigEntry_Fader_Active_IncomingDamageModifiers);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Fader_Active_HeatDamageModifier", ConfigEntry_Fader_Active_HeatDamageModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Fader_Shared_MaxHealth", ConfigEntry_Fader_Shared_MaxHealth);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Fader_Shared_HealthRegen", ConfigEntry_Fader_Shared_HealthRegen);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Fader_Shared_HealthRegenModifier", ConfigEntry_Fader_Shared_HealthRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Fader_Shared_MaxStamina", ConfigEntry_Fader_Shared_MaxStamina);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Fader_Shared_StaminaRegenModifier", ConfigEntry_Fader_Shared_StaminaRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Fader_Shared_MaxEitr", ConfigEntry_Fader_Shared_MaxEitr);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Fader_Shared_EitrRegenModifier", ConfigEntry_Fader_Shared_EitrRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Fader_Shared_MaxWeight", ConfigEntry_Fader_Shared_MaxWeight);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Fader_Shared_MoveSpeedModifier", ConfigEntry_Fader_Shared_MoveSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Fader_Shared_JumpForceModifier", ConfigEntry_Fader_Shared_JumpForceModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Fader_Shared_MaxFallSpeed", ConfigEntry_Fader_Shared_MaxFallSpeed);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Fader_Shared_EquipmentSpeedModifier", ConfigEntry_Fader_Shared_EquipmentSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Fader_Shared_WindSpeedModifier", ConfigEntry_Fader_Shared_WindSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Fader_Shared_RunStaminaCostModifier", ConfigEntry_Fader_Shared_RunStaminaCostModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Fader_Shared_JumpStaminaCostModifier", ConfigEntry_Fader_Shared_JumpStaminaCostModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Fader_Shared_StealthModifier", ConfigEntry_Fader_Shared_StealthModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Fader_Shared_NoiseModifier", ConfigEntry_Fader_Shared_NoiseModifier);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Fader_Shared_StatusAttributes", ConfigEntry_Fader_Shared_StatusAttributes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Fader_Shared_OutgoingDamageTypes", ConfigEntry_Fader_Shared_OutgoingDamageTypes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Fader_Shared_OutgoingDamageModifiers", ConfigEntry_Fader_Shared_OutgoingDamageModifiers);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Fader_Shared_FallDamageModifier", ConfigEntry_Fader_Shared_FallDamageModifier);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Fader_Shared_IncomingDamageTypes", ConfigEntry_Fader_Shared_IncomingDamageTypes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Fader_Shared_IncomingDamageModifiers", ConfigEntry_Fader_Shared_IncomingDamageModifiers);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Fader_Shared_HeatDamageModifier", ConfigEntry_Fader_Shared_HeatDamageModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Fader_Equipped_MaxHealth", ConfigEntry_Fader_Equipped_MaxHealth);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Fader_Equipped_HealthRegen", ConfigEntry_Fader_Equipped_HealthRegen);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Fader_Equipped_HealthRegenModifier", ConfigEntry_Fader_Equipped_HealthRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Fader_Equipped_MaxStamina", ConfigEntry_Fader_Equipped_MaxStamina);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Fader_Equipped_StaminaRegenModifier", ConfigEntry_Fader_Equipped_StaminaRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Fader_Equipped_MaxEitr", ConfigEntry_Fader_Equipped_MaxEitr);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Fader_Equipped_EitrRegenModifier", ConfigEntry_Fader_Equipped_EitrRegenModifier);
		Dictionary_ConfigEntry_Int.Add("ConfigEntry_Fader_Equipped_MaxWeight", ConfigEntry_Fader_Equipped_MaxWeight);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Fader_Equipped_MoveSpeedModifier", ConfigEntry_Fader_Equipped_MoveSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Fader_Equipped_JumpForceModifier", ConfigEntry_Fader_Equipped_JumpForceModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Fader_Equipped_MaxFallSpeed", ConfigEntry_Fader_Equipped_MaxFallSpeed);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Fader_Equipped_EquipmentSpeedModifier", ConfigEntry_Fader_Equipped_EquipmentSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Fader_Equipped_WindSpeedModifier", ConfigEntry_Fader_Equipped_WindSpeedModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Fader_Equipped_RunStaminaCostModifier", ConfigEntry_Fader_Equipped_RunStaminaCostModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Fader_Equipped_JumpStaminaCostModifier", ConfigEntry_Fader_Equipped_JumpStaminaCostModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Fader_Equipped_StealthModifier", ConfigEntry_Fader_Equipped_StealthModifier);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Fader_Equipped_NoiseModifier", ConfigEntry_Fader_Equipped_NoiseModifier);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Fader_Equipped_StatusAttributes", ConfigEntry_Fader_Equipped_StatusAttributes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Fader_Equipped_OutgoingDamageTypes", ConfigEntry_Fader_Equipped_OutgoingDamageTypes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Fader_Equipped_OutgoingDamageModifiers", ConfigEntry_Fader_Equipped_OutgoingDamageModifiers);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Fader_Equipped_FallDamageModifier", ConfigEntry_Fader_Equipped_FallDamageModifier);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Fader_Equipped_IncomingDamageTypes", ConfigEntry_Fader_Equipped_IncomingDamageTypes);
		Dictionary_ConfigEntry_String.Add("ConfigEntry_Fader_Equipped_IncomingDamageModifiers", ConfigEntry_Fader_Equipped_IncomingDamageModifiers);
		Dictionary_ConfigEntry_Float.Add("ConfigEntry_Fader_Equipped_HeatDamageModifier", ConfigEntry_Fader_Equipped_HeatDamageModifier);
	}

	private void Awake()
	{
		//IL_001a: Unknown result type (might be due to invalid IL or missing references)
		Add_ConfigEntries();
		Add_Buttons();
		Add_StatusEffects();
		Add_Translations();
		new Harmony("JuneGame.Valheim.ForsakenPowerOverhaul").PatchAll();
		PrefabManager.OnVanillaPrefabsAvailable += Add_Prefabs;
	}

	private void Start()
	{
		Mod_Auga = Chainloader.PluginInfos.ContainsKey("randyknapp.mods.auga");
		Mod_EpicLoot = Chainloader.PluginInfos.ContainsKey("randyknapp.mods.epicloot");
	}

	private void Update()
	{
		if (!((Object)(object)ObjectDB.m_instance != (Object)null))
		{
			return;
		}
		if ((Object)(object)StatusEffect_FPO_Passive == (Object)null)
		{
			Add_StatusEffectLists();
		}
		if ((Object)(object)Player.m_localPlayer != (Object)null && !((Character)Player.m_localPlayer).IsDead())
		{
			Update_Player_StatusEffects();
			Update_Player_StatusEffects_Equipped();
			if (ZInput.m_instance != null && ButtonConfig_PowerCycle != null && ConfigEntry_PowerCycle_Bool.Value && ZInput.GetButtonDown(ButtonConfig_PowerCycle.Name) && ((Character)Player.m_localPlayer).GetCurrentAnimHash() != 1183970330 && Player.m_localPlayer.GetGuardianPowerName().StartsWith("GP_"))
			{
				Power_Cycle();
			}
		}
	}

	private static void Add_StatusEffectLists()
	{
		StatusEffect_FPO_Passive = (StatusEffect_FPO)(object)ObjectDB.m_instance.GetStatusEffect(GetHash("SE_FPO_Passive"));
		StatusEffect_FPO_Eikthyr = (StatusEffect_FPO)(object)ObjectDB.m_instance.GetStatusEffect(GetHash("SE_FPO_Eikthyr"));
		StatusEffect_FPO_TheElder = (StatusEffect_FPO)(object)ObjectDB.m_instance.GetStatusEffect(GetHash("SE_FPO_TheElder"));
		StatusEffect_FPO_Bonemass = (StatusEffect_FPO)(object)ObjectDB.m_instance.GetStatusEffect(GetHash("SE_FPO_Bonemass"));
		StatusEffect_FPO_Moder = (StatusEffect_FPO)(object)ObjectDB.m_instance.GetStatusEffect(GetHash("SE_FPO_Moder"));
		StatusEffect_FPO_Yagluth = (StatusEffect_FPO)(object)ObjectDB.m_instance.GetStatusEffect(GetHash("SE_FPO_Yagluth"));
		StatusEffect_FPO_Queen = (StatusEffect_FPO)(object)ObjectDB.m_instance.GetStatusEffect(GetHash("SE_FPO_Queen"));
		StatusEffect_FPO_Fader = (StatusEffect_FPO)(object)ObjectDB.m_instance.GetStatusEffect(GetHash("SE_FPO_Fader"));
		StatusEffect_FPO_Eikthyr_Passive = (StatusEffect_FPO)(object)ObjectDB.m_instance.GetStatusEffect(GetHash("SE_FPO_Eikthyr_Passive"));
		StatusEffect_FPO_TheElder_Passive = (StatusEffect_FPO)(object)ObjectDB.m_instance.GetStatusEffect(GetHash("SE_FPO_TheElder_Passive"));
		StatusEffect_FPO_Bonemass_Passive = (StatusEffect_FPO)(object)ObjectDB.m_instance.GetStatusEffect(GetHash("SE_FPO_Bonemass_Passive"));
		StatusEffect_FPO_Moder_Passive = (StatusEffect_FPO)(object)ObjectDB.m_instance.GetStatusEffect(GetHash("SE_FPO_Moder_Passive"));
		StatusEffect_FPO_Yagluth_Passive = (StatusEffect_FPO)(object)ObjectDB.m_instance.GetStatusEffect(GetHash("SE_FPO_Yagluth_Passive"));
		StatusEffect_FPO_Queen_Passive = (StatusEffect_FPO)(object)ObjectDB.m_instance.GetStatusEffect(GetHash("SE_FPO_Queen_Passive"));
		StatusEffect_FPO_Fader_Passive = (StatusEffect_FPO)(object)ObjectDB.m_instance.GetStatusEffect(GetHash("SE_FPO_Fader_Passive"));
		StatusEffect_FPO_Eikthyr_Equipped = (StatusEffect_FPO)(object)ObjectDB.m_instance.GetStatusEffect(GetHash("SE_FPO_Eikthyr_Equipped"));
		StatusEffect_FPO_TheElder_Equipped = (StatusEffect_FPO)(object)ObjectDB.m_instance.GetStatusEffect(GetHash("SE_FPO_TheElder_Equipped"));
		StatusEffect_FPO_Bonemass_Equipped = (StatusEffect_FPO)(object)ObjectDB.m_instance.GetStatusEffect(GetHash("SE_FPO_Bonemass_Equipped"));
		StatusEffect_FPO_Moder_Equipped = (StatusEffect_FPO)(object)ObjectDB.m_instance.GetStatusEffect(GetHash("SE_FPO_Moder_Equipped"));
		StatusEffect_FPO_Yagluth_Equipped = (StatusEffect_FPO)(object)ObjectDB.m_instance.GetStatusEffect(GetHash("SE_FPO_Yagluth_Equipped"));
		StatusEffect_FPO_Queen_Equipped = (StatusEffect_FPO)(object)ObjectDB.m_instance.GetStatusEffect(GetHash("SE_FPO_Queen_Equipped"));
		StatusEffect_FPO_Fader_Equipped = (StatusEffect_FPO)(object)ObjectDB.m_instance.GetStatusEffect(GetHash("SE_FPO_Fader_Equipped"));
		StatusEffect_FPO_Eikthyr_Active = (StatusEffect_FPO)(object)ObjectDB.m_instance.GetStatusEffect(GetHash("SE_FPO_Eikthyr_Active"));
		StatusEffect_FPO_TheElder_Active = (StatusEffect_FPO)(object)ObjectDB.m_instance.GetStatusEffect(GetHash("SE_FPO_TheElder_Active"));
		StatusEffect_FPO_Bonemass_Active = (StatusEffect_FPO)(object)ObjectDB.m_instance.GetStatusEffect(GetHash("SE_FPO_Bonemass_Active"));
		StatusEffect_FPO_Moder_Active = (StatusEffect_FPO)(object)ObjectDB.m_instance.GetStatusEffect(GetHash("SE_FPO_Moder_Active"));
		StatusEffect_FPO_Yagluth_Active = (StatusEffect_FPO)(object)ObjectDB.m_instance.GetStatusEffect(GetHash("SE_FPO_Yagluth_Active"));
		StatusEffect_FPO_Queen_Active = (StatusEffect_FPO)(object)ObjectDB.m_instance.GetStatusEffect(GetHash("SE_FPO_Queen_Active"));
		StatusEffect_FPO_Fader_Active = (StatusEffect_FPO)(object)ObjectDB.m_instance.GetStatusEffect(GetHash("SE_FPO_Fader_Active"));
		StatusEffect_FPO_Eikthyr_Shared = (StatusEffect_FPO)(object)ObjectDB.m_instance.GetStatusEffect(GetHash("SE_FPO_Eikthyr_Shared"));
		StatusEffect_FPO_TheElder_Shared = (StatusEffect_FPO)(object)ObjectDB.m_instance.GetStatusEffect(GetHash("SE_FPO_TheElder_Shared"));
		StatusEffect_FPO_Bonemass_Shared = (StatusEffect_FPO)(object)ObjectDB.m_instance.GetStatusEffect(GetHash("SE_FPO_Bonemass_Shared"));
		StatusEffect_FPO_Moder_Shared = (StatusEffect_FPO)(object)ObjectDB.m_instance.GetStatusEffect(GetHash("SE_FPO_Moder_Shared"));
		StatusEffect_FPO_Yagluth_Shared = (StatusEffect_FPO)(object)ObjectDB.m_instance.GetStatusEffect(GetHash("SE_FPO_Yagluth_Shared"));
		StatusEffect_FPO_Queen_Shared = (StatusEffect_FPO)(object)ObjectDB.m_instance.GetStatusEffect(GetHash("SE_FPO_Queen_Shared"));
		StatusEffect_FPO_Fader_Shared = (StatusEffect_FPO)(object)ObjectDB.m_instance.GetStatusEffect(GetHash("SE_FPO_Fader_Shared"));
		List_StatusEffect_FPO.Clear();
		List_StatusEffect_FPO.Add(StatusEffect_FPO_Eikthyr);
		List_StatusEffect_FPO.Add(StatusEffect_FPO_TheElder);
		List_StatusEffect_FPO.Add(StatusEffect_FPO_Bonemass);
		List_StatusEffect_FPO.Add(StatusEffect_FPO_Moder);
		List_StatusEffect_FPO.Add(StatusEffect_FPO_Yagluth);
		List_StatusEffect_FPO.Add(StatusEffect_FPO_Queen);
		List_StatusEffect_FPO.Add(StatusEffect_FPO_Fader);
		List_StatusEffect_FPO_Passive.Clear();
		List_StatusEffect_FPO_Passive.Add(StatusEffect_FPO_Eikthyr_Passive);
		List_StatusEffect_FPO_Passive.Add(StatusEffect_FPO_TheElder_Passive);
		List_StatusEffect_FPO_Passive.Add(StatusEffect_FPO_Bonemass_Passive);
		List_StatusEffect_FPO_Passive.Add(StatusEffect_FPO_Moder_Passive);
		List_StatusEffect_FPO_Passive.Add(StatusEffect_FPO_Yagluth_Passive);
		List_StatusEffect_FPO_Passive.Add(StatusEffect_FPO_Queen_Passive);
		List_StatusEffect_FPO_Passive.Add(StatusEffect_FPO_Fader_Passive);
		List_StatusEffect_FPO_Equipped.Clear();
		List_StatusEffect_FPO_Equipped.Add(StatusEffect_FPO_Eikthyr_Equipped);
		List_StatusEffect_FPO_Equipped.Add(StatusEffect_FPO_TheElder_Equipped);
		List_StatusEffect_FPO_Equipped.Add(StatusEffect_FPO_Bonemass_Equipped);
		List_StatusEffect_FPO_Equipped.Add(StatusEffect_FPO_Moder_Equipped);
		List_StatusEffect_FPO_Equipped.Add(StatusEffect_FPO_Yagluth_Equipped);
		List_StatusEffect_FPO_Equipped.Add(StatusEffect_FPO_Queen_Equipped);
		List_StatusEffect_FPO_Equipped.Add(StatusEffect_FPO_Fader_Equipped);
		List_StatusEffect_FPO_Active.Clear();
		List_StatusEffect_FPO_Active.Add(StatusEffect_FPO_Eikthyr_Active);
		List_StatusEffect_FPO_Active.Add(StatusEffect_FPO_TheElder_Active);
		List_StatusEffect_FPO_Active.Add(StatusEffect_FPO_Bonemass_Active);
		List_StatusEffect_FPO_Active.Add(StatusEffect_FPO_Moder_Active);
		List_StatusEffect_FPO_Active.Add(StatusEffect_FPO_Yagluth_Active);
		List_StatusEffect_FPO_Active.Add(StatusEffect_FPO_Queen_Active);
		List_StatusEffect_FPO_Active.Add(StatusEffect_FPO_Fader_Active);
		List_StatusEffect_FPO_Shared.Clear();
		List_StatusEffect_FPO_Shared.Add(StatusEffect_FPO_Eikthyr_Shared);
		List_StatusEffect_FPO_Shared.Add(StatusEffect_FPO_TheElder_Shared);
		List_StatusEffect_FPO_Shared.Add(StatusEffect_FPO_Bonemass_Shared);
		List_StatusEffect_FPO_Shared.Add(StatusEffect_FPO_Moder_Shared);
		List_StatusEffect_FPO_Shared.Add(StatusEffect_FPO_Yagluth_Shared);
		List_StatusEffect_FPO_Shared.Add(StatusEffect_FPO_Queen_Shared);
		List_StatusEffect_FPO_Shared.Add(StatusEffect_FPO_Fader_Shared);
	}

	private static void GlobalKeys_Update(BossStone New_BossStone)
	{
		bool flag = false;
		if (New_BossStone.m_itemStand.HaveAttachment())
		{
			string bossName = GetBossName(New_BossStone.m_itemStand.m_currentItemName);
			if (!ZoneSystem.instance.GetGlobalKey("gk_fpo_bossstone_" + bossName) && bossName != "")
			{
				ZoneSystem.instance.SetGlobalKey("gk_fpo_bossstone_" + bossName);
				flag = true;
			}
		}
		if (flag)
		{
			ZoneSystem.instance.SetGlobalKey("gk_fpo_bossstone_passive");
		}
	}

	private static List<string> GlobalKeys_Sort()
	{
		List<string> list = new List<string>();
		foreach (string list_BossName in List_BossNames)
		{
			if (ZoneSystem.instance.GetGlobalKey("gk_fpo_bossstone_" + list_BossName))
			{
				list.Add("gk_fpo_bossstone_" + list_BossName);
			}
		}
		return list.ToList();
	}

	private static void PlayerKeys_Update()
	{
		if (!((Object)(object)Player.m_localPlayer != (Object)null))
		{
			return;
		}
		foreach (string globalKey in ZoneSystem.instance.GetGlobalKeys())
		{
			string bossName = GetBossName(globalKey);
			if (bossName != "")
			{
				((Humanoid)Player.m_localPlayer).AddUniqueKey("GP_" + bossName);
			}
		}
	}

	private static void Update_Player_StatusEffects()
	{
		if (Object.op_Implicit((Object)(object)((Character)Player.m_localPlayer).m_seman.GetStatusEffect(GetHash("SE_FPO_Passive"))) && ((Character)Player.m_localPlayer).m_seman.GetStatusEffect(GetHash("SE_FPO_Passive")).GetTooltipString() != ObjectDB.m_instance.GetStatusEffect(GetHash("SE_FPO_Passive")).GetTooltipString())
		{
			((Character)Player.m_localPlayer).m_seman.RemoveStatusEffect(GetHash("SE_FPO_Passive"), false);
		}
		if (!Object.op_Implicit((Object)(object)((Character)Player.m_localPlayer).m_seman.GetStatusEffect(GetHash("SE_FPO_Passive"))) && ZoneSystem.instance.GetGlobalKey("gk_fpo_bossstone_passive"))
		{
			((Character)Player.m_localPlayer).m_seman.AddStatusEffect(GetHash("SE_FPO_Passive"), false, 0, 0f, (short)(-1));
		}
		if (Object.op_Implicit((Object)(object)((Character)Player.m_localPlayer).m_seman.GetStatusEffect(GetHash("CorpseRun"))) && !Config_SE_CorpseRun_Bool.Value)
		{
			((Character)Player.m_localPlayer).m_seman.RemoveStatusEffect(GetHash("CorpseRun"), false);
		}
	}

	private static void Update_Player_StatusEffects_Equipped()
	{
		foreach (string list_BossName in List_BossNames)
		{
			string text = ((list_BossName == "Fader") ? "GP_Ashlands" : ("GP_" + list_BossName));
			if (Object.op_Implicit((Object)(object)((Character)Player.m_localPlayer).m_seman.GetStatusEffect(GetHash("SE_FPO_" + list_BossName + "_Equipped"))))
			{
				if (((Character)Player.m_localPlayer).m_seman.GetStatusEffect(GetHash("SE_FPO_" + list_BossName + "_Equipped")).GetTooltipString() != ObjectDB.m_instance.GetStatusEffect(GetHash("SE_FPO_" + list_BossName + "_Equipped")).GetTooltipString())
				{
					((Character)Player.m_localPlayer).m_seman.RemoveStatusEffect(GetHash("SE_FPO_" + list_BossName + "_Equipped"), false);
				}
				if (Player.m_localPlayer.GetGuardianPowerName() != text)
				{
					((Character)Player.m_localPlayer).m_seman.RemoveStatusEffect(GetHash("SE_FPO_" + list_BossName + "_Equipped"), false);
				}
			}
			if (!Object.op_Implicit((Object)(object)((Character)Player.m_localPlayer).m_seman.GetStatusEffect(GetHash("SE_FPO_" + list_BossName + "_Equipped"))) && Player.m_localPlayer.GetGuardianPowerName() == text)
			{
				((Character)Player.m_localPlayer).m_seman.AddStatusEffect(GetHash("SE_FPO_" + list_BossName + "_Equipped"), false, 0, 0f, (short)(-1));
			}
		}
	}

	private static void Update_Passive_Stats()
	{
		//IL_008c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0091: Unknown result type (might be due to invalid IL or missing references)
		//IL_045c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0461: Unknown result type (might be due to invalid IL or missing references)
		StatusEffect_FPO_Passive.m_MaxHealth = 0f;
		StatusEffect_FPO_Passive.m_HealthRegen = 0f;
		((SE_Stats)StatusEffect_FPO_Passive).m_healthRegenMultiplier = 1f;
		StatusEffect_FPO_Passive.m_MaxStamina = 0f;
		((SE_Stats)StatusEffect_FPO_Passive).m_staminaRegenMultiplier = 1f;
		StatusEffect_FPO_Passive.m_MaxEitr = 0f;
		((SE_Stats)StatusEffect_FPO_Passive).m_eitrRegenMultiplier = 1f;
		((SE_Stats)StatusEffect_FPO_Passive).m_addMaxCarryWeight = 0f;
		((SE_Stats)StatusEffect_FPO_Passive).m_speedModifier = 0f;
		((SE_Stats)StatusEffect_FPO_Passive).m_jumpModifier = Vector3.zero;
		((SE_Stats)StatusEffect_FPO_Passive).m_maxMaxFallSpeed = 0f;
		StatusEffect_FPO_Passive.m_EquipmentSpeedModifier = 0f;
		StatusEffect_FPO_Passive.m_WindSpeedModifier = 0f;
		((SE_Stats)StatusEffect_FPO_Passive).m_runStaminaDrainModifier = 0f;
		((SE_Stats)StatusEffect_FPO_Passive).m_jumpStaminaUseModifier = 0f;
		((SE_Stats)StatusEffect_FPO_Passive).m_stealthModifier = 0f;
		((SE_Stats)StatusEffect_FPO_Passive).m_noiseModifier = 0f;
		StatusEffect_FPO_Passive.m_StatusAttributes = new List<StatusAttribute>();
		StatusEffect_FPO_Passive.m_OutgoingDamageTypes = new List<SkillType>();
		StatusEffect_FPO_Passive.m_OutgoingDamageModifiers = new List<float>();
		((SE_Stats)StatusEffect_FPO_Passive).m_fallDamageModifier = 0f;
		StatusEffect_FPO_Passive.m_HeatDamageModifier = 0f;
		((SE_Stats)StatusEffect_FPO_Passive).m_mods = new List<DamageModPair>();
		((StatusEffect)StatusEffect_FPO_Passive).m_ttl = 0f;
		StatusEffect statusEffect = ObjectDB.m_instance.GetStatusEffect(GetHash("Rested"));
		if ((Object)(object)statusEffect != (Object)null)
		{
			((StatusEffect)StatusEffect_FPO_Passive).m_icon = statusEffect.m_icon;
		}
		foreach (string globalKey in ZoneSystem.instance.GetGlobalKeys())
		{
			if (globalKey.StartsWith("gk_fpo_bossstone_") && globalKey != "gk_fpo_bossstone_passive")
			{
				StatusEffect_FPO statusEffect_FPO = globalKey switch
				{
					"gk_fpo_bossstone_eikthyr" => StatusEffect_FPO_Eikthyr_Passive, 
					"gk_fpo_bossstone_theelder" => StatusEffect_FPO_TheElder_Passive, 
					"gk_fpo_bossstone_bonemass" => StatusEffect_FPO_Bonemass_Passive, 
					"gk_fpo_bossstone_moder" => StatusEffect_FPO_Moder_Passive, 
					"gk_fpo_bossstone_yagluth" => StatusEffect_FPO_Yagluth_Passive, 
					"gk_fpo_bossstone_queen" => StatusEffect_FPO_Queen_Passive, 
					"gk_fpo_bossstone_fader" => StatusEffect_FPO_Fader_Passive, 
					_ => null, 
				};
				if ((Object)(object)statusEffect_FPO != (Object)null)
				{
					StatusEffect_FPO_Passive.m_MaxHealth += statusEffect_FPO.m_MaxHealth;
					StatusEffect_FPO_Passive.m_HealthRegen += statusEffect_FPO.m_HealthRegen;
					StatusEffect_FPO statusEffect_FPO_Passive = StatusEffect_FPO_Passive;
					((SE_Stats)statusEffect_FPO_Passive).m_healthRegenMultiplier = ((SE_Stats)statusEffect_FPO_Passive).m_healthRegenMultiplier + (((SE_Stats)statusEffect_FPO).m_healthRegenMultiplier - 1f);
					StatusEffect_FPO_Passive.m_MaxStamina += statusEffect_FPO.m_MaxStamina;
					StatusEffect_FPO statusEffect_FPO_Passive2 = StatusEffect_FPO_Passive;
					((SE_Stats)statusEffect_FPO_Passive2).m_staminaRegenMultiplier = ((SE_Stats)statusEffect_FPO_Passive2).m_staminaRegenMultiplier + (((SE_Stats)statusEffect_FPO).m_staminaRegenMultiplier - 1f);
					StatusEffect_FPO_Passive.m_MaxEitr += statusEffect_FPO.m_MaxEitr;
					StatusEffect_FPO statusEffect_FPO_Passive3 = StatusEffect_FPO_Passive;
					((SE_Stats)statusEffect_FPO_Passive3).m_eitrRegenMultiplier = ((SE_Stats)statusEffect_FPO_Passive3).m_eitrRegenMultiplier + (((SE_Stats)statusEffect_FPO).m_eitrRegenMultiplier - 1f);
					StatusEffect_FPO statusEffect_FPO_Passive4 = StatusEffect_FPO_Passive;
					((SE_Stats)statusEffect_FPO_Passive4).m_addMaxCarryWeight = ((SE_Stats)statusEffect_FPO_Passive4).m_addMaxCarryWeight + ((SE_Stats)statusEffect_FPO).m_addMaxCarryWeight;
					StatusEffect_FPO statusEffect_FPO_Passive5 = StatusEffect_FPO_Passive;
					((SE_Stats)statusEffect_FPO_Passive5).m_speedModifier = ((SE_Stats)statusEffect_FPO_Passive5).m_speedModifier + ((SE_Stats)statusEffect_FPO).m_speedModifier;
					((SE_Stats)StatusEffect_FPO_Passive).m_jumpModifier = new Vector3(((SE_Stats)StatusEffect_FPO_Passive).m_jumpModifier.x + ((SE_Stats)statusEffect_FPO).m_jumpModifier.x, ((SE_Stats)StatusEffect_FPO_Passive).m_jumpModifier.y + ((SE_Stats)statusEffect_FPO).m_jumpModifier.y, ((SE_Stats)StatusEffect_FPO_Passive).m_jumpModifier.z + ((SE_Stats)statusEffect_FPO).m_jumpModifier.z);
					ref float maxMaxFallSpeed = ref ((SE_Stats)StatusEffect_FPO_Passive).m_maxMaxFallSpeed;
					float num;
					if (((SE_Stats)StatusEffect_FPO_Passive).m_maxMaxFallSpeed == 0f)
					{
						num = ((SE_Stats)statusEffect_FPO).m_maxMaxFallSpeed;
					}
					else if (((SE_Stats)statusEffect_FPO).m_maxMaxFallSpeed == 0f)
					{
						num = ((SE_Stats)StatusEffect_FPO_Passive).m_maxMaxFallSpeed;
					}
					else
					{
						num = ((((SE_Stats)statusEffect_FPO).m_maxMaxFallSpeed < ((SE_Stats)StatusEffect_FPO_Passive).m_maxMaxFallSpeed) ? ((SE_Stats)statusEffect_FPO).m_maxMaxFallSpeed : ((SE_Stats)StatusEffect_FPO_Passive).m_maxMaxFallSpeed);
					}
					maxMaxFallSpeed = num;
					StatusEffect_FPO_Passive.m_EquipmentSpeedModifier += statusEffect_FPO.m_EquipmentSpeedModifier;
					StatusEffect_FPO_Passive.m_WindSpeedModifier += statusEffect_FPO.m_WindSpeedModifier;
					StatusEffect_FPO statusEffect_FPO_Passive6 = StatusEffect_FPO_Passive;
					((SE_Stats)statusEffect_FPO_Passive6).m_runStaminaDrainModifier = ((SE_Stats)statusEffect_FPO_Passive6).m_runStaminaDrainModifier + ((SE_Stats)statusEffect_FPO).m_runStaminaDrainModifier;
					StatusEffect_FPO statusEffect_FPO_Passive7 = StatusEffect_FPO_Passive;
					((SE_Stats)statusEffect_FPO_Passive7).m_jumpStaminaUseModifier = ((SE_Stats)statusEffect_FPO_Passive7).m_jumpStaminaUseModifier + ((SE_Stats)statusEffect_FPO).m_jumpStaminaUseModifier;
					StatusEffect_FPO statusEffect_FPO_Passive8 = StatusEffect_FPO_Passive;
					((SE_Stats)statusEffect_FPO_Passive8).m_stealthModifier = ((SE_Stats)statusEffect_FPO_Passive8).m_stealthModifier + ((SE_Stats)statusEffect_FPO).m_stealthModifier;
					StatusEffect_FPO statusEffect_FPO_Passive9 = StatusEffect_FPO_Passive;
					((SE_Stats)statusEffect_FPO_Passive9).m_noiseModifier = ((SE_Stats)statusEffect_FPO_Passive9).m_noiseModifier + ((SE_Stats)statusEffect_FPO).m_noiseModifier;
					StatusEffect_FPO_Passive.m_StatusAttributes = StatusAttributes_Concat(StatusEffect_FPO_Passive.m_StatusAttributes.ToList(), statusEffect_FPO.m_StatusAttributes.ToList());
					StatusEffect_FPO_Passive.m_OutgoingDamageTypes = OutgoingDamage_Concat(StatusEffect_FPO_Passive.m_OutgoingDamageTypes.ToList(), statusEffect_FPO.m_OutgoingDamageTypes.ToList(), StatusEffect_FPO_Passive.m_OutgoingDamageModifiers.ToList(), statusEffect_FPO.m_OutgoingDamageModifiers.ToList(), out var m_OutgoingDamageModifiers);
					StatusEffect_FPO_Passive.m_OutgoingDamageModifiers = m_OutgoingDamageModifiers;
					StatusEffect_FPO statusEffect_FPO_Passive10 = StatusEffect_FPO_Passive;
					((SE_Stats)statusEffect_FPO_Passive10).m_fallDamageModifier = ((SE_Stats)statusEffect_FPO_Passive10).m_fallDamageModifier + ((SE_Stats)statusEffect_FPO).m_fallDamageModifier;
					StatusEffect_FPO_Passive.m_HeatDamageModifier += statusEffect_FPO.m_HeatDamageModifier;
					((SE_Stats)StatusEffect_FPO_Passive).m_mods = IncomingDamage_Concat(((SE_Stats)StatusEffect_FPO_Passive).m_mods.ToList(), ((SE_Stats)statusEffect_FPO).m_mods.ToList());
				}
			}
		}
		StatusEffect_FPO_Passive.m_OutgoingDamageTypes = OutgoingDamage_Sort(StatusEffect_FPO_Passive.m_OutgoingDamageTypes.ToList(), StatusEffect_FPO_Passive.m_OutgoingDamageModifiers.ToList(), out var List_Sort);
		StatusEffect_FPO_Passive.m_OutgoingDamageModifiers = List_Sort;
		((SE_Stats)StatusEffect_FPO_Passive).m_mods = IncomingDamage_Sort(((SE_Stats)StatusEffect_FPO_Passive).m_mods.ToList());
	}

	private static void Update_Equipped_Stats()
	{
		foreach (StatusEffect_FPO item in List_StatusEffect_FPO_Equipped)
		{
			((StatusEffect)item).m_ttl = 0f;
			string text = ((Object)item).name.Replace("SE_FPO_", "GP_").Replace("_Equipped", "");
			if (text == "GP_Fader")
			{
				text = "GP_Ashlands";
			}
			StatusEffect statusEffect = ObjectDB.m_instance.GetStatusEffect(GetHash(text));
			if ((Object)(object)statusEffect != (Object)null)
			{
				((StatusEffect)item).m_icon = statusEffect.m_icon;
			}
		}
	}

	private static void Update_Active_Stats()
	{
		//IL_014d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0152: Unknown result type (might be due to invalid IL or missing references)
		//IL_0357: Unknown result type (might be due to invalid IL or missing references)
		//IL_035c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0372: Expected Obj, but got Unknown
		//IL_06f9: Unknown result type (might be due to invalid IL or missing references)
		//IL_06fe: Unknown result type (might be due to invalid IL or missing references)
		if (List_StatusEffect_FPO.Count <= 0)
		{
			return;
		}
		for (int i = 0; i < List_StatusEffect_FPO.Count; i++)
		{
			List_StatusEffect_FPO[i].m_MaxHealth = List_StatusEffect_FPO_Active[i].m_MaxHealth;
			List_StatusEffect_FPO[i].m_HealthRegen = List_StatusEffect_FPO_Active[i].m_HealthRegen;
			((SE_Stats)List_StatusEffect_FPO[i]).m_healthRegenMultiplier = ((SE_Stats)List_StatusEffect_FPO_Active[i]).m_healthRegenMultiplier;
			List_StatusEffect_FPO[i].m_MaxStamina = List_StatusEffect_FPO_Active[i].m_MaxStamina;
			((SE_Stats)List_StatusEffect_FPO[i]).m_staminaRegenMultiplier = ((SE_Stats)List_StatusEffect_FPO_Active[i]).m_staminaRegenMultiplier;
			List_StatusEffect_FPO[i].m_MaxEitr = List_StatusEffect_FPO_Active[i].m_MaxEitr;
			((SE_Stats)List_StatusEffect_FPO[i]).m_eitrRegenMultiplier = ((SE_Stats)List_StatusEffect_FPO_Active[i]).m_eitrRegenMultiplier;
			((SE_Stats)List_StatusEffect_FPO[i]).m_addMaxCarryWeight = ((SE_Stats)List_StatusEffect_FPO_Active[i]).m_addMaxCarryWeight;
			((SE_Stats)List_StatusEffect_FPO[i]).m_speedModifier = ((SE_Stats)List_StatusEffect_FPO_Active[i]).m_speedModifier;
			((SE_Stats)List_StatusEffect_FPO[i]).m_jumpModifier = ((SE_Stats)List_StatusEffect_FPO_Active[i]).m_jumpModifier;
			((SE_Stats)List_StatusEffect_FPO[i]).m_maxMaxFallSpeed = ((SE_Stats)List_StatusEffect_FPO_Active[i]).m_maxMaxFallSpeed;
			List_StatusEffect_FPO[i].m_EquipmentSpeedModifier = List_StatusEffect_FPO_Active[i].m_EquipmentSpeedModifier;
			List_StatusEffect_FPO[i].m_WindSpeedModifier = List_StatusEffect_FPO_Active[i].m_WindSpeedModifier;
			((SE_Stats)List_StatusEffect_FPO[i]).m_runStaminaDrainModifier = ((SE_Stats)List_StatusEffect_FPO_Active[i]).m_runStaminaDrainModifier;
			((SE_Stats)List_StatusEffect_FPO[i]).m_jumpStaminaUseModifier = ((SE_Stats)List_StatusEffect_FPO_Active[i]).m_jumpStaminaUseModifier;
			((SE_Stats)List_StatusEffect_FPO[i]).m_stealthModifier = ((SE_Stats)List_StatusEffect_FPO_Active[i]).m_stealthModifier;
			((SE_Stats)List_StatusEffect_FPO[i]).m_noiseModifier = ((SE_Stats)List_StatusEffect_FPO_Active[i]).m_noiseModifier;
			List_StatusEffect_FPO[i].m_StatusAttributes = List_StatusEffect_FPO_Active[i].m_StatusAttributes.ToList();
			List_StatusEffect_FPO[i].m_OutgoingDamageTypes = List_StatusEffect_FPO_Active[i].m_OutgoingDamageTypes.ToList();
			List_StatusEffect_FPO[i].m_OutgoingDamageModifiers = List_StatusEffect_FPO_Active[i].m_OutgoingDamageModifiers.ToList();
			((SE_Stats)List_StatusEffect_FPO[i]).m_fallDamageModifier = ((SE_Stats)List_StatusEffect_FPO_Active[i]).m_fallDamageModifier;
			List_StatusEffect_FPO[i].m_HeatDamageModifier = List_StatusEffect_FPO_Active[i].m_HeatDamageModifier;
			((SE_Stats)List_StatusEffect_FPO[i]).m_mods = ((SE_Stats)List_StatusEffect_FPO_Active[i]).m_mods.ToList();
			((StatusEffect)List_StatusEffect_FPO[i]).m_ttl = ConfigEntry_General_GuardianPower_ActiveDuration.Value;
			((StatusEffect)List_StatusEffect_FPO[i]).m_startEffects.m_effectPrefabs = new EffectData[1];
			((StatusEffect)List_StatusEffect_FPO[i]).m_startEffects.m_effectPrefabs[0] = new EffectData
			{
				m_prefab = PrefabManager.Instance.GetPrefab("fx_GP_Activation")
			};
			string text = ((Object)List_StatusEffect_FPO[i]).name.Replace("SE_FPO_", "GP_");
			if (text == "GP_Fader")
			{
				text = "GP_Ashlands";
			}
			StatusEffect statusEffect = ObjectDB.m_instance.GetStatusEffect(GetHash(text));
			if ((Object)(object)statusEffect != (Object)null)
			{
				((StatusEffect)List_StatusEffect_FPO[i]).m_icon = statusEffect.m_icon;
			}
			foreach (string globalKey in ZoneSystem.instance.GetGlobalKeys())
			{
				if (globalKey.StartsWith("gk_fpo_bossstone_") && globalKey != "gk_fpo_bossstone_passive")
				{
					StatusEffect_FPO statusEffect_FPO = globalKey switch
					{
						"gk_fpo_bossstone_eikthyr" => StatusEffect_FPO_Eikthyr_Shared, 
						"gk_fpo_bossstone_theelder" => StatusEffect_FPO_TheElder_Shared, 
						"gk_fpo_bossstone_bonemass" => StatusEffect_FPO_Bonemass_Shared, 
						"gk_fpo_bossstone_moder" => StatusEffect_FPO_Moder_Shared, 
						"gk_fpo_bossstone_yagluth" => StatusEffect_FPO_Yagluth_Shared, 
						"gk_fpo_bossstone_queen" => StatusEffect_FPO_Queen_Shared, 
						"gk_fpo_bossstone_fader" => StatusEffect_FPO_Fader_Shared, 
						_ => null, 
					};
					if ((Object)(object)statusEffect_FPO != (Object)null)
					{
						List_StatusEffect_FPO[i].m_MaxHealth += statusEffect_FPO.m_MaxHealth;
						List_StatusEffect_FPO[i].m_HealthRegen += statusEffect_FPO.m_HealthRegen;
						StatusEffect_FPO statusEffect_FPO2 = List_StatusEffect_FPO[i];
						((SE_Stats)statusEffect_FPO2).m_healthRegenMultiplier = ((SE_Stats)statusEffect_FPO2).m_healthRegenMultiplier + (((SE_Stats)statusEffect_FPO).m_healthRegenMultiplier - 1f);
						List_StatusEffect_FPO[i].m_MaxStamina += statusEffect_FPO.m_MaxStamina;
						StatusEffect_FPO statusEffect_FPO3 = List_StatusEffect_FPO[i];
						((SE_Stats)statusEffect_FPO3).m_staminaRegenMultiplier = ((SE_Stats)statusEffect_FPO3).m_staminaRegenMultiplier + (((SE_Stats)statusEffect_FPO).m_staminaRegenMultiplier - 1f);
						List_StatusEffect_FPO[i].m_MaxEitr += statusEffect_FPO.m_MaxEitr;
						StatusEffect_FPO statusEffect_FPO4 = List_StatusEffect_FPO[i];
						((SE_Stats)statusEffect_FPO4).m_eitrRegenMultiplier = ((SE_Stats)statusEffect_FPO4).m_eitrRegenMultiplier + (((SE_Stats)statusEffect_FPO).m_eitrRegenMultiplier - 1f);
						StatusEffect_FPO statusEffect_FPO5 = List_StatusEffect_FPO[i];
						((SE_Stats)statusEffect_FPO5).m_addMaxCarryWeight = ((SE_Stats)statusEffect_FPO5).m_addMaxCarryWeight + ((SE_Stats)statusEffect_FPO).m_addMaxCarryWeight;
						StatusEffect_FPO statusEffect_FPO6 = List_StatusEffect_FPO[i];
						((SE_Stats)statusEffect_FPO6).m_speedModifier = ((SE_Stats)statusEffect_FPO6).m_speedModifier + ((SE_Stats)statusEffect_FPO).m_speedModifier;
						((SE_Stats)List_StatusEffect_FPO[i]).m_jumpModifier = new Vector3(((SE_Stats)List_StatusEffect_FPO[i]).m_jumpModifier.x + ((SE_Stats)statusEffect_FPO).m_jumpModifier.x, ((SE_Stats)List_StatusEffect_FPO[i]).m_jumpModifier.y + ((SE_Stats)statusEffect_FPO).m_jumpModifier.y, ((SE_Stats)List_StatusEffect_FPO[i]).m_jumpModifier.z + ((SE_Stats)statusEffect_FPO).m_jumpModifier.z);
						ref float maxMaxFallSpeed = ref ((SE_Stats)List_StatusEffect_FPO[i]).m_maxMaxFallSpeed;
						float num;
						if (((SE_Stats)List_StatusEffect_FPO[i]).m_maxMaxFallSpeed == 0f)
						{
							num = ((SE_Stats)statusEffect_FPO).m_maxMaxFallSpeed;
						}
						else if (((SE_Stats)statusEffect_FPO).m_maxMaxFallSpeed == 0f)
						{
							num = ((SE_Stats)List_StatusEffect_FPO[i]).m_maxMaxFallSpeed;
						}
						else
						{
							num = ((((SE_Stats)statusEffect_FPO).m_maxMaxFallSpeed < ((SE_Stats)List_StatusEffect_FPO[i]).m_maxMaxFallSpeed) ? ((SE_Stats)statusEffect_FPO).m_maxMaxFallSpeed : ((SE_Stats)List_StatusEffect_FPO[i]).m_maxMaxFallSpeed);
						}
						maxMaxFallSpeed = num;
						List_StatusEffect_FPO[i].m_EquipmentSpeedModifier += statusEffect_FPO.m_EquipmentSpeedModifier;
						List_StatusEffect_FPO[i].m_WindSpeedModifier += statusEffect_FPO.m_WindSpeedModifier;
						StatusEffect_FPO statusEffect_FPO7 = List_StatusEffect_FPO[i];
						((SE_Stats)statusEffect_FPO7).m_runStaminaDrainModifier = ((SE_Stats)statusEffect_FPO7).m_runStaminaDrainModifier + ((SE_Stats)statusEffect_FPO).m_runStaminaDrainModifier;
						StatusEffect_FPO statusEffect_FPO8 = List_StatusEffect_FPO[i];
						((SE_Stats)statusEffect_FPO8).m_jumpStaminaUseModifier = ((SE_Stats)statusEffect_FPO8).m_jumpStaminaUseModifier + ((SE_Stats)statusEffect_FPO).m_jumpStaminaUseModifier;
						StatusEffect_FPO statusEffect_FPO9 = List_StatusEffect_FPO[i];
						((SE_Stats)statusEffect_FPO9).m_stealthModifier = ((SE_Stats)statusEffect_FPO9).m_stealthModifier + ((SE_Stats)statusEffect_FPO).m_stealthModifier;
						StatusEffect_FPO statusEffect_FPO10 = List_StatusEffect_FPO[i];
						((SE_Stats)statusEffect_FPO10).m_noiseModifier = ((SE_Stats)statusEffect_FPO10).m_noiseModifier + ((SE_Stats)statusEffect_FPO).m_noiseModifier;
						List_StatusEffect_FPO[i].m_StatusAttributes = StatusAttributes_Concat(List_StatusEffect_FPO[i].m_StatusAttributes.ToList(), statusEffect_FPO.m_StatusAttributes.ToList());
						List_StatusEffect_FPO[i].m_OutgoingDamageTypes = OutgoingDamage_Concat(List_StatusEffect_FPO[i].m_OutgoingDamageTypes.ToList(), statusEffect_FPO.m_OutgoingDamageTypes.ToList(), List_StatusEffect_FPO[i].m_OutgoingDamageModifiers.ToList(), statusEffect_FPO.m_OutgoingDamageModifiers.ToList(), out var m_OutgoingDamageModifiers);
						List_StatusEffect_FPO[i].m_OutgoingDamageModifiers = m_OutgoingDamageModifiers;
						StatusEffect_FPO statusEffect_FPO11 = List_StatusEffect_FPO[i];
						((SE_Stats)statusEffect_FPO11).m_fallDamageModifier = ((SE_Stats)statusEffect_FPO11).m_fallDamageModifier + ((SE_Stats)statusEffect_FPO).m_fallDamageModifier;
						List_StatusEffect_FPO[i].m_HeatDamageModifier += statusEffect_FPO.m_HeatDamageModifier;
						((SE_Stats)List_StatusEffect_FPO[i]).m_mods = IncomingDamage_Concat(((SE_Stats)List_StatusEffect_FPO[i]).m_mods.ToList(), ((SE_Stats)statusEffect_FPO).m_mods.ToList());
					}
				}
			}
			List_StatusEffect_FPO[i].m_OutgoingDamageTypes = OutgoingDamage_Sort(List_StatusEffect_FPO[i].m_OutgoingDamageTypes.ToList(), List_StatusEffect_FPO[i].m_OutgoingDamageModifiers.ToList(), out var List_Sort);
			List_StatusEffect_FPO[i].m_OutgoingDamageModifiers = List_Sort;
			((SE_Stats)List_StatusEffect_FPO[i]).m_mods = IncomingDamage_Sort(((SE_Stats)List_StatusEffect_FPO[i]).m_mods.ToList());
		}
	}

	private static List<StatusAttribute> StatusAttributes_Concat(List<StatusAttribute> List, List<StatusAttribute> List_Add)
	{
		//IL_0011: Unknown result type (might be due to invalid IL or missing references)
		//IL_0016: Unknown result type (might be due to invalid IL or missing references)
		//IL_0025: Unknown result type (might be due to invalid IL or missing references)
		//IL_002a: Unknown result type (might be due to invalid IL or missing references)
		//IL_002c: Unknown result type (might be due to invalid IL or missing references)
		//IL_002d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0050: Unknown result type (might be due to invalid IL or missing references)
		List<StatusAttribute> list = new List<StatusAttribute>();
		foreach (StatusAttribute item in List_Add)
		{
			bool flag = true;
			foreach (StatusAttribute item2 in List)
			{
				if (item == item2)
				{
					flag = false;
				}
			}
			if (flag)
			{
				list.Add(item);
			}
		}
		return List.Concat(list).ToList();
	}

	private static List<SkillType> OutgoingDamage_Concat(List<SkillType> Type, List<SkillType> TypeAdd, List<float> Modifier, List<float> ModifierAdd, out List<float> m_OutgoingDamageModifiers)
	{
		//IL_001a: Unknown result type (might be due to invalid IL or missing references)
		//IL_001f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0032: Unknown result type (might be due to invalid IL or missing references)
		//IL_0037: Unknown result type (might be due to invalid IL or missing references)
		//IL_0039: Unknown result type (might be due to invalid IL or missing references)
		//IL_003a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0042: Unknown result type (might be due to invalid IL or missing references)
		//IL_009a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0069: Unknown result type (might be due to invalid IL or missing references)
		//IL_0072: Unknown result type (might be due to invalid IL or missing references)
		List<SkillType> list = new List<SkillType>();
		List<float> list2 = new List<float>();
		foreach (SkillType item in TypeAdd)
		{
			bool flag = true;
			int index = 0;
			foreach (SkillType item2 in Type)
			{
				if (item == item2)
				{
					flag = false;
					index = Type.IndexOf(item2);
				}
			}
			if (flag)
			{
				list.Add(item);
				list2.Add(ModifierAdd[TypeAdd.IndexOf(item)]);
			}
			else
			{
				Modifier[index] += ModifierAdd[TypeAdd.IndexOf(item)];
			}
		}
		m_OutgoingDamageModifiers = Modifier.Concat(list2).ToList();
		return Type.Concat(list).ToList();
	}

	private static List<DamageModPair> IncomingDamage_Concat(List<DamageModPair> List, List<DamageModPair> List_Add)
	{
		//IL_0014: Unknown result type (might be due to invalid IL or missing references)
		//IL_0019: Unknown result type (might be due to invalid IL or missing references)
		//IL_002b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0030: Unknown result type (might be due to invalid IL or missing references)
		//IL_0032: Unknown result type (might be due to invalid IL or missing references)
		//IL_0033: Unknown result type (might be due to invalid IL or missing references)
		//IL_0038: Unknown result type (might be due to invalid IL or missing references)
		//IL_003a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0044: Unknown result type (might be due to invalid IL or missing references)
		//IL_0077: Unknown result type (might be due to invalid IL or missing references)
		//IL_007f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0080: Unknown result type (might be due to invalid IL or missing references)
		//IL_0085: Unknown result type (might be due to invalid IL or missing references)
		//IL_008c: Unknown result type (might be due to invalid IL or missing references)
		//IL_008d: Unknown result type (might be due to invalid IL or missing references)
		//IL_009a: Unknown result type (might be due to invalid IL or missing references)
		//IL_009f: Unknown result type (might be due to invalid IL or missing references)
		//IL_006a: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ba: Unknown result type (might be due to invalid IL or missing references)
		//IL_00bb: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ae: Unknown result type (might be due to invalid IL or missing references)
		//IL_00b3: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c0: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c5: Unknown result type (might be due to invalid IL or missing references)
		List<DamageModPair> list = new List<DamageModPair>();
		foreach (DamageModPair item in List_Add)
		{
			bool flag = true;
			int index = 0;
			foreach (DamageModPair item2 in List)
			{
				if (item.m_type == item2.m_type)
				{
					flag = false;
					index = List.IndexOf(item2);
				}
			}
			if (flag)
			{
				list.Add(item);
				continue;
			}
			List[index] = new DamageModPair
			{
				m_type = item.m_type,
				m_modifier = ((GetToolTipIncomingDamageModifier(item.m_modifier) < GetToolTipIncomingDamageModifier(List[index].m_modifier)) ? item.m_modifier : List[index].m_modifier)
			};
		}
		return List.Concat(list).ToList();
	}

	private static List<SkillType> OutgoingDamage_Sort(List<SkillType> List_Type, List<float> List_Modifier, out List<float> List_Sort)
	{
		//IL_0087: Unknown result type (might be due to invalid IL or missing references)
		//IL_008c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0094: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a2: Unknown result type (might be due to invalid IL or missing references)
		List<SkillType> list = new List<SkillType>();
		List<float> list2 = new List<float>();
		foreach (SkillType item in new List<SkillType>
		{
			(SkillType)999,
			(SkillType)11,
			(SkillType)3,
			(SkillType)7,
			(SkillType)2,
			(SkillType)5,
			(SkillType)1,
			(SkillType)4,
			(SkillType)8,
			(SkillType)14,
			(SkillType)9,
			(SkillType)10,
			(SkillType)13,
			(SkillType)12
		})
		{
			if (OutgoingDamage_Sort_Loop(List_Type.ToList(), item, out var Index))
			{
				list.Add(List_Type[Index]);
				list2.Add(List_Modifier[Index]);
			}
		}
		List_Sort = list2.ToList();
		return list.ToList();
	}

	private static bool OutgoingDamage_Sort_Loop(List<SkillType> List, SkillType SkillType_Sort, out int Index)
	{
		//IL_000b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0010: Unknown result type (might be due to invalid IL or missing references)
		//IL_0011: Unknown result type (might be due to invalid IL or missing references)
		//IL_0012: Unknown result type (might be due to invalid IL or missing references)
		//IL_0017: Unknown result type (might be due to invalid IL or missing references)
		foreach (SkillType item in List)
		{
			if (item == SkillType_Sort)
			{
				Index = List.IndexOf(item);
				return true;
			}
		}
		Index = 0;
		return false;
	}

	private static List<DamageModPair> IncomingDamage_Sort(List<DamageModPair> List)
	{
		//IL_007d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0082: Unknown result type (might be due to invalid IL or missing references)
		//IL_008a: Unknown result type (might be due to invalid IL or missing references)
		//IL_008b: Unknown result type (might be due to invalid IL or missing references)
		List<DamageModPair> list = new List<DamageModPair>();
		foreach (DamageType item in new List<DamageType>
		{
			(DamageType)31,
			(DamageType)4,
			(DamageType)2,
			(DamageType)1,
			(DamageType)224,
			(DamageType)128,
			(DamageType)256,
			(DamageType)64,
			(DamageType)32,
			(DamageType)512,
			(DamageType)8,
			(DamageType)16
		})
		{
			list.Add(IncomingDamage_Sort_Loop(List.ToList(), item));
		}
		return list.ToList();
	}

	private static DamageModPair IncomingDamage_Sort_Loop(List<DamageModPair> List, DamageType DamageType_Sort)
	{
		//IL_000b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0010: Unknown result type (might be due to invalid IL or missing references)
		//IL_0011: Unknown result type (might be due to invalid IL or missing references)
		//IL_0012: Unknown result type (might be due to invalid IL or missing references)
		//IL_0017: Unknown result type (might be due to invalid IL or missing references)
		//IL_001a: Unknown result type (might be due to invalid IL or missing references)
		//IL_001b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0039: Unknown result type (might be due to invalid IL or missing references)
		//IL_003f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0041: Unknown result type (might be due to invalid IL or missing references)
		foreach (DamageModPair item in List)
		{
			if (item.m_type == DamageType_Sort)
			{
				return item;
			}
		}
		return default;
	}

	private static float Update_Player_BaseStats(string New_String, Player New_Player)
	{
		if ((Object)(object)New_Player != (Object)null)
		{
			float num = 0f;
			float num2 = 0f;
			float num3 = 0f;
			float num4 = 0f;
			float num5 = 0f;
			float num6 = 0f;
			float num7 = 0f;
			foreach (StatusEffect statusEffect in ((Character)New_Player).m_seman.GetStatusEffects())
			{
				if (((Object)statusEffect).name.StartsWith("SE_FPO_"))
				{
					StatusEffect_FPO statusEffect_FPO = (StatusEffect_FPO)(object)statusEffect;
					num += statusEffect_FPO.m_MaxHealth;
					num2 += statusEffect_FPO.m_HealthRegen;
					num3 += statusEffect_FPO.m_MaxStamina;
					num4 += statusEffect_FPO.m_MaxEitr;
					num5 += statusEffect_FPO.m_EquipmentSpeedModifier;
					num6 += statusEffect_FPO.m_WindSpeedModifier;
					num7 += statusEffect_FPO.m_HeatDamageModifier;
				}
			}
			switch (New_String)
			{
			case "MaxHealth":
				return num;
			case "HealthRegen":
				return num2;
			case "MaxStamina":
				return num3;
			case "MaxEitr":
				return num4;
			case "EquipmentSpeedModifier":
				return num5;
			case "WindSpeedModifier":
				return num6;
			case "HeatDamageModifier":
				return num7;
			}
		}
		return 0f;
	}

	private static void Power_Unlock(BossStone New_BossStone)
	{
		if ((Object)(object)Player.m_localPlayer != (Object)null)
		{
			string bossName = GetBossName(New_BossStone.m_itemStand.m_currentItemName);
			if (bossName != "")
			{
				Power_Set("GP_" + bossName, Unlock: true);
			}
		}
	}

	private static void Power_Unlock_Spawn(Player New_Player)
	{
		if (!((Object)(object)New_Player == (Object)(object)Player.m_localPlayer) || New_Player.GetGuardianPowerName().StartsWith("GP_") || !ZoneSystem.instance.GetGlobalKey("gk_fpo_bossstone_passive"))
		{
			return;
		}
		List<string> list = new List<string>();
		foreach (string unique in New_Player.m_uniques)
		{
			if (unique.StartsWith("GP_"))
			{
				list.Add(unique);
			}
		}
		Power_Set(Power_Sort(list.ToList())[0], Unlock: true);
	}

	private static void Power_Lock(Player New_Player)
	{
		if (!((Object)(object)New_Player == (Object)(object)Player.m_localPlayer) || !New_Player.GetGuardianPowerName().StartsWith("GP_"))
		{
			return;
		}
		if (!ZoneSystem.instance.GetGlobalKey("gk_fpo_bossstone_passive"))
		{
			New_Player.SetGuardianPower("");
			return;
		}
		bool flag = true;
		foreach (string globalKey in ZoneSystem.instance.GetGlobalKeys())
		{
			if (GetBossName(New_Player.GetGuardianPowerName()) == GetBossName(globalKey))
			{
				flag = false;
			}
		}
		if (flag)
		{
			New_Player.SetGuardianPower("");
		}
	}

	private static void Power_Cycle()
	{
		List<string> list = new List<string>();
		PlayerKeys_Update();
		foreach (string unique in Player.m_localPlayer.m_uniques)
		{
			foreach (string globalKey in ZoneSystem.instance.GetGlobalKeys())
			{
				if (globalKey.StartsWith("gk_fpo_bossstone_") && GetBossName(unique) == GetBossName(globalKey))
				{
					list.Add(unique);
				}
			}
		}
		List<string> list2 = Power_Sort(list.ToList());
		if (list2.Count <= 0)
		{
			return;
		}
		int num = 0;
		foreach (string item in list2)
		{
			if (Player.m_localPlayer.GetGuardianPowerName() == item || (item == "GP_Fader" && Player.m_localPlayer.GetGuardianPowerName() == "GP_Ashlands"))
			{
				num = list2.IndexOf(item);
			}
		}
		if (num + 1 == list2.Count)
		{
			num = -1;
		}
		Power_Set(list2[num + 1], Unlock: false);
	}

	private static void Power_Set(string Power, bool Unlock)
	{
		//IL_001f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0024: Unknown result type (might be due to invalid IL or missing references)
		//IL_0031: Expected Obj, but got Unknown
		//IL_003b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0040: Unknown result type (might be due to invalid IL or missing references)
		//IL_00b5: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ba: Unknown result type (might be due to invalid IL or missing references)
		//IL_00cf: Unknown result type (might be due to invalid IL or missing references)
		//IL_00d7: Expected Obj, but got Unknown
		//IL_00d8: Unknown result type (might be due to invalid IL or missing references)
		//IL_00e3: Unknown result type (might be due to invalid IL or missing references)
		//IL_00fa: Unknown result type (might be due to invalid IL or missing references)
		//IL_0100: Unknown result type (might be due to invalid IL or missing references)
		//IL_005b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0060: Unknown result type (might be due to invalid IL or missing references)
		//IL_0075: Unknown result type (might be due to invalid IL or missing references)
		//IL_007d: Expected Obj, but got Unknown
		//IL_007e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0089: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a0: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a6: Unknown result type (might be due to invalid IL or missing references)
		Player.m_localPlayer.SetGuardianPower((Power == "GP_Fader") ? "GP_Ashlands" : Power);
		EffectList val = new EffectList
		{
			m_effectPrefabs = new EffectData[1]
		};
		Vector3 position = ((Component)Player.m_localPlayer).transform.position;
		position.y += 0.925f;
		if (Unlock)
		{
			val.m_effectPrefabs[0] = new EffectData
			{
				m_prefab = PrefabManager.Instance.GetPrefab("GO_FPO_Effect_PowerUnlock"),
				m_scale = true
			};
			val.Create(position, ((Component)Player.m_localPlayer).transform.rotation, ((Component)Player.m_localPlayer).transform, 0.5f, -1, default(ZDOID));
		}
		else
		{
			val.m_effectPrefabs[0] = new EffectData
			{
				m_prefab = PrefabManager.Instance.GetPrefab("sfx_gui_button"),
				m_attach = true
			};
			val.Create(position, ((Component)Player.m_localPlayer).transform.rotation, ((Component)Player.m_localPlayer).transform, 1f, -1, default(ZDOID));
		}
	}

	private static List<string> Power_Sort(List<string> PlayerKeys)
	{
		List<string> list = new List<string>();
		foreach (string list_BossName in List_BossNames)
		{
			if (PlayerKeys.Contains("GP_" + list_BossName))
			{
				list.Add("GP_" + list_BossName);
			}
		}
		return list.ToList();
	}

	private static string GetBossName(string New_String)
	{
		New_String = New_String.ToLower();
		if (New_String.StartsWith("$item_trophy_") || New_String.StartsWith("gk_fpo_bossstone_") || New_String.StartsWith("gp_"))
		{
			if (New_String.Contains("_eikthyr"))
			{
				return "Eikthyr";
			}
			if (New_String.Contains("_theelder") || New_String.Contains("_elder"))
			{
				return "TheElder";
			}
			if (New_String.Contains("_bonemass"))
			{
				return "Bonemass";
			}
			if (New_String.Contains("_moder") || New_String.Contains("_dragonqueen"))
			{
				return "Moder";
			}
			if (New_String.Contains("_yagluth") || New_String.Contains("_goblinking"))
			{
				return "Yagluth";
			}
			if (New_String.Contains("_queen") || New_String.Contains("_seekerqueen"))
			{
				return "Queen";
			}
			if (New_String.Contains("_fader") || New_String.Contains("_ashlands"))
			{
				return "Fader";
			}
		}
		return "";
	}

	private static void Add_Prefabs()
	{
		//IL_0029: Unknown result type (might be due to invalid IL or missing references)
		//IL_002f: Expected Obj, but got Unknown
		//IL_0042: Unknown result type (might be due to invalid IL or missing references)
		//IL_0047: Unknown result type (might be due to invalid IL or missing references)
		GameObject val = PrefabManager.Instance.CreateClonedPrefab("GO_FPO_Effect_PowerUnlock", "fx_GP_Stone");
		foreach (Transform item in val.transform)
		{
			Transform val2 = item;
			if (Object.op_Implicit((Object)(object)((Component)val2).GetComponent<ParticleSystem>()))
			{
				MainModule main = ((Component)val2).GetComponent<ParticleSystem>().main;
				main.scalingMode = (ParticleSystemScalingMode)0;
			}
		}
		PrefabManager.Instance.AddPrefab(val);
		PrefabManager.OnVanillaPrefabsAvailable -= Add_Prefabs;
	}

	private static void Add_StatusEffects()
	{
		//IL_002e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0038: Expected Obj, but got Unknown
		//IL_00a2: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ac: Expected Obj, but got Unknown
		//IL_0428: Unknown result type (might be due to invalid IL or missing references)
		//IL_046f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0421: Unknown result type (might be due to invalid IL or missing references)
		//IL_0474: Unknown result type (might be due to invalid IL or missing references)
		//IL_089d: Unknown result type (might be due to invalid IL or missing references)
		//IL_08a7: Expected Obj, but got Unknown
		StatusEffect_FPO statusEffect_FPO = ScriptableObject.CreateInstance<StatusEffect_FPO>();
		((Object)statusEffect_FPO).name = "SE_FPO_Passive";
		((StatusEffect)statusEffect_FPO).m_name = "$ui_fpo_passive";
		((StatusEffect)statusEffect_FPO).m_tooltip = "$ui_fpo_passive";
		ItemManager.Instance.AddStatusEffect(new CustomStatusEffect((StatusEffect)(object)statusEffect_FPO, false));
		foreach (string list_BossName in List_BossNames)
		{
			StatusEffect_FPO statusEffect_FPO2 = ScriptableObject.CreateInstance<StatusEffect_FPO>();
			((Object)statusEffect_FPO2).name = "SE_FPO_" + list_BossName;
			((StatusEffect)statusEffect_FPO2).m_name = "$se_" + list_BossName.ToLower() + "_name";
			((StatusEffect)statusEffect_FPO2).m_tooltip = "$se_" + list_BossName.ToLower() + "_name";
			ItemManager.Instance.AddStatusEffect(new CustomStatusEffect((StatusEffect)(object)statusEffect_FPO2, false));
		}
		foreach (string list_BossName2 in List_BossNames)
		{
			foreach (string list_Component in List_Components)
			{
				StatusEffect_FPO statusEffect_FPO3 = ScriptableObject.CreateInstance<StatusEffect_FPO>();
				((Object)statusEffect_FPO3).name = "SE_FPO_" + list_BossName2 + "_" + list_Component;
				((StatusEffect)statusEffect_FPO3).m_name = ((list_Component == "Equipped") ? "$ui_fpo_equipped $ui_fpo_passive" : ("$se_" + list_BossName2.ToLower() + "_name"));
				statusEffect_FPO3.m_MaxHealth = Dictionary_ConfigEntry_Int["ConfigEntry_" + list_BossName2 + "_" + list_Component + "_MaxHealth"].Value;
				statusEffect_FPO3.m_HealthRegen = Dictionary_ConfigEntry_Int["ConfigEntry_" + list_BossName2 + "_" + list_Component + "_HealthRegen"].Value;
				((SE_Stats)statusEffect_FPO3).m_healthRegenMultiplier = 1f + Dictionary_ConfigEntry_Float["ConfigEntry_" + list_BossName2 + "_" + list_Component + "_HealthRegenModifier"].Value / 100f;
				statusEffect_FPO3.m_MaxStamina = Dictionary_ConfigEntry_Int["ConfigEntry_" + list_BossName2 + "_" + list_Component + "_MaxStamina"].Value;
				((SE_Stats)statusEffect_FPO3).m_staminaRegenMultiplier = 1f + Dictionary_ConfigEntry_Float["ConfigEntry_" + list_BossName2 + "_" + list_Component + "_StaminaRegenModifier"].Value / 100f;
				statusEffect_FPO3.m_MaxEitr = Dictionary_ConfigEntry_Int["ConfigEntry_" + list_BossName2 + "_" + list_Component + "_MaxEitr"].Value;
				((SE_Stats)statusEffect_FPO3).m_eitrRegenMultiplier = 1f + Dictionary_ConfigEntry_Float["ConfigEntry_" + list_BossName2 + "_" + list_Component + "_EitrRegenModifier"].Value / 100f;
				((SE_Stats)statusEffect_FPO3).m_addMaxCarryWeight = Dictionary_ConfigEntry_Int["ConfigEntry_" + list_BossName2 + "_" + list_Component + "_MaxWeight"].Value;
				((SE_Stats)statusEffect_FPO3).m_speedModifier = 0f + Dictionary_ConfigEntry_Float["ConfigEntry_" + list_BossName2 + "_" + list_Component + "_MoveSpeedModifier"].Value / 100f;
				((SE_Stats)statusEffect_FPO3).m_jumpModifier = ((Dictionary_ConfigEntry_Float["ConfigEntry_" + list_BossName2 + "_" + list_Component + "_JumpForceModifier"].Value != 0f) ? (Vector3.one * (Dictionary_ConfigEntry_Float["ConfigEntry_" + list_BossName2 + "_" + list_Component + "_JumpForceModifier"].Value / 200f)) : Vector3.zero);
				((SE_Stats)statusEffect_FPO3).m_maxMaxFallSpeed = 0f + Dictionary_ConfigEntry_Float["ConfigEntry_" + list_BossName2 + "_" + list_Component + "_MaxFallSpeed"].Value;
				statusEffect_FPO3.m_EquipmentSpeedModifier = 0f - Dictionary_ConfigEntry_Float["ConfigEntry_" + list_BossName2 + "_" + list_Component + "_EquipmentSpeedModifier"].Value / 100f;
				statusEffect_FPO3.m_WindSpeedModifier = 0f + Dictionary_ConfigEntry_Float["ConfigEntry_" + list_BossName2 + "_" + list_Component + "_WindSpeedModifier"].Value / 100f;
				((SE_Stats)statusEffect_FPO3).m_runStaminaDrainModifier = 0f - Dictionary_ConfigEntry_Float["ConfigEntry_" + list_BossName2 + "_" + list_Component + "_RunStaminaCostModifier"].Value / 100f;
				((SE_Stats)statusEffect_FPO3).m_jumpStaminaUseModifier = 0f - Dictionary_ConfigEntry_Float["ConfigEntry_" + list_BossName2 + "_" + list_Component + "_JumpStaminaCostModifier"].Value / 100f;
				((SE_Stats)statusEffect_FPO3).m_stealthModifier = 0f - Dictionary_ConfigEntry_Float["ConfigEntry_" + list_BossName2 + "_" + list_Component + "_StealthModifier"].Value / 100f;
				((SE_Stats)statusEffect_FPO3).m_noiseModifier = 0f - Dictionary_ConfigEntry_Float["ConfigEntry_" + list_BossName2 + "_" + list_Component + "_NoiseModifier"].Value / 100f;
				statusEffect_FPO3.m_StatusAttributes = GetStatusAttributes(Dictionary_ConfigEntry_String["ConfigEntry_" + list_BossName2 + "_" + list_Component + "_StatusAttributes"].Value);
				statusEffect_FPO3.m_OutgoingDamageTypes = GetOutgoingDamages(Dictionary_ConfigEntry_String["ConfigEntry_" + list_BossName2 + "_" + list_Component + "_OutgoingDamageTypes"].Value, Dictionary_ConfigEntry_String["ConfigEntry_" + list_BossName2 + "_" + list_Component + "_OutgoingDamageModifiers"].Value, out var Out_OutgoingDamageModifiers);
				statusEffect_FPO3.m_OutgoingDamageModifiers = Out_OutgoingDamageModifiers;
				((SE_Stats)statusEffect_FPO3).m_fallDamageModifier = 0f - Dictionary_ConfigEntry_Float["ConfigEntry_" + list_BossName2 + "_" + list_Component + "_FallDamageModifier"].Value / 100f;
				statusEffect_FPO3.m_HeatDamageModifier = 0f - Dictionary_ConfigEntry_Float["ConfigEntry_" + list_BossName2 + "_" + list_Component + "_HeatDamageModifier"].Value / 100f;
				((SE_Stats)statusEffect_FPO3).m_mods = GetIncomingDamages(Dictionary_ConfigEntry_String["ConfigEntry_" + list_BossName2 + "_" + list_Component + "_IncomingDamageTypes"].Value, Dictionary_ConfigEntry_String["ConfigEntry_" + list_BossName2 + "_" + list_Component + "_IncomingDamageModifiers"].Value);
				ItemManager.Instance.AddStatusEffect(new CustomStatusEffect((StatusEffect)(object)statusEffect_FPO3, false));
			}
		}
	}

	private static List<StatusAttribute> GetStatusAttributes(string List)
	{
		//IL_0042: Unknown result type (might be due to invalid IL or missing references)
		//IL_0047: Unknown result type (might be due to invalid IL or missing references)
		//IL_0055: Unknown result type (might be due to invalid IL or missing references)
		//IL_005a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0089: Unknown result type (might be due to invalid IL or missing references)
		List<string> list = List.Split(new char[1] { ',' }).ToList();
		List<StatusAttribute> list2 = new List<StatusAttribute>();
		for (int i = 0; i < list.Count; i++)
		{
			if (!GetStatusAttributeValid(list[i].ToLower()))
			{
				continue;
			}
			bool flag = true;
			foreach (StatusAttribute item in list2)
			{
				if (GetStatusAttribute(list[i].ToLower()) == item)
				{
					flag = false;
				}
			}
			if (flag)
			{
				list2.Add(GetStatusAttribute(list[i].ToLower()));
			}
		}
		return list2;
	}

	private static bool GetStatusAttributeValid(string New_String)
	{
		return New_String switch
		{
			"coldresistance" => true, 
			"doubleimpactdamage" => true, 
			"sailingpower" => true, 
			_ => false, 
		};
	}

	private static StatusAttribute GetStatusAttribute(string New_String)
	{
		//IL_002a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0037: Unknown result type (might be due to invalid IL or missing references)
		//IL_002e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0032: Unknown result type (might be due to invalid IL or missing references)
		//IL_0036: Unknown result type (might be due to invalid IL or missing references)
		return New_String switch
		{
			"coldresistance" => (StatusAttribute)1, 
			"doubleimpactdamage" => (StatusAttribute)2, 
			"sailingpower" => (StatusAttribute)4, 
			_ => (StatusAttribute)0, 
		};
	}

	private static List<SkillType> GetOutgoingDamages(string String_Type, string String_Modifier, out List<float> Out_OutgoingDamageModifiers)
	{
		//IL_0068: Unknown result type (might be due to invalid IL or missing references)
		//IL_006d: Unknown result type (might be due to invalid IL or missing references)
		//IL_007c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0081: Unknown result type (might be due to invalid IL or missing references)
		//IL_00b3: Unknown result type (might be due to invalid IL or missing references)
		List<string> list = String_Type.Split(new char[1] { ',' }).ToList();
		List<string> list2 = String_Modifier.Split(new char[1] { ',' }).ToList();
		List<SkillType> list3 = new List<SkillType>();
		List<float> list4 = new List<float>();
		for (int i = 0; i < list.Count && i < list2.Count; i++)
		{
			if (!GetOutgoingDamageTypeValid(list[i].ToLower()))
			{
				continue;
			}
			bool flag = true;
			foreach (SkillType item in list3)
			{
				if (GetOutgoingDamageType(list[i].ToLower()) == item)
				{
					flag = false;
				}
			}
			if (flag)
			{
				list3.Add(GetOutgoingDamageType(list[i].ToLower()));
				if (float.TryParse(list2[i], out var result))
				{
					list4.Add(result / 100f);
				}
				else
				{
					list4.Add(result);
				}
			}
		}
		Out_OutgoingDamageModifiers = list4;
		return list3;
	}

	private static bool GetOutgoingDamageTypeValid(string New_String)
	{
		return New_String switch
		{
			"all" => true, 
			"unarmed" => true, 
			"clubs" => true, 
			"axes" => true, 
			"knives" => true, 
			"spears" => true, 
			"swords" => true, 
			"polearms" => true, 
			"bows" => true, 
			"crossbows" => true, 
			"elementalmagic" => true, 
			"bloodmagic" => true, 
			"woodcutting" => true, 
			"pickaxes" => true, 
			_ => false, 
		};
	}

	private static SkillType GetOutgoingDamageType(string New_String)
	{
		//IL_01ee: Unknown result type (might be due to invalid IL or missing references)
		//IL_01ef: Unknown result type (might be due to invalid IL or missing references)
		//IL_01b0: Unknown result type (might be due to invalid IL or missing references)
		//IL_01b9: Unknown result type (might be due to invalid IL or missing references)
		//IL_01b5: Unknown result type (might be due to invalid IL or missing references)
		//IL_01d6: Unknown result type (might be due to invalid IL or missing references)
		//IL_01e0: Unknown result type (might be due to invalid IL or missing references)
		//IL_01e5: Unknown result type (might be due to invalid IL or missing references)
		//IL_01db: Unknown result type (might be due to invalid IL or missing references)
		//IL_01bd: Unknown result type (might be due to invalid IL or missing references)
		//IL_01c1: Unknown result type (might be due to invalid IL or missing references)
		//IL_01ea: Unknown result type (might be due to invalid IL or missing references)
		//IL_01d1: Unknown result type (might be due to invalid IL or missing references)
		//IL_01c5: Unknown result type (might be due to invalid IL or missing references)
		//IL_01cd: Unknown result type (might be due to invalid IL or missing references)
		//IL_01c9: Unknown result type (might be due to invalid IL or missing references)
		return New_String switch
		{
			"all" => (SkillType)999, 
			"unarmed" => (SkillType)11, 
			"clubs" => (SkillType)3, 
			"axes" => (SkillType)7, 
			"knives" => (SkillType)2, 
			"spears" => (SkillType)5, 
			"swords" => (SkillType)1, 
			"polearms" => (SkillType)4, 
			"bows" => (SkillType)8, 
			"crossbows" => (SkillType)14, 
			"elementalmagic" => (SkillType)9, 
			"bloodmagic" => (SkillType)10, 
			"woodcutting" => (SkillType)13, 
			"pickaxes" => (SkillType)12, 
			_ => (SkillType)0, 
		};
	}

	private static List<DamageModPair> GetIncomingDamages(string String_Type, string String_Modifier)
	{
		//IL_0060: Unknown result type (might be due to invalid IL or missing references)
		//IL_0065: Unknown result type (might be due to invalid IL or missing references)
		//IL_0073: Unknown result type (might be due to invalid IL or missing references)
		//IL_0078: Unknown result type (might be due to invalid IL or missing references)
		//IL_007a: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ec: Unknown result type (might be due to invalid IL or missing references)
		//IL_0100: Unknown result type (might be due to invalid IL or missing references)
		//IL_0105: Unknown result type (might be due to invalid IL or missing references)
		//IL_010d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0112: Unknown result type (might be due to invalid IL or missing references)
		//IL_00b4: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c8: Unknown result type (might be due to invalid IL or missing references)
		//IL_00cd: Unknown result type (might be due to invalid IL or missing references)
		//IL_00d6: Unknown result type (might be due to invalid IL or missing references)
		//IL_00db: Unknown result type (might be due to invalid IL or missing references)
		//IL_00e0: Unknown result type (might be due to invalid IL or missing references)
		List<string> list = String_Type.Split(new char[1] { ',' }).ToList();
		List<string> list2 = String_Modifier.Split(new char[1] { ',' }).ToList();
		List<DamageModPair> list3 = new List<DamageModPair>();
		for (int i = 0; i < list.Count && i < list2.Count; i++)
		{
			if (!GetIncomingDamageTypeValid(list[i].ToLower()))
			{
				continue;
			}
			bool flag = true;
			foreach (DamageModPair item in list3)
			{
				if (GetIncomingDamageType(list[i].ToLower()) == item.m_type)
				{
					flag = false;
				}
			}
			if (flag)
			{
				if (int.TryParse(list2[i], out var result))
				{
					list3.Add(new DamageModPair
					{
						m_type = GetIncomingDamageType(list[i].ToLower()),
						m_modifier = GetIncomingDamageModifier(result)
					});
				}
				else
				{
					list3.Add(new DamageModPair
					{
						m_type = GetIncomingDamageType(list[i].ToLower()),
						m_modifier = (DamageModifier)0
					});
				}
			}
		}
		return list3;
	}

	private static bool GetIncomingDamageTypeValid(string New_String)
	{
		return New_String switch
		{
			"physical" => true, 
			"pierce" => true, 
			"slash" => true, 
			"blunt" => true, 
			"elemental" => true, 
			"lightning" => true, 
			"poison" => true, 
			"frost" => true, 
			"fire" => true, 
			"spirit" => true, 
			"chop" => true, 
			"pickaxe" => true, 
			_ => false, 
		};
	}

	private static DamageType GetIncomingDamageType(string New_String)
	{
		//IL_01d7: Unknown result type (might be due to invalid IL or missing references)
		//IL_01d8: Unknown result type (might be due to invalid IL or missing references)
		//IL_01d2: Unknown result type (might be due to invalid IL or missing references)
		//IL_0193: Unknown result type (might be due to invalid IL or missing references)
		//IL_01cd: Unknown result type (might be due to invalid IL or missing references)
		//IL_019f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0197: Unknown result type (might be due to invalid IL or missing references)
		//IL_01a7: Unknown result type (might be due to invalid IL or missing references)
		//IL_01c1: Unknown result type (might be due to invalid IL or missing references)
		//IL_01bc: Unknown result type (might be due to invalid IL or missing references)
		//IL_01b7: Unknown result type (might be due to invalid IL or missing references)
		//IL_01af: Unknown result type (might be due to invalid IL or missing references)
		//IL_019b: Unknown result type (might be due to invalid IL or missing references)
		//IL_01c9: Unknown result type (might be due to invalid IL or missing references)
		return New_String switch
		{
			"physical" => (DamageType)31, 
			"pierce" => (DamageType)4, 
			"slash" => (DamageType)2, 
			"blunt" => (DamageType)1, 
			"elemental" => (DamageType)224, 
			"lightning" => (DamageType)128, 
			"poison" => (DamageType)256, 
			"frost" => (DamageType)64, 
			"fire" => (DamageType)32, 
			"spirit" => (DamageType)512, 
			"chop" => (DamageType)8, 
			"pickaxe" => (DamageType)16, 
			_ => (DamageType)31, 
		};
	}

	private static DamageModifier GetIncomingDamageModifier(int New_Int)
	{
		//IL_0032: Unknown result type (might be due to invalid IL or missing references)
		//IL_003e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0043: Unknown result type (might be due to invalid IL or missing references)
		//IL_002e: Unknown result type (might be due to invalid IL or missing references)
		//IL_003a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0042: Unknown result type (might be due to invalid IL or missing references)
		//IL_002a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0036: Unknown result type (might be due to invalid IL or missing references)
		return New_Int switch
		{
			200 => (DamageModifier)6, 
			150 => (DamageModifier)2, 
			100 => (DamageModifier)0, 
			50 => (DamageModifier)1, 
			25 => (DamageModifier)5, 
			0 => (DamageModifier)3, 
			_ => (DamageModifier)0, 
		};
	}

	private static string GetTooltipStats(StatusEffect_FPO New_StatusEffect_FPO)
	{
		//IL_020d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0212: Unknown result type (might be due to invalid IL or missing references)
		//IL_0484: Unknown result type (might be due to invalid IL or missing references)
		//IL_0489: Unknown result type (might be due to invalid IL or missing references)
		//IL_048b: Unknown result type (might be due to invalid IL or missing references)
		//IL_048e: Unknown result type (might be due to invalid IL or missing references)
		//IL_04a4: Expected I4, but got Unknown
		//IL_050c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0511: Unknown result type (might be due to invalid IL or missing references)
		//IL_051f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0535: Unknown result type (might be due to invalid IL or missing references)
		//IL_0539: Invalid comparison between Unknown and I4
		//IL_0552: Unknown result type (might be due to invalid IL or missing references)
		//IL_0570: Unknown result type (might be due to invalid IL or missing references)
		//IL_053b: Unknown result type (might be due to invalid IL or missing references)
		//IL_053f: Invalid comparison between Unknown and I4
		//IL_05a8: Unknown result type (might be due to invalid IL or missing references)
		//IL_05af: Invalid comparison between Unknown and I4
		//IL_0605: Unknown result type (might be due to invalid IL or missing references)
		//IL_0623: Unknown result type (might be due to invalid IL or missing references)
		//IL_05c3: Unknown result type (might be due to invalid IL or missing references)
		//IL_0731: Unknown result type (might be due to invalid IL or missing references)
		//IL_0736: Unknown result type (might be due to invalid IL or missing references)
		//IL_0738: Unknown result type (might be due to invalid IL or missing references)
		//IL_073a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0752: Unknown result type (might be due to invalid IL or missing references)
		//IL_0754: Unknown result type (might be due to invalid IL or missing references)
		//IL_0769: Unknown result type (might be due to invalid IL or missing references)
		//IL_076b: Unknown result type (might be due to invalid IL or missing references)
		StringBuilder stringBuilder = new StringBuilder(256);
		if (New_StatusEffect_FPO.m_MaxHealth != 0f)
		{
			stringBuilder.Append("$se_health: [HP]" + New_StatusEffect_FPO.m_MaxHealth.ToString("+0;-0") + "</color>\n");
		}
		if (New_StatusEffect_FPO.m_HealthRegen != 0f)
		{
			stringBuilder.Append("$se_healthregen: [HP]" + New_StatusEffect_FPO.m_HealthRegen.ToString("+0;-0") + "</color> HP/10s\n");
		}
		if (((SE_Stats)New_StatusEffect_FPO).m_healthRegenMultiplier != 1f)
		{
			stringBuilder.Append("$se_healthregen: [HP]" + ((((SE_Stats)New_StatusEffect_FPO).m_healthRegenMultiplier - 1f) * 100f).ToString("+0;-0") + "%</color>\n");
		}
		if (New_StatusEffect_FPO.m_MaxStamina != 0f)
		{
			stringBuilder.Append("$se_stamina: [Stamina]" + New_StatusEffect_FPO.m_MaxStamina.ToString("+0;-0") + "</color>\n");
		}
		if (((SE_Stats)New_StatusEffect_FPO).m_staminaRegenMultiplier != 1f)
		{
			stringBuilder.Append("$se_staminaregen: [Stamina]" + ((((SE_Stats)New_StatusEffect_FPO).m_staminaRegenMultiplier - 1f) * 100f).ToString("+0;-0") + "%</color>\n");
		}
		if (New_StatusEffect_FPO.m_MaxEitr != 0f)
		{
			stringBuilder.Append("$se_eitr: [Eitr]" + New_StatusEffect_FPO.m_MaxEitr.ToString("+0;-0") + "</color>\n");
		}
		if (((SE_Stats)New_StatusEffect_FPO).m_eitrRegenMultiplier != 1f)
		{
			stringBuilder.Append("$se_eitrregen: [Eitr]" + ((((SE_Stats)New_StatusEffect_FPO).m_eitrRegenMultiplier - 1f) * 100f).ToString("+0;-0") + "%</color>\n");
		}
		if (((SE_Stats)New_StatusEffect_FPO).m_addMaxCarryWeight != 0f)
		{
			stringBuilder.Append("$se_max_carryweight: [General]" + ((SE_Stats)New_StatusEffect_FPO).m_addMaxCarryWeight.ToString("+0;-0") + "</color>\n");
		}
		if (((SE_Stats)New_StatusEffect_FPO).m_speedModifier != 0f)
		{
			stringBuilder.Append("$item_movement_modifier: [General]" + (((SE_Stats)New_StatusEffect_FPO).m_speedModifier * 100f).ToString("+0;-0") + "%</color>\n");
		}
		if (((SE_Stats)New_StatusEffect_FPO).m_jumpModifier != Vector3.zero)
		{
			stringBuilder.Append("$skill_jump: [General]" + (((SE_Stats)New_StatusEffect_FPO).m_jumpModifier.y * 200f).ToString("+0;-0") + "%</color>\n");
		}
		if (((SE_Stats)New_StatusEffect_FPO).m_maxMaxFallSpeed != 0f)
		{
			stringBuilder.Append("$item_limitfallspeed: [General]" + ((SE_Stats)New_StatusEffect_FPO).m_maxMaxFallSpeed.ToString("0") + "</color> m/s\n");
		}
		if (New_StatusEffect_FPO.m_EquipmentSpeedModifier != 0f)
		{
			stringBuilder.Append("$ui_fpo_equipmentspeedmodifier: [General]" + ((New_StatusEffect_FPO.m_EquipmentSpeedModifier * 100f < -100f) ? (-100f) : (New_StatusEffect_FPO.m_EquipmentSpeedModifier * 100f)).ToString("+0;-0") + "%</color>\n");
		}
		if (New_StatusEffect_FPO.m_WindSpeedModifier != 0f)
		{
			stringBuilder.Append("$ui_fpo_windspeedmodifier: [General]" + (New_StatusEffect_FPO.m_WindSpeedModifier * 100f).ToString("+0;-0") + "%</color>\n");
		}
		if (((SE_Stats)New_StatusEffect_FPO).m_runStaminaDrainModifier != 0f)
		{
			stringBuilder.Append("$se_runstamina: [General]" + ((((SE_Stats)New_StatusEffect_FPO).m_runStaminaDrainModifier * 100f < -100f) ? (-100f) : (((SE_Stats)New_StatusEffect_FPO).m_runStaminaDrainModifier * 100f)).ToString("+0;-0") + "%</color>\n");
		}
		if (((SE_Stats)New_StatusEffect_FPO).m_jumpStaminaUseModifier != 0f)
		{
			stringBuilder.Append("$se_jumpstamina: [General]" + ((((SE_Stats)New_StatusEffect_FPO).m_jumpStaminaUseModifier * 100f < -100f) ? (-100f) : (((SE_Stats)New_StatusEffect_FPO).m_jumpStaminaUseModifier * 100f)).ToString("+0;-0") + "%</color>\n");
		}
		if (((SE_Stats)New_StatusEffect_FPO).m_stealthModifier != 0f)
		{
			stringBuilder.Append("$ui_fpo_stealth: [General]" + ((((SE_Stats)New_StatusEffect_FPO).m_stealthModifier * 100f < -100f) ? (-100f) : (((SE_Stats)New_StatusEffect_FPO).m_stealthModifier * 100f)).ToString("+0;-0") + "%</color>\n");
		}
		if (((SE_Stats)New_StatusEffect_FPO).m_noiseModifier != 0f)
		{
			stringBuilder.Append("$se_noisemod: [General]" + ((((SE_Stats)New_StatusEffect_FPO).m_noiseModifier * 100f < -100f) ? (-100f) : (((SE_Stats)New_StatusEffect_FPO).m_noiseModifier * 100f)).ToString("+0;-0") + "%</color>\n");
		}
		foreach (StatusAttribute statusAttribute in New_StatusEffect_FPO.m_StatusAttributes)
		{
			stringBuilder.Append((statusAttribute - 1) switch
			{
				0 => "$ui_fpo_coldresistance", 
				1 => "$ui_fpo_doubleimpactdamage", 
				3 => "$ui_fpo_sailingpower", 
				_ => "", 
			} + "\n");
		}
		foreach (SkillType outgoingDamageType in New_StatusEffect_FPO.m_OutgoingDamageTypes)
		{
			if (New_StatusEffect_FPO.m_OutgoingDamageModifiers[New_StatusEffect_FPO.m_OutgoingDamageTypes.IndexOf(outgoingDamageType)] != 0f)
			{
				if ((int)outgoingDamageType == 13 || (int)outgoingDamageType == 12)
				{
					stringBuilder.Append("$ui_fpo_outgoing_tool " + GetToolTipOutgoingDamageType(outgoingDamageType) + ": [General]" + (New_StatusEffect_FPO.m_OutgoingDamageModifiers[New_StatusEffect_FPO.m_OutgoingDamageTypes.IndexOf(outgoingDamageType)] * 100f).ToString("+0;-0") + "%</color>\n");
				}
				else if ((int)outgoingDamageType == 999)
				{
					stringBuilder.Append("$ui_fpo_outgoing_all: [General]" + (New_StatusEffect_FPO.m_OutgoingDamageModifiers[New_StatusEffect_FPO.m_OutgoingDamageTypes.IndexOf(outgoingDamageType)] * 100f).ToString("+0;-0") + "%</color>\n");
				}
				else
				{
					stringBuilder.Append("$ui_fpo_outgoing " + GetToolTipOutgoingDamageType(outgoingDamageType) + ": [General]" + (New_StatusEffect_FPO.m_OutgoingDamageModifiers[New_StatusEffect_FPO.m_OutgoingDamageTypes.IndexOf(outgoingDamageType)] * 100f).ToString("+0;-0") + "%</color>\n");
				}
			}
		}
		if (((SE_Stats)New_StatusEffect_FPO).m_fallDamageModifier != 0f)
		{
			stringBuilder.Append("$item_falldamage: [General]" + ((((SE_Stats)New_StatusEffect_FPO).m_fallDamageModifier * 100f < -100f) ? (-100f) : (((SE_Stats)New_StatusEffect_FPO).m_fallDamageModifier * 100f)).ToString("+0;-0") + "%</color>\n");
		}
		if (New_StatusEffect_FPO.m_HeatDamageModifier != 0f)
		{
			stringBuilder.Append("$ui_fpo_heatdamage: [General]" + ((New_StatusEffect_FPO.m_HeatDamageModifier * 100f < -100f) ? (-100f) : (New_StatusEffect_FPO.m_HeatDamageModifier * 100f)).ToString("+0;-0") + "%</color>\n");
		}
		foreach (DamageModPair mod in ((SE_Stats)New_StatusEffect_FPO).m_mods)
		{
			if ((int)mod.m_modifier != 0)
			{
				stringBuilder.Append("$ui_fpo_incoming " + GetToolTipIncomingDamageType(mod.m_type) + ": [General]" + (GetToolTipIncomingDamageModifier(mod.m_modifier) * 100f).ToString("+0;-0") + "%</color>\n");
			}
		}
		string text = stringBuilder.ToString();
		text = text.Replace("[HP]+", "+[HP]");
		text = text.Replace("[HP]-", "-[HP]");
		text = text.Replace("[HP]", "<color=#FF8080FF>");
		text = text.Replace("[Stamina]+", "+[Stamina]");
		text = text.Replace("[Stamina]-", "-[Stamina]");
		text = text.Replace("[Stamina]", "<color=#FFFF80FF>");
		text = text.Replace("[Eitr]+", "+[Eitr]");
		text = text.Replace("[Eitr]-", "-[Eitr]");
		text = text.Replace("[Eitr]", "<color=#8080FFFF>");
		text = text.Replace("[General]", "<color=orange>");
		if (text == "")
		{
			text = "None\n";
		}
		return text;
	}

	private static string GetToolTipOutgoingDamageType(SkillType New_SkillType)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_0002: Unknown result type (might be due to invalid IL or missing references)
		//IL_0040: Expected I4, but got Unknown
		//IL_0040: Unknown result type (might be due to invalid IL or missing references)
		//IL_0043: Unknown result type (might be due to invalid IL or missing references)
		//IL_0075: Expected I4, but got Unknown
		return (New_SkillType - 1) switch
		{
			10 => "$skill_unarmed", 
			2 => "$skill_clubs", 
			6 => "$skill_axes", 
			1 => "$skill_knives", 
			4 => "$skill_spears", 
			0 => "$skill_swords", 
			3 => "$skill_polearms", 
			7 => "$skill_bows", 
			13 => "$skill_crowssbows", 
			8 => "$skill_elementalmagic", 
			9 => "$skill_bloodmagic", 
			5 => "$skill_blocking", 
			12 => "$skill_woodcutting", 
			11 => "$skill_pickaxes", 
			_ => (New_SkillType - 100) switch
			{
				2 => "$skill_run", 
				0 => "$skill_jump", 
				1 => "$skill_sneak", 
				3 => "$skill_swim", 
				10 => "$skill_ride", 
				4 => "$skill_fishing", 
				_ => "", 
			}, 
		};
	}

	private static string GetToolTipIncomingDamageType(DamageType New_DamageType)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_0003: Invalid comparison between Unknown and I4
		//IL_003e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0044: Invalid comparison between Unknown and I4
		//IL_0005: Unknown result type (might be due to invalid IL or missing references)
		//IL_0007: Invalid comparison between Unknown and I4
		//IL_0055: Unknown result type (might be due to invalid IL or missing references)
		//IL_005b: Invalid comparison between Unknown and I4
		//IL_0046: Unknown result type (might be due to invalid IL or missing references)
		//IL_0049: Invalid comparison between Unknown and I4
		//IL_002a: Unknown result type (might be due to invalid IL or missing references)
		//IL_002d: Invalid comparison between Unknown and I4
		//IL_0009: Unknown result type (might be due to invalid IL or missing references)
		//IL_000b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0021: Expected I4, but got Unknown
		//IL_005d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0063: Invalid comparison between Unknown and I4
		//IL_004b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0051: Invalid comparison between Unknown and I4
		//IL_002f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0032: Invalid comparison between Unknown and I4
		//IL_0021: Unknown result type (might be due to invalid IL or missing references)
		//IL_0023: Invalid comparison between Unknown and I4
		//IL_0065: Unknown result type (might be due to invalid IL or missing references)
		//IL_006b: Invalid comparison between Unknown and I4
		//IL_0034: Unknown result type (might be due to invalid IL or missing references)
		//IL_0037: Invalid comparison between Unknown and I4
		if ((int)New_DamageType <= 32)
		{
			if ((int)New_DamageType <= 8)
			{
				switch (New_DamageType - 1)
				{
				default:
					if ((int)New_DamageType != 8)
					{
						break;
					}
					return "$inventory_chop";
				case 3:
					return "$inventory_pierce";
				case 1:
					return "$inventory_slash";
				case 0:
					return "$inventory_blunt";
				case 2:
					break;
				}
			}
			else
			{
				if ((int)New_DamageType == 16)
				{
					return "$inventory_pickaxe";
				}
				if ((int)New_DamageType == 31)
				{
					return "$ui_fpo_physical";
				}
				if ((int)New_DamageType == 32)
				{
					return "$inventory_fire";
				}
			}
		}
		else if ((int)New_DamageType <= 128)
		{
			if ((int)New_DamageType == 64)
			{
				return "$inventory_frost";
			}
			if ((int)New_DamageType == 128)
			{
				return "$inventory_lightning";
			}
		}
		else
		{
			if ((int)New_DamageType == 224)
			{
				return "$ui_fpo_elemental";
			}
			if ((int)New_DamageType == 256)
			{
				return "$inventory_poison";
			}
			if ((int)New_DamageType == 512)
			{
				return "$inventory_spirit";
			}
		}
		return "";
	}

	private static float GetToolTipIncomingDamageModifier(DamageModifier New_DamageModifier)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_0022: Expected I4, but got Unknown
		return (int)New_DamageModifier switch
		{
			6 => 1f, 
			2 => 0.5f, 
			0 => 0f, 
			1 => -0.5f, 
			5 => -0.75f, 
			3 => -1f, 
			_ => 0f, 
		};
	}

	private static string GetToolTipFormat(StatusEffect New_StatusEffect)
	{
		StringBuilder stringBuilder = new StringBuilder(256);
		stringBuilder.Append("<color=orange>" + New_StatusEffect.m_name + "</color>\n");
		stringBuilder.Append(GetToolTipStringFormat(New_StatusEffect) + "\n");
		if (Mod_EpicLoot)
		{
			stringBuilder.Append("\t\n");
		}
		return stringBuilder.ToString();
	}

	private static string GetToolTipStringFormat(StatusEffect New_StatusEffect)
	{
		StringBuilder stringBuilder = new StringBuilder(256);
		string[] array = New_StatusEffect.GetTooltipString().Split(new char[1] { '\n' }, StringSplitOptions.RemoveEmptyEntries);
		foreach (string text in array)
		{
			stringBuilder.Append("<size=16>" + text + "</size>\n");
		}
		return stringBuilder.ToString();
	}

	private static int GetHash(string New_String)
	{
		return StringExtensionMethods.GetStableHashCode(New_String);
	}

	private static void Add_Translations()
	{
		CustomLocalization localization = LocalizationManager.Instance.GetLocalization();
		string text = "English";
		localization.AddTranslation(ref text, new Dictionary<string, string>
		{
			{ "ui_fpo", "Forsaken Power Overhaul" },
			{ "ui_fpo_passive", "Passive" },
			{ "ui_fpo_equipped", "Equipped" },
			{ "ui_fpo_active", "Active" },
			{ "ui_fpo_shared", "Shared" },
			{ "ui_fpo_equipmentspeedmodifier", "Movement Speed Penalty from Equipment" },
			{ "ui_fpo_windspeedmodifier", "Wind Speed when Sailing" },
			{ "ui_fpo_stealth", "Visibility when Sneaking" },
			{ "ui_fpo_coldresistance", "Cold Resistance" },
			{ "ui_fpo_doubleimpactdamage", "Double Impact Damage" },
			{ "ui_fpo_sailingpower", "Tailwind when Sailing" },
			{ "ui_fpo_outgoing", "Outgoing Damage with" },
			{ "ui_fpo_outgoing_all", "Outgoing Damage" },
			{ "ui_fpo_outgoing_tool", "Efficiency with" },
			{ "ui_fpo_incoming", "Incoming Damage from" },
			{ "ui_fpo_heatdamage", "Heat Damage" }
		});
	}

	private static string GetLocalization(string New_String)
	{
		return Localization.m_instance.Localize(New_String);
	}

	private static string GetLocalization(StringBuilder New_StringBuilder)
	{
		return Localization.m_instance.Localize(New_StringBuilder.ToString());
	}
}
