using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Reflection;
using System.Reflection.Emit;
using BepInEx.Configuration;
using HarmonyLib;
using JetBrains.Annotations;
using Jotunn;
using Jotunn.Managers;
using TMPro;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.UI;
using Zen;
using Zen.Lib;
using Zen.Lib.Config;
using ZenUI.Compatibility;

namespace ZenUI.Section;

[HarmonyPatch]
internal static class CraftingPanel
{
	private enum CraftGroup
	{
		Everything,
		Weapons,
		Ammo,
		Armor,
		Shields,
		Magic,
		Tools,
		Equipment,
		Resources,
		Food,
		Trophy,
		Misc
	}

	private class CraftGroupItemTypes(string iconSpriteName, HashSet<ItemType> types)
	{
		public readonly HashSet<ItemType> Types = types;

		private Sprite? _icon;

		public Sprite Icon
		{
			get
			{
				if (!Object.op_Implicit((Object)(object)_icon))
				{
					return _icon = GUIManager.Instance.GetSprite(iconSpriteName);
				}
				return _icon;
			}
		}
	}

	[HarmonyPatch(typeof(InventoryGui), "UpdateRecipeList")]
	private static class InventoryGuiUpdateRecipeList
	{
		[HarmonyPrefix]
		[HarmonyPriority(700)]
		private static void PrefixEarly(InventoryGui __instance)
		{
			if (Configs.CraftPanelEnabled.Value && !__instance.InCraftTab() && _isLeftPanelDirty)
			{
				ClearLeftPanel();
			}
		}

		[HarmonyPrefix]
		[HarmonyPriority(0)]
		private static void PrefixLate(InventoryGui __instance, List<Recipe> recipes, ref bool __runOriginal)
		{
			if (!Configs.CraftPanelEnabled.Value || !__instance.InCraftTab())
			{
				return;
			}
			if (_isLeftPanelDirty)
			{
				ClearLeftPanel();
			}
			__runOriginal = false;
			if (IsObjectDBRecipesChanged)
			{
				AssignRecipesToCraftGroups();
			}
			bool globalKey = ZoneSystem.instance.GetGlobalKey((GlobalKeys)25);
			ActiveGroups.Clear();
			__instance.m_availableRecipes.Clear();
			foreach (Recipe recipe in recipes)
			{
				bool flag = globalKey || Player.m_localPlayer.HaveRequirements(recipe, false, 1, 1);
				InventoryGui.instance.AddRecipeToList(Player.m_localPlayer, recipe, (ItemData)null, flag);
				ActiveGroups.UnionWith(RecipeToGroups[recipe]);
			}
			if (ActiveGroups.Count == 2)
			{
				ActiveGroups.Remove(CraftGroup.Everything);
			}
		}

		[UsedImplicitly]
		private static void Postfix(InventoryGui __instance)
		{
			if (Configs.CraftPanelEnabled.Value && __instance.InCraftTab())
			{
				UpdateRecipeList();
			}
		}
	}

	private static readonly Stopwatch Stopwatch = new Stopwatch();

	private const int DefaultWidth = 5;

	private const int DefaultHeight = 7;

	private static CraftingPanelGrid _craftingGrid = null;

	private static RectTransform _leftPanel = null;

	private static RectTransform _rightPanel = null;

	private static CraftingStation? _currentStation;

	private static CraftGroup? _currentGroup;

	private static bool _isGroupChanged;

	private static bool _isLeftPanelDirty;

	private static ItemData? _selectedItem;

	private static TMP_Text? _craftButtonLabelCache;

	private static GameObject? _itemInfoTooltip_KBM;

	private static (ItemData? Item, bool IsDetailMode, bool IsMulticraft) _itemStateLastSelected_KBM;

	private static Vector2 _craftTypeTextOrigPos;

	private const float CraftTypeTextVanillaOffsetY = 20f;

	private const float CraftTypeTextOffsetY = -150f;

	private static int _lastObjectDBRecipesCount;

	private static readonly Dictionary<(Recipe Recipe, int Variant), ItemData> RecipeItemCloneCache = new Dictionary<(Recipe, int), ItemData>();

	private static readonly Dictionary<CraftGroup, float> ScrollPositions = new Dictionary<CraftGroup, float>();

	private static readonly Dictionary<Recipe, HashSet<CraftGroup>> RecipeToGroups = new Dictionary<Recipe, HashSet<CraftGroup>>();

	private static readonly Dictionary<ItemData, RecipeDataPair> ItemRecipeData = new Dictionary<ItemData, RecipeDataPair>();

	private static readonly SortedSet<CraftGroup> ActiveGroups = new SortedSet<CraftGroup>();

	private static readonly SortedDictionary<CraftGroup, CraftGroupItemTypes> CraftGroups = new SortedDictionary<CraftGroup, CraftGroupItemTypes>
	{
		{
			CraftGroup.Everything,
			new CraftGroupItemTypes("wisp", Enum.GetValues(typeof(ItemType)).Cast<ItemType>().ToHashSet())
		},
		{
			CraftGroup.Weapons,
			new CraftGroupItemTypes("BattleAxe", new HashSet<ItemType>
			{
				(ItemType)3,
				(ItemType)14,
				(ItemType)4,
				(ItemType)22,
				(ItemType)20
			})
		},
		{
			CraftGroup.Ammo,
			new CraftGroupItemTypes("arrow_iron", new HashSet<ItemType>
			{
				(ItemType)9,
				(ItemType)23
			})
		},
		{
			CraftGroup.Armor,
			new CraftGroupItemTypes("HelmetCarapace", new HashSet<ItemType>
			{
				(ItemType)6,
				(ItemType)7,
				(ItemType)11,
				(ItemType)17
			})
		},
		{
			CraftGroup.Shields,
			new CraftGroupItemTypes("shield_ironbuckler", new HashSet<ItemType> { (ItemType)5 })
		},
		{
			CraftGroup.Magic,
			new CraftGroupItemTypes("StaffFireball", new HashSet<ItemType> { (ItemType)24 })
		},
		{
			CraftGroup.Tools,
			new CraftGroupItemTypes("pickaxe_iron", new HashSet<ItemType>
			{
				(ItemType)19,
				(ItemType)15,
				(ItemType)18,
				(ItemType)16
			})
		},
		{
			CraftGroup.Equipment,
			new CraftGroupItemTypes("chest_hildir1", new HashSet<ItemType> { (ItemType)10 })
		},
		{
			CraftGroup.Resources,
			new CraftGroupItemTypes("Barrel", new HashSet<ItemType> { (ItemType)1 })
		},
		{
			CraftGroup.Food,
			new CraftGroupItemTypes("meat_cooked", new HashSet<ItemType>
			{
				(ItemType)2,
				(ItemType)21
			})
		},
		{
			CraftGroup.Trophy,
			new CraftGroupItemTypes("TrophyDeer", new HashSet<ItemType> { (ItemType)13 })
		},
		{
			CraftGroup.Misc,
			new CraftGroupItemTypes("bonefragments", new HashSet<ItemType> { (ItemType)0 })
		}
	};

	private static readonly Dictionary<CraftGroup, HashSet<string>> ExplicitGroupAssignment = new Dictionary<CraftGroup, HashSet<string>>
	{
		{
			CraftGroup.Ammo,
			new HashSet<string> { "Catapult_ammo", "BombSiege" }
		},
		{
			CraftGroup.Tools,
			new HashSet<string> { "Pickaxe*", "Scythe", "FishingRod", "Tankard*", "KnifeButcher", "Shovel" }
		},
		{
			CraftGroup.Resources,
			new HashSet<string> { "FishingBait*", "*Uncooked" }
		},
		{
			CraftGroup.Magic,
			new HashSet<string> { "Staff*", "-*Uncooked" }
		},
		{
			CraftGroup.Food,
			new HashSet<string> { "Feast*" }
		}
	};

	private static readonly HashSet<string> AllExplicitAssignmentPatterns = new HashSet<string>();

	private static readonly HashSet<ItemType> AllKnownTypes = CraftGroups.Where((KeyValuePair<CraftGroup, CraftGroupItemTypes> kvp) => kvp.Key != CraftGroup.Everything).SelectMany((KeyValuePair<CraftGroup, CraftGroupItemTypes> kvp) => kvp.Value.Types).ToHashSet();

	private static TMP_Text CraftButtonLabel
	{
		get
		{
			if (!Object.op_Implicit((Object)(object)_craftButtonLabelCache))
			{
				return _craftButtonLabelCache = ((Component)InventoryGui.instance.m_craftButton).GetComponentInChildren<TMP_Text>();
			}
			return _craftButtonLabelCache;
		}
	}

