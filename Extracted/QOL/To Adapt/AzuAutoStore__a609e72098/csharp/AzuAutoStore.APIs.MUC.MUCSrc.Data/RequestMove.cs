using System.Runtime.CompilerServices;
using AzuAutoStore.APIs.MUC.MUCSrc.Helper;

namespace AzuAutoStore.APIs.MUC.MUCSrc.Data;

[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
public class RequestMove : IRequest, IPackage
{
	public readonly Vector2i fromPos;

	public readonly Vector2i toPos;

	public readonly int itemHash;

	public readonly int dragAmount;

	public readonly ItemData item;

	public int RequestID { get; set; }

	public Inventory SourceInventory { get; }

	public Inventory TargetInventory { get; }

	public RequestMove(ItemData itemToMove, Vector2i toPos, int dragAmount, Inventory inventory)
	{
		//IL_004e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0053: Unknown result type (might be due to invalid IL or missing references)
		//IL_0059: Unknown result type (might be due to invalid IL or missing references)
		//IL_005a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0016: Unknown result type (might be due to invalid IL or missing references)
		//IL_001b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0023: Unknown result type (might be due to invalid IL or missing references)
		//IL_0028: Unknown result type (might be due to invalid IL or missing references)
		if (itemToMove == null)
		{
			Log.LogWarning("Item is null");
			fromPos = new Vector2i(-1, -1);
			this.toPos = new Vector2i(-1, -1);
			itemHash = 0;
			this.dragAmount = 0;
		}
		else
		{
			SourceInventory = inventory;
			TargetInventory = inventory;
			fromPos = itemToMove.m_gridPos;
			this.toPos = toPos;
			itemHash = StringExtensionMethods.GetStableHashCode(itemToMove.PrefabName());
			item = itemToMove.Clone();
			this.dragAmount = dragAmount;
		}
	}

	public RequestMove(ZPackage package)
	{
		//IL_0014: Unknown result type (might be due to invalid IL or missing references)
		//IL_0019: Unknown result type (might be due to invalid IL or missing references)
		//IL_0020: Unknown result type (might be due to invalid IL or missing references)
		//IL_0025: Unknown result type (might be due to invalid IL or missing references)
		RequestID = package.ReadInt();
		fromPos = package.ReadVector2i();
		toPos = package.ReadVector2i();
		itemHash = package.ReadInt();
		dragAmount = package.ReadInt();
	}

	public ZPackage WriteToPackage()
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_0005: Unknown result type (might be due to invalid IL or missing references)
		//IL_0011: Unknown result type (might be due to invalid IL or missing references)
		//IL_0013: Unknown result type (might be due to invalid IL or missing references)
		//IL_001d: Unknown result type (might be due to invalid IL or missing references)
		//IL_001f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0029: Unknown result type (might be due to invalid IL or missing references)
		//IL_0035: Unknown result type (might be due to invalid IL or missing references)
		//IL_0042: Expected Obj, but got Unknown
		ZPackage val = new ZPackage();
		val.Write(RequestID);
		val.Write(fromPos);
		val.Write(toPos);
		val.Write(itemHash);
		val.Write(dragAmount);
		return val;
	}
}
