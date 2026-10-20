using System;
using System.Collections;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization.ObjectGraphVisitors;

[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
internal sealed class DefaultValuesObjectGraphVisitor : ChainedObjectGraphVisitor
{
	private readonly DefaultValuesHandling handling;

	private readonly IObjectFactory factory;

	public DefaultValuesObjectGraphVisitor(DefaultValuesHandling handling, IObjectGraphVisitor<IEmitter> nextVisitor, IObjectFactory factory)
		: base(nextVisitor)
	{
		this.handling = handling;
		this.factory = factory;
	}

	[return: _003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)]
	private object GetDefault(Type type)
	{
		return factory.CreatePrimitive(type);
	}

	public override bool EnterMapping(IPropertyDescriptor key, IObjectDescriptor value, IEmitter context)
	{
		DefaultValuesHandling defaultValuesHandling = handling;
		YamlMemberAttribute customAttribute = key.GetCustomAttribute<YamlMemberAttribute>();
		if (customAttribute != null && customAttribute.IsDefaultValuesHandlingSpecified)
		{
			defaultValuesHandling = customAttribute.DefaultValuesHandling;
		}
		if ((defaultValuesHandling & DefaultValuesHandling.OmitNull) != 0 && value.Value == null)
		{
			return false;
		}
		if ((defaultValuesHandling & DefaultValuesHandling.OmitEmptyCollections) != 0 && value.Value is IEnumerable enumerable)
		{
			IEnumerator enumerator = enumerable.GetEnumerator();
			bool flag = enumerator.MoveNext();
			if (enumerator is IDisposable disposable)
			{
				disposable.Dispose();
			}
			if (!flag)
			{
				return false;
			}
		}
		if ((defaultValuesHandling & DefaultValuesHandling.OmitDefaults) != 0)
		{
			object objB = key.GetCustomAttribute<DefaultValueAttribute>()?.Value ?? GetDefault(key.Type);
			if (object.Equals(value.Value, objB))
			{
				return false;
			}
		}
		return base.EnterMapping(key, value, context);
	}
}
