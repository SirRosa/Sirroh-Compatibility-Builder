using System;
using HarmonyLib;
using UnityEngine;

namespace Zen.Lib;

public abstract class VirtualInventory : MonoBehaviour
{
	private sealed class VirtualContainer : Container
	{
	}

	[HarmonyPatch]
	private static class Patch
	{
		[HarmonyPrefix]
		[HarmonyPatch(typeof(Inventory), "AddItem", new Type[] { typeof(ItemData) })]
		[HarmonyPriority(700)]
		private static bool Inventory_AddItem(Inventory __instance, ItemData? item, ref bool __result)
		{
			if (item != null && TryGetOpened(out VirtualInventory opened) && opened.IsInventory(__instance) && !opened._isRefreshInventory)
			{
				return __result = opened.IsAddItemValid(item);
			}
			return true;
		}

		[HarmonyPrefix]
		[HarmonyPatch(typeof(Container), "IsOwner")]
		[HarmonyPriority(800)]
		private static bool Container_IsOwner(Container __instance, ref bool __result)
		{
			if (!(__instance is VirtualContainer))
			{
				return true;
			}
			__result = Object.op_Implicit((Object)(object)_opened) && _opened.GetZNetView().IsOwner();
			return false;
		}

		[HarmonyPrefix]
		[HarmonyPatch(typeof(Container), "SetInUse")]
		[HarmonyPriority(800)]
		private static bool Container_SetInUse(Container __instance)
		{
			return !(__instance is VirtualContainer);
		}

		[HarmonyPrefix]
		[HarmonyPatch(typeof(Container), "StackAll")]
		[HarmonyPriority(800)]
		private static bool Container_StackAll(Container __instance)
		{
			//IL_002b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0030: Unknown result type (might be due to invalid IL or missing references)
			//IL_003e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0044: Unknown result type (might be due to invalid IL or missing references)
			if (!(__instance is VirtualContainer))
			{
				return true;
			}
			if (TryGetOpened(out VirtualInventory opened) && opened.OnHoldToStack())
			{
				InventoryGui.instance.m_moveItemEffects.Create(((Component)__instance).transform.position, Quaternion.identity, (Transform)null, 1f, -1, default(ZDOID));
			}
			return false;
		}

		[HarmonyPrefix]
		[HarmonyPatch(typeof(InventoryGui), "Hide")]
		[HarmonyPriority(800)]
		private static void InventoryGui_Hide(InventoryGui __instance)
		{
			DestroyContainer();
		}

		[HarmonyPrefix]
		[HarmonyPatch(typeof(InventoryGui), "CloseContainer")]
		[HarmonyPriority(800)]
		private static void InventoryGui_CloseContainer(InventoryGui __instance)
		{
			DestroyContainer();
		}

		[HarmonyPrefix]
		[HarmonyPatch(typeof(InventoryGui), "OnSelectedItem")]
		private static void InventoryGui_OnSelectedItem_Prefix(InventoryGui __instance, InventoryGrid grid, ItemData? item, Modifier mod, Vector2i pos, ref bool __runOriginal, ref VirtualInventory? __state)
		{
			//IL_000f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0010: Unknown result type (might be due to invalid IL or missing references)
			if (TryGetOpened(out __state) && !__state.OnSelectedItemBefore(__instance, grid, item, mod, pos))
			{
				__runOriginal = false;
			}
		}

		[HarmonyPostfix]
		[HarmonyPatch(typeof(InventoryGui), "OnSelectedItem")]
		private static void InventoryGui_OnSelectedItem_Postfix(InventoryGui __instance, InventoryGrid grid, ItemData? item, Modifier mod, Vector2i pos, VirtualInventory? __state)
		{
			//IL_000e: Unknown result type (might be due to invalid IL or missing references)
			//IL_000f: Unknown result type (might be due to invalid IL or missing references)
			if (Object.op_Implicit((Object)(object)__state))
			{
				__state.OnSelectedItemAfter(__instance, grid, item, mod, pos);
			}
		}

		[HarmonyPrefix]
		[HarmonyPatch(typeof(InventoryGui), "OnDropOutside")]
		private static void InventoryGui_OnDropOutside_Prefix(InventoryGui __instance, ref bool __runOriginal, ref VirtualInventory? __state)
		{
			if (TryGetOpened(out __state) && !__state.OnDropOutsideBefore(__instance))
			{
				__runOriginal = false;
			}
		}

