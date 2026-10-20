using System;
using System.Collections.Generic;
using BepInEx;
using TMPro;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.UI;
using Zen;
using Zen.Lib;

namespace ZenUI.Section;

internal class CraftingPanelGrid : InventoryGrid
{
	private record struct CacheKey(int Width, int Height);

	private readonly record struct RenderKey(ItemData Item, Sprite Icon, bool Selected, bool CanCraft, bool Hovered, int Amount);

	private class CacheData(CraftingPanelGrid grid)
	{
		public readonly int ID = grid._cache.Count;

		public readonly RectTransform Root = ((InventoryGrid)grid).m_gridRoot;

		public readonly List<InventoryElement> Elements = ((InventoryGrid)grid).m_elements;

		public readonly int Width = ((InventoryGrid)grid).m_width;

		public readonly int Height = ((InventoryGrid)grid).m_height;
	}

	private static readonly Color BlackAndWhite = Hud.s_colorRedBlueZeroAlpha;

	private readonly Dictionary<CacheKey, CacheData> _cache = new Dictionary<CacheKey, CacheData>();

	private readonly Dictionary<Vector2i, ItemData> _gridInvPosIndex = new Dictionary<Vector2i, ItemData>();

	private CacheKey _prevCacheKey;

	private RectTransform _originalGridRoot;

	private readonly Dictionary<InventoryElement, RenderKey> _renderStateKeys = new Dictionary<InventoryElement, RenderKey>();

	private static bool IsUntouchedItemIndicatorEnabled
	{
		get
		{
			//IL_0011: Unknown result type (might be due to invalid IL or missing references)
			if (Configs.CraftPanelUntouchedItemIndicator.Value)
			{
				return Configs.CraftPanelUntouchedItemIndicatorColor.Value.a > 0f;
			}
			return false;
		}
	}

	public ScrollRect ScrollRect => base.m_ensureVisible.mScrollRect;

	public event Action<ItemData?>? OnSelectedItem;

	public event Action<float>? OnScrollChanged;

