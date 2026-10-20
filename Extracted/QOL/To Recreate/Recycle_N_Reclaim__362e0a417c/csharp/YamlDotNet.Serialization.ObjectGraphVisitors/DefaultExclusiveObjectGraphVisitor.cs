using System;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization.ObjectGraphVisitors;

[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
internal sealed class DefaultExclusiveObjectGraphVisitor : ChainedObjectGraphVisitor
{
	public DefaultExclusiveObjectGraphVisitor(IObjectGraphVisitor<IEmitter> nextVisitor)
		: base(nextVisitor)
	{
	}

	[return: _003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)]
	private static object GetDefault(Type type)
	{
		if (!type.IsValueType())
		{
			return null;
		}
		return Activator.CreateInstance(type);
	}

	public override bool EnterMapping(IObjectDescriptor key, IObjectDescriptor value, IEmitter context)
	{
		if (!object.Equals(value.Value, GetDefault(value.Type)))
		{
			return base.EnterMapping(key, value, context);
		}
		return false;
	}

	public override bool EnterMapping(IPropertyDescriptor key, IObjectDescriptor value, IEmitter context)
	{
		DefaultValueAttribute customAttribute = key.GetCustomAttribute<DefaultValueAttribute>();
		object objB = ((customAttribute != null) ? customAttribute.Value : GetDefault(key.Type));
		if (!object.Equals(value.Value, objB))
		{
			return base.EnterMapping(key, value, context);
		}
		return false;
	}
}