		[HarmonyPostfix]
		[HarmonyPatch(typeof(InventoryGui), "OnDropOutside")]
		private static void InventoryGui_OnDropOutside_Postfix(InventoryGui __instance, VirtualInventory __state)
		{
			if (Object.op_Implicit((Object)(object)__state))
			{
				__state.OnDropOutsideAfter(__instance);
			}
		}

		[HarmonyPrefix]
		[HarmonyPatch(typeof(Localization), "Localize", new Type[] { typeof(string) })]
		private static void Localization_Localize(ref string text)
		{
			if ((Object.op_Implicit((Object)(object)_opened) || IsRecentlyClosed) && _stackAllButtonLabel != null)
			{
				text = text.Replace("$inventory_stackall", _stackAllButtonLabel);
			}
		}
	}

	private static class RPC
	{
		public static void Register()
		{
			ZRoutedRpc.instance.Register<ZDOID>("RPC_VirtualInventoryRequest", (Action<long, ZDOID>)RPC_VirtualInventoryRequest);
			ZRoutedRpc.instance.Register<ZDOID, bool>("RPC_VirtualInventoryResponse", (Action<long, ZDOID, bool>)RPC_VirtualInventoryResponse);
		}

		public static void Unregister()
		{
			ZRoutedRpc.instance.Unregister("RPC_VirtualInventoryRequest");
			ZRoutedRpc.instance.Unregister("RPC_VirtualInventoryResponse");
		}

		public static void InvokeRequestOpen(VirtualInventory vi)
		{
			//IL_003b: Unknown result type (might be due to invalid IL or missing references)
			ZNetView zNetView = vi.GetZNetView();
			if (!zNetView.IsValid())
			{
				Logging<ModLib>.Warning("ZNetView is not valid, aborting request to open VirtualInventory");
				return;
			}
			ZDO zDO = zNetView.GetZDO();
			ZRoutedRpc.instance.InvokeRoutedRPC(zDO.GetOwner(), "RPC_VirtualInventoryRequest", new object[1] { zDO.m_uid });
		}

		private static void RPC_VirtualInventoryRequest(long sender, ZDOID zid)
		{
			//IL_0005: Unknown result type (might be due to invalid IL or missing references)
			//IL_00eb: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ac: Unknown result type (might be due to invalid IL or missing references)
			ZDO zDO = ZDOMan.instance.GetZDO(zid);
			if (zDO == null)
			{
				return;
			}
			ZNetView val = ZNetScene.instance.FindInstance(zDO);
			if (!Object.op_Implicit((Object)(object)val))
			{
				return;
			}
			bool flag = IsOpenedFrom(((Component)val).gameObject, out VirtualInventory vi);
			Logging<ModLib>.InterpolatedString msg = new Logging<ModLib>.InterpolatedString(33, 3, out var shouldAppend);
			if (shouldAppend)
			{
				msg.AppendLiteral("Requesting ");
				msg.AppendFormatted("VirtualInventory");
				msg.AppendLiteral(" open from ");
				msg.AppendFormatted(((Object)val).name);
				msg.AppendLiteral(", isUsing? ");
				msg.AppendFormatted(flag);
			}
			Logging<ModLib>.Info(msg);
			if (Object.op_Implicit((Object)(object)vi) && !vi.IsOwnerRequired)
			{
				Logging<ModLib>.Info("Ownership not required.");
				SendResponse(sender, zid, isGranted: true);
				return;
			}
			if (!flag)
			{
				msg = new Logging<ModLib>.InterpolatedString(34, 1, out shouldAppend);
				if (shouldAppend)
				{
					msg.AppendLiteral("Assigning ZDO owner to requester: ");
					msg.AppendFormatted(sender);
				}
				Logging<ModLib>.Info(msg);
				zDO.SetOwner(sender);
			}
			SendResponse(sender, zid, !flag);
			static void SendResponse(long target, ZDOID val2, bool isGranted)
			{
				//IL_003c: Unknown result type (might be due to invalid IL or missing references)
				Logging<ModLib>.InterpolatedString msg2 = new Logging<ModLib>.InterpolatedString(32, 1, out var shouldAppend2);
				if (shouldAppend2)
				{
					msg2.AppendLiteral("Response permission is granted? ");
					msg2.AppendFormatted(isGranted);
				}
				Logging<ModLib>.Info(msg2);
				ZRoutedRpc.instance.InvokeRoutedRPC(target, "RPC_VirtualInventoryResponse", new object[2] { val2, isGranted });
			}
		}

