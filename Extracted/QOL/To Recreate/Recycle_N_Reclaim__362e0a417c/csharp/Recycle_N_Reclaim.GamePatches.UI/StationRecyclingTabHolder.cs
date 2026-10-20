using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using Auga;
using EpicLootAPI;
using Recycle_N_Reclaim.GamePatches.Recycling;
using Recycle_N_Reclaim.YAMLStuff;
using TMPro;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.UI;

namespace Recycle_N_Reclaim.GamePatches.UI;

[_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(1)]
[_003Cc6ee30b4_002D1fc8_002D48a6_002Db646_002D32a3d54a7999_003ENullable(0)]
public class StationRecyclingTabHolder : MonoBehaviour
{
	private GameObject _recyclingTabButtonGameObject;

	private Button _recyclingTabButtonComponent;

	private List<RecyclingAnalysisContext> _recyclingAnalysisContexts = new List<RecyclingAnalysisContext>();

	private int _lastInventoryHash;

	private WorkbenchTabData _augaTabData;

	private GameObject _itemInfoGo;

	private GameObject _descriptionBoxGo;

	private void Start()
	{
		((MonoBehaviour)this).InvokeRepeating("EnsureRecyclingTabExists", 5f, 5f);
	}

	private void EnsureRecyclingTabExists()
	{
		if (!((Object)(object)InventoryGui.instance == (Object)null) && (Object)(object)_recyclingTabButtonComponent == (Object)null)
		{
			SetupTabButton();
		}
	}

	private void OnDestroy()
	{
		try
		{
			Object.Destroy((Object)(object)_recyclingTabButtonGameObject.gameObject);
		}
		catch
		{
		}
	}

	private void SetupTabButton()
	{
		//IL_016a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0171: Unknown result type (might be due to invalid IL or missing references)
		//IL_01d0: Unknown result type (might be due to invalid IL or missing references)
		//IL_01fd: Unknown result type (might be due to invalid IL or missing references)
		//IL_0207: Expected Obj, but got Unknown
		//IL_0219: Unknown result type (might be due to invalid IL or missing references)
		//IL_0223: Expected Obj, but got Unknown
		//IL_005f: Unknown result type (might be due to invalid IL or missing references)
		//IL_006e: Unknown result type (might be due to invalid IL or missing references)
		if ((Object)(object)Player.m_localPlayer == (Object)null)
		{
			return;
		}
		Recycle_N_ReclaimPlugin.Recycle_N_ReclaimLogger.LogDebug((object)"Creating Workbench Tab");
		if (Recycle_N_ReclaimPlugin.HasAuga)
		{
			if (!API.Workbench_HasWorkbenchTab("Reclaim"))
			{
				Texture2D val = Utils.LoadTextureFromResources("RecyclingPanel.png");
				Sprite tabIcon = Sprite.Create(val, new Rect(0f, 0f, (float)((Texture)val).width, (float)((Texture)val).height), new Vector2(0f, 0f), 100f);
				if (Recycle_N_ReclaimPlugin.HasEpicLoot)
				{
					_augaTabData = API.Workbench_AddWorkbenchTab("Reclaim", tabIcon, "Recycle_N_Reclaim".Replace("_", "-"), (int index) =>
					{
						OnRecycleClick();
					});
				}
				else
				{
					_augaTabData = API.Workbench_AddVanillaWorkbenchTab("Reclaim", tabIcon, "Recycle_N_Reclaim".Replace("_", "-"), (int index) =>
					{
						OnRecycleClick();
					});
				}
				_recyclingTabButtonComponent = (_recyclingTabButtonGameObject = _augaTabData.TabButtonGO).GetComponent<Button>();
				_itemInfoGo = _augaTabData.ItemInfoGO;
				API.ComplexTooltip_AddDivider(_itemInfoGo);
				_descriptionBoxGo = API.ComplexTooltip_AddTwoColumnTextBox(_itemInfoGo);
				API.ComplexTooltip_EnableDescription(_itemInfoGo, enabled: false);
			}
		}
		else
		{
			Transform transform = ((Component)InventoryGui.instance.m_tabUpgrade).transform;
			_recyclingTabButtonGameObject = Object.Instantiate<GameObject>(((Component)InventoryGui.instance.m_tabUpgrade).gameObject, transform.position, transform.rotation, transform.parent);
			((Object)_recyclingTabButtonGameObject).name = "RECLAIM";
			_recyclingTabButtonGameObject.transform.parent.Find("TabBorder").SetAsLastSibling();
			_recyclingTabButtonGameObject.transform.localPosition = new Vector3(-45f, -94f, 0f);
			_recyclingTabButtonComponent = _recyclingTabButtonGameObject.GetComponent<Button>();
			((Selectable)_recyclingTabButtonComponent).interactable = true;
			_recyclingTabButtonComponent.onClick = new ButtonClickedEvent();
			((UnityEvent)_recyclingTabButtonComponent.onClick).AddListener((UnityAction)OnRecycleClick);
			TMP_Text componentInChildren = _recyclingTabButtonGameObject.GetComponentInChildren<TMP_Text>();
			if ((Object)(object)componentInChildren != (Object)null)
			{
				componentInChildren.text = Recycle_N_ReclaimPlugin.Localize("$azumatt_recycle_n_reclaim_reclaim_tab");
			}
		}
		bool active = (Object)(object)Player.m_localPlayer.GetCurrentCraftingStation() != (Object)null;
		_recyclingTabButtonGameObject.SetActive(active);
	}

