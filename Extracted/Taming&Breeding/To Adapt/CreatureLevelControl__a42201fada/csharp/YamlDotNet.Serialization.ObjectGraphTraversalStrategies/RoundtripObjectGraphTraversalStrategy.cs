using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Serialization.ObjectGraphTraversalStrategies;

[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
internal class RoundtripObjectGraphTraversalStrategy : FullObjectGraphTraversalStrategy
{
	private readonly IEnumerable<IYamlTypeConverter> converters;

	public RoundtripObjectGraphTraversalStrategy(IEnumerable<IYamlTypeConverter> converters, ITypeInspector typeDescriptor, ITypeResolver typeResolver, int maxRecursion, INamingConvention namingConvention)
		: base(typeDescriptor, typeResolver, maxRecursion, namingConvention)
	{
		this.converters = converters;
	}

	protected override void TraverseProperties<[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)] TContext>(IObjectDescriptor value, IObjectGraphVisitor<TContext> visitor, TContext context, Stack<ObjectPathSegment> path)
	{
		if (!value.Type.HasDefaultConstructor() && !converters.Any([_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(0)] (IYamlTypeConverter c) => c.Accepts(value.Type)))
		{
			throw new InvalidOperationException($"Type '{value.Type}' cannot be deserialized because it does not have a default constructor or a type converter.");
		}
		base.TraverseProperties(value, visitor, context, path);
	}
}