		private static void RPC_VirtualInventoryResponse(long sender, ZDOID zid, bool isGranted)
		{
			//IL_0005: Unknown result type (might be due to invalid IL or missing references)
			GameObject val = ZNetScene.instance.FindInstance(zid);
			if (Object.op_Implicit((Object)(object)val))
			{
				OpenContainer(val, isGranted);
			}
		}
	}

	private static VirtualContainer? _virtualContainer;

	private static VirtualInventory? _opened;

	private static double _closeTime;

	public const float CloseCooldown = 0.5f;

	private bool _isRefreshInventory;

	private static string? _stackAllButtonLabel;

	public bool IsOpen => (Object)(object)_opened == (Object)(object)this;

	public bool IsEmpty => Inventory.NrOfItems() == 0;

	protected virtual bool IsOwnerRequired => true;

	public static bool IsRecentlyClosed => Time.timeAsDouble < _closeTime + 0.5;

	protected virtual string? StackAllButtonLabel => null;

	protected abstract Inventory Inventory { get; }

	public static bool IsOpened<T>() where T : VirtualInventory
	{
		T opened;
		return TryGetOpened(out opened);
	}

	public static bool IsOpenedFrom(GameObject target)
	{
		VirtualInventory vi;
		return IsOpenedFrom(target, out vi);
	}

	public static bool IsOpenedFrom(GameObject target, out VirtualInventory vi)
	{
		if (!Object.op_Implicit((Object)(object)(vi = null)))
		{
			if (Object.op_Implicit((Object)(object)_opened) && target.TryGetComponent<VirtualInventory>(ref vi))
			{
				return vi.IsOpen;
			}
			return false;
		}
		return true;
	}

	public bool IsInventory(Inventory otherInv)
	{
		return otherInv == Inventory;
	}

	protected abstract void LoadInventory();

	protected abstract bool OnHoldToStack();

	protected abstract bool IsWarded();

	protected abstract bool IsStackAllButtonVisible();

	protected abstract bool IsAddItemValid(ItemData item);

	protected abstract ZNetView GetZNetView();

	public virtual void ClearInventory()
	{
		Inventory.m_inventory.Clear();
	}

	public virtual void RefreshInventory()
	{
		Action onChanged = Inventory.m_onChanged;
		Inventory.m_onChanged = null;
		try
		{
			_isRefreshInventory = true;
			ClearInventory();
			LoadInventory();
		}
		finally
		{
			Inventory.m_onChanged = onChanged;
			Inventory.Changed(false, false);
			_isRefreshInventory = false;
		}
	}

	internal static void Init()
	{
		RPC.Register();
	}

	internal static void Shutdown()
	{
		RPC.Unregister();
		DestroyContainer();
	}

	protected virtual void Awake()
	{
		Inventory inventory = Inventory;
		inventory.m_onChanged = (Action)Delegate.Combine(inventory.m_onChanged, new Action(OnInventoryChanged));
	}

	private static bool TryGetOpened(out VirtualInventory opened)
	{
		return VirtualInventory.TryGetOpened<VirtualInventory>(out opened);
	}

	public static bool TryGetOpened<T>(out T opened) where T : VirtualInventory
	{
		if (_opened is T val)
		{
			opened = val;
			return true;
		}
		opened = null;
		return false;
	}

	protected virtual void OnOpenAllow()
	{
	}

	protected virtual void OnOpenDeny()
	{
	}

	protected virtual void OnClose()
	{
	}

	protected virtual void OnMoveItemDenied(ItemData? item)
	{
		if (Object.op_Implicit((Object)(object)Player.m_localPlayer))
		{
			Piece component = ((Component)((Component)this).transform.root).GetComponent<Piece>();
			string text = ((Object.op_Implicit((Object)(object)component) && item != null) ? "$msg_cantuseon".Localize(item.GetName(), component.m_name) : "$msg_cantdrop");
			((Character)Player.m_localPlayer).Message((MessageType)2, text, 0, (Sprite)null, false);
		}
	}

	protected void RequestOpen()
	{
		if (IsWarded() && !((MonoBehaviour)(object)this).CanAccessWard(flash: true))
		{
			OnOpenDeny();
			return;
		}
		if (!ZenMod<ModLib>.IsOnServerAndAllClients)
		{
			GetZNetView().ClaimOwnership();
		}
		RPC.InvokeRequestOpen(this);
	}

	public static bool TryRequestOpenFrom(GameObject gameObject)
	{
		VirtualInventory virtualInventory = default;
		if (!gameObject.TryGetComponent<VirtualInventory>(ref virtualInventory))
		{
			return false;
		}
		virtualInventory.RequestOpen();
		return true;
	}

