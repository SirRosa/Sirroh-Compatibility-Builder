using System.Reflection;
using System.Runtime.CompilerServices;

namespace YamlDotNet;

internal static class PropertyInfoExtensions
{
	[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
	[return: _003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)]
	public static object ReadValue(this PropertyInfo property, object target)
	{
		return property.GetValue(target, null);
	}
}
