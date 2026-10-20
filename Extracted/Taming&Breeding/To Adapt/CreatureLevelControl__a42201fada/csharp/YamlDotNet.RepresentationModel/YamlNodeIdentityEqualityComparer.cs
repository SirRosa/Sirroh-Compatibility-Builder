using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Runtime.CompilerServices;

namespace YamlDotNet.RepresentationModel;

[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
internal sealed class YamlNodeIdentityEqualityComparer : IEqualityComparer<YamlNode>
{
	public bool Equals([AllowNull] YamlNode x, [AllowNull] YamlNode y)
	{
		return x == y;
	}

	public int GetHashCode(YamlNode obj)
	{
		return obj.GetHashCode();
	}
}