	private void OnRecycleClick()
	{
		((Selectable)_recyclingTabButtonComponent).interactable = false;
		((Selectable)InventoryGui.instance.m_tabCraft).interactable = true;
		((Selectable)InventoryGui.instance.m_tabUpgrade).interactable = true;
		Recycle_N_ReclaimPlugin.Recycle_N_ReclaimLogger.LogDebug((object)"OnRecycleClick");
		UpdateCraftingPanel();
	}

	public void UpdateCraftingPanel()
	{
		//IL_0090: Unknown result type (might be due to invalid IL or missing references)
		//IL_0095: Unknown result type (might be due to invalid IL or missing references)
		//IL_00d9: Unknown result type (might be due to invalid IL or missing references)
		//IL_00de: Unknown result type (might be due to invalid IL or missing references)
		InventoryGui instance = InventoryGui.instance;
		Player localPlayer = Player.m_localPlayer;
		if ((Object)(object)localPlayer.GetCurrentCraftingStation() == (Object)null && !localPlayer.NoCostCheat())
		{
			((Selectable)instance.m_tabCraft).interactable = false;
			((Selectable)instance.m_tabUpgrade).interactable = true;
			((Component)instance.m_tabUpgrade).gameObject.SetActive(false);
			((Selectable)_recyclingTabButtonComponent).interactable = true;
			((Component)_recyclingTabButtonComponent).gameObject.SetActive(false);
		}
		else
		{
			((Component)instance.m_tabUpgrade).gameObject.SetActive(true);
		}
		UpdateRecyclingList();
		RecipeDataPair val;
		if (instance.m_availableRecipes.Count > 0)
		{
			val = instance.get_m_selectedRecipe();
			if ((Object)(object)val.Recipe != (Object)null)
			{
				instance.SetRecipe(instance.GetSelectedRecipeIndex(false), true);
			}
			else
			{
				instance.SetRecipe(0, true);
			}
		}
		else
		{
			InventoryGui.instance.SetRecipe(-1, true);
		}
		if (Recycle_N_ReclaimPlugin.HasAuga)
		{
			GameObject itemInfoGo = _itemInfoGo;
			val = instance.get_m_selectedRecipe();
			API.ComplexTooltip_SetItem(itemInfoGo, val.ItemData);
		}
	}

