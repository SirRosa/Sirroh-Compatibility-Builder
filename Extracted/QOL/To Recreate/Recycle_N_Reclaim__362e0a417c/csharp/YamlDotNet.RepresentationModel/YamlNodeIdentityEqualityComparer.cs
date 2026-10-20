using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Runtime.CompilerServices;

namespace YamlDotNet.RepresentationModel;

[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
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
