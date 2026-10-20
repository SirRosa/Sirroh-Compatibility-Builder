using System;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization.ObjectGraphVisitors;

[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
internal sealed class DefaultExclusiveObjectGraphVisitor : ChainedObjectGraphVisitor
{
	public DefaultExclusiveObjectGraphVisitor(IObjectGraphVisitor<IEmitter> nextVisitor)
		: base(nextVisitor)
	{
	}

	[return: _003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)]
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