	private static bool IsObjectDBRecipesChanged => _lastObjectDBRecipesCount != ObjectDB.instance.m_recipes.Count;

	public static bool IsStationChanged
	{
		get
		{
			if (Object.op_Implicit((Object)(object)Player.m_localPlayer))
			{
				return (Object)(object)_currentStation != (Object)(object)Player.m_localPlayer.GetCurrentCraftingStation();
			}
			return false;
		}
	}

	private static IEnumerable<RecipeDataPair> ActiveRecipes
	{
		get
		{
			if (_currentGroup.HasValue)
			{
				return InventoryGui.instance.m_availableRecipes.Where((RecipeDataPair r) => !r.Recipe.m_noCraftOnlyUpgrade).Where(InCurrentGroup).Where(CraftingPanelSearch.ApplySearchFilter)
					.SortCraftRecipes();
			}
			return Array.Empty<RecipeDataPair>();
		}
	}

	public static bool IsMulticraftPressed => InventoryGui.instance.IsMulticraftPressed();

	private static bool IsNoCraftCost
	{
		get
		{
			if (!Object.op_Implicit((Object)(object)ZoneSystem.instance) || !ZoneSystem.instance.GetGlobalKey((GlobalKeys)25))
			{
				if (Object.op_Implicit((Object)(object)Player.m_localPlayer))
				{
					return Player.m_localPlayer.NoCostCheat();
				}
				return false;
			}
			return true;
		}
	}

	internal static bool CanCraft(ItemData item)
	{
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		//IL_000b: Unknown result type (might be due to invalid IL or missing references)
		RecipeDataPair val = ItemRecipeData[item];
		if (!val.CanCraft)
		{
			return IsNoCraftCost;
		}
		return true;
	}

	private static bool InCurrentGroup(ItemData? item)
	{
		if (item != null)
		{
			return ItemRecipeData.ContainsKey(item);
		}
		return false;
	}

	private static bool InCurrentGroup(RecipeDataPair r)
	{
		if (_currentGroup.HasValue)
		{
			return RecipeToGroups[r.Recipe].Contains(_currentGroup.Value);
		}
		return false;
	}

	private static bool IsInGroups(this RecipeDataPair recipeData, params CraftGroup[] groups)
	{
		return recipeData.Recipe.IsInGroups(groups);
	}

	private static bool IsInGroups(this Recipe recipe, params CraftGroup[] groups)
	{
		return groups.Any(RecipeToGroups[recipe].Contains);
	}

	internal static void InitExplicitGroupConfigs()
	{
		foreach (CraftGroup group in Enum.GetValues(typeof(CraftGroup)))
		{
			if (group != CraftGroup.Everything)
			{
				if (!ExplicitGroupAssignment.TryGetValue(group, out HashSet<string> value))
				{
					value = new HashSet<string>();
					ExplicitGroupAssignment.Add(group, value);
				}
				ConfigEntry<StringList> config = Config.Define(isAdmin: true, "Crafting Group Assignment", group.ToString(), new StringList(value), "Comma separated list of item prefab names explicitly assigned to this group.\r\nUse this to override the default groupings which are based on item type.\r\nThe prefix and suffix wildcard * is supported.\r\nExplicltly remove an item from a group with a - prefix: -prefabName\r\nRemoval wildcards are also supported, example: -Wood* or -*Wood");
				ExplicitGroupAssignment[group] = config.Value.ToHashSet();
				config.SettingChanged += (object _, EventArgs _) =>
				{
					UpdatePatterns(group, config.Value.ToHashSet());
				};
			}
		}
		UpdateExplicitAssignmentPatterns();
		static void UpdatePatterns(CraftGroup key, HashSet<string> patterns)
		{
			ExplicitGroupAssignment[key] = patterns;
			UpdateExplicitAssignmentPatterns();
		}
	}

	private static void UpdateExplicitAssignmentPatterns()
	{
		AllExplicitAssignmentPatterns.Clear();
		AllExplicitAssignmentPatterns.UnionWith(ExplicitGroupAssignment.SelectMany((KeyValuePair<CraftGroup, HashSet<string>> kv) => kv.Value));
	}

	private static void ResetInfoPanel_KBM()
	{
		Object.Destroy((Object)(object)_itemInfoTooltip_KBM);
		_itemStateLastSelected_KBM = default;
	}

	private static void InitPanel()
	{
		ZenMod<Plugin>.Instance.RegisterInputs += ResetInfoPanel_KBM;
		Reset();
		SetupCraftingPanel();
	}

	private static void SetupCraftingPanel()
	{
		//IL_0016: Unknown result type (might be due to invalid IL or missing references)
		//IL_0020: Expected Obj, but got Unknown
		//IL_0030: Unknown result type (might be due to invalid IL or missing references)
		//IL_003a: Expected Obj, but got Unknown
		//IL_005b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0060: Unknown result type (might be due to invalid IL or missing references)
		//IL_0061: Unknown result type (might be due to invalid IL or missing references)
		//IL_0066: Unknown result type (might be due to invalid IL or missing references)
		//IL_0073: Unknown result type (might be due to invalid IL or missing references)
		//IL_008e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0093: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a0: Unknown result type (might be due to invalid IL or missing references)
		//IL_00bb: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c0: Unknown result type (might be due to invalid IL or missing references)
		//IL_00cd: Unknown result type (might be due to invalid IL or missing references)
		//IL_00da: Unknown result type (might be due to invalid IL or missing references)
		//IL_00df: Unknown result type (might be due to invalid IL or missing references)
		//IL_01c5: Unknown result type (might be due to invalid IL or missing references)
		//IL_01ca: Unknown result type (might be due to invalid IL or missing references)
		//IL_01d5: Unknown result type (might be due to invalid IL or missing references)
		//IL_01e9: Unknown result type (might be due to invalid IL or missing references)
		//IL_0204: Unknown result type (might be due to invalid IL or missing references)
		//IL_0209: Unknown result type (might be due to invalid IL or missing references)
		//IL_020a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0214: Unknown result type (might be due to invalid IL or missing references)
		//IL_0215: Unknown result type (might be due to invalid IL or missing references)
		//IL_0216: Unknown result type (might be due to invalid IL or missing references)
		//IL_021b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0228: Unknown result type (might be due to invalid IL or missing references)
		//IL_022e: Unknown result type (might be due to invalid IL or missing references)
		//IL_022f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0230: Unknown result type (might be due to invalid IL or missing references)
		//IL_0235: Unknown result type (might be due to invalid IL or missing references)
		//IL_0242: Unknown result type (might be due to invalid IL or missing references)
		//IL_0248: Unknown result type (might be due to invalid IL or missing references)
		//IL_0249: Unknown result type (might be due to invalid IL or missing references)
		//IL_024e: Unknown result type (might be due to invalid IL or missing references)
		//IL_025b: Unknown result type (might be due to invalid IL or missing references)
		//IL_028c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0291: Unknown result type (might be due to invalid IL or missing references)
		//IL_02a6: Unknown result type (might be due to invalid IL or missing references)
		//IL_02b1: Unknown result type (might be due to invalid IL or missing references)
		//IL_02bb: Unknown result type (might be due to invalid IL or missing references)
		//IL_02c6: Unknown result type (might be due to invalid IL or missing references)
		//IL_02d0: Unknown result type (might be due to invalid IL or missing references)
		//IL_02db: Unknown result type (might be due to invalid IL or missing references)
		//IL_02e5: Unknown result type (might be due to invalid IL or missing references)
		//IL_02e6: Unknown result type (might be due to invalid IL or missing references)
		//IL_02e7: Unknown result type (might be due to invalid IL or missing references)
		//IL_02ec: Unknown result type (might be due to invalid IL or missing references)
		//IL_02f9: Unknown result type (might be due to invalid IL or missing references)
		//IL_030d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0351: Unknown result type (might be due to invalid IL or missing references)
		//IL_0356: Unknown result type (might be due to invalid IL or missing references)
		//IL_035b: Unknown result type (might be due to invalid IL or missing references)
		InventoryGui instance = InventoryGui.instance;
		_rightPanel = (RectTransform)((Transform)instance.m_crafting).Find("Decription");
		_leftPanel = (RectTransform)((Transform)instance.m_crafting).Find("RecipeList");
		Logging<Plugin>.Info("Resize the panels");
		Logging<Plugin>.Info("Resize the crafting window");
		RectTransform val = (RectTransform)((Component)instance.m_crafting).transform;
		Vector2 sizeDelta = val.sizeDelta;
		sizeDelta.y = 685f;
		val.sizeDelta = sizeDelta;
		Logging<Plugin>.Info("Resize the right panel");
		RectTransform rightPanel = _rightPanel;
		sizeDelta = _rightPanel.sizeDelta;
		sizeDelta.y = 490f;
		rightPanel.sizeDelta = sizeDelta;
		Logging<Plugin>.Info("Resize the left panel");
		RectTransform leftPanel = _leftPanel;
		sizeDelta = _leftPanel.sizeDelta;
		sizeDelta.y = 490f;
		leftPanel.sizeDelta = sizeDelta;
		Rect rect = instance.m_recipeListRoot.rect;
		instance.m_recipeListBaseSize = rect.height;
		Logging<Plugin>.Info("Clone the ContainerGrid game object");
		GameObject val2 = Object.Instantiate<GameObject>(((Component)instance.ContainerGrid).gameObject, (Transform)(object)_rightPanel);
		((Object)val2).name = "ZenUI_CraftingGrid";
		val2.SetActive(false);
		Logging<Plugin>.Info("Replace the InventoryGrid with a CraftingPanelGrid");
		Object.Destroy((Object)(object)val2.GetComponent<InventoryGrid>());
		_craftingGrid = val2.AddComponent<CraftingPanelGrid>();
		_craftingGrid.Init(5, 7);
		Logging<Plugin>.Info("Setup selected event handlers");
		_craftingGrid.OnSelectedItem += SelectItem;
		Logging<Plugin>.Info("Setup scroll event handlers");
		_craftingGrid.OnScrollChanged += ScrollChanged;
		Logging<Plugin>.Info("Move the crafting button down and to the left");
		RectTransform val3 = (RectTransform)((Component)instance.m_craftButton).transform.parent;
		val3.anchoredPosition = new Vector2(-280f, -50f);
		val3.sizeDelta = new Vector2(-160f, 70f);
		Logging<Plugin>.Info("Resize the progress bar to fit the new button shape");
		RectTransform val4 = (RectTransform)instance.m_craftProgressPanel;
		val4.anchoredPosition = Vector2.zero;
		sizeDelta = val4.offsetMax;
		sizeDelta.x = 0f;
		val4.offsetMax = sizeDelta;
		sizeDelta = val4.offsetMin;
		sizeDelta.x = 0f;
		val4.offsetMin = sizeDelta;
		sizeDelta = val4.sizeDelta;
		sizeDelta.x = 180f;
		val4.sizeDelta = sizeDelta;
		instance.m_craftProgressBar.SetWidth(180f);
		Logging<Plugin>.Info("Move the requirements panel down and align the right margin");
		RectTransform val5 = (RectTransform)((Transform)instance.m_crafting).Find("Decription/requirements");
		((HorizontalOrVerticalLayoutGroup)ExposedGameObjectExtension.GetOrAddComponent<HorizontalLayoutGroup>(((Component)val5).gameObject)).spacing = 0f;
		val5.anchoredPosition = new Vector2(0f, -48f);
		val5.anchorMax = new Vector2(1f, 0f);
		val5.anchorMin = new Vector2(0f, 0f);
		sizeDelta = val5.sizeDelta;
		sizeDelta.x = 0f;
		val5.sizeDelta = sizeDelta;
		foreach (Transform item in (Transform)val5)
		{
			((Behaviour)((Component)item).GetComponent<Image>()).enabled = true;
		}
		Logging<Plugin>.Info("Save the original upgrade notice position");
		_craftTypeTextOrigPos = ((RectTransform)instance.m_itemCraftType.transform).anchoredPosition;
		Logging<Plugin>.Info("Setup crafting group icons");
	}

