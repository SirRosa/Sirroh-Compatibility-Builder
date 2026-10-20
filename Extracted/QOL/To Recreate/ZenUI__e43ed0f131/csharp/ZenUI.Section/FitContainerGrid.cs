using System;
using System.Collections.Generic;
using System.Reflection;
using System.Reflection.Emit;
using HarmonyLib;
using JetBrains.Annotations;
using UnityEngine;
using Zen.Lib;

namespace ZenUI.Section;

[HarmonyPatch]
internal static class FitContainerGrid
{
	[HarmonyPatch(typeof(InventoryGui), "Show")]
	private static class InventoryGuiShow
	{
		[UsedImplicitly]
		private static void Prefix(InventoryGui __instance, Container? container, ref bool __state)
		{
			//IL_0045: Unknown result type (might be due to invalid IL or missing references)
			//IL_0050: Unknown result type (might be due to invalid IL or missing references)
			if (IsFeatureEnabled)
			{
				InventoryGrid val = __instance.InitContainerGrid();
				if (Object.op_Implicit((Object)(object)container) && Object.op_Implicit((Object)(object)container.m_piece) && RescaledContainers.TryGetValue(container.m_piece.GetPrefabName(), out (float, bool) value))
				{
					((Transform)val.m_gridRoot).localScale = Vector3.one * value.Item1;
					__state = value.Item2;
				}
			}
		}

		[UsedImplicitly]
		private static void Postfix(InventoryGui __instance, Container? container, bool __state)
		{
			if (IsFeatureEnabled && Object.op_Implicit((Object)(object)container))
			{
				if (__state)
				{
					__instance.ContainerGrid.RotateGrid(isRotated: true);
				}
				__instance.ContainerGrid.ResetAnchorPosition();
			}
		}
	}

	private static readonly Dictionary<string, (float Scale, bool RotateInventory)> RescaledContainers = new Dictionary<string, (float, bool)>
	{
		["piece_chest_grausten"] = (0.84f, false),
		["piece_chest_warderobe"] = (0.8f, true)
	};

	private static bool IsFeatureEnabled
	{
		get
		{
			if (Configs.RescaleContainerGrid.Value)
			{
				return Configs.NoSlideAnimation.Value;
			}
			return false;
		}
	}

	private static InventoryGrid InitContainerGrid(this InventoryGui gui)
	{
		//IL_0017: Unknown result type (might be due to invalid IL or missing references)
		//IL_0031: Unknown result type (might be due to invalid IL or missing references)
		//IL_0047: Unknown result type (might be due to invalid IL or missing references)
		//IL_004c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0059: Unknown result type (might be due to invalid IL or missing references)
		InventoryGrid containerGrid = gui.ContainerGrid;
		containerGrid.m_gridRoot.anchorMax = new Vector2(0.5f, 1f);
		containerGrid.m_gridRoot.anchorMin = new Vector2(0.5f, 0f);
		RectTransform gridRoot = containerGrid.m_gridRoot;
		Vector2 pivot = containerGrid.m_gridRoot.pivot;
		pivot.x = 0.5f;
		gridRoot.pivot = pivot;
		return containerGrid;
	}