	private void OpenContainer(bool isGranted)
	{
		if (!isGranted)
		{
			((Character)Player.m_localPlayer).Message((MessageType)2, "$msg_inuse", 0, (Sprite)null, false);
			OnOpenDeny();
			return;
		}
		_opened = this;
		RefreshInventory();
		InventoryGui.instance.Show((Container)(object)CreateContainer(), 1);
		UpdateStackAllButtonVisibility();
		OnOpenAllow();
	}

	private static void OpenContainer(GameObject gameObject, bool isGranted)
	{
		//IL_000f: Unknown result type (might be due to invalid IL or missing references)
		VirtualInventory virtualInventory = default;
		if (!gameObject.TryGetComponent<VirtualInventory>(ref virtualInventory))
		{
			throw new MissingComponentException("VirtualInventory");
		}
		virtualInventory.OpenContainer(isGranted);
	}

	public static void Close()
	{
		if (Object.op_Implicit((Object)(object)_opened) && Object.op_Implicit((Object)(object)InventoryGui.instance) && InventoryGui.instance.IsContainerOpen())
		{
			InventoryGui.instance.CloseContainer();
		}
	}

	private VirtualContainer CreateContainer()
	{
		//IL_0011: Unknown result type (might be due to invalid IL or missing references)
		//IL_0016: Unknown result type (might be due to invalid IL or missing references)
		if (!Object.op_Implicit((Object)(object)_virtualContainer))
		{
			GameObject val = new GameObject("ZenVirtualContainer");
			val.SetActive(false);
			_virtualContainer = val.AddComponent<VirtualContainer>();
		}
		Inventory inventory = Inventory;
		((Container)_virtualContainer).m_name = inventory.m_name;
		((Container)_virtualContainer).m_width = inventory.m_width;
		((Container)_virtualContainer).m_height = inventory.m_height;
		((Container)_virtualContainer).m_inventory = inventory;
		((Component)_virtualContainer).transform.SetParent(((Component)this).transform, false);
		return _virtualContainer;
	}

	private static void DestroyContainer()
	{
		if (Object.op_Implicit((Object)(object)_opened))
		{
			_closeTime = Time.timeAsDouble;
			_opened.OnClose();
			_opened = null;
		}
		if (Object.op_Implicit((Object)(object)_virtualContainer))
		{
			Object.Destroy((Object)(object)((Component)_virtualContainer).gameObject);
		}
	}

	private void OnInventoryChanged()
	{
		UpdateStackAllButtonVisibility();
	}

	private void UpdateStackAllButtonVisibility()
	{
		_stackAllButtonLabel = StackAllButtonLabel;
		InventoryGui.instance.ShowStackAllButton(IsStackAllButtonVisible());
	}

	protected virtual bool OnSelectedItemBefore(InventoryGui gui, InventoryGrid grid, ItemData? item, Modifier mod, Vector2i pos)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_0004: Unknown result type (might be due to invalid IL or missing references)
		//IL_0007: Invalid comparison between Unknown and I4
		if ((int)mod != 0)
		{
			if ((int)mod != 2)
			{
				return true;
			}
			if ((Object)(object)grid == (Object)(object)gui.ContainerGrid)
			{
				return true;
			}
			if ((Object)(object)grid == (Object)(object)gui.m_playerGrid && item != null && IsAddItemValid(item))
			{
				return true;
			}
		}
		else
		{
			Inventory inventory = grid.GetInventory();
			Inventory dragInventory = gui.m_dragInventory;
			ItemData dragItem = gui.m_dragItem;
			if (dragItem == null)
			{
				return true;
			}
			if (inventory == dragInventory)
			{
				return true;
			}
			if (inventory == ((Humanoid)Player.m_localPlayer).GetInventory())
			{
				return true;
			}
			if (IsAddItemValid(dragItem))
			{
				return true;
			}
		}
		OnMoveItemDenied(gui.m_dragItem ?? item);
		gui.SetupDragItem((ItemData)null, (Inventory)null, 0);
		return false;
	}

	protected virtual void OnSelectedItemAfter(InventoryGui gui, InventoryGrid grid, ItemData? item, Modifier mod, Vector2i pos)
	{
	}

	protected virtual bool OnDropOutsideBefore(InventoryGui gui)
	{
		return true;
	}

	protected virtual void OnDropOutsideAfter(InventoryGui gui)
	{
	}

	protected virtual string? GetStackButtonLabel()
	{
		return null;
	}
}
