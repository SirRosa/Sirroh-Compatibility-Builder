using System.Runtime.CompilerServices;
using AzuAutoStore.APIs.MUC.MUCSrc.Helper;

namespace AzuAutoStore.APIs.MUC.MUCSrc.Data;

[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
public class RequestDropResponse : IPackage, IResponse
{
	public readonly ItemData responseItem;

	public readonly ZDOID sender;

	public int SourceID { get; set; }

	public bool Success { get; set; }

	public int Amount { get; set; }

	public RequestDropResponse(ItemData responseItem, ZDOID sender, bool success, int amount)
	{
		//IL_0013: Unknown result type (might be due to invalid IL or missing references)
		//IL_0014: Unknown result type (might be due to invalid IL or missing references)
		this.responseItem = responseItem.ClampStackSize();
		this.sender = sender;
		Success = success;
		Amount = amount;
	}

	public RequestDropResponse(ZPackage package)
	{
		//IL_0014: Unknown result type (might be due to invalid IL or missing references)
		//IL_0019: Unknown result type (might be due to invalid IL or missing references)
		responseItem = InventoryHelper.LoadItemFromPackage(package);
		sender = package.ReadZDOID();
		Success = package.ReadBool();
		Amount = package.ReadInt();
	}

	public RequestDropResponse()
	{
		responseItem = null;
	}

	public ZPackage WriteToPackage()
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_0006: Expected Obj, but got Unknown
		//IL_0014: Unknown result type (might be due to invalid IL or missing references)
		ZPackage val = new ZPackage();
		InventoryHelper.WriteItemToPackage(responseItem, val);
		val.Write(sender);
		val.Write(Success);
		val.Write(Amount);
		return val;
	}
}
