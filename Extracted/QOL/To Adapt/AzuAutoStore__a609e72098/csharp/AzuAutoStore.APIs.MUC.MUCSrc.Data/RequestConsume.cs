using System.Runtime.CompilerServices;

namespace AzuAutoStore.APIs.MUC.MUCSrc.Data;

[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
public class RequestConsume : IPackage
{
	public readonly int itemPosX;

	public readonly int itemPosY;

	public RequestConsume(ItemData item)
	{
		itemPosX = item.m_gridPos.x;
		itemPosY = item.m_gridPos.y;
	}

	public RequestConsume(ZPackage package)
	{
		itemPosX = package.ReadInt();
		itemPosY = package.ReadInt();
	}

	public ZPackage WriteToPackage()
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_0005: Unknown result type (might be due to invalid IL or missing references)
		//IL_0011: Unknown result type (might be due to invalid IL or missing references)
		//IL_001e: Expected Obj, but got Unknown
		ZPackage val = new ZPackage();
		val.Write(itemPosX);
		val.Write(itemPosY);
		return val;
	}
}