	public void UpdateRecyclingList()
	{
		//IL_003e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0043: Unknown result type (might be due to invalid IL or missing references)
		Player localPlayer = Player.m_localPlayer;
		InventoryGui instance = InventoryGui.instance;
		List<RecipeDataPair> list = instance.get_m_recipeList();
		Recycle_N_ReclaimPlugin.Recycle_N_ReclaimLogger.LogDebug((object)$"Old recipe list had {list.Count} entries. Cleaning up");
		foreach (RecipeDataPair item in list)
		{
			RecipeDataPair current = item;
			Object.Destroy((Object)(object)current.InterfaceElement);
		}
		list.Clear();
		_recyclingAnalysisContexts.Clear();
		IEnumerable<RecyclingAnalysisContext> source = from context in Reclaimer.GetRecyclingAnalysisForInventory(((Humanoid)localPlayer).GetInventory(), localPlayer)
			where (Object)(object)context.Recipe != (Object)null && context.DisplayImpediments.Count == 0
			select context;
		_recyclingAnalysisContexts.AddRange(source.Where([_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(0)] (RecyclingAnalysisContext x) => !GroupUtils.IsPrefabExcludedInReclaiming(((Object)x.Item.m_dropPrefab).name)));
		foreach (RecyclingAnalysisContext recyclingAnalysisContext in _recyclingAnalysisContexts)
		{
			if (!((Object)(object)recyclingAnalysisContext.Recipe == (Object)null))
			{
				AddRecipeToList(recyclingAnalysisContext, list);
			}
		}
		Recycle_N_ReclaimPlugin.Recycle_N_ReclaimLogger.LogDebug((object)$"Added {list.Count} entries");
		instance.m_recipeListRoot.SetSizeWithCurrentAnchors((Axis)1, Mathf.Max(instance.get_m_recipeListBaseSize(), (float)list.Count * instance.m_recipeListSpace));
		_lastInventoryHash = ComputeInventoryHash(((Humanoid)localPlayer).GetInventory());
	}

	private void AddRecipeToList(RecyclingAnalysisContext context, List<RecipeDataPair> m_recipeList)
	{
		//IL_0052: Unknown result type (might be due to invalid IL or missing references)
		//IL_006b: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ca: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c3: Unknown result type (might be due to invalid IL or missing references)
		//IL_019e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0183: Unknown result type (might be due to invalid IL or missing references)
		//IL_0270: Unknown result type (might be due to invalid IL or missing references)
		//IL_027a: Expected Obj, but got Unknown
		//IL_032d: Unknown result type (might be due to invalid IL or missing references)
		int count = m_recipeList.Count;
		InventoryGui igui = InventoryGui.instance;
		RectTransform recipeListRoot = igui.m_recipeListRoot;
		GameObject element = Object.Instantiate<GameObject>(igui.m_recipeElementPrefab, (Transform)(object)recipeListRoot);
		element.SetActive(true);
		((RectTransform)element.transform).anchoredPosition = new Vector2(0f, (float)count * (0f - igui.m_recipeListSpace));
		Image component = ((Component)element.transform.Find("icon")).GetComponent<Image>();
		component.sprite = context.Item.GetIcon();
		((Graphic)component).color = (Color)((context.RecyclingImpediments.Count == 0) ? Color.white : new Color(1f, 0f, 1f, 0f));
		if (Recycle_N_ReclaimPlugin.HasEpicLoot && context.RecyclingImpediments.Count == 0)
		{
			EpicLoot.ApplyMagicItemBackgroundToIcon(((Component)component).gameObject, context.Item);
		}
		TMP_Text component2 = ((Component)element.transform.Find("name")).GetComponent<TMP_Text>();
		bool flag = context.RecyclingImpediments.Count > 0;
		string text = Recycle_N_ReclaimPlugin.Localize(ItemDisplayName(context.Item, flag));
		if (context.Item.m_stack > 1 && context.Item.m_shared.m_maxStackSize > 1)
		{
			text = $"{text} x{context.Item.m_stack}";
		}
		component2.text = text;
		((Graphic)component2).color = (Color)(flag ? new Color(0.66f, 0.66f, 0.66f, 1f) : Color.white);
		GuiBar component3 = ((Component)element.transform.Find("Durability")).GetComponent<GuiBar>();
		if (context.Item.m_shared.m_useDurability && (double)context.Item.m_durability < (double)context.Item.GetMaxDurability())
		{
			((Component)component3).gameObject.SetActive(true);
			component3.SetValue(context.Item.GetDurabilityPercentage());
		}
		else
		{
			((Component)component3).gameObject.SetActive(false);
		}
		TMP_Text component4 = ((Component)element.transform.Find("QualityLevel")).GetComponent<TMP_Text>();
		((Component)component4).gameObject.SetActive(true);
		component4.text = context.Item.m_quality.ToString();
		((UnityEvent)element.GetComponent<Button>().onClick).AddListener((UnityAction)(() =>
		{
			igui.OnSelectedRecipe(element);
		}));
		bool globalKey = ZoneSystem.instance.GetGlobalKey((GlobalKeys)25);
		CraftingStation currentCraftingStation = Player.m_localPlayer.GetCurrentCraftingStation();
		bool flag2 = (Object)(object)currentCraftingStation != (Object)null && currentCraftingStation.m_upgrader;
		bool flag3 = (igui.InCraftTab() ? (Player.m_localPlayer.HaveRequirements(context.Recipe, false, 1, 1) | globalKey) : (((context.Item.m_quality < context.Item.m_shared.m_maxQuality) | flag2) && (Player.m_localPlayer.HaveRequirements(context.Recipe, false, context.Item.m_quality + 1, 1) | globalKey)));
		m_recipeList.Add(new RecipeDataPair(context.Recipe, context.Item, element, flag3));
	}