	private static void SetRepairPanelPosition(InventoryGui gui)
	{
		//IL_0016: Unknown result type (might be due to invalid IL or missing references)
		//IL_001b: Unknown result type (might be due to invalid IL or missing references)
		//IL_001c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0021: Unknown result type (might be due to invalid IL or missing references)
		//IL_002e: Unknown result type (might be due to invalid IL or missing references)
		Logging<Plugin>.Info("Move the repair panel to compensate for the resized crafting panel");
		RectTransform val = (RectTransform)((Component)gui.m_repairButton).transform;
		Vector2 anchoredPosition = val.anchoredPosition;
		anchoredPosition.y = 185.5f;
		val.anchoredPosition = anchoredPosition;
	}

	private static bool TryGetCurrentGroup(out CraftGroup group)
	{
		group = _currentGroup ?? ((CraftGroup)(-1));
		return _currentGroup.HasValue;
	}

	private static void ScrollChanged(float value)
	{
		if (TryGetCurrentGroup(out var group))
		{
			ScrollPositions[group] = value;
		}
	}

	internal static void ResetScrollCache()
	{
		Logging<Plugin>.Info("Reset scroll position cached values for all groups");
		foreach (CraftGroup value in Enum.GetValues(typeof(CraftGroup)))
		{
			ScrollPositions[value] = 1f;
		}
	}

	private static void Reset()
	{
		_currentStation = null;
		_currentGroup = null;
		_lastObjectDBRecipesCount = 0;
		_selectedItem = null;
		ResetInfoPanel_KBM();
		SelectItem(null);
		ResetScrollCache();
	}

	private static void ForceRefresh()
	{
		Reset();
		InventoryGui.instance.UpdateCraftingPanel(false);
	}

	private static void AssignRecipesToCraftGroups()
	{
		Logging<Plugin>.Info("Assign all recipes to craft groups");
		RecipeToGroups.Clear();
		foreach (Recipe item in ObjectDB.instance.m_recipes.Where((Recipe recipe) => Object.op_Implicit((Object)(object)recipe.m_item)))
		{
			AssignRecipeToCraftGroups(item);
		}
		_lastObjectDBRecipesCount = ObjectDB.instance.m_recipes.Count;
	}

	private static void AssignRecipeToCraftGroups(Recipe recipe)
	{
		//IL_0033: Unknown result type (might be due to invalid IL or missing references)
		//IL_0038: Unknown result type (might be due to invalid IL or missing references)
		//IL_006c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0091: Unknown result type (might be due to invalid IL or missing references)
		//IL_0111: Unknown result type (might be due to invalid IL or missing references)
		string itemPrefabName = recipe.m_item.GetPrefabName();
		ItemType itemType = recipe.m_item.m_itemData.GetItemType();
		IEnumerable<CraftGroup> enumerable = CraftGroups.Keys.Where((CraftGroup g) => g != CraftGroup.Everything);
		if (!AllKnownTypes.Contains(itemType))
		{
			Logging<Plugin>.InterpolatedString msg = new Logging<Plugin>.InterpolatedString(20, 2, out var shouldAppend);
			if (shouldAppend)
			{
				msg.AppendLiteral("No known type: ");
				msg.AppendFormatted<ItemType>(itemType);
				msg.AppendLiteral(" for ");
				msg.AppendFormatted(itemPrefabName);
			}
			Logging<Plugin>.Info(msg);
		}
		AddToGroup(CraftGroup.Everything);
		bool flag = false;
		foreach (CraftGroup item in enumerable)
		{
			if (IsRemovedFromGroupExplicitly(item))
			{
				continue;
			}
			if (IsWildcardFound(AllExplicitAssignmentPatterns))
			{
				if (IsAssignedToGroupExplicitly(item))
				{
					AddToGroup(item);
					flag = true;
				}
			}
			else if (CraftGroups[item].Types.Contains(itemType))
			{
				AddToGroup(item);
				flag = true;
			}
		}
		if (!flag)
		{
			AddToGroup(CraftGroup.Misc);
		}
		void AddToGroup(CraftGroup group)
		{
			Logging<Plugin>.InterpolatedString msg2 = new Logging<Plugin>.InterpolatedString(23, 2, out var shouldAppend2);
			if (shouldAppend2)
			{
				msg2.AppendLiteral("Add recipe: ");
				msg2.AppendFormatted(itemPrefabName);
				msg2.AppendLiteral(" to group: ");
				msg2.AppendFormatted(group);
			}
			Logging<Plugin>.Info(msg2);
			RecipeToGroups.AddToList(recipe, group);
		}
		static bool EndsWith(string s, string pattern, bool isExclude)
		{
			if (isExclude)
			{
				if (!pattern.StartsWith("-"))
				{
					return false;
				}
				pattern = pattern.Substring(1);
			}
			if (pattern.EndsWith("*"))
			{
				return s.StartsWith(pattern.Substring(0, pattern.Length - 1));
			}
			return false;
		}
		bool IsAssignedToGroupExplicitly(CraftGroup group)
		{
			int num;
			if (ExplicitGroupAssignment.TryGetValue(group, out HashSet<string> value))
			{
				num = (IsWildcardFound(value) ? 1 : 0);
				if (num != 0)
				{
					Logging<Plugin>.InterpolatedString msg2 = new Logging<Plugin>.InterpolatedString(25, 2, out var shouldAppend2);
					if (shouldAppend2)
					{
						msg2.AppendLiteral("Explicit item: ");
						msg2.AppendFormatted(itemPrefabName);
						msg2.AppendLiteral(" in group ");
						msg2.AppendFormatted(group);
					}
					Logging<Plugin>.Info(msg2);
				}
			}
			else
			{
				num = 0;
			}
			return (byte)num != 0;
		}
		bool IsRemovedFromGroupExplicitly(CraftGroup group)
		{
			int num;
			if (ExplicitGroupAssignment.TryGetValue(group, out HashSet<string> value))
			{
				num = (IsWildcardFound(value, isExclude: true) ? 1 : 0);
				if (num != 0)
				{
					Logging<Plugin>.InterpolatedString msg2 = new Logging<Plugin>.InterpolatedString(25, 2, out var shouldAppend2);
					if (shouldAppend2)
					{
						msg2.AppendLiteral("Remove item: ");
						msg2.AppendFormatted(itemPrefabName);
						msg2.AppendLiteral(" from group ");
						msg2.AppendFormatted(group);
					}
					Logging<Plugin>.Info(msg2);
				}
			}
			else
			{
				num = 0;
			}
			return (byte)num != 0;
		}
		bool IsWildcardFound(HashSet<string> list, bool isExclude = false)
		{
			if (!list.Contains(isExclude ? ("-" + itemPrefabName) : itemPrefabName))
			{
				return list.Any((string pattern) => StartsWith(itemPrefabName, pattern, isExclude) || EndsWith(itemPrefabName, pattern, isExclude));
			}
			return true;
		}
		static bool StartsWith(string s, string pattern, bool isExclude)
		{
			if (isExclude)
			{
				if (!pattern.StartsWith("-"))
				{
					return false;
				}
				pattern = pattern.Substring(1);
			}
			if (pattern.StartsWith("*"))
			{
				return s.EndsWith(pattern.Substring(1));
			}
			return false;
		}
	}

