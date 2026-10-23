using System.Runtime.CompilerServices;
using AzuAutoStore.APIs.MUC.MUCSrc.Helper;

namespace AzuAutoStore.APIs.MUC.MUCSrc.Data;

[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
public class RequestConsumeResponse : IPackage, IResponse
{
	public readonly ItemData item;

	public int SourceID { get; set; }

	public bool Success { get; set; }

	public int Amount { get; set; }

	public RequestConsumeResponse(ZPackage package)
	{
		item = InventoryHelper.LoadItemFromPackage(package);
		Success = package.ReadBool();
		Amount = package.ReadInt();
	}

	public RequestConsumeResponse(ItemData item, bool success, int amount)
	{
		this.item = item.ClampStackSize();
		Success = success;
		Amount = amount;
	}

	public RequestConsumeResponse()
	{
		item = null;
	}

	public ZPackage WriteToPackage()
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_0006: Expected Obj, but got Unknown
		ZPackage val = new ZPackage();
		InventoryHelper.WriteItemToPackage(item, val);
		val.Write(Success);
		val.Write(Amount);
		return val;
	}
}
