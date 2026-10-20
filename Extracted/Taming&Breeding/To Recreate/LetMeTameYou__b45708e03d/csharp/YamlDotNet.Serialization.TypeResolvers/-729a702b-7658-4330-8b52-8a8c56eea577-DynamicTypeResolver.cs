using System;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Serialization.TypeResolvers;

internal sealed class _003C729a702b_002D7658_002D4330_002D8b52_002D8a8c56eea577_003EDynamicTypeResolver : _003C9a18e817_002D7f53_002D45f5_002D8cc8_002D78dd60e37121_003EITypeResolver
{
	[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
	public Type Resolve(Type staticType, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] object actualValue)
	{
		if (actualValue == null)
		{
			return staticType;
		}
		return actualValue.GetType();
	}
}