	private static void UpdateGamepad()
	{
		if (ZInput.IsGamepadActive() && ((InventoryGrid)_craftingGrid).m_uiGroup.IsActive && InventoryGui.instance.InCraftTab() && ActiveGroups.Count != 0)
		{
			CraftGroup craftGroup = _currentGroup ?? ActiveGroups.First();
			int num = ActiveGroupIndex(craftGroup);
			if (ZInput.GetButtonDown("JoyDPadUp"))
			{
				craftGroup = ActiveGroups.ElementAt(Mathf.Max(num - 1, 0));
			}
			if (ZInput.GetButtonDown("JoyDPadDown"))
			{
				craftGroup = ActiveGroups.ElementAt(Mathf.Min(num + 1, ActiveGroups.Count - 1));
			}
			if (craftGroup != _currentGroup)
			{
				SelectGroup(craftGroup);
			}
		}
		static int ActiveGroupIndex(CraftGroup group)
		{
			int num2 = 0;
			foreach (CraftGroup activeGroup in ActiveGroups)
			{
				if (activeGroup == group)
				{
					return num2;
				}
				num2++;
			}
			return 0;
		}
	}

	private static ItemData GetRecipeItemClone(Recipe recipe, int variant)
	{
		if (!RecipeItemCloneCache.TryGetValue((recipe, variant), out ItemData value))
		{
			Logging<Plugin>.InterpolatedString msg = new Logging<Plugin>.InterpolatedString(39, 2, out var shouldAppend);
			if (shouldAppend)
			{
				msg.AppendLiteral("Adding recipe item to cache: ");
				msg.AppendFormatted(recipe.m_item.GetPrefabName());
				msg.AppendLiteral(" variant: ");
				msg.AppendFormatted(variant);
			}
			Logging<Plugin>.Info(msg);
			value = recipe.m_item.m_itemData.Clone();
			RecipeItemCloneCache.Add((recipe, variant), value);
		}
		value.m_stack = recipe.GetAmount();
		value.m_durability = value.GetMaxDurability();
		value.m_variant = variant;
		return value;
	}

	private static int GetAmount(this Recipe recipe)
	{
		int num = default;
		ItemData val = default;
		return recipe.GetAmount(1, ref num, ref val, 1);
	}

	private static void UpdateGridData()
	{
		//IL_0052: Unknown result type (might be due to invalid IL or missing references)
		//IL_0057: Unknown result type (might be due to invalid IL or missing references)
		//IL_00b8: Unknown result type (might be due to invalid IL or missing references)
		//IL_00bd: Unknown result type (might be due to invalid IL or missing references)
		//IL_0175: Unknown result type (might be due to invalid IL or missing references)
		//IL_012f: Unknown result type (might be due to invalid IL or missing references)
		Logging<Plugin>.Info("Update grid data");
		Inventory inventory = ((InventoryGrid)_craftingGrid).GetInventory();
		inventory.m_inventory.Clear();
		ItemRecipeData.Clear();
		_craftingGrid.ResetCache();
		Stopwatch.Restart();
		int num = 0;
		bool shouldAppend;
		Logging<Plugin>.InterpolatedString msg;
		foreach (RecipeDataPair activeRecipe in ActiveRecipes)
		{
			RecipeDataPair current = activeRecipe;
			Recipe recipe = current.Recipe;
			int num2 = ((Configs.CraftPanelHideUncraftableVariants.Value && !current.CanCraft && !IsNoCraftCost) ? 1 : recipe.m_item.m_itemData.m_shared.m_icons.Length);
			for (int i = 0; i < num2; i++)
			{
				ItemData recipeItemClone = GetRecipeItemClone(recipe, i);
				recipeItemClone.m_gridPos = new Vector2i(num % 5, num / 5);
				if (Logging<Plugin>.IsEnabled)
				{
					msg = new Logging<Plugin>.InterpolatedString(42, 5, out shouldAppend);
					if (shouldAppend)
					{
						msg.AppendLiteral("Item: ");
						msg.AppendFormatted(recipeItemClone.GetPrefabName());
						msg.AppendLiteral(" Index: ");
						msg.AppendFormatted(num);
						msg.AppendLiteral(" Variant: ");
						msg.AppendFormatted(i);
						msg.AppendLiteral(" GridPos: ");
						msg.AppendFormatted<Vector2i>(recipeItemClone.m_gridPos);
						msg.AppendLiteral(" Icons: ");
						msg.AppendFormatted(recipeItemClone.m_shared.m_icons.Length);
					}
					Logging<Plugin>.Debug(msg);
				}
				_craftingGrid.AddItem(recipeItemClone);
				ItemRecipeData.Add(recipeItemClone, current);
				num++;
			}
		}
		Stopwatch.Stop();
		msg = new Logging<Plugin>.InterpolatedString(17, 2, out shouldAppend);
		if (shouldAppend)
		{
			msg.AppendLiteral("Time: ");
			msg.AppendFormatted(Stopwatch.ElapsedMilliseconds);
			msg.AppendLiteral("ms, count: ");
			msg.AppendFormatted(inventory.NrOfItems());
		}
		Logging<Plugin>.Info(msg);
		inventory.m_height = Mathf.Max(7, Mathf.CeilToInt((float)inventory.NrOfItems() / 5f));
		msg = new Logging<Plugin>.InterpolatedString(17, 2, out shouldAppend);
		if (shouldAppend)
		{
			msg.AppendLiteral("Inventory size: ");
			msg.AppendFormatted(inventory.m_width);
			msg.AppendLiteral("x");
			msg.AppendFormatted(inventory.m_height);
		}
		Logging<Plugin>.Info(msg);
	}

	private static void RestoreScrollPosition()
	{
		Logging<Plugin>.Info("Restore scroll position");
		if (TryGetCurrentGroup(out var group))
		{
			_craftingGrid.ScrollRect.verticalNormalizedPosition = ScrollPositions[group];
		}
	}

	public static void Shutdown()
	{
		//IL_0028: Unknown result type (might be due to invalid IL or missing references)
		if (Object.op_Implicit((Object)(object)_craftingGrid))
		{
			if (Object.op_Implicit((Object)(object)InventoryGui.instance))
			{
				InventoryGui.instance.m_itemCraftType.rectTransform.anchoredPosition = _craftTypeTextOrigPos;
			}
			ActivateOnCopy.Shutdown();
			Object.Destroy((Object)(object)((Component)_craftingGrid).gameObject);
			ResetInfoPanel_KBM();
		}
	}

