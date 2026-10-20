using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Reflection.Emit;
using HarmonyLib;
using JetBrains.Annotations;
using UnityEngine;
using UnityEngine.UI;

namespace Auga;

internal static class API
{
	private static readonly Assembly _targetAssembly;

	public static string RedText;

	public static string Red;

	public static string Brown1;

	public static string Brown2;

	public static string Brown3;

	public static string Brown4;

	public static string Brown5;

	public static string Brown6;

	public static string Brown7;

	public static string Blue;

	public static string LightBlue;

	public static string Gold;

	public static string BrightGold;

	public static string BrightestGold;

	public static string GoldDark;

	public static string Green;

	static API()
	{
		//IL_00c3: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c9: Expected Obj, but got Unknown
		//IL_011a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0126: Expected Obj, but got Unknown
		RedText = "#CD2121";
		Red = "#AD1616";
		Brown1 = "#EAE1D9";
		Brown2 = "#D1C9C2";
		Brown3 = "#A39689";
		Brown4 = "#706457";
		Brown5 = "#2E2620";
		Brown6 = "#EAE1D9";
		Brown7 = "#181410";
		Blue = "#216388";
		LightBlue = "#1AACEF";
		Gold = "#B98A12";
		BrightGold = "#EAA800";
		BrightestGold = "#FFBF1B";
		GoldDark = "#755608";
		Green = "#1B9B37";
		_targetAssembly = LoadAssembly();
		if (!(_targetAssembly != null))
		{
			return;
		}
		Harmony val = new Harmony("mods.randyknapp.auga.API");
		foreach (MethodInfo item in from m in typeof(API).GetMethods(BindingFlags.DeclaredOnly | BindingFlags.Static | BindingFlags.Public)
			where m.Name != "IsLoaded" && m.Name != "LoadAssembly"
			select m)
		{
			val.Patch((MethodBase)item, (HarmonyMethod)null, (HarmonyMethod)null, new HarmonyMethod(AccessTools.DeclaredMethod(typeof(API), "Transpiler", (Type[])null, (Type[])null)), (HarmonyMethod)null, (HarmonyMethod)null);
		}
	}

	private static IEnumerable<CodeInstruction> Transpiler(IEnumerable<CodeInstruction> _, MethodBase original)
	{
		Type[] parameters = original.GetParameters().Select((ParameterInfo p) =>
		{
			Type type = p.ParameterType;
			if (type.Assembly == Assembly.GetExecutingAssembly() && _targetAssembly != null)
			{
				type = _targetAssembly.GetType(type.FullName ?? string.Empty);
			}
			return type;
		}).ToArray();
		MethodBase originalMethod = _targetAssembly.GetType("Auga.API").GetMethod(original.Name, parameters);
		int i = 0;
		while (i < parameters.Length)
		{
			yield return new CodeInstruction(OpCodes.Ldarg, (object)i);
			int num = i + 1;
			i = num;
		}
		yield return new CodeInstruction(OpCodes.Call, (object)originalMethod);
		yield return new CodeInstruction(OpCodes.Ret, (object)null);
	}

	public static Assembly LoadAssembly()
	{
		return AppDomain.CurrentDomain.GetAssemblies().FirstOrDefault((Assembly assembly) => assembly.GetName().Name == "Auga");
	}

	public static bool IsLoaded()
	{
		return LoadAssembly() != null;
	}

	public static Font GetBoldFont()
	{
		return null;
	}

	public static Font GetSemiBoldFont()
	{
		return null;
	}

	public static Font GetRegularFont()
	{
		return null;
	}

	public static Sprite GetItemBackgroundSprite()
	{
		return null;
	}

	public static GameObject Panel_Create(Transform parent, Vector2 size, string name, bool withCornerDecoration)
	{
		return null;
	}

	public static Button SmallButton_Create(Transform parent, string name, string labelText)
	{
		return null;
	}

	public static Button MediumButton_Create(Transform parent, string name, string labelText)
	{
		return null;
	}

	public static Button FancyButton_Create(Transform parent, string name, string labelText)
	{
		return null;
	}

	public static Button SettingsButton_Create(Transform parent, string name, string labelText)
	{
		return null;
	}

	public static Button DiamondButton_Create(Transform parent, string name, [CanBeNull] Sprite icon)
	{
		return null;
	}

	public static GameObject Divider_CreateSmall(Transform parent, string name, float width = -1f)
	{
		return null;
	}

	public static Tuple<GameObject, GameObject> Divider_CreateMedium(Transform parent, string name, float width = -1f)
	{
		return null;
	}

	public static Tuple<GameObject, GameObject> Divider_CreateLarge(Transform parent, string name, float width = -1f)
	{
		return null;
	}

	public static void Button_SetTextColors(Button button, Color normal, Color highlighted, Color pressed, Color selected, Color disabled, Color baseTextColor)
	{
	}

	public static void Button_OverrideTextColor(Button button, Color color)
	{
	}

	public static void Tooltip_MakeSimpleTooltip(GameObject obj)
	{
	}

	public static void Tooltip_MakeItemTooltip(GameObject obj, ItemData item)
	{
	}

	public static bool PlayerPanel_HasTab(string tabID)
	{
		return false;
	}

	public static PlayerPanelTabData PlayerPanel_AddTab(string tabID, Sprite tabIcon, string tabTitleText, Action<int> onTabSelected)
	{
		return null;
	}

	public static bool PlayerPanel_IsTabActive(GameObject tabButton)
	{
		return false;
	}

