using System.Runtime.CompilerServices;

namespace AzuAutoStore.APIs.MUC.MUCSrc.Data;

public class RequestMoveResponse : IPackage, IResponse
{
	public int SourceID { get; set; }

	public bool Success { get; set; }

	public int Amount { get; set; }

	public RequestMoveResponse(int sourceID, bool success, int amount)
	{
		SourceID = sourceID;
		Success = success;
		Amount = amount;
	}

	public RequestMoveResponse()
	{
		SourceID = 0;
		Success = false;
		Amount = 0;
	}

	[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
	public RequestMoveResponse(ZPackage package)
	{
		SourceID = package.ReadInt();
		Success = package.ReadBool();
		Amount = package.ReadInt();
	}

	[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
	public ZPackage WriteToPackage()
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_0005: Unknown result type (might be due to invalid IL or missing references)
		//IL_0011: Unknown result type (might be due to invalid IL or missing references)
		//IL_001d: Unknown result type (might be due to invalid IL or missing references)
		//IL_002a: Expected Obj, but got Unknown
		ZPackage val = new ZPackage();
		val.Write(SourceID);
		val.Write(Success);
		val.Write(Amount);
		return val;
	}
}
