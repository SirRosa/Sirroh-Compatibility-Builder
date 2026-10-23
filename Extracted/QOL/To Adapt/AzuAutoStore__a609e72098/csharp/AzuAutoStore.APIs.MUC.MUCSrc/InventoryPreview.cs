using System;
using System.Collections;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using AzuAutoStore.APIs.MUC.MUCSrc.Data;
using AzuAutoStore.APIs.MUC.MUCSrc.Helper;
using BepInEx;
using UnityEngine;

namespace AzuAutoStore.APIs.MUC.MUCSrc;

[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
public static class InventoryPreview
{
	public static readonly ConditionalWeakTable<Inventory, List<IRequest>> PackageChanges = new ConditionalWeakTable<Inventory, List<IRequest>>();

	public static readonly ConditionalWeakTable<Inventory, List<IRequest>> ToRemovePackages = new ConditionalWeakTable<Inventory, List<IRequest>>();

	private static WaitForSeconds removeQueuedPackagesDelay = new WaitForSeconds(0.2f);

	private static WaitForSeconds removeSucceededPackagesDelay = new WaitForSeconds(2f);

	private const float PreviewTimeout = 15f;

	public static void AddPackage(IRequest package)
	{
		package.RequestID = PackageHandler.AddPackage(package);
		AppendPackage(package.SourceInventory, package);
		AppendPackage(package.TargetInventory, package);
	}

	private static void AppendPackage(Inventory inventory, IRequest package)
	{
		if (PackageChanges.TryGetValue(inventory, out var value))
		{
			if (!value.Contains(package))
			{
				value.Add(package);
			}
			Log.LogDebug($"InventoryPreview: Appended package {package.RequestID} to inventory {inventory.m_name}, total packages: {value.Count}");
			return;
		}
		PackageChanges.Add(inventory, new List<IRequest> { package });
		Inventory val = inventory;
		val.m_onChanged = (Action)Delegate.Combine(val.m_onChanged, (Action)(() =>
		{
			RemoveQueuedPackages(inventory);
		}));
		Log.LogDebug($"InventoryPreview: Added package {package.RequestID} to inventory {inventory.m_name}, total packages: 1 (new)");
	}

	public static void RemovePackage(IResponse package)
	{
		RemovePackage(InventoryHandler.GetSourceInventory(package.SourceID), package);
		RemovePackage(InventoryHandler.GetTargetInventory(package.SourceID), package);
		PackageHandler.RemovePackage(package.SourceID);
	}

	private static void RemovePackage(Inventory inventory, IResponse package)
	{
		if (inventory == null)
		{
			return;
		}
		InventoryOwner owner = InventoryOwner.GetOwner(inventory);
		IRequest request = null;
		if (PackageChanges.TryGetValue(inventory, out var value))
		{
			request = value.Find((IRequest p) => p.RequestID == package.SourceID);
		}
		if (request != null)
		{
			if (ToRemovePackages.TryGetValue(inventory, out var value2))
			{
				value2.Add(request);
			}
			else
			{
				ToRemovePackages.Add(inventory, new List<IRequest> { request });
			}
			if (owner != null && owner.IsValid() && owner.ZNetView.IsOwner())
			{
				RemoveQueuedPackages(inventory);
			}
			else
			{
				((MonoBehaviour)ThreadingHelper.Instance).StartCoroutine(RemoveQueuedPackagesDelayed(inventory, package.Success ? removeSucceededPackagesDelay : removeQueuedPackagesDelay));
			}
		}
	}

	private static void RemoveQueuedPackages(Inventory inventory)
	{
		if (!ToRemovePackages.TryGetValue(inventory, out var value) || value.Count <= 0)
		{
			return;
		}
		foreach (IRequest item in new List<IRequest>(value))
		{
			if (PackageChanges.TryGetValue(inventory, out var value2))
			{
				value2.Remove(item);
			}
			value.Remove(item);
			Log.LogDebug($"InventoryPreview: Removed package {item.RequestID} from inventory {inventory.m_name}, total packages: {value.Count}");
		}
	}

	private static IEnumerator RemoveQueuedPackagesDelayed(Inventory inventory, WaitForSeconds delay)
	{
		yield return delay;
		RemoveQueuedPackages(inventory);
	}

	private static bool IsAbandoned(Inventory inventory, IRequest package)
	{
		if (ToRemovePackages.TryGetValue(inventory, out var value) && value.Contains(package))
		{
			return false;
		}
		return PackageHandler.AgeOf(package.RequestID) >= 15f;
	}

	public static bool GetChanges(Inventory inventory, out SlotPreview preview)
	{
		//IL_011d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0122: Unknown result type (might be due to invalid IL or missing references)
		//IL_0126: Unknown result type (might be due to invalid IL or missing references)
		//IL_012b: Unknown result type (might be due to invalid IL or missing references)
		//IL_01a2: Unknown result type (might be due to invalid IL or missing references)
		//IL_013d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0154: Unknown result type (might be due to invalid IL or missing references)
		//IL_0175: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c8: Unknown result type (might be due to invalid IL or missing references)
		//IL_00e9: Unknown result type (might be due to invalid IL or missing references)
		//IL_00f9: Unknown result type (might be due to invalid IL or missing references)
		//IL_02e9: Unknown result type (might be due to invalid IL or missing references)
		//IL_0300: Unknown result type (might be due to invalid IL or missing references)
		//IL_024c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0268: Unknown result type (might be due to invalid IL or missing references)
		//IL_027f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0296: Unknown result type (might be due to invalid IL or missing references)
		if (inventory == null)
		{
			preview = null;
			return false;
		}
		if (PackageChanges.TryGetValue(inventory, out var value))
		{
			value.RemoveAll((IRequest p) => IsAbandoned(inventory, p));
			preview = new SlotPreview(inventory);
			foreach (IRequest item3 in value)
			{
				if (item3 is RequestChestAdd requestChestAdd)
				{
					if (requestChestAdd.dragItem != null)
					{
						ItemData item = null;
						if (requestChestAdd.allowSwitch)
						{
							item = item3.TargetInventory.GetItemAt(requestChestAdd.toPos.x, requestChestAdd.toPos.y);
						}
						if (inventory == item3.SourceInventory)
						{
							preview.Add(requestChestAdd.dragItem.m_gridPos, item);
						}
						if (inventory == item3.TargetInventory)
						{
							preview.Remove(requestChestAdd.toPos, item);
							preview.Add(requestChestAdd.toPos, requestChestAdd.dragItem);
						}
					}
				}
				else if (item3 is RequestChestRemove { fromPos: var fromPos, toPos: var toPos } requestChestRemove)
				{
					if (inventory == item3.SourceInventory)
					{
						preview.Remove(fromPos, requestChestRemove.item, requestChestRemove.dragAmount);
						preview.Add(fromPos, requestChestRemove.switchItem);
					}
					if (inventory == item3.TargetInventory)
					{
						preview.Add(toPos, requestChestRemove.item, requestChestRemove.dragAmount);
					}
				}
				else
				{
					if (!(item3 is RequestMove requestMove) || (preview.GetSlot(requestMove.fromPos, out var item2) && requestMove.itemHash != ((item2 != null) ? new int?(StringExtensionMethods.GetStableHashCode(item2.PrefabName())) : ((int?)null))))
					{
						continue;
					}
					ItemData itemAt = requestMove.TargetInventory.GetItemAt(requestMove.toPos.x, requestMove.toPos.y);
					if (itemAt != null && !InventoryHelper.CanStack(requestMove.item, itemAt))
					{
						if (requestMove.dragAmount == requestMove.item.m_stack)
						{
							preview.Remove(requestMove.fromPos, requestMove.item, requestMove.dragAmount);
							preview.Remove(requestMove.toPos, itemAt, itemAt.m_stack);
							preview.Add(requestMove.fromPos, itemAt, itemAt.m_stack);
							preview.Add(requestMove.toPos, requestMove.item, requestMove.dragAmount);
						}
					}
					else
					{
						int amount = Mathf.Max(0, requestMove.dragAmount);
						if (itemAt != null)
						{
							amount = Mathf.Min(itemAt.m_shared.m_maxStackSize - itemAt.m_stack, requestMove.dragAmount);
						}
						preview.Remove(requestMove.fromPos, requestMove.item, amount);
						preview.Add(requestMove.toPos, requestMove.item, amount);
					}
				}
			}
			return preview.HasChanges();
		}
		preview = null;
		return false;
	}

	static InventoryPreview()
	{
		//IL_0019: Unknown result type (might be due to invalid IL or missing references)
		//IL_0023: Expected Obj, but got Unknown
		//IL_0028: Unknown result type (might be due to invalid IL or missing references)
		//IL_0032: Expected Obj, but got Unknown
	}
}