	private static bool ShowCraftingGrid(bool show)
	{
		if (Object.op_Implicit((Object)(object)_itemInfoTooltip_KBM))
		{
			_itemInfoTooltip_KBM.SetActive(show);
		}
		if (show == ((Behaviour)_craftingGrid).isActiveAndEnabled)
		{
			return show;
		}
		Logging<Plugin>.InterpolatedString msg = new Logging<Plugin>.InterpolatedString(24, 1, out var shouldAppend);
		if (shouldAppend)
		{
			msg.AppendLiteral("Show the crafting grid: ");
			msg.AppendFormatted(show);
		}
		Logging<Plugin>.Info(msg);
		((Component)_craftingGrid).gameObject.SetActive(show);
		ShowVanillaUI(!show);
		return show;
	}

	private static void ShowVanillaUI(bool isVanilla)
	{
		Logging<Plugin>.InterpolatedString msg = new Logging<Plugin>.InterpolatedString(41, 1, out var shouldAppend);
		if (shouldAppend)
		{
			msg.AppendLiteral("Show vanilla crafting panel UI elements: ");
			msg.AppendFormatted(isVanilla);
		}
		Logging<Plugin>.Info(msg);
		InventoryGui instance = InventoryGui.instance;
		((Component)instance.m_recipeDecription).gameObject.SetActive(isVanilla);
		((Component)instance.m_recipeIcon).gameObject.SetActive(isVanilla);
		((Component)instance.m_recipeName).gameObject.SetActive(isVanilla);
		((Behaviour)((Component)_rightPanel).GetComponent<Image>()).enabled = isVanilla;
		OtherModUI.Show((Transform)(object)_rightPanel, isVanilla);
	}

	private static void ClearLeftPanel()
	{
		//IL_0023: Unknown result type (might be due to invalid IL or missing references)
		Logging<Plugin>.Info("Clear left panel");
		foreach (Transform item in (Transform)InventoryGui.instance.m_recipeListRoot)
		{
			Object.Destroy((Object)(object)((Component)item).gameObject);
		}
		_isLeftPanelDirty = false;
	}

	private static void UpdateCraftingGroupsUI()
	{
		//IL_008d: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a1: Unknown result type (might be due to invalid IL or missing references)
		//IL_016b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0175: Expected Obj, but got Unknown
		InventoryGui instance = InventoryGui.instance;
		_isLeftPanelDirty = true;
		UpdateGroupListSizeRect(ActiveGroups.Count);
		foreach (var item2 in ActiveGroups.WithIndex())
		{
			CraftGroup group = item2.Item;
			int item = item2.Index;
			GameObject val = Object.Instantiate<GameObject>(instance.m_recipeElementPrefab, (Transform)(object)instance.m_recipeListRoot);
			val.SetActive(true);
			((Object)val).name = group.ToString();
			((RectTransform)val.transform).anchoredPosition = new Vector2(0f, (float)item * (0f - instance.m_recipeListSpace));
			((Component)val.transform.Find("name")).GetComponent<TMP_Text>().text = $"$CraftGroup_{group}".Localize();
			((Component)val.transform.Find("icon")).GetComponent<Image>().sprite = CraftGroups[group].Icon;
			((Component)val.transform.Find("Durability")).gameObject.SetActive(false);
			Transform val2 = val.transform.Find("QualityLevel");
			((Component)val2).GetComponent<TMP_Text>().text = "";
			((Component)val2).gameObject.SetActive(false);
			((UnityEvent)val.GetComponent<Button>().onClick).AddListener((UnityAction)(() =>
			{
				ApplySoundFx();
				SelectGroup(group);
			}));
			((Component)val.transform.Find("selected")).gameObject.SetActive(((Object)val).name == _currentGroup.ToString());
		}
	}

	private static void UpdateGroupListSizeRect(int count)
	{
		InventoryGui instance = InventoryGui.instance;
		instance.m_recipeListRoot.SetSizeWithCurrentAnchors((Axis)1, Mathf.Max(instance.m_recipeListBaseSize, (float)count * instance.m_recipeListSpace));
	}

	private static IEnumerable<RecipeDataPair> SortCraftRecipes(this IEnumerable<RecipeDataPair> recipes)
	{
		Logging<Plugin>.Info("Sort crafting group recipes");
		return recipes.OrderByDescending(IsCraftable).ThenBy(IsRealOrCast).ThenBy(CraftGroupOrder)
			.ThenBy(SkillTypeOrder)
			.ThenBy(AttackAnimationOrder)
			.ThenBy(ItemTypeOrder)
			.ThenBy(AmmoTypeOrder)
			.ThenBy(DamageOrder)
			.ThenBy(ArmorOrder)
			.ThenBy(ShieldOrder)
			.ThenBy(FoodOrder)
			.ThenBy((RecipeDataPair data) => data.Recipe.m_item.m_itemData.m_shared.m_consumeStatusEffect?.m_category)
			.ThenBy((RecipeDataPair data) => data.Recipe.m_item.m_itemData.m_shared.m_attackStatusEffect?.m_category)
			.ThenBy((RecipeDataPair data) => data.Recipe.m_item.m_itemData.m_shared.m_equipStatusEffect?.m_category)
			.ThenBy(StationOrder)
			.ThenBy(NameOrder)
			.ThenBy(DebugLog);
		static string AmmoTypeOrder(RecipeDataPair recipeData)
		{
			//IL_0000: Unknown result type (might be due to invalid IL or missing references)
			if (!recipeData.IsInGroups(CraftGroup.Ammo))
			{
				return string.Empty;
			}
			return recipeData.Recipe.m_item.m_itemData.m_shared.m_ammoType;
		}
		static float ArmorOrder(RecipeDataPair recipeData)
		{
			//IL_0000: Unknown result type (might be due to invalid IL or missing references)
			if (!recipeData.IsInGroups(CraftGroup.Armor))
			{
				return 0f;
			}
			return recipeData.Recipe.m_item.m_itemData.GetArmor();
		}
		static string AttackAnimationOrder(RecipeDataPair recipeData)
		{
			//IL_0000: Unknown result type (might be due to invalid IL or missing references)
			//IL_0053: Unknown result type (might be due to invalid IL or missing references)
			//IL_0058: Unknown result type (might be due to invalid IL or missing references)
			//IL_0059: Unknown result type (might be due to invalid IL or missing references)
			//IL_005b: Invalid comparison between Unknown and I4
			//IL_005d: Unknown result type (might be due to invalid IL or missing references)
			//IL_005f: Invalid comparison between Unknown and I4
			if (!recipeData.IsInGroups(CraftGroup.Weapons, CraftGroup.Magic))
			{
				return string.Empty;
			}
			string attackAnimation = recipeData.Recipe.m_item.m_itemData.m_shared.m_attack.m_attackAnimation;
			SkillType skillType = recipeData.Recipe.m_item.m_itemData.m_shared.m_skillType;
			string text;
			if ((int)skillType != 1)
			{
				if ((int)skillType != 2 || attackAnimation == "knife_stab" || attackAnimation == "dual_knives")
				{
					goto IL_00a7;
				}
				text = "knife_stab";
			}
			else
			{
				if (attackAnimation == "swing_longsword" || attackAnimation == "greatsword")
				{
					goto IL_00a7;
				}
				text = "swing_longsword";
			}
			goto IL_00a9;
			IL_00a9:
			attackAnimation = text;
			int num = attackAnimation switch
			{
				"knife_stab" => 1, 
				"dual_knives" => 2, 
				"swing_longsword" => 3, 
				"greatsword" => 4, 
				_ => 0, 
			};
			if (num <= 0)
			{
				return attackAnimation;
			}
			return num.ToString("00");
			IL_00a7:
			text = attackAnimation;
			goto IL_00a9;
		}
		static CraftGroup CraftGroupOrder(RecipeDataPair recipeData)
		{
			return RecipeToGroups[recipeData.Recipe].First((CraftGroup g) => g != CraftGroup.Everything);
		}
		static (float, float, int) DamageOrder(RecipeDataPair recipeData)
		{
			//IL_003e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0043: Unknown result type (might be due to invalid IL or missing references)
			//IL_0053: Unknown result type (might be due to invalid IL or missing references)
			//IL_0059: Unknown result type (might be due to invalid IL or missing references)
			//IL_001a: Unknown result type (might be due to invalid IL or missing references)
			ItemData itemData = recipeData.Recipe.m_item.m_itemData;
			if (!itemData.IsWeapon() && !recipeData.IsInGroups(CraftGroup.Ammo))
			{
				return (0f, 0f, 0);
			}
			DamageTypes damage = itemData.GetDamage();
			float totalPhysicalDamage = damage.GetTotalPhysicalDamage();
			float totalElementalDamage = damage.GetTotalElementalDamage();
			float item = damage.m_spirit + damage.m_poison;
			int minStationLevel = recipeData.Recipe.m_minStationLevel;
			return (totalPhysicalDamage + totalElementalDamage, item, minStationLevel);
		}
		static int DebugLog(RecipeDataPair recipeData)
		{
			_ = Logging<Plugin>.IsEnabled;
			return 0;
		}
		static (FoodPanel.FoodType, float) FoodOrder(RecipeDataPair recipeData)
		{
			//IL_0000: Unknown result type (might be due to invalid IL or missing references)
			if (!recipeData.IsInGroups(CraftGroup.Food))
			{
				return (FoodPanel.FoodType.Default, 0f);
			}
			ItemData itemData = recipeData.Recipe.m_item.m_itemData;
			FoodPanel.FoodType foodType = itemData.GetFoodType();
			float item = itemData.m_shared.m_food + itemData.m_shared.m_foodStamina + itemData.m_shared.m_foodEitr;
			return (foodType, item);
		}
		static bool IsCraftable(RecipeDataPair recipeData)
		{
			if (recipeData.CanCraft && Configs.CraftPanelSortCraftable.Value)
			{
				return !IsNoCraftCost;
			}
			return false;
		}
		static bool IsRealOrCast(RecipeDataPair recipeData)
		{
			ItemData itemData = recipeData.Recipe.m_item.m_itemData;
			if (Object.op_Implicit((Object)(object)itemData.m_shared.m_appendToolTip))
			{
				return itemData.m_shared.m_appendToolTip.m_itemData.IsEquipable();
			}
			return false;
		}
		static ItemType ItemTypeOrder(RecipeDataPair recipeData)
		{
			//IL_0011: Unknown result type (might be due to invalid IL or missing references)
			return recipeData.Recipe.m_item.m_itemData.GetItemType();
		}
		static (string, int) NameOrder(RecipeDataPair recipeData)
		{
			string item = recipeData.Recipe.m_item.m_itemData.GetName().Localize();
			int amount = recipeData.Recipe.m_amount;
			return (item, amount);
		}
		static (bool, float, float, float) ShieldOrder(RecipeDataPair recipeData)
		{
			//IL_0000: Unknown result type (might be due to invalid IL or missing references)
			if (!recipeData.IsInGroups(CraftGroup.Shields, CraftGroup.Weapons, CraftGroup.Magic))
			{
				return (false, 0f, 0f, 0f);
			}
			ItemData itemData = recipeData.Recipe.m_item.m_itemData;
			float deflectionForce = itemData.GetDeflectionForce();
			float baseBlockPower = itemData.GetBaseBlockPower();
			float timedBlockBonus = itemData.m_shared.m_timedBlockBonus;
			return (timedBlockBonus == 0f, 0f - timedBlockBonus, baseBlockPower, deflectionForce);
		}
		static float SkillTypeOrder(RecipeDataPair recipeData)
		{
			//IL_0000: Unknown result type (might be due to invalid IL or missing references)
			//IL_002e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0033: Unknown result type (might be due to invalid IL or missing references)
			//IL_0034: Unknown result type (might be due to invalid IL or missing references)
			//IL_0036: Invalid comparison between Unknown and I4
			//IL_0038: Unknown result type (might be due to invalid IL or missing references)
			//IL_003b: Invalid comparison between Unknown and I4
			//IL_003d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0040: Invalid comparison between Unknown and I4
			//IL_005c: Unknown result type (might be due to invalid IL or missing references)
			if (recipeData.IsInGroups(CraftGroup.Ammo))
			{
				return 0f;
			}
			SkillType skillType = recipeData.Recipe.m_item.m_itemData.m_shared.m_skillType;
			if ((int)skillType == 2)
			{
				return 0.9f;
			}
			if ((int)skillType == 11)
			{
				return 0.5f;
			}
			if ((int)skillType == 14)
			{
				return 8.1f;
			}
			return (float)skillType;
		}
		static string StationOrder(RecipeDataPair recipeData)
		{
			CraftingStation craftingStation = recipeData.Recipe.m_craftingStation;
			return ((craftingStation != null) ? craftingStation.GetHoverName() : null) ?? string.Empty;
		}
	}

