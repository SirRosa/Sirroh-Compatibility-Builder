using System.Runtime.CompilerServices;

namespace AzuAutoStore.APIs.MUC.MUCSrc;

[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
public class HumanoidInventoryOwner : InventoryOwner
{
	private readonly Inventory inventory;

	public Humanoid Humanoid { get; }

	public override ZNetView ZNetView => ((Character)Humanoid).m_nview;

	public override Inventory Inventory => inventory;

	public HumanoidInventoryOwner(Humanoid humanoid, Inventory inventory)
	{
		Humanoid = humanoid;
		this.inventory = inventory;
	}
}
