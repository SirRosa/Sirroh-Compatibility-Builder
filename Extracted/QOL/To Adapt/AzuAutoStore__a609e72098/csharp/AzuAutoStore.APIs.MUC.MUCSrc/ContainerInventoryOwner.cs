using System.Runtime.CompilerServices;
using AzuAutoStore.APIs.MUC.MUCSrc.Patches.Compatibility;

namespace AzuAutoStore.APIs.MUC.MUCSrc;

[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
public class ContainerInventoryOwner : InventoryOwner
{
	public Container Container { get; }

	public bool IsItemDrawer { get; }

	public override ZNetView ZNetView => Container.m_nview;

	public override Inventory Inventory => Container.GetInventory();

	public ContainerInventoryOwner(Container container)
	{
		Container = container;
		IsItemDrawer = ItemDrawerCompat.IsItemDrawer(Container);
	}
}