	private static string ItemDisplayName(ItemData item, bool blocked)
	{
		if (!Recycle_N_ReclaimPlugin.HasEpicLoot)
		{
			return item.m_shared.m_name;
		}
		return item.GetDecoratedName(blocked ? "#A8A8A8FF" : null);
	}

	private static int ComputeInventoryHash(Inventory inventory)
	{
		int num = 17;
		foreach (ItemData item in from i in inventory.GetAllItems()
			orderby i.m_shared.m_name, i.m_quality
			select i)
		{
			num = num * 31 + item.m_shared.m_name.GetHashCode();
			num = num * 31 + item.m_quality;
			num = num * 31 + item.m_stack;
			num = num * 31 + (item.m_equipped ? 1 : 0);
		}
		return num;
	}

	public bool HasInventoryChanged(Inventory inventory)
	{
		int num = ComputeInventoryHash(inventory);
		if (num == _lastInventoryHash)
		{
			return false;
		}
		_lastInventoryHash = num;
		return true;
	}

	public bool InRecycleTab()
	{
		if ((Object)(object)_recyclingTabButtonComponent == (Object)null)
		{
			return false;
		}
		return !((Selectable)_recyclingTabButtonComponent).interactable;
	}

	public void SetInteractable(bool interactable)
	{
		EnsureRecyclingTabExists();
		((Selectable)_recyclingTabButtonComponent).interactable = interactable;
	}

	public void SetActive(bool active)
	{
		if (!Recycle_N_ReclaimPlugin.EnableExperimentalCraftingTabUI.Value.IsOff())
		{
			_recyclingTabButtonGameObject.SetActive(active);
		}
	}

	public void UpdateRecipe(Player player, float dt)
	{
		//IL_001e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0023: Unknown result type (might be due to invalid IL or missing references)
		InventoryGui instance = InventoryGui.instance;
		int selectedRecipeIndex = instance.GetSelectedRecipeIndex(false);
		UpdateRecyclingAnalysisContexts(selectedRecipeIndex, player);
		UpdateCraftingStationUI(player);
		RecipeDataPair val = instance.get_m_selectedRecipe();
		if (Object.op_Implicit((Object)(object)val.Recipe) && selectedRecipeIndex >= 0 && selectedRecipeIndex < _recyclingAnalysisContexts.Count)
		{
			UpdateRecipeUI(selectedRecipeIndex, instance);
		}
		else
		{
			ClearRecipeUI(instance);
		}
		UpdateCraftingTimer(dt, selectedRecipeIndex, player, instance);
	}

	private void UpdateRecyclingAnalysisContexts(int selectedRecipeIndex, Player player)
	{
		if (selectedRecipeIndex > -1 && _recyclingAnalysisContexts.Count > 0 && selectedRecipeIndex < _recyclingAnalysisContexts.Count)
		{
			RecyclingAnalysisContext recyclingAnalysisContext = new RecyclingAnalysisContext(_recyclingAnalysisContexts[selectedRecipeIndex].Item);
			Reclaimer.TryAnalyzeOneItem(recyclingAnalysisContext, ((Humanoid)player).GetInventory(), player);
			_recyclingAnalysisContexts[selectedRecipeIndex] = recyclingAnalysisContext;
		}
	}

	private void UpdateCraftingStationUI(Player player)
	{
		InventoryGui instance = InventoryGui.instance;
		CraftingStation currentCraftingStation = player.GetCurrentCraftingStation();
		if (Object.op_Implicit((Object)(object)currentCraftingStation))
		{
			SetActive(((Component)instance.m_craftingStationIcon).gameObject, isActive: true);
			SetActive(((Component)instance.m_craftingStationLevelRoot).gameObject, isActive: true);
			instance.m_craftingStationName.text = Recycle_N_ReclaimPlugin.Localize(currentCraftingStation.m_name);
			instance.m_craftingStationIcon.sprite = currentCraftingStation.m_icon;
			instance.m_craftingStationLevel.text = currentCraftingStation.GetLevel(true).ToString();
		}
		else
		{
			SetActive(((Component)instance.m_craftingStationIcon).gameObject, isActive: false);
			SetActive(((Component)instance.m_craftingStationLevelRoot).gameObject, isActive: false);
			instance.m_craftingStationName.text = Recycle_N_ReclaimPlugin.Localize("$hud_crafting");
		}
	}

