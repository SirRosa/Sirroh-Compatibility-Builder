using System;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization.ObjectGraphVisitors;

[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
internal sealed class DefaultValuesObjectGraphVisitor : ChainedObjectGraphVisitor
{
	private readonly DefaultValuesHandling handling;

	public DefaultValuesObjectGraphVisitor(DefaultValuesHandling handling, IObjectGraphVisitor<IEmitter> nextVisitor)
		: base(nextVisitor)
	{
		this.handling = handling;
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

	public override bool EnterMapping(IPropertyDescriptor key, IObjectDescriptor value, IEmitter context)
	{
		DefaultValuesHandling defaultValuesHandling = handling;
		YamlMemberAttribute customAttribute = key.GetCustomAttribute<YamlMemberAttribute>();
		if (customAttribute != null && customAttribute.IsDefaultValuesHandlingSpecified)
		{
			defaultValuesHandling = customAttribute.DefaultValuesHandling;
		}
		switch (defaultValuesHandling)
		{
		case DefaultValuesHandling.OmitNull:
			if (value.Value == null)
			{
				return false;
			}
			break;
		case DefaultValuesHandling.OmitDefaults:
		{
			object objB = key.GetCustomAttribute<DefaultValueAttribute>()?.Value ?? GetDefault(key.Type);
			if (object.Equals(value.Value, objB))
			{
				return false;
			}
			break;
		}
		}
		return base.EnterMapping(key, value, context);
	}
}