	internal void Init(int width, int height)
	{
		//IL_0083: Unknown result type (might be due to invalid IL or missing references)
		//IL_0088: Unknown result type (might be due to invalid IL or missing references)
		//IL_0089: Unknown result type (might be due to invalid IL or missing references)
		//IL_0093: Unknown result type (might be due to invalid IL or missing references)
		//IL_0094: Unknown result type (might be due to invalid IL or missing references)
		//IL_009e: Unknown result type (might be due to invalid IL or missing references)
		//IL_009f: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a9: Unknown result type (might be due to invalid IL or missing references)
		//IL_00b4: Unknown result type (might be due to invalid IL or missing references)
		//IL_00be: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c9: Unknown result type (might be due to invalid IL or missing references)
		//IL_00d3: Unknown result type (might be due to invalid IL or missing references)
		//IL_00d4: Unknown result type (might be due to invalid IL or missing references)
		//IL_00de: Unknown result type (might be due to invalid IL or missing references)
		//IL_00e8: Unknown result type (might be due to invalid IL or missing references)
		//IL_013a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0174: Unknown result type (might be due to invalid IL or missing references)
		//IL_017e: Expected Obj, but got Unknown
		//IL_01b7: Unknown result type (might be due to invalid IL or missing references)
		//IL_01bc: Unknown result type (might be due to invalid IL or missing references)
		//IL_01c7: Unknown result type (might be due to invalid IL or missing references)
		//IL_01d1: Unknown result type (might be due to invalid IL or missing references)
		//IL_01dc: Unknown result type (might be due to invalid IL or missing references)
		//IL_01e6: Unknown result type (might be due to invalid IL or missing references)
		//IL_01f1: Unknown result type (might be due to invalid IL or missing references)
		//IL_01fb: Unknown result type (might be due to invalid IL or missing references)
		//IL_0206: Unknown result type (might be due to invalid IL or missing references)
		//IL_021a: Unknown result type (might be due to invalid IL or missing references)
		//IL_027e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0288: Expected Obj, but got Unknown
		InventoryGui instance = InventoryGui.instance;
		Logging<Plugin>.Info("Add Canvas and GraphicRaycaster optimization for large grids");
		((Component)this).gameObject.AddComponent<Canvas>();
		((Component)this).gameObject.AddComponent<GraphicRaycaster>();
		Logging<Plugin>.Info("Set the default grid root");
		InitGridRoot();
		Logging<Plugin>.Info("Set the element prefab");
		base.m_elementPrefab = instance.m_playerGrid.m_elementPrefab;
		Logging<Plugin>.Info("Set the element space");
		base.m_elementSpace = instance.m_playerGrid.m_elementSpace;
		Logging<Plugin>.Info("Setup the position defaults");
		RectTransform val = (RectTransform)((Component)this).transform;
		val.anchoredPosition = Vector2.zero;
		val.anchorMax = Vector2.one;
		val.anchorMin = Vector2.zero;
		val.offsetMax = new Vector2(0f, -5f);
		val.offsetMin = new Vector2(0f, -5f);
		val.sizeDelta = Vector2.zero;
		val.pivot = Vector2.one * 0.5f;
		Logging<Plugin>.Info("Setup the tooltip anchor");
		base.m_tooltipAnchor = Object.Instantiate<RectTransform>(instance.m_playerGrid.m_tooltipAnchor, (Transform)(object)instance.m_crafting, false);
		((Object)base.m_tooltipAnchor).name = "ZenUI_CraftingPanelGrid_TooltipAnchor";
		base.m_tooltipAnchor.anchoredPosition = new Vector2(-1000f, -70f);
		Logging<Plugin>.Info("Setup the UIGroupHandler");
		base.m_uiGroup = ((Component)instance.m_crafting).GetComponent<UIGroupHandler>();
		Logging<Plugin>.Info("Setup the inventory for the grid");
		base.m_inventory = new Inventory("$hud_crafting", (Sprite)null, width, height);
		Logging<Plugin>.Info("Clone the scrollbar");
		GameObject val2 = Object.Instantiate<GameObject>(((Component)instance.ContainerGrid.m_scrollbar).gameObject, ((Component)this).transform, false);
		((Object)val2).name = "ScrollBar";
		RectTransform val3 = (RectTransform)val2.transform;
		val3.anchoredPosition = new Vector2(0f, 0f);
		val3.anchorMax = new Vector2(1f, 1f);
		val3.anchorMin = new Vector2(1f, 0f);
		val3.offsetMax = new Vector2(4f, 0f);
		val3.offsetMin = new Vector2(-4f, 0f);
		Logging<Plugin>.Info("Add event handler for SelectedItem");
		base.m_onSelected = (Action<InventoryGrid, ItemData, Vector2i, Modifier>)Delegate.Combine(base.m_onSelected, new Action<InventoryGrid, ItemData, Vector2i, Modifier>(InvokeOnSelectedItem));
		Logging<Plugin>.Info("Fixup the scrollbar");
		base.m_scrollbar = val2.GetComponent<Scrollbar>();
		base.m_scrollbar.handleRect = (RectTransform)val2.transform.Find("Sliding Area/Handle");
		((UnityEvent<float>)(object)base.m_scrollbar.onValueChanged).AddListener((UnityAction<float>)((float v) =>
		{
			OnScrollChanged?.Invoke(v);
		}));
		Logging<Plugin>.Info("Reassign the ScrollRect area to point to this crafting grid");
		ScrollRect component = ((Component)this).GetComponent<ScrollRect>();
		component.verticalScrollbarVisibility = (ScrollbarVisibility)1;
		component.content = base.m_gridRoot;
		component.verticalScrollbar = base.m_scrollbar;
		component.scrollSensitivity = Configs.CraftPanelScrollSensitivity.Value * 1000f;
		base.m_ensureVisible = ((Component)this).GetComponent<ScrollRectEnsureVisible>();
		base.m_ensureVisible.Initialize();
	}

	private void OnDestroy()
	{
		Object.Destroy((Object)(object)((Component)base.m_scrollbar).gameObject);
		Object.Destroy((Object)(object)((Component)base.m_tooltipAnchor).gameObject);
		foreach (CacheData value in _cache.Values)
		{
			Object.Destroy((Object)(object)((Component)value.Root).gameObject);
		}
	}

