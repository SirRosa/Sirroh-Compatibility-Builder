using System;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Serialization.ObjectFactories;

[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
internal sealed class LambdaObjectFactory : ObjectFactoryBase
{
	private readonly Func<Type, object> factory;

	public LambdaObjectFactory(Func<Type, object> factory)
	{
		this.factory = factory ?? throw new ArgumentNullException("factory");
	}

	public override object Create(Type type)
	{
		return factory(type);
	}
}
