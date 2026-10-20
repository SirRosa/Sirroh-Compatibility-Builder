using System;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Serialization.ObjectFactories;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal sealed class _003Cb1590967_002D5661_002D4775_002D9f49_002D3352822a9c33_003ELambdaObjectFactory : ObjectFactoryBase
{
	private readonly Func<Type, object> factory;

	public _003Cb1590967_002D5661_002D4775_002D9f49_002D3352822a9c33_003ELambdaObjectFactory(Func<Type, object> factory)
	{
		this.factory = factory ?? throw new ArgumentNullException("factory");
	}

	public override object Create(Type type)
	{
		return factory(type);
	}
}