	private static void SelectGroup(CraftGroup? group)
	{
		//IL_007f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0086: Expected Obj, but got Unknown
		Logging<Plugin>.InterpolatedString msg = new Logging<Plugin>.InterpolatedString(16, 1, out var shouldAppend);
		if (shouldAppend)
		{
			msg.AppendLiteral("Selected group: ");
			msg.AppendFormatted(group);
		}
		Logging<Plugin>.Info(msg);
		_isGroupChanged = _currentGroup != group;
		_currentGroup = group;
		UpdateGridData();
		foreach (Transform item in (Transform)InventoryGui.instance.m_recipeListRoot)
		{
			Transform val = item;
			((Component)val.Find("selected")).gameObject.SetActive(((Object)val).name == group.ToString());
		}
	}

	internal static bool IsSelectedItem(ItemData item)
	{
		//IL_002b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0030: Unknown result type (might be due to invalid IL or missing references)
		InventoryGui instance = InventoryGui.instance;
		if (!Object.op_Implicit((Object)(object)instance.m_selectedRecipe.Recipe))
		{
			return false;
		}
		Recipe recipe = instance.m_selectedRecipe.Recipe;
		RecipeDataPair val = ItemRecipeData[item];
		if ((Object)(object)recipe == (Object)(object)val.Recipe)
		{
			return instance.m_selectedVariant == item.m_variant;
		}
		return false;
	}

	internal static void SelectItem(ItemData? item)
	{
		SelectItem(item, allowDeselect: true);
	}

	internal static void SelectItem(ItemData? item, bool allowDeselect)
	{
		//IL_006c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0072: Unknown result type (might be due to invalid IL or missing references)
		//IL_0063: Unknown result type (might be due to invalid IL or missing references)
		//IL_0073: Unknown result type (might be due to invalid IL or missing references)
		if (allowDeselect && !ZInput.IsGamepadActive() && item != null && IsSame(item))
		{
			item = null;
		}
		Logging<Plugin>.InterpolatedString msg = new Logging<Plugin>.InterpolatedString(15, 1, out var shouldAppend);
		if (shouldAppend)
		{
			msg.AppendLiteral("Selected Item: ");
			msg.AppendFormatted(item?.GetPrefabName() ?? "(none)");
		}
		Logging<Plugin>.Info(msg);
		InventoryGui.instance.m_selectedRecipe = ((item == null) ? default(RecipeDataPair) : ItemRecipeData[item]);
		InventoryGui.instance.m_selectedVariant = item?.m_variant ?? 0;
		_selectedItem = item;
		static bool IsSame(ItemData? itm)
		{
			//IL_0025: Unknown result type (might be due to invalid IL or missing references)
			//IL_002a: Unknown result type (might be due to invalid IL or missing references)
			if (itm == null)
			{
				return false;
			}
			Recipe recipe = InventoryGui.instance.m_selectedRecipe.Recipe;
			int selectedVariant = InventoryGui.instance.m_selectedVariant;
			RecipeDataPair val = ItemRecipeData[itm];
			if ((Object)(object)recipe == (Object)(object)val.Recipe)
			{
				return selectedVariant == itm.m_variant;
			}
			return false;
		}
	}

