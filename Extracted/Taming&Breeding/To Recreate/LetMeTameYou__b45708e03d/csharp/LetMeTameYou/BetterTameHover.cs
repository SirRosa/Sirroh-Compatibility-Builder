using System;
using System.Collections.Generic;
using HarmonyLib;
using UnityEngine;

namespace LetMeTameYou;

internal static class BetterTameHover
{
	public static float max_interact_default = 3.5f;

	[HarmonyPostfix]
	[HarmonyPatch(typeof(ItemDrop), "GetHoverText")]
	private static void ID_GetHoverText(ItemDrop __instance, ref string __result)
	{
		EggGrow val = default;
		if (!Object.op_Implicit((Object)(object)__instance.m_nview) || !__instance.m_nview.IsValid() || !((Component)__instance).gameObject.TryGetComponent<EggGrow>(ref val))
		{
			return;
		}
		Component[] components = ((Component)__instance).gameObject.GetComponents(typeof(Component));
		int num = 999;
		int num2 = 999;
		for (int i = 0; i < components.Length; i++)
		{
			if (((object)components[i]).GetType() == typeof(ItemDrop))
			{
				num = i;
				break;
			}
			if (((object)components[i]).GetType() == typeof(EggGrow))
			{
				num2 = i;
				break;
			}
		}
		if (num <= num2)
		{
			bool flag = __instance.m_nview.GetZDO().GetFloat(ZDOVars.s_growStart, 0f) > 0f;
			string text;
			if (__instance.m_itemData.m_stack > 1)
			{
				text = "$item_chicken_egg_stacked";
			}
			else
			{
				text = (flag ? "$item_chicken_egg_warm" : "$item_chicken_egg_cold");
			}
			string text2 = __result;
			int num3 = text2.IndexOf('\n');
			if (num3 > 0)
			{
				__result = text2.Substring(0, num3) + " " + Localization.instance.Localize(text) + text2.Substring(num3);
			}
		}
	}

	[HarmonyPatch(typeof(Procreation), "Procreate")]
	[HarmonyPostfix]
	private static void Proc_proc(Procreation __instance)
	{
		if (Object.op_Implicit((Object)(object)__instance.m_nview) && __instance.m_nview.IsValid())
		{
			__instance.m_nview.GetZDO().Set("LMTY_ProcTime", Time.time);
		}
	}

	[HarmonyPatch(typeof(Tameable), "GetHoverText")]
	[HarmonyPostfix]
	private static void Tameable_GetHoverText(Tameable __instance, ref string __result)
	{
		if (!TameManager.hasTamingKeysAndLevel(__instance))
		{
			string oldValue = Localization.instance.Localize("$hud_wild");
			__result = Localization.instance.Localize(__result.Replace(oldValue, "$lmty_feral"));
		}
	}

	[HarmonyPostfix]
	[HarmonyPriority(395)]
	[HarmonyPatch(typeof(Character), "GetHoverText")]
	public static void Char_GetHoverText(Character __instance, ref string __result)
	{
		if (LetMeTameYou.useTamingTool.Value)
		{
			GetTamingText(__instance, ref __result);
		}
	}

	[HarmonyPriority(10)]
	[HarmonyPostfix]
	[HarmonyPatch(typeof(Tameable), "DecreaseRemainingTime")]
	private static void PostFix_DecreaseRemainingTime(Tameable __instance, ref float time)
	{
		__instance.m_nview.GetZDO().Set("LMTY_TameStep", time);
	}

