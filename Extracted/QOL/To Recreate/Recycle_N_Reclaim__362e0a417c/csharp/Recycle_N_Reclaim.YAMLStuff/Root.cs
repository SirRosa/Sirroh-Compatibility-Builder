using System.Collections.Generic;
using System.Runtime.CompilerServices;
using YamlDotNet.Serialization;

namespace Recycle_N_Reclaim.YAMLStuff;

[_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(1)]
[_003Cc6ee30b4_002D1fc8_002D48a6_002Db646_002D32a3d54a7999_003ENullable(0)]
public class Root
{
	[YamlMember(Alias = "groups")]
	public Dictionary<string, List<string>> Groups { get; set; }

	[YamlMember(Alias = "containers")]
	public Dictionary<string, excludeContainer> Containers { get; set; }

	[YamlMember(Alias = "reclaiming")]
	public Reclaiming Reclaiming { get; set; }

	[YamlMember(Alias = "inventory")]
	public Inventory Inventory { get; set; }
}