	private void InvokeOnSelectedItem(InventoryGrid grid, ItemData? item, Vector2i pos, Modifier modifier)
	{
		//IL_0034: Unknown result type (might be due to invalid IL or missing references)
		//IL_0039: Unknown result type (might be due to invalid IL or missing references)
		//IL_0047: Unknown result type (might be due to invalid IL or missing references)
		//IL_004d: Unknown result type (might be due to invalid IL or missing references)
		((Transform)base.m_tooltipAnchor).SetAsLastSibling();
		OnSelectedItem?.Invoke(item);
		if (!ZInput.IsGamepadActive())
		{
			InventoryGui.instance.m_moveItemEffects.Create(((Component)this).transform.position, Quaternion.identity, (Transform)null, 1f, -1, default(ZDOID));
		}
	}

	private void InitGridRoot()
	{
		//IL_0011: Unknown result type (might be due to invalid IL or missing references)
		//IL_001b: Expected Obj, but got Unknown
		//IL_003b: Unknown result type (might be due to invalid IL or missing references)
		_originalGridRoot = (RectTransform)((Component)this).transform.Find("Root");
		base.m_gridRoot = _originalGridRoot;
		foreach (Transform item in (Transform)_originalGridRoot)
		{
			Object.Destroy((Object)(object)((Component)item).gameObject);
		}
		((Component)_originalGridRoot).gameObject.SetActive(false);
	}

	private CacheKey GetKey()
	{
		Inventory inventory = ((InventoryGrid)this).GetInventory();
		return new CacheKey(inventory.m_width, inventory.m_height);
	}

	private bool IsSame(CacheData cache)
	{
		if (base.m_elements == cache.Elements && base.m_inventory.m_width == cache.Width)
		{
			return base.m_inventory.m_height == cache.Height;
		}
		return false;
	}

	private void CreateCache(CacheKey key)
	{
		base.m_width = key.Width;
		base.m_height = key.Height;
		base.m_elements = new List<InventoryElement>();
		RectTransform val = Object.Instantiate<RectTransform>(_originalGridRoot, ((Component)this).transform, false);
		((Object)val).name = string.Format("RootCache_{0}_{1}x{2}", "ZenUI", base.m_width, base.m_height);
		((Transform)val).SetSiblingIndex(1);
		SetRoot(val);
		Logging<Plugin>.InterpolatedString msg = new Logging<Plugin>.InterpolatedString(20, 1, out var shouldAppend);
		if (shouldAppend)
		{
			msg.AppendLiteral("Created cache root: ");
			msg.AppendFormatted(((Object)val).name);
		}
		Logging<Plugin>.Info(msg);
	}