	private static void UpdateSelectedItemInfo_KBM(ItemData? item)
	{
		//IL_00f3: Unknown result type (might be due to invalid IL or missing references)
		//IL_00f8: Unknown result type (might be due to invalid IL or missing references)
		//IL_0116: Unknown result type (might be due to invalid IL or missing references)
		//IL_011d: Expected Obj, but got Unknown
		//IL_0137: Unknown result type (might be due to invalid IL or missing references)
		//IL_01d0: Unknown result type (might be due to invalid IL or missing references)
		if (!Object.op_Implicit((Object)(object)Player.m_localPlayer) || item == null)
		{
			ResetInfoPanel_KBM();
			return;
		}
		bool inCraftingStation = Player.m_localPlayer.m_inCraftingStation;
		bool flag = !inCraftingStation || (inCraftingStation && Object.op_Implicit((Object)(object)_itemInfoTooltip_KBM));
		(ItemData, bool, bool) tuple = (item, TooltipSummary.IsDetailMode(), IsMulticraftPressed);
		var (val, flag2, flag3) = tuple;
		var (val2, flag4, shouldAppend) = _itemStateLastSelected_KBM;
		if ((val == val2 && flag2 == flag4 && flag3 == shouldAppend) & flag)
		{
			return;
		}
		_itemStateLastSelected_KBM = tuple;
		if (InventoryGui.instance.m_shownFrames > 1 && !Object.op_Implicit((Object)(object)_itemInfoTooltip_KBM))
		{
			_itemInfoTooltip_KBM = Object.Instantiate<GameObject>(TooltipFormat.TooltipPrefab, (Transform)(object)((InventoryGrid)_craftingGrid).m_tooltipAnchor);
			((Object)_itemInfoTooltip_KBM).name = "ZenUI_ItemInfoTooltip_KBM";
			_itemInfoTooltip_KBM.transform.localPosition = Vector2.op_Implicit(Configs.CraftPanelInfoPosition.Value);
			RectTransform val3 = (RectTransform)_itemInfoTooltip_KBM.transform.Find("Bkg");
			if (Object.op_Implicit((Object)(object)val3))
			{
				((Component)val3).gameObject.AddOutline(4f, UIColor.ValheimTooltipTitle);
				((Graphic)((Component)val3).gameObject.GetComponent<Image>()).material = UI.Materials.LitPanel;
			}
			else
			{
				Logging<Plugin>.Error("Could not setup tooltip Bkg node", 0);
			}
		}
		if (!Object.op_Implicit((Object)(object)_itemInfoTooltip_KBM))
		{
			return;
		}
		Logging<Plugin>.InterpolatedString msg = new Logging<Plugin>.InterpolatedString(38, 1, out shouldAppend);
		if (shouldAppend)
		{
			msg.AppendLiteral("Update selected item info UI element: ");
			msg.AppendFormatted(item.GetName());
		}
		Logging<Plugin>.Info(msg);
		Transform val4 = _itemInfoTooltip_KBM.transform.Find("Bkg/Text");
		TMP_Text val5 = default;
		if (Object.op_Implicit((Object)(object)val4) && ((Component)val4).TryGetComponent<TMP_Text>(ref val5))
		{
			InventoryElement elementAt = _craftingGrid.GetElementAt(item.m_gridPos);
			if (Object.op_Implicit((Object)(object)elementAt))
			{
				val5.text = elementAt.m_tooltip.GetDynamic().Localize();
			}
		}
		else
		{
			Logging<Plugin>.Error("Unable to set tooltip body text", 0);
		}
		Transform val6 = _itemInfoTooltip_KBM.transform.Find("Bkg/Topic");
		TMP_Text val7 = default;
		if (Object.op_Implicit((Object)(object)val6) && ((Component)val6).TryGetComponent<TMP_Text>(ref val7))
		{
			val7.text = item.GetName().Localize();
		}
		else
		{
			Logging<Plugin>.Error("Unable to set tooltip topic text", 0);
		}
	}

	internal static void ApplySoundFx()
	{
		//IL_0014: Unknown result type (might be due to invalid IL or missing references)
		//IL_0019: Unknown result type (might be due to invalid IL or missing references)
		//IL_0027: Unknown result type (might be due to invalid IL or missing references)
		//IL_002d: Unknown result type (might be due to invalid IL or missing references)
		InventoryGui.instance.m_moveItemEffects.Create(((Component)InventoryGui.instance).transform.position, Quaternion.identity, (Transform)null, 1f, -1, default(ZDOID));
	}

	[HarmonyPrefix]
	[HarmonyPatch(typeof(Game), "Start")]
	internal static void Game_Start()
	{
		if (Configs.CraftPanelEnabled.Value)
		{
			InitPanel();
		}
	}

	[HarmonyPrefix]
	[HarmonyPatch(typeof(InventoryGui), "OnDestroy")]
	private static void InventoryGui_OnDestroy(InventoryGui __instance)
	{
		if (Configs.CraftPanelEnabled.Value)
		{
			Shutdown();
		}
	}

	[HarmonyPrefix]
	[HarmonyPatch(typeof(InventoryGui), "AddRecipeToList")]
	private static void InventoryGui_AddRecipeToList(InventoryGui __instance, Recipe recipe, ItemData item, bool canCraft, ref bool __runOriginal)
	{
		//IL_0020: Unknown result type (might be due to invalid IL or missing references)
		//IL_002b: Unknown result type (might be due to invalid IL or missing references)
		if (Configs.CraftPanelEnabled.Value && __instance.InCraftTab())
		{
			__runOriginal = false;
			RecipeDataPair item2 = new RecipeDataPair(recipe, item, (GameObject)null, canCraft);
			__instance.m_availableRecipes.Add(item2);
		}
	}

	internal static void UpdateRecipeList()
	{
		Stopwatch.Restart();
		Logging<Plugin>.Info("Update Recipe List");
		ClearLeftPanel();
		SelectDefaultGroup();
		UpdateCraftingGroupsUI();
		Logging<Plugin>.InterpolatedString msg = new Logging<Plugin>.InterpolatedString(8, 1, out var shouldAppend);
		if (shouldAppend)
		{
			msg.AppendLiteral("Time: ");
			msg.AppendFormatted(Stopwatch.ElapsedMilliseconds);
			msg.AppendLiteral("ms");
		}
		Logging<Plugin>.Info(msg);
	}

	private static void SelectDefaultGroup()
	{
		if (ActiveGroups.Count == 0)
		{
			SelectGroup(null);
		}
		else if (IsStationChanged || (!_currentGroup.HasValue && ActiveGroups.Count > 0))
		{
			SelectGroup(ActiveGroups.First());
		}
		else
		{
			SelectGroup(_currentGroup);
		}
	}

	private static bool FocusOn(ItemData? item)
	{
		if (!InCurrentGroup(item))
		{
			return false;
		}
		_craftingGrid.CenterOn(item);
		return true;
	}

	[HarmonyPrefix]
	[HarmonyPatch(typeof(InventoryGui), "Update")]
	private static void InventoryGui_Update(InventoryGui __instance)
	{
		if (Configs.CraftPanelEnabled.Value && Object.op_Implicit((Object)(object)_craftingGrid) && InventoryGui.IsVisible() && ShowCraftingGrid(__instance.InCraftTab()))
		{
			UpdateGamepad();
			_craftingGrid.UpdateGui(_selectedItem);
			UpdateScrollPosition();
			if (!ZInput.IsGamepadActive())
			{
				UpdateSelectedItemInfo_KBM(_selectedItem);
			}
			_isGroupChanged = false;
			_currentStation = (Object.op_Implicit((Object)(object)Player.m_localPlayer) ? Player.m_localPlayer.GetCurrentCraftingStation() : null);
		}
	}

	private static void UpdateScrollPosition()
	{
		bool isStationChanged = IsStationChanged;
		if ((_isGroupChanged | isStationChanged) && !FocusOn(_selectedItem))
		{
			SelectItem(null);
			if (isStationChanged)
			{
				ResetScrollCache();
			}
			RestoreScrollPosition();
		}
	}

