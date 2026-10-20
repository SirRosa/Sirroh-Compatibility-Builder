using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Reflection.Emit;
using HarmonyLib;
using UnityEngine;
using Zen.Lib;

namespace ZenUI.Section;

[HarmonyPatch]
internal static class SkillsPanel
{
	private static UIGroupHandler? _skillsUIGroup;

	[HarmonyPrefix]
	[HarmonyPatch(typeof(InventoryGui), "Show")]
	private static void InventoryGui_Show(InventoryGui __instance, Container container)
	{
		if (Configs.AutoOpenSkillsPanel.Value && !Object.op_Implicit((Object)(object)Player.m_localPlayer.m_currentStation) && !Object.op_Implicit((Object)(object)container))
		{
			((MonoBehaviour)(object)__instance).NextFrame((Action)__instance.OnOpenSkills);
		}
	}

	[HarmonyPrefix]
	[HarmonyPatch(typeof(SkillsDialog), "Setup")]
	private static void SkillsDialog_Setup(SkillsDialog __instance, ref bool __runOriginal)
	{
		if (Configs.AutoOpenSkillsPanel.Value && InventoryGui.instance.IsSkillsPanelOpen)
		{
			__instance.OnClose();
			__runOriginal = false;
		}
	}

	[HarmonyPrefix]
	[HarmonyPatch(typeof(InventoryGui), "OnOpenSkills")]
	private static void InventoryGui_OnOpenSkills(InventoryGui __instance)
	{
		if (Configs.AutoOpenSkillsPanel.Value)
		{
			SkillsDialog skillsDialog = __instance.m_skillsDialog;
			_skillsUIGroup = ((Component)skillsDialog).GetComponent<UIGroupHandler>();
			if (!Enumerable.Contains(__instance.m_uiGroups, _skillsUIGroup))
			{
				Transform val = ((Component)skillsDialog).transform.Find("SkillsFrame");
				GameObject val2 = Object.Instantiate<GameObject>(((Component)__instance.m_infoPanel.Find("selected_frame")).gameObject, val, false);
				((Object)val2).name = ((Object)val2).name.Replace("(Clone)", "");
				val2.transform.SetAsFirstSibling();
				((Behaviour)_skillsUIGroup).enabled = true;
				_skillsUIGroup.m_groupPriority = 1;
				_skillsUIGroup.m_enableWhenActiveAndGamepad = val2;
				_skillsUIGroup.SetActive(false);
				__instance.m_uiGroups = CollectionExtensions.AddToArray<UIGroupHandler>(__instance.m_uiGroups, _skillsUIGroup);
				((Component)((Component)skillsDialog).transform.Find("Closebutton")).gameObject.SetActive(false);
				((Component)((Component)skillsDialog).transform.Find("darken")).gameObject.SetActive(false);
				((Behaviour)((Component)skillsDialog).GetComponent<CanvasGroup>()).enabled = false;
				((Component)skillsDialog).transform.SetSiblingIndex(1);
			}
		}
	}

	[HarmonyPrefix]
	[HarmonyPatch(typeof(SkillsDialog), "Update")]
	private static void SkillsDialog_Update(SkillsDialog __instance, ref bool __runOriginal)
	{
		if (Configs.AutoOpenSkillsPanel.Value && ZInput.IsGamepadActive() && Object.op_Implicit((Object)(object)_skillsUIGroup) && !_skillsUIGroup.IsActive)
		{
			__runOriginal = false;
		}
	}

	[HarmonyPrefix]
	[HarmonyPatch(typeof(SkillsDialog), "OnClose")]
	private static void SkillsDialog_OnClose(SkillsDialog __instance, ref bool __runOriginal)
	{
		if (Configs.AutoOpenSkillsPanel.Value && CloseOtherPanel())
		{
			__runOriginal = false;
		}
	}

	private static bool CloseOtherPanel()
	{
		InventoryGui instance = InventoryGui.instance;
		if (!CloseIfOpen(instance.m_trophiesPanel) && !CloseIfOpen(((Component)instance.m_splitDialog).gameObject) && !CloseIfOpen(((Component)instance.m_textsDialog).gameObject))
		{
			return CloseIfOpen(((Component)instance.m_variantDialog).gameObject);
		}
		return true;
	}

	private static bool CloseIfOpen(GameObject obj)
	{
		if (!obj.activeSelf)
		{
			return false;
		}
		obj.SetActive(false);
		return true;
	}

	[HarmonyTranspiler]
	[HarmonyPatch(typeof(InventoryGui), "SetActiveGroup", new Type[]
	{
		typeof(int),
		typeof(bool)
	})]
	private static IEnumerable<CodeInstruction> InventoryGui_SetActiveGroup(IEnumerable<CodeInstruction> codes)
	{
		//IL_0002: Unknown result type (might be due to invalid IL or missing references)
		//IL_001b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0021: Expected Obj, but got Unknown
		//IL_002f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0035: Expected Obj, but got Unknown
		//IL_0043: Unknown result type (might be due to invalid IL or missing references)
		//IL_0049: Expected Obj, but got Unknown
		return new CodeMatcher(codes, (ILGenerator)null).MatchStartForward(new CodeMatch[3]
		{
			new CodeMatch((OpCode?)OpCodes.Ldarg_0, (object)null, (string)null),
			new CodeMatch((OpCode?)OpCodes.Ldarg_1, (object)null, (string)null),
			new CodeMatch((OpCode?)OpCodes.Stfld, (object)null, (string)null)
		}).ThrowIfInvalid("Unable to match IL").Advance(2)
			.Insert(new CodeInstruction[1] { CodeInstruction.Call(typeof(SkillsPanel), "SetActiveGroupIndexIntercept", (Type[])null, (Type[])null) })
			.InstructionEnumeration();
	}

	private static int SetActiveGroupIndexIntercept(int index)
	{
		if (!Configs.AutoOpenSkillsPanel.Value || InventoryGui.instance.IsSkillsPanelOpen)
		{
			return index;
		}
		if ((Object)(object)_skillsUIGroup == (Object)(object)InventoryGui.m_instance.m_uiGroups[index])
		{
			return index - 1;
		}
		return index;
	}

	[HarmonyTranspiler]
	[HarmonyPatch(typeof(KeyHints), "UpdateHints")]
	private static IEnumerable<CodeInstruction> KeyHints_UpdateHints(IEnumerable<CodeInstruction> codes)
	{
		MethodInfo methodInfo = AccessTools.PropertyGetter(typeof(InventoryGui), "IsSkillsPanelOpen");
		MethodInfo methodInfo2 = AccessTools.Method(typeof(SkillsPanel), "IsSkillsPanelOpenIntercept", (Type[])null, (Type[])null);
		return Transpilers.MethodReplacer(codes, (MethodBase)methodInfo, (MethodBase)methodInfo2);
	}

	private static bool IsSkillsPanelOpenIntercept(InventoryGui gui)
	{
		if (!Configs.AutoOpenSkillsPanel.Value)
		{
			return gui.IsSkillsPanelOpen;
		}
		return false;
	}
}