	private void CreateGridElements()
	{
		//IL_008a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0090: Unknown result type (might be due to invalid IL or missing references)
		//IL_0095: Unknown result type (might be due to invalid IL or missing references)
		//IL_0096: Unknown result type (might be due to invalid IL or missing references)
		//IL_009b: Unknown result type (might be due to invalid IL or missing references)
		//IL_00af: Unknown result type (might be due to invalid IL or missing references)
		//IL_00b4: Unknown result type (might be due to invalid IL or missing references)
		//IL_00bf: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c9: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ce: Unknown result type (might be due to invalid IL or missing references)
		//IL_00d3: Unknown result type (might be due to invalid IL or missing references)
		//IL_010b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0127: Unknown result type (might be due to invalid IL or missing references)
		//IL_012c: Unknown result type (might be due to invalid IL or missing references)
		//IL_012d: Unknown result type (might be due to invalid IL or missing references)
		//IL_012f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0226: Unknown result type (might be due to invalid IL or missing references)
		//IL_023b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0250: Unknown result type (might be due to invalid IL or missing references)
		//IL_0264: Unknown result type (might be due to invalid IL or missing references)
		//IL_02a8: Unknown result type (might be due to invalid IL or missing references)
		//IL_02af: Expected Obj, but got Unknown
		Logging<Plugin>.InterpolatedString msg = new Logging<Plugin>.InterpolatedString(25, 4, out var shouldAppend);
		if (shouldAppend)
		{
			msg.AppendLiteral("Size: ");
			msg.AppendFormatted(base.m_width);
			msg.AppendLiteral("x");
			msg.AppendFormatted(base.m_height);
			msg.AppendLiteral(", InventorySize: ");
			msg.AppendFormatted(base.m_inventory.m_width);
			msg.AppendLiteral("x");
			msg.AppendFormatted(base.m_inventory.m_height);
		}
		Logging<Plugin>.Info(msg);
		RectTransform val = (RectTransform)((Component)this).transform;
		Vector2 widgetSize = ((InventoryGrid)this).GetWidgetSize();
		Rect rect = val.rect;
		Vector2 val2 = new Vector2(rect.width / 2f, 0f) - new Vector2(widgetSize.x, 0f) * 0.5f;
		Sprite sprite = ((BaseUnityPlugin)(object)ZenMod<Plugin>.Instance).LoadSpriteFromResource("exclamation.png");
		for (int i = 0; i < base.m_height; i++)
		{
			for (int j = 0; j < base.m_width; j++)
			{
				Vector2 val3 = new Vector2((float)j * base.m_elementSpace, (float)i * (0f - base.m_elementSpace));
				GameObject val4 = Object.Instantiate<GameObject>(base.m_elementPrefab, (Transform)(object)base.m_gridRoot);
				((RectTransform)val4.transform).anchoredPosition = val2 + val3;
				UIInputHandler component = val4.GetComponent<UIInputHandler>();
				component.m_onRightDown = (Action<UIInputHandler>)Delegate.Combine(component.m_onRightDown, new Action<UIInputHandler>(base.OnRightDown));
				component.m_onLeftDown = (Action<UIInputHandler>)Delegate.Combine(component.m_onLeftDown, new Action<UIInputHandler>(base.OnLeftDown));
				component.m_onLeftClick = (Action<UIInputHandler>)Delegate.Combine(component.m_onLeftClick, new Action<UIInputHandler>(base.OnLeftClick));
				component.m_onLeftUp = (Action<UIInputHandler>)Delegate.Combine(component.m_onLeftUp, new Action<UIInputHandler>(base.OnLeftRelease));
				component.m_onPointerEnter = (Action<UIInputHandler>)Delegate.Combine(component.m_onPointerEnter, new Action<UIInputHandler>(base.OnPointerEnter));
				InventoryElement component2 = val4.GetComponent<InventoryElement>();
				component2.Initialize(j, i);
				if (IsUntouchedItemIndicatorEnabled)
				{
					component2.m_noteleport.sprite = sprite;
					RectTransform rectTransform = ((Graphic)component2.m_noteleport).rectTransform;
					rectTransform.anchorMin = new Vector2(0f, 1f);
					rectTransform.anchorMax = new Vector2(0f, 1f);
					rectTransform.pivot = new Vector2(0f, 1f);
					rectTransform.anchoredPosition = new Vector2(-8.5f, -1f);
				}
				base.m_elements.Add(component2);
				component2.m_selected.SetActive(false);
				((InventoryGrid)(object)this).DisableElement(component2);
				foreach (Transform item in val4.transform)
				{
					Transform val5 = item;
					switch (((Object)val5).name)
					{
					case "equiped":
					case "quality":
					case "foodicon":
					case "selected":
					case "icon":
					case "amount":
					case "noteleport":
						shouldAppend = true;
						break;
					default:
						shouldAppend = false;
						break;
					}
					if (!shouldAppend)
					{
						Object.Destroy((Object)(object)((Component)val5).gameObject);
					}
				}
			}
		}
	}

	private void SetRoot(RectTransform root)
	{
		((Component)base.m_gridRoot).gameObject.SetActive(false);
		base.m_gridRoot = root;
		((Component)base.m_gridRoot).gameObject.SetActive(true);
		ScrollRect val = default;
		if (!((Component)this).TryGetComponent<ScrollRect>(ref val))
		{
			Logging<Plugin>.Error("ScrollRect component missing", 0);
			return;
		}
		val.content = base.m_gridRoot;
		ScrollRectEnsureVisible val2 = default;
		if (!((Component)val).TryGetComponent<ScrollRectEnsureVisible>(ref val2))
		{
			Logging<Plugin>.Error("ScrollRectEnsureVisible component missing", 0);
		}
		else
		{
			val2.Initialize();
		}
	}

