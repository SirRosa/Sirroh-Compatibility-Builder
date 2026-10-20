using System;
using System.Runtime.CompilerServices;
using YamlDotNet.Serialization.ObjectFactories;

namespace YamlDotNet.Serialization;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal abstract class StaticContext
{
	public virtual bool IsKnownType(Type type)
	{
		throw new NotImplementedException();
	}

	public virtual _003C9a18e817_002D7f53_002D45f5_002D8cc8_002D78dd60e37121_003EITypeResolver GetTypeResolver()
	{
		throw new NotImplementedException();
	}

	public virtual StaticObjectFactory GetFactory()
	{
		throw new NotImplementedException();
	}

	public virtual _003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector GetTypeInspector()
	{
		throw new NotImplementedException();
	}
}