	private void UpdateRecipeUI(int selectedRecipeIndex, InventoryGui igui)
	{
		//IL_000e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0013: Unknown result type (might be due to invalid IL or missing references)
		//IL_0051: Unknown result type (might be due to invalid IL or missing references)
		//IL_0056: Unknown result type (might be due to invalid IL or missing references)
		//IL_0233: Unknown result type (might be due to invalid IL or missing references)
		//IL_0238: Unknown result type (might be due to invalid IL or missing references)
		//IL_0258: Unknown result type (might be due to invalid IL or missing references)
		//IL_025d: Unknown result type (might be due to invalid IL or missing references)
		RecyclingAnalysisContext recyclingAnalysisContext = _recyclingAnalysisContexts[selectedRecipeIndex];
		RecipeDataPair val = igui.get_m_selectedRecipe();
		ItemData itemData = val.ItemData;
		_ = itemData?.m_quality;
		((Behaviour)igui.m_recipeIcon).enabled = true;
		((Behaviour)igui.m_recipeName).enabled = true;
		((Behaviour)igui.m_recipeDecription).enabled = true;
		Image recipeIcon = igui.m_recipeIcon;
		val = igui.get_m_selectedRecipe();
		recipeIcon.sprite = val.Recipe.m_item.m_itemData.m_shared.m_icons[itemData?.m_variant ?? igui.get_m_selectedVariant()];
		if (Recycle_N_ReclaimPlugin.HasEpicLoot)
		{
			EpicLoot.ApplyMagicItemBackgroundToIcon(((Component)igui.m_recipeIcon).gameObject, recyclingAnalysisContext.Item);
		}
		string text = Recycle_N_ReclaimPlugin.Localize(ItemDisplayName(recyclingAnalysisContext.Item, blocked: false));
		if (recyclingAnalysisContext.Item.m_stack > 1)
		{
			text = text + " x" + recyclingAnalysisContext.Item.m_stack;
		}
		igui.m_recipeName.text = text;
		if (recyclingAnalysisContext.RecyclingImpediments.Count == 0)
		{
			igui.m_recipeDecription.text = "\n" + Recycle_N_ReclaimPlugin.Localize("$azumatt_recycle_n_reclaim_requirements_fulfilled");
		}
		else
		{
			igui.m_recipeDecription.text = "\n" + Recycle_N_ReclaimPlugin.Localize("$azumatt_recycle_n_reclaim_requirements_blocked") + ":\n\n<size=15>" + string.Join("\n", recyclingAnalysisContext.RecyclingImpediments) + "</size>";
		}
		if (itemData != null)
		{
			SetActive(((Component)igui.m_itemCraftType).gameObject, isActive: true);
			string text2 = (Recycle_N_ReclaimPlugin.HasEpicLoot ? itemData.GetDisplayName() : itemData.m_shared.m_name);
			igui.m_itemCraftType.text = Recycle_N_ReclaimPlugin.Localize("$azumatt_recycle_n_reclaim_reclaim_item_level", Recycle_N_ReclaimPlugin.Localize(text2), itemData.m_quality.ToString());
		}
		else
		{
			SetActive(((Component)igui.m_itemCraftType).gameObject, isActive: false);
		}
		if (Recycle_N_ReclaimPlugin.HasAuga)
		{
			if ((Object)(object)_descriptionBoxGo == (Object)null)
			{
				_descriptionBoxGo = API.ComplexTooltip_AddTwoColumnTextBox(_augaTabData.ItemInfoGO);
			}
			API.TooltipTextBox_AddLine(_descriptionBoxGo, igui.m_recipeDecription.text, localize: true, overwrite: true);
		}
		GameObject gameObject = ((Component)igui.m_variantButton).gameObject;
		val = igui.get_m_selectedRecipe();
		int isActive;
		if (val.Recipe.m_item.m_itemData.m_shared.m_variants > 1)
		{
			val = igui.get_m_selectedRecipe();
			isActive = ((val.ItemData == null) ? 1 : 0);
		}
		else
		{
			isActive = 0;
		}
		SetActive(gameObject, (byte)isActive != 0);
		if (Recycle_N_ReclaimPlugin.HasEpicLoot)
		{
			SetupRequirementListEpicLoot(recyclingAnalysisContext);
		}
		else
		{
			SetupRequirementList(recyclingAnalysisContext);
		}
		SetActive(((Component)igui.m_minStationLevelIcon).gameObject, isActive: false);
		((Selectable)igui.m_craftButton).interactable = recyclingAnalysisContext.RecyclingImpediments.Count == 0;
		((Component)igui.m_craftButton).GetComponentInChildren<TMP_Text>().text = Recycle_N_ReclaimPlugin.Localize("$azumatt_recycle_n_reclaim_reclaim_button");
		((Component)igui.m_craftButton).GetComponent<UITooltip>().m_text = ((recyclingAnalysisContext.RecyclingImpediments.Count == 0) ? "" : Recycle_N_ReclaimPlugin.Localize("$msg_missingrequirement"));
	}

