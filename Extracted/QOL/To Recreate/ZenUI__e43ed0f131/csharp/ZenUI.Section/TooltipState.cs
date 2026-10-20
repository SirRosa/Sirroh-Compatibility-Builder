using System;
using System.Collections.Generic;
using System.Reflection;
using System.Reflection.Emit;
using HarmonyLib;
using JetBrains.Annotations;
using UnityEngine;
using Zen;
using Zen.Lib;

namespace ZenUI.Section;

[HarmonyPatch]
internal static class TooltipState
{
	private enum TipStyle
	{
		Detail,
		Summary
	}

	private readonly record struct StateID
	{
		[UsedImplicitly]
		private readonly string _topic;

		[UsedImplicitly]
		private readonly TipStyle _style;

		[UsedImplicitly]
		private readonly bool _isMulticraft;

		[UsedImplicitly]
		private readonly bool _isEquipped;

		public StateID(UITooltip tooltip)
		{
			_topic = tooltip.m_topic;
			_style = CurrentStyle;
			_isMulticraft = CraftingPanel.IsMulticraftPressed;
			int isEquipped;
			if (TooltipData.TryGetValue(tooltip, out ITooltipData value))
			{
				if (value is TooltipDataItem tooltipDataItem)
				{
					ItemData item = tooltipDataItem.Item;
					if (item != null)
					{
						isEquipped = (item.m_equipped ? 1 : 0);
						goto IL_0052;
					}
				}
				isEquipped = 0;
			}
			else
			{
				isEquipped = 0;
			}
			goto IL_0052;
			IL_0052:
			_isEquipped = (byte)isEquipped != 0;
		}
	}

	private static StateID _lastStateID;

	private static readonly Dictionary<UITooltip, ITooltipData> TooltipData = new Dictionary<UITooltip, ITooltipData>();

	private static TipStyle CurrentStyle
	{
		get
		{
			if (!TooltipSummary.IsDetailMode())
			{
				return TipStyle.Summary;
			}
			return TipStyle.Detail;
		}
	}

	public static void SetData(this UITooltip tooltip, ITooltipData tipData)
	{
		TooltipData[tooltip] = tipData;
	}

	public static bool IsLastStateChanged(this UITooltip tooltip)
	{
		StateID current;
		return tooltip.IsLastStateChanged(out current);
	}

	private static bool IsLastStateChanged(this UITooltip tooltip, out StateID current)
	{
		current = new StateID(tooltip);
		if (!((Object)(object)UITooltip.m_current != (Object)(object)tooltip))
		{
			return _lastStateID != current;
		}
		return true;
	}

	public static string GetDynamic(this UITooltip tooltip)
	{
		if (!TooltipSummary.IsFeatureEnabled)
		{
			return tooltip.m_text;
		}
		if (TooltipData.TryGetValue(tooltip, out ITooltipData value))
		{
			if (CurrentStyle != TipStyle.Detail)
			{
				return value.Summary();
			}
			return value.Detail();
		}
		Logging<Plugin>.Debug("Summary TooltipData is missing, falling back to vanilla tooltip");
		return tooltip.m_text;
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(UITooltip), "OnDisable")]
	private static void UITooltip_OnDisable(UITooltip __instance)
	{
		TooltipData.Remove(__instance);
		_lastStateID = default;
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(Inventory), "Changed")]
	private static void Inventory_Changed(Inventory __instance)
	{
		if (InventoryGui.IsVisible() && (((Humanoid)Player.m_localPlayer).GetInventory() == __instance || (Object.op_Implicit((Object)(object)InventoryGui.instance.ContainerGrid) && InventoryGui.instance.ContainerGrid.GetInventory() == __instance)))
		{
			TooltipData.Clear();
			_lastStateID = default;
			UITooltip.HideTooltip();
		}
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(InventoryGrid), "CreateItemTooltip")]
	private static void InventoryGrid_CreateItemTooltip(InventoryGrid __instance, ItemData item, UITooltip tooltip)
	{
		if (!TooltipData.ContainsKey(tooltip) || tooltip.IsLastStateChanged())
		{
			bool isCraftPanel = __instance is CraftingPanelGrid;
			TooltipDataItem tipData = new TooltipDataItem(item, isCraftPanel);
			tooltip.SetData(tipData);
		}
	}

	[HarmonyPrefix]
	[HarmonyPatch(typeof(UITooltip), "LateUpdate")]
	private static void UITooltip_LateUpdate(UITooltip __instance)
	{
		if (!((Object)(object)UITooltip.m_current != (Object)(object)__instance) && __instance.IsLastStateChanged(out var current))
		{
			_lastStateID = current;
			__instance.UpdateTextElements();
		}
	}

	[HarmonyTranspiler]
	[HarmonyPatch(typeof(UITooltip), "UpdateTextElements")]
	private static IEnumerable<CodeInstruction> UITooltip_UpdateTextElements(IEnumerable<CodeInstruction> codes)
	{
		FieldInfo textField = AccessTools.DeclaredField(typeof(UITooltip), "m_text");
		return Transpilers.Manipulator(codes, (Func<CodeInstruction, bool>)((CodeInstruction c) => CodeInstructionExtensions.Is(c, OpCodes.Ldfld, (MemberInfo)textField)), (Action<CodeInstruction>)((CodeInstruction c) =>
		{
			Func<UITooltip, string> func = Intercept;
			c.opcode = OpCodes.Call;
			c.operand = func.Method;
		}));
		static string Intercept(UITooltip tooltip)
		{
			return tooltip.GetDynamic();
		}
	}

	[HarmonyTranspiler]
	[HarmonyPatch(typeof(StoreGui), "FillList")]
	private static IEnumerable<CodeInstruction> StoreGui_FillList(IEnumerable<CodeInstruction> codes)
	{
		//IL_002f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0035: Expected Obj, but got Unknown
		//IL_0059: Unknown result type (might be due to invalid IL or missing references)
		CodeMatch[] array = new CodeMatch[1]
		{
			new CodeMatch((OpCode?)OpCodes.Callvirt, (object)AccessTools.DeclaredMethod(typeof(UITooltip), "Set", (Type[])null, (Type[])null), (string)null)
		};
		Action<UITooltip, string, string, RectTransform, Vector2, TradeItem> intercept = SetTooltip;
		return new CodeMatcher(codes, (ILGenerator)null).MatchStartForward(array).ThrowIfInvalid("Unable to match IL sequence").Repeat((Action<CodeMatcher>)((CodeMatcher match) =>
		{
			//IL_0014: Unknown result type (might be due to invalid IL or missing references)
			//IL_001a: Expected Obj, but got Unknown
			match.InsertAndAdvance(new CodeInstruction[1]
			{
				new CodeInstruction(OpCodes.Ldloc_S, (object)(byte)7)
			});
			match.Set(OpCodes.Call, (object)intercept.Method);
		}), (Action<string>)null)
			.InstructionEnumeration();
		static void SetTooltip(UITooltip tooltip, string topic, string text, RectTransform anchor, Vector2 fixedPosition, TradeItem tradeItem)
		{
			//IL_0004: Unknown result type (might be due to invalid IL or missing references)
			tooltip.Set(topic, text, anchor, fixedPosition);
			ITooltipData tipData;
			if (Object.op_Implicit((Object)(object)tradeItem.m_prefab))
			{
				tipData = new TooltipDataItem(tradeItem.m_prefab.m_itemData, isCraftPanel: false);
			}
			else
			{
				string summary = TooltipSummary.Format(tradeItem.m_tooltip).Localize();
				tipData = new TooltipData(text, summary);
			}
			tooltip.SetData(tipData);
		}
	}
}