	private void SwitchCache(CacheData cache)
	{
		Logging<Plugin>.InterpolatedString msg = new Logging<Plugin>.InterpolatedString(12, 4, out var shouldAppend);
		if (shouldAppend)
		{
			msg.AppendFormatted(((Object)this).name);
			msg.AppendLiteral(" ");
			msg.AppendFormatted(cache.Width);
			msg.AppendLiteral("x");
			msg.AppendFormatted(cache.Height);
			msg.AppendLiteral(" CacheID: ");
			msg.AppendFormatted(cache.ID, "0000");
		}
		Logging<Plugin>.Info(msg);
		SetRoot(cache.Root);
		base.m_elements = cache.Elements;
		base.m_width = cache.Width;
		base.m_height = cache.Height;
	}

	private void ResetScrollSize()
	{
		base.m_gridRoot.SetSizeWithCurrentAnchors((Axis)1, (float)base.m_height * base.m_elementSpace);
	}

	private void UpdateGamepad()
	{
		//IL_0016: Unknown result type (might be due to invalid IL or missing references)
		//IL_00d4: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ef: Unknown result type (might be due to invalid IL or missing references)
		//IL_00fc: Unknown result type (might be due to invalid IL or missing references)
		if (ZInput.IsGamepadActive() && base.m_uiGroup.IsActive)
		{
			Vector2i selected = base.m_selected;
			if (ZInput.GetButtonDown("JoyLStickLeft"))
			{
				base.m_selected.x--;
			}
			if (ZInput.GetButtonDown("JoyLStickRight"))
			{
				base.m_selected.x++;
			}
			if (ZInput.GetButtonDown("JoyLStickUp"))
			{
				base.m_selected.y--;
			}
			if (ZInput.GetButtonDown("JoyLStickDown"))
			{
				base.m_selected.y++;
			}
			base.m_selected.x = Mathf.Clamp(base.m_selected.x, 0, base.m_width - 1);
			base.m_selected.y = Mathf.Clamp(base.m_selected.y, 0, base.m_height - 1);
			if (!(selected == base.m_selected))
			{
				base.m_onSelected((InventoryGrid)(object)this, ((InventoryGrid)this).GetGamepadSelectedItem(), base.m_selected, (Modifier)0);
				CenterOn(base.m_selected);
			}
		}
	}

	public void AddItem(ItemData item)
	{
		//IL_0018: Unknown result type (might be due to invalid IL or missing references)
		((InventoryGrid)this).GetInventory().m_inventory.Add(item);
		_gridInvPosIndex[item.m_gridPos] = item;
	}

	private void UpdateGuiBefore()
	{
		CacheKey key = GetKey();
		if (!_cache.TryGetValue(key, out CacheData value))
		{
			CreateCache(key);
			CreateGridElements();
		}
		else if (!IsSame(value))
		{
			SwitchCache(value);
		}
		if (key != _prevCacheKey)
		{
			ResetScrollSize();
		}
		_prevCacheKey = key;
	}

	public void UpdateGui(ItemData? selectedItem)
	{
		//IL_000e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		//IL_0013: Unknown result type (might be due to invalid IL or missing references)
		base.m_selected = selectedItem?.m_gridPos ?? new Vector2i(-1, -1);
		UpdateGamepad();
		UpdateGuiBefore();
		UpdateGuiOptimized();
		UpdateGuiAfter();
	}

	private void UpdateGuiAfter()
	{
		CacheKey key = GetKey();
		if (!_cache.ContainsKey(key))
		{
			Logging<Plugin>.InterpolatedString msg = new Logging<Plugin>.InterpolatedString(18, 1, out var shouldAppend);
			if (shouldAppend)
			{
				msg.AppendLiteral("Update cache key: ");
				msg.AppendFormatted(key);
			}
			Logging<Plugin>.Info(msg);
			_cache[key] = new CacheData(this);
		}
	}

	public void ResetCache()
	{
		Logging<Plugin>.Info("Reset item grid position lookup index");
		_gridInvPosIndex.Clear();
		Logging<Plugin>.Info("Remove all render keys");
		_renderStateKeys.Clear();
	}

	private bool IsRenderStateChanged(InventoryElement element, ItemData item, out RenderKey newKey)
	{
		newKey = new RenderKey(item, item.GetIcon(), CraftingPanel.IsSelectedItem(item), CraftingPanel.CanCraft(item), IsHovering(element), item.GetCraftAmount());
		if (_renderStateKeys.TryGetValue(element, out var value) && value == newKey)
		{
			return false;
		}
		_renderStateKeys[element] = newKey;
		return true;
	}

