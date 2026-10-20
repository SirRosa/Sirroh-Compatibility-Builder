using System;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Serialization.TypeInspectors;

[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
internal abstract class ReflectionTypeInspector : _003Cb3d6a51f_002D6584_002D4a6c_002Da94f_002D3d33acb8e7cc_003ETypeInspectorSkeleton
{
	public override string GetEnumName(Type enumType, string name)
	{
		return name;
	}

	public override string GetEnumValue(object enumValue)
	{
		if (enumValue == null)
		{
			return string.Empty;
		}
		return enumValue.ToString();
	}
}
