using System.Reflection;
using System.Runtime.CompilerServices;

namespace YamlDotNet;

internal static class _003Cbf83bdff_002D8b22_002D4a46_002D8b22_002Df2a76d48f904_003EPropertyInfoExtensions
{
	[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
	[return: _003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	public static object ReadValue(this PropertyInfo property, object target)
	{
		return property.GetValue(target, null);
	}
}