	public static void GetTamingText(Character __instance, ref string __result)
	{
		//IL_007e: Unknown result type (might be due to invalid IL or missing references)
		Player localPlayer = Player.m_localPlayer;
		if ((Object)(object)((Humanoid)localPlayer).GetCurrentWeapon().m_dropPrefab == (Object)null || LetMeTameYou.tamingtoolPrefabName != ((Object)((Humanoid)localPlayer).GetCurrentWeapon().m_dropPrefab).name)
		{
			return;
		}
		Tameable componentInParent = ((Component)__instance).GetComponentInParent<Tameable>();
		string text = "\n";
		if (Terminal.m_cheat && LetMeTameYou.debugout.Value && Input.GetKeyDown((KeyCode)Enum.Parse(typeof(KeyCode), "Z")))
		{
			sendGrowProcreate(__instance);
		}
		if ((Object)(object)componentInParent == (Object)null)
		{
			if (ShowDebug(localPlayer))
			{
				text += "Not tameable \n";
				text = text + "Prefab name is: " + ((Object)__instance).name;
				text = text.Replace("(Clone)", "");
				__result += text;
			}
			return;
		}
		MonsterAI componentInParent2 = ((Component)__instance).GetComponentInParent<MonsterAI>();
		Procreation componentInParent3 = ((Component)__instance).GetComponentInParent<Procreation>();
		bool flag = true;
		if (__instance.m_tamed)
		{
			if (ShowDebug(localPlayer))
			{
				text += ("Prefab is: " + ((Object)__instance).name + ", is commandable= " + componentInParent.m_commandable + "\n").Replace("(Clone)", "");
			}
			if ((Object)(object)componentInParent3 != (Object)null)
			{
				if (componentInParent3.IsDue())
				{
					text += "$lmty_is_due ";
					flag = false;
				}
				else if (componentInParent3.IsPregnant())
				{
					text += "$lmty_is_pregnant";
					DateTime dateTime = new DateTime(componentInParent3.m_nview.GetZDO().GetLong("pregnant", 0L));
					double num = (double)componentInParent3.m_pregnancyDuration - (ZNet.instance.GetTime() - dateTime).TotalSeconds;
					if (num > 0.0)
					{
						text = text + ": " + (int)num + "$lmty_seconds_left \n";
					}
					flag = false;
				}
				else if (!componentInParent3.ReadyForProcreation())
				{
					text += "$lmty_needs_food";
				}
				else
				{
					if (ShowDebug(localPlayer))
					{
						text += GetPregStats(componentInParent3);
						__result += Localization.instance.Localize(text);
						return;
					}
					switch (getInstNum(componentInParent3)[0])
					{
					case 1:
						text += "$lmty_crowded \n";
						break;
					default:
						text += "$lmty_needs_mate \n";
						break;
					case 0:
						break;
					}
					text = ((!(componentInParent3.m_pregnancyChance < 1f)) ? (text + "Pregnancy chance is too high: " + componentInParent3.m_pregnancyChance + "\n Check the config and reduce") : (text + "$lmty_ready_to_proc"));
				}
			}
			else
			{
				text += "$lmty_cannot_proc";
			}
			if (flag)
			{
				text += "\n$lmty_possible_consume ";
			}
		}
		else
		{
			LMTY_Interactable lMTY_Interactable = default;
			if (((Component)__instance).gameObject.TryGetComponent<LMTY_Interactable>(ref lMTY_Interactable))
			{
				text += "$lmty_trade_for_tame ";
				int num2 = 20;
				foreach (KeyValuePair<string, int> item in lMTY_Interactable.tradelist)
				{
					text = text + item.Value + " " + item.Key + ", ";
					if (text.Length - num2 > 50)
					{
						num2 = text.Length;
						text += "\n";
					}
				}
				text = text.Remove(text.Length - 2) + "\n";
			}
			if (!(componentInParent.m_tamingTime > 0f))
			{
				__result += Localization.instance.Localize(text);
				return;
			}
			text += "$lmty_taming_time ";
			float remainingTime = componentInParent.GetRemainingTime();
			if (remainingTime != componentInParent.m_tamingTime)
			{
				text = text + (int)remainingTime + "s\\";
			}
			text = text + componentInParent.m_tamingTime + "s";
			if (!componentInParent.IsHungry())
			{
				ZDO zDO = componentInParent.m_nview.GetZDO();
				if (zDO != null)
				{
					float num3 = zDO.GetFloat("LMTY_TameStep", 0f);
					if (num3 > 3f)
					{
						text = text + " (<color=#5CEB59><b>" + (int)(3f / num3 * remainingTime) + "s</b></color>)";
					}
				}
			}
			if (flag)
			{
				text += "\n$lmty_possible_consume ";
			}
		}
		if (!flag)
		{
			__result += Localization.instance.Localize(text);
			return;
		}
		int num4 = 15;
		if (componentInParent2.m_consumeItems.Count < num4)
		{
			foreach (ItemDrop consumeItem in componentInParent2.m_consumeItems)
			{
				text = text + consumeItem.m_itemData.m_shared.m_name + ", ";
			}
		}
		else
		{
			int num5 = (int)Mathf.Ceil((float)componentInParent2.m_consumeItems.Count / (float)num4);
			int num6 = (int)Math.Round((float)(componentInParent2.m_consumeItems.Count / num5) + 0.49f);
			int num7 = (int)(Time.fixedTime * 0.23f) % num5 * num6;
			int num8 = num7;
			for (int i = 0; i < num6 && i <= componentInParent2.m_consumeItems.Count; i++)
			{
				text = text + componentInParent2.m_consumeItems[num8].m_itemData.m_shared.m_name + ", ";
				num8++;
			}
		}
		text = Localization.instance.Localize(text.TrimEnd(new char[2] { ' ', ',' }));
		__result += text;
	}