	[HarmonyPrefix]
	[HarmonyPatch(typeof(InventoryGui), "SetRecipe")]
	private static void InventoryGui_SetRecipe(InventoryGui __instance, ref bool __runOriginal)
	{
		//IL_0029: Unknown result type (might be due to invalid IL or missing references)
		//IL_002e: Unknown result type (might be due to invalid IL or missing references)
		if (Configs.CraftPanelEnabled.Value && __runOriginal)
		{
			bool flag = true;
			if (__instance.m_availableRecipes.Count > 0)
			{
				RecipeDataPair val = __instance.m_availableRecipes[0];
				flag = Object.op_Implicit((Object)(object)val.InterfaceElement);
			}
			__runOriginal = flag;
		}
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(Player), "ToggleNoPlacementCost")]
	private static void Player_ToggleNoPlacementCost(Player __instance)
	{
		if (Configs.CraftPanelEnabled.Value)
		{
			ForceRefresh();
		}
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(Player), "ResetCharacterKnownItems")]
	private static void Player_ResetCharacterKnownItems(Player __instance)
	{
		if (Configs.CraftPanelEnabled.Value)
		{
			ForceRefresh();
		}
	}

	[HarmonyPrefix]
	[HarmonyPatch(typeof(InventoryGui), "Awake")]
	[HarmonyPriority(800)]
	private static void InventoryGui_Awake(InventoryGui __instance)
	{
		if (Configs.CraftPanelEnabled.Value)
		{
			ActivateOnCopy.Register((MonoBehaviour)(object)__instance.m_recipeDecription);
			ActivateOnCopy.Register((MonoBehaviour)(object)__instance.m_recipeIcon);
			ActivateOnCopy.Register((MonoBehaviour)(object)__instance.m_recipeName);
			SetRepairPanelPosition(__instance);
		}
	}

	[HarmonyPrefix]
	[HarmonyPatch(typeof(InventoryGrid), "CreateItemTooltip")]
	private static void InventoryGrid_CreateItemTooltip(InventoryGrid __instance, ItemData item, UITooltip tooltip, ref bool __runOriginal)
	{
		//IL_002a: Unknown result type (might be due to invalid IL or missing references)
		//IL_002f: Unknown result type (might be due to invalid IL or missing references)
		//IL_008d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0093: Unknown result type (might be due to invalid IL or missing references)
		if (!Configs.CraftPanelEnabled.Value || (Object)(object)__instance != (Object)(object)_craftingGrid)
		{
			return;
		}
		__runOriginal = false;
		string text = string.Empty;
		RecipeDataPair val = ItemRecipeData[item];
		if (val.Recipe.m_requireOnlyOneIngredient)
		{
			item.SetTooltipExtra("$inventory_onlyoneingredient");
			if (item.GetTooltipExtra() == "$inventory_onlyoneingredient")
			{
				text = $"\n\n<color={UIColor.ValheimTooltipTitle}><align=center>$inventory_onlyoneingredient</align></color>".Localize();
			}
		}
		tooltip.Set(item.GetName(), item.GetTooltipCrafting() + text, __instance.m_tooltipAnchor, default(Vector2));
	}

	[HarmonyTranspiler]
	[HarmonyPatch(typeof(InventoryGui), "SetupRequirement")]
	private static IEnumerable<CodeInstruction> InventoryGui_SetupRequirement(IEnumerable<CodeInstruction> codes)
	{
		//IL_0027: Unknown result type (might be due to invalid IL or missing references)
		//IL_002d: Expected Obj, but got Unknown
		//IL_0058: Unknown result type (might be due to invalid IL or missing references)
		//IL_005e: Expected Obj, but got Unknown
		//IL_0066: Unknown result type (might be due to invalid IL or missing references)
		//IL_006c: Expected Obj, but got Unknown
		//IL_0074: Unknown result type (might be due to invalid IL or missing references)
		//IL_007a: Expected Obj, but got Unknown
		//IL_0087: Unknown result type (might be due to invalid IL or missing references)
		//IL_008d: Expected Obj, but got Unknown
		//IL_009a: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a0: Expected Obj, but got Unknown
		//IL_00a3: Unknown result type (might be due to invalid IL or missing references)
		CodeMatch[] array = new CodeMatch[1]
		{
			new CodeMatch((OpCode?)OpCodes.Stfld, (object)AccessTools.DeclaredField(typeof(UITooltip), "m_text"), (string)null)
		};
		Action<UITooltip, Transform, Requirement, int> action = MakeTooltip;
		CodeInstruction[] array2 = new CodeInstruction[5]
		{
			new CodeInstruction(OpCodes.Ldloc_3, (object)null),
			new CodeInstruction(OpCodes.Ldloc_0, (object)null),
			new CodeInstruction(OpCodes.Ldarg_1, (object)null),
			new CodeInstruction(OpCodes.Ldarg_S, (object)(byte)5),
			new CodeInstruction(OpCodes.Call, (object)action.Method)
		};
		return new CodeMatcher(codes, (ILGenerator)null).MatchEndForward(array).ThrowIfInvalid("Unable to match IL sequence").Advance(1)
			.Insert(array2)
			.InstructionEnumeration();
		static void MakeTooltip(UITooltip tooltip, Transform elementRoot, Requirement req, int craftMultiplier)
		{
			//IL_0061: Unknown result type (might be due to invalid IL or missing references)
			//IL_0067: Unknown result type (might be due to invalid IL or missing references)
			if (Configs.CraftPanelTooltipReq.Value)
			{
				tooltip.m_tooltipPrefab = TooltipFormat.TooltipPrefab;
				if (tooltip.IsLastStateChanged() && Object.op_Implicit((Object)(object)req.m_resItem))
				{
					ItemData itemData = req.m_resItem.m_itemData;
					int amount = req.m_amount * craftMultiplier;
					TooltipDataItem tooltipDataItem = new TooltipDataItem(itemData, isCraftPanel: true, amount);
					tooltip.Set(itemData.GetName(), tooltipDataItem.Detail(), (RectTransform)(object)((elementRoot is RectTransform) ? elementRoot : null), default(Vector2));
					tooltip.SetData(tooltipDataItem);
				}
			}
		}
	}

	[HarmonyTranspiler]
	[HarmonyPatch(typeof(Player), "GetAvailableRecipes")]
	private static IEnumerable<CodeInstruction> Player_GetAvailableRecipes(IEnumerable<CodeInstruction> codes)
	{
		MethodInfo methodInfo = AccessTools.Method(typeof(Player), "RequiredCraftingStation", (Type[])null, (Type[])null);
		Func<Player, Recipe, int, bool, bool> func = RequiredCraftingStation;
		return Transpilers.MethodReplacer(codes, (MethodBase)methodInfo, (MethodBase)func.Method);
		static bool RequiredCraftingStation(Player player, Recipe recipe, int qualityLevel, bool checkLevel)
		{
			if (!Configs.CraftPanelShowAnyKnownStation.Value || Object.op_Implicit((Object)(object)player.GetCurrentCraftingStation()))
			{
				return player.RequiredCraftingStation(recipe, qualityLevel, checkLevel);
			}
			if (!Object.op_Implicit((Object)(object)recipe.GetRequiredStation(qualityLevel)))
			{
				return true;
			}
			if (!checkLevel)
			{
				return true;
			}
			if (player.m_currentStation.GetLevel(true) < recipe.GetRequiredStationLevel(qualityLevel))
			{
				return false;
			}
			return true;
		}
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(InventoryGui), "UpdateRecipe")]
	private static void InventoryGui_UpdateRecipe(InventoryGui __instance)
	{
		//IL_0050: Unknown result type (might be due to invalid IL or missing references)
		//IL_0055: Unknown result type (might be due to invalid IL or missing references)
		//IL_005e: Unknown result type (might be due to invalid IL or missing references)
		if (Configs.CraftPanelShowAnyKnownStation.Value)
		{
			ShowAnyKnownStation(__instance);
		}
		if (Configs.CraftPanelEnabled.Value)
		{
			((Component)__instance.m_variantButton).gameObject.SetActive(false);
			float y = (__instance.InCraftTab() ? (-150f) : 20f);
			RectTransform rectTransform = __instance.m_itemCraftType.rectTransform;
			Vector2 craftTypeTextOrigPos = _craftTypeTextOrigPos;
			craftTypeTextOrigPos.y = y;
			rectTransform.anchoredPosition = craftTypeTextOrigPos;
			if (__instance.InCraftTab())
			{
				string s = (IsMulticraftPressed ? $"$inventory_craftbutton x {__instance.m_multiCraftAmount}" : "$inventory_craftbutton");
				CraftButtonLabel.text = s.Localize();
			}
		}
	}

	private static void ShowAnyKnownStation(InventoryGui gui)
	{
		if (Object.op_Implicit((Object)(object)Player.m_localPlayer.GetCurrentCraftingStation()))
		{
			gui.m_craftingStationIcon.overrideSprite = null;
			((Component)gui.m_craftingStationIcon).gameObject.SetActive(true);
			return;
		}
		Recipe recipe = gui.m_selectedRecipe.Recipe;
		CraftingStation val = recipe?.m_craftingStation;
		gui.m_craftingStationIcon.overrideSprite = val?.m_icon;
		((Component)gui.m_craftingStationIcon).gameObject.SetActive(Object.op_Implicit((Object)(object)val));
		string text = recipe?.m_item.GetName().Localize();
		string arg = ((val != null) ? val.GetHoverName().Localize() : null) ?? "$inventory_crafting".Localize();
		TMP_Text craftingStationName = gui.m_craftingStationName;
		if (text != null)
		{
			craftingStationName.text = $"{text}\n<size=24><color={UIColor.Gray}>{arg}</color></size>";
		}
	}

	[HarmonyPrefix]
	[HarmonyPatch(typeof(InventoryGui), "OnTabCraftPressed")]
	private static void InventoryGui_OnTabCraftPressed(InventoryGui __instance)
	{
		SelectItem(_selectedItem, allowDeselect: false);
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(InventoryGui), "Hide")]
	private static void InventoryGui_Hide(InventoryGui __instance)
	{
		ResetInfoPanel_KBM();
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(InventoryGui), "Show")]
	private static void InventoryGui_Show(InventoryGui __instance)
	{
		if (Configs.NoSlideAnimation.Value)
		{
			__instance.UpdateContainer(Player.m_localPlayer);
			__instance.UpdateRecipe(Player.m_localPlayer, Time.deltaTime);
			__instance.UpdateRepair();
			if (!IsStationChanged)
			{
				FocusOn(_selectedItem);
			}
		}
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(UITooltip), "OnHoverStart")]
	private static void UITooltip_OnHoverStart()
	{
		GameObject tooltip = UITooltip.m_tooltip;
		if (Object.op_Implicit((Object)(object)tooltip) && Object.op_Implicit((Object)(object)_craftingGrid) && (Object)(object)tooltip.transform.parent == (Object)(object)((Component)_craftingGrid).transform)
		{
			tooltip.transform.SetParent(((Component)InventoryGui.instance).transform);
		}
	}
}
