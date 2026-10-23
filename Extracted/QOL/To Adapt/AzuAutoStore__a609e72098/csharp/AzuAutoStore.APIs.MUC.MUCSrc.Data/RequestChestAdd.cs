using System.Runtime.CompilerServices;
using AzuAutoStore.APIs.MUC.MUCSrc.Helper;
using UnityEngine;

namespace AzuAutoStore.APIs.MUC.MUCSrc.Data;

[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
public class RequestChestAdd : IRequest, IPackage
{
	public readonly Vector2i toPos;

	public readonly ItemData dragItem;

	public readonly bool allowSwitch;

	public int RequestID { get; set; }

	public Inventory SourceInventory { get; }

	public Inventory TargetInventory { get; }

	public RequestChestAdd(Vector2i toPos, int dragAmount, ItemData dragItem, Inventory sourceInventory, Inventory targetInventory)
	{
		//IL_0007: Unknown result type (might be due to invalid IL or missing references)
		//IL_0008: Unknown result type (might be due to invalid IL or missing references)
		this.toPos = toPos;
		if (dragItem != null)
		{
			this.dragItem = dragItem.Clone();
			this.dragItem.m_stack = Mathf.Min(dragAmount, this.dragItem.m_stack);
			allowSwitch = dragAmount == dragItem.m_stack;
		}
		SourceInventory = sourceInventory;
		TargetInventory = targetInventory;
	}

	public RequestChestAdd(ZPackage package)
	{
		//IL_0014: Unknown result type (might be due to invalid IL or missing references)
		//IL_0019: Unknown result type (might be due to invalid IL or missing references)
		RequestID = package.ReadInt();
		toPos = package.ReadVector2i();
		dragItem = InventoryHelper.LoadItemFromPackage(package);
		allowSwitch = package.ReadBool();
	}

	public ZPackage WriteToPackage()
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_0006: Expected Obj, but got Unknown
		//IL_0014: Unknown result type (might be due to invalid IL or missing references)
		ZPackage val = new ZPackage();
		val.Write(RequestID);
		val.Write(toPos);
		InventoryHelper.WriteItemToPackage(dragItem, val);
		val.Write(allowSwitch);
		return val;
	}
}
