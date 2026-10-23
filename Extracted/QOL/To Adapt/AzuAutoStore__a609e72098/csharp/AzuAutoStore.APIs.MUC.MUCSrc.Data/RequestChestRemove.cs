using System.Runtime.CompilerServices;
using AzuAutoStore.APIs.MUC.MUCSrc.Helper;

namespace AzuAutoStore.APIs.MUC.MUCSrc.Data;

[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
public class RequestChestRemove : IRequest, IPackage
{
	public readonly Vector2i fromPos;

	public readonly Vector2i toPos;

	public readonly int dragAmount;

	public readonly ItemData switchItem;

	public readonly ItemData item;

	public int RequestID { get; set; }

	public Inventory SourceInventory { get; }

	public Inventory TargetInventory { get; }

	public RequestChestRemove(Vector2i fromPos, Vector2i toPos, int dragAmount, ItemData switchItem, Inventory sourceInventory, Inventory targetInventory)
	{
		//IL_0007: Unknown result type (might be due to invalid IL or missing references)
		//IL_0008: Unknown result type (might be due to invalid IL or missing references)
		//IL_000e: Unknown result type (might be due to invalid IL or missing references)
		//IL_000f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0049: Unknown result type (might be due to invalid IL or missing references)
		//IL_004f: Unknown result type (might be due to invalid IL or missing references)
		this.fromPos = fromPos;
		this.toPos = toPos;
		this.dragAmount = dragAmount;
		this.switchItem = ((switchItem != null) ? switchItem.Clone() : null);
		SourceInventory = sourceInventory;
		TargetInventory = targetInventory;
		object obj;
		if (sourceInventory == null)
		{
			obj = null;
		}
		else
		{
			ItemData itemAt = sourceInventory.GetItemAt(fromPos.x, fromPos.y);
			obj = ((itemAt != null) ? itemAt.Clone() : null);
		}
		item = (ItemData)obj;
	}

	public RequestChestRemove(ZPackage package)
	{
		//IL_0014: Unknown result type (might be due to invalid IL or missing references)
		//IL_0019: Unknown result type (might be due to invalid IL or missing references)
		//IL_0020: Unknown result type (might be due to invalid IL or missing references)
		//IL_0025: Unknown result type (might be due to invalid IL or missing references)
		RequestID = package.ReadInt();
		fromPos = package.ReadVector2i();
		toPos = package.ReadVector2i();
		dragAmount = package.ReadInt();
		switchItem = InventoryHelper.LoadItemFromPackage(package);
	}

	public ZPackage WriteToPackage()
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_0006: Expected Obj, but got Unknown
		//IL_0014: Unknown result type (might be due to invalid IL or missing references)
		//IL_0020: Unknown result type (might be due to invalid IL or missing references)
		ZPackage val = new ZPackage();
		val.Write(RequestID);
		val.Write(fromPos);
		val.Write(toPos);
		val.Write(dragAmount);
		InventoryHelper.WriteItemToPackage(switchItem, val);
		return val;
	}
}