	private void UpdateGuiOptimized()
	{
		//IL_00ad: Unknown result type (might be due to invalid IL or missing references)
		//IL_0076: Unknown result type (might be due to invalid IL or missing references)
		//IL_007c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0156: Unknown result type (might be due to invalid IL or missing references)
		//IL_015c: Invalid comparison between Unknown and I4
		//IL_01a9: Unknown result type (might be due to invalid IL or missing references)
		base.m_selected.x = Mathf.Clamp(base.m_selected.x, 0, base.m_width - 1);
		base.m_selected.y = Mathf.Clamp(base.m_selected.y, 0, base.m_height - 1);
		foreach (InventoryElement element in base.m_elements)
		{
			if (ZInput.IsGamepadActive())
			{
				bool active = base.m_uiGroup.IsActive && element.Position == base.m_selected;
				element.m_selected.SetActive(active);
			}
			else
			{
				element.m_selected.SetActive(false);
			}
			RenderKey newKey;
			if (!_gridInvPosIndex.TryGetValue(element.Position, out ItemData value))
			{
				_renderStateKeys.Remove(element);
				if (element.m_used)
				{
					((InventoryGrid)(object)this).DisableElement(element);
				}
			}
			else if (IsRenderStateChanged(element, value, out newKey))
			{
				Logging<Plugin>.InterpolatedString msg = new Logging<Plugin>.InterpolatedString(34, 1, out var shouldAppend);
				if (shouldAppend)
				{
					msg.AppendLiteral("Rebuilding grid element for item: ");
					msg.AppendFormatted(value.GetName());
				}
				Logging<Plugin>.Info(msg);
				element.m_used = true;
				((Behaviour)element.m_icon).enabled = true;
				element.m_icon.sprite = newKey.Icon;
				((Behaviour)element.m_equiped).enabled = false;
				if ((int)value.m_shared.m_itemType == 2 && (value.m_shared.m_food > 0f || value.m_shared.m_foodStamina > 0f || value.m_shared.m_foodEitr > 0f))
				{
					((Behaviour)element.m_food).enabled = true;
					((Graphic)element.m_food).color = value.GetFoodForkColor();
				}
				else
				{
					((Behaviour)element.m_food).enabled = false;
				}
				((Behaviour)element.m_tooltip).enabled = Configs.CraftPanelTooltipHover.Value || ZInput.IsGamepadActive();
				((InventoryGrid)this).CreateItemTooltip(value, element.m_tooltip);
				UpdateElement(element, value, newKey);
				msg = new Logging<Plugin>.InterpolatedString(9, 1, out shouldAppend);
				if (shouldAppend)
				{
					msg.AppendLiteral("Updated: ");
					msg.AppendFormatted(value.GetName());
				}
				Logging<Plugin>.Info(msg);
			}
		}
	}

	private bool IsHovering(InventoryElement element)
	{
		//IL_001f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0025: Expected Obj, but got Unknown
		//IL_0026: Unknown result type (might be due to invalid IL or missing references)
		//IL_002b: Unknown result type (might be due to invalid IL or missing references)
		//IL_002f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0034: Unknown result type (might be due to invalid IL or missing references)
		if (ZInput.IsGamepadActive())
		{
			return (Object)(object)((Component)element).transform == (Object)(object)((InventoryGrid)this).GetGamepadSelectedElement();
		}
		RectTransform val = (RectTransform)((Component)element).transform;
		Rect rect = val.rect;
		return rect.Contains(((Transform)val).InverseTransformPoint(ZInput.pointerPosition));
	}

