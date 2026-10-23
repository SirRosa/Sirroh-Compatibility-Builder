using System.Runtime.CompilerServices;

namespace AzuAutoStore.APIs.MUC.MUCSrc.Data;

public class RequestDrop : IPackage
{
	public readonly Vector2i targetContainerSlot;

	public readonly int amount;

	public readonly ZDOID sender;

	public RequestDrop(Vector2i targetContainerSlot, int amount, ZDOID sender)
	{
		//IL_0007: Unknown result type (might be due to invalid IL or missing references)
		//IL_0008: Unknown result type (might be due to invalid IL or missing references)
		//IL_0015: Unknown result type (might be due to invalid IL or missing references)
		//IL_0016: Unknown result type (might be due to invalid IL or missing references)
		this.targetContainerSlot = targetContainerSlot;
		this.amount = amount;
		this.sender = sender;
	}

	[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
	public RequestDrop(ZPackage package)
	{
		//IL_0008: Unknown result type (might be due to invalid IL or missing references)
		//IL_000d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0020: Unknown result type (might be due to invalid IL or missing references)
		//IL_0025: Unknown result type (might be due to invalid IL or missing references)
		targetContainerSlot = package.ReadVector2i();
		amount = package.ReadInt();
		sender = package.ReadZDOID();
	}

	[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
	public ZPackage WriteToPackage()
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_0005: Unknown result type (might be due to invalid IL or missing references)
		//IL_0007: Unknown result type (might be due to invalid IL or missing references)
		//IL_0011: Unknown result type (might be due to invalid IL or missing references)
		//IL_001d: Unknown result type (might be due to invalid IL or missing references)
		//IL_001f: Unknown result type (might be due to invalid IL or missing references)
		//IL_002a: Expected Obj, but got Unknown
		ZPackage val = new ZPackage();
		val.Write(targetContainerSlot);
		val.Write(amount);
		val.Write(sender);
		return val;
	}
}
