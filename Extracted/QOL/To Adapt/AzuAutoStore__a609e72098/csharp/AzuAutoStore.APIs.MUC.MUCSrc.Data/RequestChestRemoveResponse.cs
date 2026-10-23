using System.Runtime.CompilerServices;
using AzuAutoStore.APIs.MUC.MUCSrc.Helper;

namespace AzuAutoStore.APIs.MUC.MUCSrc.Data;

[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
public class RequestChestRemoveResponse : IPackage, IResponse
{
	public ItemData responseItem;

	public bool hasSwitched;

	public int SourceID { get; set; }

	public bool Success { get; set; }

	public int Amount { get; set; }

	public RequestChestRemoveResponse(int sourceID, bool success, int amount, bool hasSwitched, ItemData responseItem)
	{
		SourceID = sourceID;
		Success = success;
		Amount = amount;
		this.hasSwitched = hasSwitched;
		this.responseItem = responseItem.ClampStackSize();
	}

	public RequestChestRemoveResponse(ZPackage package)
	{
		SourceID = package.ReadInt();
		Success = package.ReadBool();
		Amount = package.ReadInt();
		hasSwitched = package.ReadBool();
		responseItem = InventoryHelper.LoadItemFromPackage(package);
	}

	public RequestChestRemoveResponse()
	{
		Success = false;
		Amount = 0;
		hasSwitched = false;
		responseItem = null;
	}

	public ZPackage WriteToPackage()
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_0006: Expected Obj, but got Unknown
		ZPackage val = new ZPackage();
		val.Write(SourceID);
		val.Write(Success);
		val.Write(Amount);
		val.Write(hasSwitched);
		InventoryHelper.WriteItemToPackage(responseItem, val);
		return val;
	}
}