	private void ClearRecipeUI(InventoryGui igui)
	{
		((Behaviour)igui.m_recipeIcon).enabled = false;
		if (Recycle_N_ReclaimPlugin.HasEpicLoot)
		{
			EpicLoot.ApplyMagicItemBackgroundToIcon(((Component)igui.m_recipeIcon).gameObject, null);
		}
		((Behaviour)igui.m_recipeName).enabled = false;
		((Behaviour)igui.m_recipeDecription).enabled = false;
		SetActive(((Component)igui.m_qualityPanel).gameObject, isActive: false);
		SetActive(((Component)igui.m_minStationLevelIcon).gameObject, isActive: false);
		((Component)igui.m_craftButton).GetComponent<UITooltip>().m_text = "";
		SetActive(((Component)igui.m_variantButton).gameObject, isActive: false);
		((Component)igui.m_craftButton).GetComponentInChildren<TMP_Text>().text = Recycle_N_ReclaimPlugin.Localize("$azumatt_recycle_n_reclaim_reclaim_button");
		SetActive(((Component)igui.m_itemCraftType).gameObject, isActive: false);
		for (int i = 0; i < igui.m_recipeRequirementList.Length; i++)
		{
			InventoryGui.HideRequirement(igui.m_recipeRequirementList[i].transform);
		}
		((Selectable)igui.m_craftButton).interactable = false;
	}

	private void UpdateCraftingTimer(float dt, int selectedRecipeIndex, Player player, InventoryGui igui)
	{
		if ((double)igui.get_m_craftTimer() < 0.0)
		{
			SetActive(((Component)igui.m_craftProgressPanel).gameObject, isActive: false);
			SetActive(((Component)igui.m_craftButton).gameObject, isActive: true);
			return;
		}
		SetActive(((Component)igui.m_craftButton).gameObject, isActive: false);
		SetActive(((Component)igui.m_craftProgressPanel).gameObject, isActive: true);
		igui.m_craftProgressBar.SetMaxValue(igui.m_craftDuration);
		igui.m_craftProgressBar.SetValue(igui.get_m_craftTimer());
		igui.set_m_craftTimer(igui.get_m_craftTimer() + dt);
		if ((double)igui.get_m_craftTimer() >= (double)igui.m_craftDuration)
		{
			Reclaimer.DoInventoryChanges(_recyclingAnalysisContexts[selectedRecipeIndex], ((Humanoid)player).GetInventory(), player, recordUndo: true);
			igui.set_m_craftTimer(-1f);
			igui.SetRecipe(-1, false);
			UpdateCraftingPanel();
		}
	}

	private void SetActive(GameObject gameObject, bool isActive)
	{
		if (Object.op_Implicit((Object)(object)gameObject))
		{
			gameObject.SetActive(isActive);
		}
	}

	private void SetupRequirementListEpicLoot(RecyclingAnalysisContext analysisContexts)
	{
		InventoryGui instance = InventoryGui.instance;
		List<RecyclingAnalysisContext.ReclaimingYieldEntry> list = analysisContexts.Entries.Where((RecyclingAnalysisContext.ReclaimingYieldEntry entry) => entry.Amount != 0).ToList();
		for (int num = 0; num < instance.m_recipeRequirementList.Length; num++)
		{
			Transform transform = instance.m_recipeRequirementList[num].transform;
			if (num < list.Count)
			{
				if (analysisContexts.Entries[num].Amount == 0)
				{
					InventoryGui.HideRequirement(transform);
				}
				else
				{
					SetupRequirementEpicLoot(transform, list[num]);
				}
			}
			else
			{
				InventoryGui.HideRequirement(transform);
			}
		}
	}