	[HarmonyPrefix]
	[HarmonyPatch(typeof(Player), "FindHoverObject")]
	private static void FindHoverObject_Prefix(Player __instance, GameObject hover, Character hoverCreature)
	{
		//IL_008e: Unknown result type (might be due to invalid IL or missing references)
		if (LetMeTameYou.useTamingTool.Value && (Object)(object)((Humanoid)__instance).GetCurrentWeapon().m_dropPrefab == (Object)(object)ZNetScene.instance.GetPrefab(LetMeTameYou.tamingtoolPrefabName))
		{
			EggGrow thisGrow = default;
			if (Object.op_Implicit((Object)(object)hoverCreature))
			{
				__instance.m_maxInteractDistance = LetMeTameYou.increasedInteractDistance.Value;
			}
			else if (Object.op_Implicit((Object)(object)hover) && Terminal.m_cheat && LetMeTameYou.debugout.Value && hover.TryGetComponent<EggGrow>(ref thisGrow) && Input.GetKeyDown((KeyCode)Enum.Parse(typeof(KeyCode), "Z")))
			{
				sendGrowEgg(thisGrow);
			}
		}
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(Player), "FindHoverObject")]
	private static void Postfix(Player __instance, ref GameObject hover, ref Character hoverCreature)
	{
		if (Object.op_Implicit((Object)(object)hoverCreature) && !Object.op_Implicit((Object)(object)hover) && setHoverCreature(__instance, hoverCreature))
		{
			hover = ((Component)hoverCreature).gameObject;
		}
		__instance.m_maxInteractDistance = max_interact_default;
	}

	private static void sendGrowProcreate(Character thisChar)
	{
		Procreation component = ((Component)thisChar).gameObject.GetComponent<Procreation>();
		Growup component2 = ((Component)thisChar).gameObject.GetComponent<Growup>();
		if (!Object.op_Implicit((Object)(object)component) && !Object.op_Implicit((Object)(object)component2))
		{
			DBG.blogWarning("Could not find Procreation or Growup in creature, exiting command");
		}
		else if (Object.op_Implicit((Object)(object)component))
		{
			component.m_pregnancyDuration = 3f;
			component.MakePregnant();
		}
		else
		{
			component2.m_growTime = 5f;
		}
	}

	private static void sendGrowEgg(EggGrow thisGrow)
	{
		if (!Object.op_Implicit((Object)(object)thisGrow))
		{
			DBG.blogWarning("Could not find Procreation or EggGrow in Item, exiting command");
			return;
		}
		thisGrow.m_growTime = 5f;
		thisGrow.m_requireUnderRoof = false;
		thisGrow.m_requireNearbyFire = false;
	}

	public static bool setHoverCreature(Player plr, Character hoverChar)
	{
		//IL_0007: Unknown result type (might be due to invalid IL or missing references)
		//IL_0012: Unknown result type (might be due to invalid IL or missing references)
		if (Vector3.Distance(((Character)plr).m_eye.position, ((Component)hoverChar).transform.position) < plr.m_maxInteractDistance)
		{
			return true;
		}
		return false;
	}

	public static bool ShowDebug(Player plr)
	{
		if (LetMeTameYou.debugout.Value && !((Character)plr).IsCrouching())
		{
			return true;
		}
		return false;
	}

	public static int[] getInstNum(Procreation _proc)
	{
		//IL_0081: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a5: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c4: Unknown result type (might be due to invalid IL or missing references)
		int[] array = new int[4];
		int num = -10;
		int num2 = -10;
		int num3 = 0;
		bool flag = true;
		try
		{
			if ((Object)(object)_proc.m_offspringPrefab == (Object)null)
			{
				string prefabName = Utils.GetPrefabName(((Object)_proc.m_offspring).name);
				_proc.m_offspringPrefab = ZNetScene.instance.GetPrefab(prefabName);
				int prefab = _proc.m_nview.GetZDO().GetPrefab();
				_proc.m_myPrefab = ZNetScene.instance.GetPrefab(prefab);
			}
			num = SpawnSystem.GetNrOfInstances(_proc.m_myPrefab, ((Component)_proc).gameObject.transform.position, _proc.m_totalCheckRange, false, false);
			num2 = SpawnSystem.GetNrOfInstances(_proc.m_offspringPrefab, ((Component)_proc).gameObject.transform.position, _proc.m_totalCheckRange, false, false);
			num3 = SpawnSystem.GetNrOfInstances(_proc.m_myPrefab, ((Component)_proc).transform.position, _proc.m_partnerCheckRange, false, true);
			flag = num + num2 < _proc.m_maxCreatures && num3 >= 2;
		}
		catch (Exception ex)
		{
			DBG.blogDebug("Error: " + ex.Message);
			DBG.blogDebug("Error: " + ex.StackTrace);
			array[0] = -1;
			return array;
		}
		array[1] = num;
		array[2] = num2;
		array[3] = num3;
		if (flag)
		{
			array[0] = 0;
			return array;
		}
		if (num + num2 > _proc.m_maxCreatures - 1)
		{
			array[0] = 1;
			return array;
		}
		array[0] = 2;
		return array;
	}

	public static double PercentSuccess(Procreation _proc)
	{
		int num = ((_proc.m_spawnOffsetMax > 0f) ? 1 : (-1));
		if (Random.value > _proc.m_pregnancyChance)
		{
			_proc.m_spawnOffsetMax += 1E-05f * (float)num;
		}
		else
		{
			_proc.m_spawnOffsetMax += 1E-07f * (float)num;
		}
		float num2 = _proc.m_spawnOffsetMax % 0.001f * 100000f * (float)num;
		float num3 = num2 % 1f * 100f;
		if (num2 > 98f || num3 == 99f)
		{
			float num4 = (float)Math.Round(0.1f * num2 / (num2 + num3), 3);
			if ((double)num4 > 0.1 || num4 < 0f)
			{
				DBG.blogDebug("invalid ratio");
			}
			num4 = (num4 + 1E-08f) * (float)num;
			_proc.m_spawnOffsetMax = (float)(int)(_proc.m_spawnOffsetMax * 10f) / 10f + num4;
			DBG.blogDebug("success=" + Math.Round(num2) + ", failed=" + Math.Round(num3) + ", ratio=" + num4);
		}
		return (int)(_proc.m_spawnOffsetMax % 0.1f * 1000f * (float)num);
	}

	public static string GetPregStats(Procreation _proc)
	{
		//IL_020c: Unknown result type (might be due to invalid IL or missing references)
		string text = "";
		bool flag = !_proc.m_nview.IsValid() || !_proc.m_nview.IsOwner() || !_proc.m_character.IsTamed();
		text = text + "isValid: " + !flag;
		text = text + "\nPregchance= " + _proc.m_pregnancyChance;
		text = text + "\nIsNotAlerted= " + !_proc.m_baseAI.IsAlerted();
		text = text + "\nIsNotHungry= " + !_proc.m_tameable.IsHungry();
		double num = PercentSuccess(_proc);
		text = text + "\nChanceToBreed: " + ((num > 0.0) ? ("True(" + num + "%)") : "False");
		int[] instNum = getInstNum(_proc);
		switch (instNum[0])
		{
		case 0:
			text += "\nLess than max instance: True";
			break;
		case 1:
			text += "\nLess than max instance: False";
			text = text + "\nMax=" + _proc.m_maxCreatures + ", Mates=" + (instNum[1] - 1) + ", Offspring=" + instNum[2];
			break;
		case 2:
			text += "\nLess than max instance: False (needs mate)";
			text = text + "\nReady Mates=" + (instNum[3] - 1) + ", Offspring=" + instNum[2];
			text = text + "\nClosest 3 Creatures within range of " + _proc.m_totalCheckRange + " units are:\n";
			text += GetCloseInstances(((Component)_proc).gameObject, ((Component)_proc).gameObject.transform.position, _proc.m_totalCheckRange);
			break;
		default:
			text += "\nLess than max instance: Error";
			break;
		}
		if (((MonoBehaviour)_proc).IsInvoking())
		{
			text = ((!((MonoBehaviour)_proc).IsInvoking("Procreate")) ? (text + "\nis invoking but not Procreate") : (text + "\nis invoking Procreate"));
		}
		else
		{
			text += "\nis not invoking";
		}
		text = text + " " + (int)(Time.time - _proc.m_nview.GetZDO().GetFloat("LMTY_ProcTime", 0f)) + "s";
		int num2 = _proc.m_nview.GetZDO().GetInt("lovePoints", 0);
		return text + "\nLovePoints: " + num2 + " out of " + _proc.m_requiredLovePoints;
	}

	private static string GetCloseInstances(GameObject instance, Vector3 center, float maxRange)
	{
		//IL_008d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0098: Unknown result type (might be due to invalid IL or missing references)
		float num = 999999f;
		float num2 = 999999f;
		float num3 = 999999f;
		string text = "n/a";
		string text2 = "n/a2";
		string text3 = "n/a3";
		BaseAI componentInParent = instance.GetComponentInParent<BaseAI>();
		List<Character> allCharacters = Character.GetAllCharacters();
		foreach (Character item in allCharacters)
		{
			if (!((Object)(object)((Component)item).gameObject == (Object)(object)((Component)componentInParent).gameObject) && !item.IsPlayer() && ((Component)item).GetComponent<ZNetView>().IsValid())
			{
				float num4 = Vector3.Distance(((Component)item).transform.position, instance.transform.position);
				if (num4 < num)
				{
					text = ((Object)item).name;
					num = num4;
					if (item.IsTamed())
					{
						text += "(Tamed)";
					}
					else
					{
						text = ((!((Object)(object)((Component)item).gameObject.GetComponent<Tameable>() != (Object)null)) ? (text + "(NotTameable)") : (text + "(Untamed)"));
					}
				}
				else if (num4 < num2)
				{
					text2 = ((Object)item).name;
					num2 = num4;
					if (item.IsTamed())
					{
						text2 += "(Tamed)";
					}
					else
					{
						text2 = ((!((Object)(object)((Component)item).gameObject.GetComponent<Tameable>() != (Object)null)) ? (text2 + "(NotTameable)") : (text2 + "(Untamed)"));
					}
				}
				else if (num4 < num3)
				{
					text3 = ((Object)item).name;
					num3 = num4;
					if (item.IsTamed())
					{
						text3 += "(Tamed)";
					}
					else
					{
						text3 = ((!((Object)(object)((Component)item).gameObject.GetComponent<Tameable>() != (Object)null)) ? (text3 + "(NotTameable)") : (text3 + "(Untamed)"));
					}
				}
			}
		}
		return (text + ":" + text2 + ":" + text3).Replace("(Clone)", "");
	}
}