	private static void ResetAnchorPosition(this InventoryGrid grid)
	{
		//IL_0008: Unknown result type (might be due to invalid IL or missing references)
		//IL_004b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0050: Unknown result type (might be due to invalid IL or missing references)
		//IL_0059: Unknown result type (might be due to invalid IL or missing references)
		//IL_0028: Unknown result type (might be due to invalid IL or missing references)
		//IL_002e: Expected Obj, but got Unknown
		//IL_0031: Unknown result type (might be due to invalid IL or missing references)
		//IL_003c: Unknown result type (might be due to invalid IL or missing references)
		RectTransform gridRoot = grid.m_gridRoot;
		float num = (0f - grid.GetWidgetSize().x) * 0.5f;
		if (grid.IsRotated())
		{
			RectTransform val = (RectTransform)((Transform)gridRoot).parent;
			num = 0f - num + val.offsetMax.y / ((Transform)gridRoot).localScale.x;
		}
		Vector2 anchoredPosition = gridRoot.anchoredPosition;
		anchoredPosition.x = num;
		gridRoot.anchoredPosition = anchoredPosition;
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(InventoryGui), "Hide")]
	private static void InventoryGui_Hide(InventoryGui __instance)
	{
		//IL_0014: Unknown result type (might be due to invalid IL or missing references)
		if (IsFeatureEnabled)
		{
			InventoryGrid containerGrid = __instance.ContainerGrid;
			((Transform)containerGrid.m_gridRoot).localScale = Vector3.one;
			containerGrid.RotateGrid(isRotated: false);
		}
	}

	private static void RotateGrid(this InventoryGrid grid, bool isRotated)
	{
		//IL_0013: Unknown result type (might be due to invalid IL or missing references)
		//IL_0018: Unknown result type (might be due to invalid IL or missing references)
		//IL_001f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0024: Unknown result type (might be due to invalid IL or missing references)
		//IL_0033: Unknown result type (might be due to invalid IL or missing references)
		//IL_004d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0052: Unknown result type (might be due to invalid IL or missing references)
		Quaternion val = Quaternion.Euler(0f, 0f, (float)(isRotated ? (-90) : 0));
		if (((Transform)grid.m_gridRoot).rotation == val)
		{
			return;
		}
		((Transform)grid.m_gridRoot).rotation = val;
		foreach (Transform item in (Transform)grid.m_gridRoot)
		{
			item.rotation = Quaternion.identity;
		}
	}

	private static bool IsContainerGrid(this InventoryGrid grid)
	{
		if (Object.op_Implicit((Object)(object)InventoryGui.instance))
		{
			return (Object)(object)InventoryGui.instance.ContainerGrid == (Object)(object)grid;
		}
		return false;
	}

	private static bool IsRotated(this InventoryGrid grid)
	{
		//IL_0015: Unknown result type (might be due to invalid IL or missing references)
		//IL_001a: Unknown result type (might be due to invalid IL or missing references)
		//IL_001d: Unknown result type (might be due to invalid IL or missing references)
		if (IsFeatureEnabled && grid.IsContainerGrid())
		{
			Quaternion rotation = ((Transform)grid.m_gridRoot).rotation;
			return rotation.eulerAngles.z != 0f;
		}
		return false;
	}

	private static bool IsRotated(this Inventory inv)
	{
		if (!Object.op_Implicit((Object)(object)InventoryGui.instance))
		{
			return false;
		}
		InventoryGrid containerGrid = InventoryGui.instance.ContainerGrid;
		if (containerGrid.GetInventory() == inv)
		{
			return containerGrid.IsRotated();
		}
		return false;
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(InventoryGrid), "ResetView")]
	private static void InventoryGrid_ResetView(InventoryGrid __instance)
	{
		if (IsFeatureEnabled && __instance.IsContainerGrid())
		{
			__instance.ResetAnchorPosition();
		}
	}

	[HarmonyTranspiler]
	[HarmonyPatch(typeof(InventoryGrid), "UpdateGui")]
	private static IEnumerable<CodeInstruction> InventoryGrid_UpdateGui(IEnumerable<CodeInstruction> codes)
	{
		//IL_001d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0023: Expected Obj, but got Unknown
		//IL_0065: Unknown result type (might be due to invalid IL or missing references)
		//IL_006b: Expected Obj, but got Unknown
		//IL_00ad: Unknown result type (might be due to invalid IL or missing references)
		//IL_00b3: Expected Obj, but got Unknown
		//IL_00c1: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c7: Expected Obj, but got Unknown
		//IL_00f2: Unknown result type (might be due to invalid IL or missing references)
		//IL_00f8: Expected Obj, but got Unknown
		//IL_0105: Unknown result type (might be due to invalid IL or missing references)
		//IL_010b: Expected Obj, but got Unknown
		//IL_010e: Unknown result type (might be due to invalid IL or missing references)
		CodeMatch[] array = new CodeMatch[4]
		{
			new CodeMatch((OpCode?)OpCodes.Ldc_R4, (object)0.5f, (string)null),
			new CodeMatch((OpCode?)OpCodes.Call, (object)AccessTools.DeclaredMethod(typeof(Vector2), "op_Multiply", new Type[2]
			{
				typeof(Vector2),
				typeof(float)
			}, (Type[])null), (string)null),
			new CodeMatch((OpCode?)OpCodes.Call, (object)AccessTools.DeclaredMethod(typeof(Vector2), "op_Subtraction", new Type[2]
			{
				typeof(Vector2),
				typeof(Vector2)
			}, (Type[])null), (string)null),
			new CodeMatch((OpCode?)OpCodes.Stloc_S, (object)null, (string)null)
		};
		Func<Vector2, InventoryGrid, Vector2> func = Intercept;
		CodeInstruction[] array2 = new CodeInstruction[2]
		{
			new CodeInstruction(OpCodes.Ldarg_0, (object)null),
			new CodeInstruction(OpCodes.Call, (object)func.Method)
		};
		return new CodeMatcher(codes, (ILGenerator)null).MatchEndForward(array).ThrowIfInvalid("Unable to match IL sequence").Insert(array2)
			.InstructionEnumeration();
		static Vector2 Intercept(Vector2 vanilla, InventoryGrid grid)
		{
			//IL_000f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0011: Unknown result type (might be due to invalid IL or missing references)
			if (!IsFeatureEnabled || !grid.IsContainerGrid())
			{
				return vanilla;
			}
			return Vector2.zero;
		}
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(ScrollRectEnsureVisible), "CenterOnItem")]
	private static void ScrollRectEnsureVisible_CenterOnItem(ScrollRectEnsureVisible __instance)
	{
		if (Object.op_Implicit((Object)(object)InventoryGui.instance) && IsFeatureEnabled && (Object)(object)__instance.mContent == (Object)(object)InventoryGui.instance.ContainerGrid.m_gridRoot && !__instance.mScrollRect.horizontal)
		{
			InventoryGui.instance.ContainerGrid.ResetAnchorPosition();
		}
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(InventoryGrid), "GetWidgetSize")]
	private static void InventoryGrid_GetWidgetSize(InventoryGrid __instance, ref Vector2 __result)
	{
		//IL_0002: Unknown result type (might be due to invalid IL or missing references)
		//IL_000d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0012: Unknown result type (might be due to invalid IL or missing references)
		//IL_0017: Unknown result type (might be due to invalid IL or missing references)
		//IL_001c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0036: Unknown result type (might be due to invalid IL or missing references)
		//IL_003b: Unknown result type (might be due to invalid IL or missing references)
		__result *= Vector2.op_Implicit(((Transform)__instance.m_gridRoot).localScale);
		if (__instance.IsRotated())
		{
			__result = new Vector2(__result.y, __result.x);
		}
	}

	[HarmonyTranspiler]
	[HarmonyPatch(typeof(InventoryGrid), "UpdateGamepad")]
	private static IEnumerable<CodeInstruction> InventoryGrid_UpdateGamepad(IEnumerable<CodeInstruction> codes)
	{
		//IL_001a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0020: Expected Obj, but got Unknown
		//IL_0041: Unknown result type (might be due to invalid IL or missing references)
		//IL_0047: Expected Obj, but got Unknown
		//IL_0068: Unknown result type (might be due to invalid IL or missing references)
		//IL_006e: Expected Obj, but got Unknown
		//IL_0083: Unknown result type (might be due to invalid IL or missing references)
		//IL_0089: Expected Obj, but got Unknown
		//IL_00aa: Unknown result type (might be due to invalid IL or missing references)
		//IL_00b0: Expected Obj, but got Unknown
		//IL_00d1: Unknown result type (might be due to invalid IL or missing references)
		//IL_00d7: Expected Obj, but got Unknown
		//IL_00ff: Unknown result type (might be due to invalid IL or missing references)
		//IL_0105: Expected Obj, but got Unknown
		//IL_012d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0133: Expected Obj, but got Unknown
		//IL_0149: Unknown result type (might be due to invalid IL or missing references)
		//IL_014f: Expected Obj, but got Unknown
		//IL_0170: Unknown result type (might be due to invalid IL or missing references)
		//IL_0176: Expected Obj, but got Unknown
		//IL_018c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0192: Expected Obj, but got Unknown
		//IL_01b3: Unknown result type (might be due to invalid IL or missing references)
		//IL_01b9: Expected Obj, but got Unknown
		//IL_02ba: Unknown result type (might be due to invalid IL or missing references)
		//IL_02c1: Expected Obj, but got Unknown
		//IL_02ed: Unknown result type (might be due to invalid IL or missing references)
		//IL_02f3: Expected Obj, but got Unknown
		//IL_0301: Unknown result type (might be due to invalid IL or missing references)
		//IL_0307: Expected Obj, but got Unknown
		//IL_030e: Unknown result type (might be due to invalid IL or missing references)
		CodeMatch[] array = new CodeMatch[3]
		{
			new CodeMatch((OpCode?)OpCodes.Ldarg_0, (object)null, (string)null),
			new CodeMatch((OpCode?)OpCodes.Ldflda, (object)AccessTools.Field(typeof(InventoryGrid), "m_selected"), (string)null),
			new CodeMatch((OpCode?)OpCodes.Ldfld, (object)AccessTools.Field(typeof(Vector2i), "x"), (string)null)
		};
		CodeMatch[] array2 = new CodeMatch[3]
		{
			new CodeMatch((OpCode?)OpCodes.Ldarg_0, (object)null, (string)null),
			new CodeMatch((OpCode?)OpCodes.Ldflda, (object)AccessTools.Field(typeof(InventoryGrid), "m_selected"), (string)null),
			new CodeMatch((OpCode?)OpCodes.Ldfld, (object)AccessTools.Field(typeof(Vector2i), "y"), (string)null)
		};
		CodeMatch[] array3 = new CodeMatch[1]
		{
			new CodeMatch((OpCode?)OpCodes.Stfld, (object)AccessTools.DeclaredField(typeof(Vector2i), "x"), (string)null)
		};
		CodeMatch[] array4 = new CodeMatch[1]
		{
			new CodeMatch((OpCode?)OpCodes.Stfld, (object)AccessTools.DeclaredField(typeof(Vector2i), "y"), (string)null)
		};
		CodeMatch[] array5 = new CodeMatch[2]
		{
			new CodeMatch((OpCode?)OpCodes.Ldarg_0, (object)null, (string)null),
			new CodeMatch((OpCode?)OpCodes.Ldfld, (object)AccessTools.Field(typeof(InventoryGrid), "m_width"), (string)null)
		};
		CodeMatch[] array6 = new CodeMatch[2]
		{
			new CodeMatch((OpCode?)OpCodes.Ldarg_0, (object)null, (string)null),
			new CodeMatch((OpCode?)OpCodes.Ldfld, (object)AccessTools.Field(typeof(InventoryGrid), "m_height"), (string)null)
		};
		Func<InventoryGrid, int> readXtoY = ReadXtoY;
		Func<InventoryGrid, int> readYtoX = ReadYtoX;
		Action<int, InventoryGrid> writeXtoY = WriteXtoY;
		Action<int, InventoryGrid> writeYtoX = WriteYtoX;
		Func<InventoryGrid, int> heightToWidth = HeightToWidth;
		Func<InventoryGrid, int> widthToHeight = WidthToHeight;
		string[] inputs = new string[4] { "JoyDPadLeft", "JoyDPadRight", "JoyLStickLeft", "JoyLStickRight" };
		CodeMatch val = new CodeMatch((Func<CodeInstruction, bool>)((CodeInstruction ci) => ci.opcode == OpCodes.Ldstr && StringUtils.ContainsString((IReadOnlyList<string>)inputs, ci.operand as string, StringComparison.Ordinal)), (string)null);
		Func<string, InventoryGrid, string> func = InterceptLeftRight;
		CodeInstruction[] insertInput = new CodeInstruction[2]
		{
			new CodeInstruction(OpCodes.Ldarg_0, (object)null),
			new CodeInstruction(OpCodes.Call, (object)func.Method)
		};
		return new CodeMatcher(codes, (ILGenerator)null).Start().MatchStartForward(new CodeMatch[1] { val }).ThrowIfInvalid("Unable to match IL: sequenceInputs")
			.Repeat((Action<CodeMatcher>)((CodeMatcher m) =>
			{
				m.Advance(1).Insert(insertInput);
			}), (Action<string>)null)
			.Start()
			.MatchStartForward(array)
			.ThrowIfInvalid("Unable to match IL: sequenceReadX")
			.Repeat((Action<CodeMatcher>)((CodeMatcher m) =>
			{
				//IL_0035: Unknown result type (might be due to invalid IL or missing references)
				//IL_003b: Expected Obj, but got Unknown
				m.Advance(1).SetAndAdvance(OpCodes.Nop, (object)null).SetAndAdvance(OpCodes.Nop, (object)null)
					.Insert(new CodeInstruction[1]
					{
						new CodeInstruction(OpCodes.Call, (object)readXtoY.Method)
					});
			}), (Action<string>)null)
			.Start()
			.MatchStartForward(array2)
			.ThrowIfInvalid("Unable to match IL: sequenceReadY")
			.Repeat((Action<CodeMatcher>)((CodeMatcher m) =>
			{
				//IL_0035: Unknown result type (might be due to invalid IL or missing references)
				//IL_003b: Expected Obj, but got Unknown
				m.Advance(1).SetAndAdvance(OpCodes.Nop, (object)null).SetAndAdvance(OpCodes.Nop, (object)null)
					.Insert(new CodeInstruction[1]
					{
						new CodeInstruction(OpCodes.Call, (object)readYtoX.Method)
					});
			}), (Action<string>)null)
			.Start()
			.MatchStartForward(array3)
			.ThrowIfInvalid("Unable to match IL: sequenceWriteX")
			.Repeat((Action<CodeMatcher>)((CodeMatcher m) =>
			{
				//IL_000f: Unknown result type (might be due to invalid IL or missing references)
				//IL_0015: Expected Obj, but got Unknown
				//IL_003d: Unknown result type (might be due to invalid IL or missing references)
				//IL_0043: Expected Obj, but got Unknown
				m.InsertAndAdvance(new CodeInstruction[1]
				{
					new CodeInstruction(OpCodes.Ldarg_0, (object)null)
				}).SetAndAdvance(OpCodes.Call, (object)writeXtoY.Method).Insert(new CodeInstruction[1]
				{
					new CodeInstruction(OpCodes.Pop, (object)null)
				});
			}), (Action<string>)null)
			.Start()
			.MatchStartForward(array4)
			.ThrowIfInvalid("Unable to match IL: sequenceWriteY")
			.Repeat((Action<CodeMatcher>)((CodeMatcher m) =>
			{
				//IL_000f: Unknown result type (might be due to invalid IL or missing references)
				//IL_0015: Expected Obj, but got Unknown
				//IL_003d: Unknown result type (might be due to invalid IL or missing references)
				//IL_0043: Expected Obj, but got Unknown
				m.InsertAndAdvance(new CodeInstruction[1]
				{
					new CodeInstruction(OpCodes.Ldarg_0, (object)null)
				}).SetAndAdvance(OpCodes.Call, (object)writeYtoX.Method).Insert(new CodeInstruction[1]
				{
					new CodeInstruction(OpCodes.Pop, (object)null)
				});
			}), (Action<string>)null)
			.Start()
			.MatchStartForward(array5)
			.ThrowIfInvalid("Unable to match IL: sequenceWidth")
			.Repeat((Action<CodeMatcher>)((CodeMatcher m) =>
			{
				m.Advance(1).Set(OpCodes.Call, (object)widthToHeight.Method);
			}), (Action<string>)null)
			.Start()
			.MatchStartForward(array6)
			.ThrowIfInvalid("Unable to match IL: sequenceHeight")
			.Repeat((Action<CodeMatcher>)((CodeMatcher m) =>
			{
				m.Advance(1).Set(OpCodes.Call, (object)heightToWidth.Method);
			}), (Action<string>)null)
			.InstructionEnumeration();
		static int HeightToWidth(InventoryGrid grid)
		{
			if (grid.IsRotated())
			{
				return grid.m_width;
			}
			return grid.m_height;
		}
		static string InterceptLeftRight(string vanillaAction, InventoryGrid grid)
		{
			if (!grid.IsRotated())
			{
				return vanillaAction;
			}
			return vanillaAction switch
			{
				"JoyDPadLeft" => "JoyDPadRight", 
				"JoyDPadRight" => "JoyDPadLeft", 
				"JoyLStickLeft" => "JoyLStickRight", 
				"JoyLStickRight" => "JoyLStickLeft", 
				_ => vanillaAction, 
			};
		}
		static int ReadXtoY(InventoryGrid grid)
		{
			if (grid.IsRotated())
			{
				return grid.m_selected.y;
			}
			return grid.m_selected.x;
		}
		static int ReadYtoX(InventoryGrid grid)
		{
			if (grid.IsRotated())
			{
				return grid.m_selected.x;
			}
			return grid.m_selected.y;
		}
		static int WidthToHeight(InventoryGrid grid)
		{
			if (grid.IsRotated())
			{
				return grid.m_height;
			}
			return grid.m_width;
		}
		static void WriteXtoY(int value, InventoryGrid grid)
		{
			if (!grid.IsRotated())
			{
				grid.m_selected.x = value;
			}
			else
			{
				grid.m_selected.y = value;
			}
		}
		static void WriteYtoX(int value, InventoryGrid grid)
		{
			if (!grid.IsRotated())
			{
				grid.m_selected.y = value;
			}
			else
			{
				grid.m_selected.x = value;
			}
		}
	}

	[HarmonyPrefix]
	[HarmonyPatch(typeof(InventoryGui), "MoveToUpperInventoryGrid")]
	private static void InventoryGui_MoveToUpperInventoryGrid(InventoryGui __instance, ref Vector2i previousGridPosition)
	{
		if (__instance.ContainerGrid.IsRotated())
		{
			ref int x = ref previousGridPosition.x;
			ref int y = ref previousGridPosition.y;
			int num = __instance.ContainerGrid.m_height - previousGridPosition.y - 1;
			int x2 = previousGridPosition.x;
			x = num;
			y = x2;
		}
	}

	[HarmonyPrefix]
	[HarmonyPatch(typeof(InventoryGui), "MoveToLowerInventoryGrid")]
	private static bool InventoryGui_MoveToLowerInventoryGrid(InventoryGui __instance, ref Vector2i previousGridPosition)
	{
		//IL_0044: Unknown result type (might be due to invalid IL or missing references)
		//IL_0049: Unknown result type (might be due to invalid IL or missing references)
		//IL_008d: Unknown result type (might be due to invalid IL or missing references)
		if (!__instance.ContainerGrid.IsRotated())
		{
			return true;
		}
		if (!__instance.m_inventoryGroup.IsActive || !__instance.IsContainerOpen())
		{
			return false;
		}
		int num = __instance.m_playerGrid.GridWidth - __instance.m_containerGrid.m_height;
		Vector2i selectionGridPosition = __instance.m_containerGrid.SelectionGridPosition;
		int val = Mathf.Max(0, previousGridPosition.x - num);
		selectionGridPosition.y = __instance.m_containerGrid.m_height - Math.Min(val, __instance.m_containerGrid.m_height - 1);
		selectionGridPosition.x = 0;
		__instance.m_containerGrid.SetGamepadSelection(selectionGridPosition);
		__instance.SetActiveGroup(__instance.m_activeGroup - 1, true);
		return false;
	}

	[HarmonyTranspiler]
	[HarmonyPatch(typeof(InventoryGui), "MoveToLowerInventoryGrid")]
	[HarmonyPriority(100)]
	private static IEnumerable<CodeInstruction> InventoryGui_MoveToLowerInventoryGrid(IEnumerable<CodeInstruction> codes)
	{
		MethodInfo methodInfo = AccessTools.DeclaredPropertyGetter(typeof(InventoryGrid), "SelectionGridPosition");
		Func<InventoryGrid, Vector2i> func = Intercept;
		return Transpilers.MethodReplacer(codes, (MethodBase)methodInfo, (MethodBase)func.Method);
		static Vector2i Intercept(InventoryGrid grid)
		{
			//IL_000f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0014: Unknown result type (might be due to invalid IL or missing references)
			//IL_001d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0008: Unknown result type (might be due to invalid IL or missing references)
			if (!IsFeatureEnabled)
			{
				return grid.SelectionGridPosition;
			}
			Vector2i selectionGridPosition = grid.SelectionGridPosition;
			selectionGridPosition.y = 0;
			return selectionGridPosition;
		}
	}

	[HarmonyPostfix]
	[HarmonyPatch(/*Could not decode attribute arguments.*/)]
	private static void InventoryGrid_GridWidth(InventoryGrid __instance, ref int __result)
	{
		if (__instance.IsRotated())
		{
			__result = __instance.m_height;
		}
	}

	[HarmonyPrefix]
	[HarmonyPatch(typeof(Inventory), "FindEmptySlot")]
	private static void Inventory_FindEmptySlot(Inventory __instance, bool topFirst, ref Vector2i __result, ref bool __runOriginal)
	{
		//IL_008e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0093: Unknown result type (might be due to invalid IL or missing references)
		//IL_0070: Unknown result type (might be due to invalid IL or missing references)
		//IL_0075: Unknown result type (might be due to invalid IL or missing references)
		//IL_002b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0030: Unknown result type (might be due to invalid IL or missing references)
		if (!__instance.IsRotated())
		{
			return;
		}
		__runOriginal = false;
		if (topFirst)
		{
			for (int i = 0; i < __instance.m_width; i++)
			{
				for (int num = __instance.m_height - 1; num >= 0; num--)
				{
					if (__instance.GetItemAt(i, num) == null)
					{
						__result = new Vector2i(i, num);
						return;
					}
				}
			}
		}
		else
		{
			for (int num2 = __instance.m_width - 1; num2 >= 0; num2--)
			{
				for (int num3 = __instance.m_height - 1; num3 >= 0; num3--)
				{
					if (__instance.GetItemAt(num2, num3) == null)
					{
						__result = new Vector2i(num2, num3);
						return;
					}
				}
			}
		}
		__result = new Vector2i(-1, -1);
	}
}