	private static void UpdateElement(InventoryElement element, ItemData item, RenderKey renderKey)
	{
		//IL_0015: Unknown result type (might be due to invalid IL or missing references)
		//IL_001a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0033: Unknown result type (might be due to invalid IL or missing references)
		//IL_0042: Unknown result type (might be due to invalid IL or missing references)
		//IL_0047: Unknown result type (might be due to invalid IL or missing references)
		//IL_0055: Unknown result type (might be due to invalid IL or missing references)
		//IL_002c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0057: Unknown result type (might be due to invalid IL or missing references)
		//IL_005e: Unknown result type (might be due to invalid IL or missing references)
		//IL_005b: Unknown result type (might be due to invalid IL or missing references)
		//IL_005f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0080: Unknown result type (might be due to invalid IL or missing references)
		//IL_0063: Unknown result type (might be due to invalid IL or missing references)
		//IL_0069: Unknown result type (might be due to invalid IL or missing references)
		//IL_006e: Unknown result type (might be due to invalid IL or missing references)
		//IL_007c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0081: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a3: Unknown result type (might be due to invalid IL or missing references)
		//IL_0086: Unknown result type (might be due to invalid IL or missing references)
		//IL_008c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0091: Unknown result type (might be due to invalid IL or missing references)
		//IL_009f: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a4: Unknown result type (might be due to invalid IL or missing references)
		//IL_00be: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ca: Unknown result type (might be due to invalid IL or missing references)
		//IL_00d8: Unknown result type (might be due to invalid IL or missing references)
		//IL_00dd: Unknown result type (might be due to invalid IL or missing references)
		//IL_00df: Unknown result type (might be due to invalid IL or missing references)
		//IL_012f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0134: Unknown result type (might be due to invalid IL or missing references)
		//IL_015c: Unknown result type (might be due to invalid IL or missing references)
		//IL_015e: Unknown result type (might be due to invalid IL or missing references)
		//IL_016c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0158: Unknown result type (might be due to invalid IL or missing references)
		//IL_03f8: Unknown result type (might be due to invalid IL or missing references)
		//IL_020a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0338: Unknown result type (might be due to invalid IL or missing references)
		//IL_0357: Unknown result type (might be due to invalid IL or missing references)
		//IL_0376: Unknown result type (might be due to invalid IL or missing references)
		//IL_0395: Unknown result type (might be due to invalid IL or missing references)
		//IL_03b4: Unknown result type (might be due to invalid IL or missing references)
		//IL_0278: Unknown result type (might be due to invalid IL or missing references)
		//IL_0297: Unknown result type (might be due to invalid IL or missing references)
		//IL_02b6: Unknown result type (might be due to invalid IL or missing references)
		//IL_02d5: Unknown result type (might be due to invalid IL or missing references)
		//IL_02f4: Unknown result type (might be due to invalid IL or missing references)
		bool canCraft = renderKey.CanCraft;
		bool flag = canCraft || renderKey.Hovered;
		Color white = Color.white;
		Color val;
		if (!(Configs.CraftPanelUncraftableBrightness.Value > 0f))
		{
			val = BlackAndWhite;
		}
		else
		{
			Color val2 = Color.white * Configs.CraftPanelUncraftableBrightness.Value;
			val2.a = 1f;
			val = val2;
		}
		Color val3 = val;
		Color color = (flag ? white : val3);
		Color val4;
		if (!flag)
		{
			Color val2 = white * 0.7f;
			val2.a = 1f;
			val4 = val2;
		}
		else
		{
			val4 = white;
		}
		Color val5 = val4;
		Color val6;
		if (!flag)
		{
			Color val2 = white * 0.6f;
			val2.a = 1f;
			val6 = val2;
		}
		else
		{
			val6 = white;
		}
		Color color2 = val6;
		((Behaviour)element.m_equiped).enabled = renderKey.Selected;
		((Graphic)element.m_icon).color = color;
		((Graphic)element.m_amount).color = color2;
		Image food = element.m_food;
		((Graphic)food).color = ((Graphic)food).color * val5;
		((Behaviour)element.m_noteleport).enabled = IsUntouchedItemIndicatorEnabled && Object.op_Implicit((Object)(object)Player.m_localPlayer) && !Player.m_localPlayer.IsKnownMaterial(item.GetName());
		if (((Behaviour)element.m_noteleport).enabled)
		{
			Color value = Configs.CraftPanelUntouchedItemIndicatorColor.Value;
			bool flag2 = Configs.CraftPanelUncraftableBrightness.Value < 1f;
			Image noteleport = element.m_noteleport;
			Color color3;
			if (!(!flag & flag2))
			{
				color3 = value;
			}
			else
			{
				Color val2 = value;
				val2.a = 0.5f;
				color3 = val2;
			}
			((Graphic)noteleport).color = color3;
		}
		if (item.m_shared.m_maxStackSize > 1)
		{
			element.m_amount.SetText("x{0}", (float)renderKey.Amount);
		}
		else
		{
			element.m_amount.SetText(string.Empty);
		}
		((Behaviour)element.m_amount).enabled = element.m_amount.text != string.Empty;
		((Behaviour)element.m_quality).enabled = false;
		bool flag3 = !Utility.IsNullOrWhiteSpace(Configs.CraftPanelUncraftableSymbol.Value) && Configs.CraftPanelUncraftableSymbolPosition.Value != UncraftableSymbolPosition.None;
		if (!canCraft & flag3)
		{
			UIColor arg = Configs.CraftPanelUncraftableSymbolColor.Value;
			string value2 = Configs.CraftPanelUncraftableSymbol.Value;
			element.m_quality.text = $"<color={arg}>{value2}</color>";
			((Behaviour)element.m_quality).enabled = true;
			switch (Configs.CraftPanelUncraftableSymbolPosition.Value)
			{
			case UncraftableSymbolPosition.TopLeft:
				element.m_quality.rectTransform.pivot = new Vector2(0.5f, 0.5f);
				element.m_quality.rectTransform.anchorMin = new Vector2(0f, 0f);
				element.m_quality.rectTransform.anchorMax = new Vector2(0f, 1f);
				element.m_quality.rectTransform.offsetMin = new Vector2(15f, 0f);
				element.m_quality.rectTransform.offsetMax = new Vector2(0f, -3f);
				element.m_quality.fontSize = 18f;
				element.m_quality.alignment = (TextAlignmentOptions)258;
				break;
			case UncraftableSymbolPosition.Center:
				element.m_quality.rectTransform.pivot = new Vector2(0.5f, 0.5f);
				element.m_quality.rectTransform.anchorMin = new Vector2(0f, 0f);
				element.m_quality.rectTransform.anchorMax = new Vector2(1f, 1f);
				element.m_quality.rectTransform.offsetMin = new Vector2(0f, 0f);
				element.m_quality.rectTransform.offsetMax = new Vector2(0f, 0f);
				element.m_quality.fontSize = 32f;
				element.m_quality.alignment = (TextAlignmentOptions)514;
				break;
			default:
				throw new ArgumentOutOfRangeException();
			}
		}
		ItemIcon.UpdateItemIcon(null, element.m_icon, element.m_equiped, Configs.ItemActivatedColor.Value);
	}

