using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Serialization.ObjectGraphVisitors;

[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
internal sealed class CommentsObjectGraphVisitor : ChainedObjectGraphVisitor
{
	public CommentsObjectGraphVisitor(IObjectGraphVisitor<IEmitter> nextVisitor)
		: base(nextVisitor)
	{
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