	public static void SetupRequirementEpicLoot(Transform elementRoot, RecyclingAnalysisContext.ReclaimingYieldEntry entry)
	{
		//IL_007d: Unknown result type (might be due to invalid IL or missing references)
		//IL_00d0: Unknown result type (might be due to invalid IL or missing references)
		Image component = ((Component)((Component)elementRoot).transform.Find("res_icon")).GetComponent<Image>();
		TMP_Text component2 = ((Component)((Component)elementRoot).transform.Find("res_name")).GetComponent<TMP_Text>();
		TMP_Text component3 = ((Component)((Component)elementRoot).transform.Find("res_amount")).GetComponent<TMP_Text>();
		UITooltip component4 = ((Component)elementRoot).GetComponent<UITooltip>();
		((Component)component).gameObject.SetActive(true);
		((Component)component2).gameObject.SetActive(true);
		((Component)component3).gameObject.SetActive(true);
		component.sprite = entry.RecipeItemData.GetIcon();
		((Graphic)component).color = Color.white;
		component4.m_text = Recycle_N_ReclaimPlugin.Localize(entry.RecipeItemData.m_shared.m_name);
		component2.text = Recycle_N_ReclaimPlugin.Localize(entry.RecipeItemData.m_shared.m_name);
		component3.text = entry.Amount.ToString();
		((Graphic)component3).color = Color.white;
	}

	private void SetupRequirementList(RecyclingAnalysisContext analysisContexts)
	{
		InventoryGui instance = InventoryGui.instance;
		int num = 0;
		List<RecyclingAnalysisContext.ReclaimingYieldEntry> list = analysisContexts.Entries.Where((RecyclingAnalysisContext.ReclaimingYieldEntry entry) => entry.Amount != 0).ToList();
		int num2 = 0;
		if (list.Count > 4)
		{
			num2 = (int)Time.fixedTime % (int)Mathf.Ceil((float)list.Count / (float)instance.m_recipeRequirementList.Length) * instance.m_recipeRequirementList.Length;
		}
		for (int num3 = num2; num3 < list.Count; num3++)
		{
			if (SetupRequirement(instance.m_recipeRequirementList[num].transform, list[num3]))
			{
				num++;
			}
			if (num >= instance.m_recipeRequirementList.Length)
			{
				break;
			}
		}
		for (; num < instance.m_recipeRequirementList.Length; num++)
		{
			InventoryGui.HideRequirement(instance.m_recipeRequirementList[num].transform);
		}
	}

	public static bool SetupRequirement(Transform elementRoot, RecyclingAnalysisContext.ReclaimingYieldEntry entry)
	{
		//IL_007d: Unknown result type (might be due to invalid IL or missing references)
		//IL_00d0: Unknown result type (might be due to invalid IL or missing references)
		Image component = ((Component)((Component)elementRoot).transform.Find("res_icon")).GetComponent<Image>();
		TMP_Text component2 = ((Component)((Component)elementRoot).transform.Find("res_name")).GetComponent<TMP_Text>();
		TMP_Text component3 = ((Component)((Component)elementRoot).transform.Find("res_amount")).GetComponent<TMP_Text>();
		UITooltip component4 = ((Component)elementRoot).GetComponent<UITooltip>();
		((Component)component).gameObject.SetActive(true);
		((Component)component2).gameObject.SetActive(true);
		((Component)component3).gameObject.SetActive(true);
		component.sprite = entry.RecipeItemData.GetIcon();
		((Graphic)component).color = Color.white;
		component4.m_text = Recycle_N_ReclaimPlugin.Localize(entry.RecipeItemData.m_shared.m_name);
		component2.text = Recycle_N_ReclaimPlugin.Localize(entry.RecipeItemData.m_shared.m_name);
		component3.text = entry.Amount.ToString();
		((Graphic)component3).color = Color.white;
		if (entry.Amount <= 0)
		{
			InventoryGui.HideRequirement(elementRoot);
			return false;
		}
		return true;
	}
}