	public InventoryElement? GetElementAt(Vector2i pos)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_0009: Unknown result type (might be due to invalid IL or missing references)
		//IL_0017: Unknown result type (might be due to invalid IL or missing references)
		//IL_0020: Unknown result type (might be due to invalid IL or missing references)
		//IL_0031: Unknown result type (might be due to invalid IL or missing references)
		//IL_0037: Unknown result type (might be due to invalid IL or missing references)
		if (pos.x < 0 || pos.x >= base.m_width || pos.y < 0 || pos.y >= base.m_height)
		{
			return null;
		}
		return ((InventoryGrid)this).GetElement(pos.x, pos.y, base.m_width);
	}

	public RectTransform? GetElementTransformAt(Vector2i pos)
	{
		//IL_0001: Unknown result type (might be due to invalid IL or missing references)
		//IL_0007: Unknown result type (might be due to invalid IL or missing references)
		InventoryElement element = ((InventoryGrid)this).GetElement(pos.x, pos.y, base.m_width);
		if (Object.op_Implicit((Object)(object)element))
		{
			Transform transform = ((Component)element).transform;
			return (RectTransform?)(object)((transform is RectTransform) ? transform : null);
		}
		return null;
	}

	public void CenterOn(Vector2i pos)
	{
		//IL_0007: Unknown result type (might be due to invalid IL or missing references)
		base.m_ensureVisible.CenterOnItem(GetElementTransformAt(pos));
	}

	public void CenterOn(ItemData? item)
	{
		//IL_0005: Unknown result type (might be due to invalid IL or missing references)
		if (item != null)
		{
			CenterOn(item.m_gridPos);
		}
	}

	static CraftingPanelGrid()
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_0005: Unknown result type (might be due to invalid IL or missing references)
	}
}
