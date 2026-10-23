using System.Runtime.CompilerServices;
using AzuAutoStore.APIs.MUC.MUCSrc.Helper;

namespace AzuAutoStore.APIs.MUC.MUCSrc.Data;

[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
public class RequestChestAddResponse : IPackage, IResponse
{
	public Vector2i inventoryPos;

	public ItemData switchItem;

	public int SourceID { get; set; }

	public bool Success { get; set; }

	public int Amount { get; set; }

	public RequestChestAddResponse(int sourceID, bool success, Vector2i inventoryPos, int amount, ItemData switchItem)
	{
		//IL_001d: Unknown result type (might be due to invalid IL or missing references)
		//IL_001e: Unknown result type (might be due to invalid IL or missing references)
		SourceID = sourceID;
		Success = success;
		Amount = amount;
		this.inventoryPos = inventoryPos;
		this.switchItem = switchItem.ClampStackSize();
	}

	public RequestChestAddResponse(ZPackage package)
	{
		//IL_0014: Unknown result type (might be due to invalid IL or missing references)
		//IL_0019: Unknown result type (might be due to invalid IL or missing references)
		SourceID = package.ReadInt();
		inventoryPos = package.ReadVector2i();
		Success = package.ReadBool();
		Amount = package.ReadInt();
		switchItem = InventoryHelper.LoadItemFromPackage(package);
	}

	public RequestChestAddResponse()
	{
		//IL_0017: Unknown result type (might be due to invalid IL or missing references)
		//IL_001c: Unknown result type (might be due to invalid IL or missing references)
		SourceID = 0;
		Success = false;
		inventoryPos = new Vector2i(-1, -1);
		Amount = 0;
		switchItem = null;
	}

	public ZPackage WriteToPackage()
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_0006: Expected Obj, but got Unknown
		//IL_0014: Unknown result type (might be due to invalid IL or missing references)
		ZPackage val = new ZPackage();
		val.Write(SourceID);
		val.Write(inventoryPos);
		val.Write(Success);
		val.Write(Amount);
		InventoryHelper.WriteItemToPackage(switchItem, val);
		return val;
	}
}
