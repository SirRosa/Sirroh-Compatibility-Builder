using System.Reflection;
using System.Runtime.CompilerServices;

namespace YamlDotNet;

internal static class PropertyInfoExtensions
{
	[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
	[return: _003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)]
	public static object ReadValue(this PropertyInfo property, object target)
	{
		return property.GetValue(target, null);
	}
}
