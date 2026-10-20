using System;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Serialization.ObjectGraphVisitors;

[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
internal sealed class CommentsObjectGraphVisitor : ChainedObjectGraphVisitor
{
	public CommentsObjectGraphVisitor(IObjectGraphVisitor<IEmitter> nextVisitor)
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

	public override bool EnterMapping(IPropertyDescriptor key, IObjectDescriptor value, IEmitter context)
	{
		YamlMemberAttribute customAttribute = key.GetCustomAttribute<YamlMemberAttribute>();
		if (customAttribute != null && customAttribute.Description != null)
		{
			context.Emit(new Comment(customAttribute.Description, isInline: false));
		}
		return base.EnterMapping(key, value, context);
	}
}
