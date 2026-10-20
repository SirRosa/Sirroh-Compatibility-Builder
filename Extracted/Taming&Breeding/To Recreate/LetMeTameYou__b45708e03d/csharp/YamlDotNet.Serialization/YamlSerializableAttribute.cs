using System;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Serialization;

[AttributeUsage(AttributeTargets.Class | AttributeTargets.Struct | AttributeTargets.Enum, Inherited = false, AllowMultiple = true)]
internal sealed class YamlSerializableAttribute : Attribute
{
	public YamlSerializableAttribute()
	{
	}

	[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
	public YamlSerializableAttribute(Type serializableType)
	{
	}
}