	public static Button PlayerPanel_GetTabButton(int index)
	{
		return null;
	}

	public static bool Workbench_HasWorkbenchTab(string tabID)
	{
		return false;
	}

	public static WorkbenchTabData Workbench_AddWorkbenchTab(string tabID, Sprite tabIcon, string tabTitleText, Action<int> onTabSelected)
	{
		return null;
	}

	public static WorkbenchTabData Workbench_AddVanillaWorkbenchTab(string tabID, Sprite tabIcon, string tabTitleText, Action<int> onTabSelected)
	{
		return null;
	}

	public static bool Workbench_IsTabActive(GameObject tabButton)
	{
		return false;
	}

	public static Button Workbench_GetCraftingTabButton()
	{
		return null;
	}

	public static Button Workbench_GetUpgradeTabButton()
	{
		return null;
	}

	public static GameObject Workbench_CreateNewResultsPanel()
	{
		return null;
	}

	public static void TooltipTextBox_AddLine(GameObject tooltipTextBoxGO, Text t, object s, bool localize = true, bool overwrite = false)
	{
	}

	public static void TooltipTextBox_AddLine(GameObject tooltipTextBoxGO, object a, bool localize = true, bool overwrite = false)
	{
	}

	public static void TooltipTextBox_AddLine(GameObject tooltipTextBoxGO, object a, object b, bool localize = true, bool overwrite = false)
	{
	}

	public static void TooltipTextBox_AddLine(GameObject tooltipTextBoxGO, object a, object b, object parenthetical, bool localize = true, bool overwrite = false)
	{
	}

	public static void TooltipTextBox_AddUpgradeLine(GameObject tooltipTextBoxGO, object label, object value1, object value2, string color2, bool localize = true, bool overwrite = false)
	{
	}

	public static void ComplexTooltip_AddItemTooltipCreatedListener(Action<GameObject, ItemData> listener)
	{
	}

	public static void ComplexTooltip_AddFoodTooltipCreatedListener(Action<GameObject, Food> listener)
	{
	}

	public static void ComplexTooltip_AddStatusEffectTooltipCreatedListener(Action<GameObject, StatusEffect> listener)
	{
	}

	public static void ComplexTooltip_AddSkillTooltipCreatedListener(Action<GameObject, Skill> listener)
	{
	}

	public static void ComplexTooltip_AddItemStatPreprocessor(Func<ItemData, string, string, Tuple<string, string>> itemStatPreprocessor)
	{
	}

	public static void ComplexTooltip_ClearTextBoxes(GameObject complexTooltipGO)
	{
	}

	public static GameObject ComplexTooltip_AddTwoColumnTextBox(GameObject complexTooltipGO)
	{
		return null;
	}

	public static GameObject ComplexTooltip_AddCenteredTextBox(GameObject complexTooltipGO)
	{
		return null;
	}

	public static GameObject ComplexTooltip_AddUpgradeLabels(GameObject complexTooltipGO)
	{
		return null;
	}

	public static GameObject ComplexTooltip_AddUpgradeTwoColumnTextBox(GameObject complexTooltipGO)
	{
		return null;
	}

	public static GameObject ComplexTooltip_AddCheckBoxTextBox(GameObject complexTooltipGO)
	{
		return null;
	}

	public static GameObject ComplexTooltip_AddDivider(GameObject complexTooltipGO)
	{
		return null;
	}

	public static void ComplexTooltip_SetTopic(GameObject complexTooltipGO, string topic)
	{
	}

	public static void ComplexTooltip_SetSubtitle(GameObject complexTooltipGO, string topic)
	{
	}

	public static void ComplexTooltip_SetDescription(GameObject complexTooltipGO, string desc)
	{
	}

	public static void ComplexTooltip_SetIcon(GameObject complexTooltipGO, Sprite icon)
	{
	}

	public static void ComplexTooltip_EnableDescription(GameObject complexTooltipGO, bool enabled)
	{
	}

	public static string ComplexTooltip_GenerateItemSubtext(GameObject complexTooltipGO, ItemData item)
	{
		return string.Empty;
	}

	public static void ComplexTooltip_SetItem(GameObject complexTooltipGO, ItemData item, int quality = -1, int variant = -1)
	{
	}

	public static void ComplexTooltip_SetItemNoTextBoxes(GameObject complexTooltipGO, ItemData item, int quality = -1, int variant = -1)
	{
	}

	public static void ComplexTooltip_SetFood(GameObject complexTooltipGO, Food food)
	{
	}

	public static void ComplexTooltip_SetStatusEffect(GameObject complexTooltipGO, StatusEffect statusEffect)
	{
	}

	public static void ComplexTooltip_SetSkill(GameObject complexTooltipGO, Skill skill)
	{
	}

	public static Image RequirementsPanel_GetIcon(GameObject requirementsPanelGO)
	{
		return null;
	}

	public static GameObject[] RequirementsPanel_RequirementList(GameObject requirementsPanelGO)
	{
		return null;
	}

	public static void RequirementsPanel_SetWires(GameObject requirementsPanelGO, RequirementWireState[] wireStates, bool canCraft)
	{
	}

	public static Text CustomVariantPanel_Enable(string buttonLabel, Action<bool> onShow)
	{
		return null;
	}

	public static void CustomVariantPanel_SetButtonLabel(string buttonLabel)
	{
	}

	public static void CustomVariantPanel_Disable()
	{
	}
}
