using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Serialization.ObjectGraphTraversalStrategies;

[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
internal class RoundtripObjectGraphTraversalStrategy : FullObjectGraphTraversalStrategy
{
	private readonly IEnumerable<IYamlTypeConverter> converters;

	private readonly Settings settings;

	public RoundtripObjectGraphTraversalStrategy(IEnumerable<IYamlTypeConverter> converters, ITypeInspector typeDescriptor, ITypeResolver typeResolver, int maxRecursion, INamingConvention namingConvention, Settings settings, IObjectFactory factory)
		: base(typeDescriptor, typeResolver, maxRecursion, namingConvention, factory)
	{
		this.converters = converters;
		this.settings = settings;
	}

	protected override void TraverseProperties<[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] TContext>(IObjectDescriptor value, IObjectGraphVisitor<TContext> visitor, TContext context, Stack<ObjectPathSegment> path)
	{
		if (!value.Type.HasDefaultConstructor(settings.AllowPrivateConstructors) && !converters.Any([_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(0)] (IYamlTypeConverter c) => c.Accepts(value.Type)))
		{
			throw new InvalidOperationException($"Type '{value.Type}' cannot be deserialized because it does not have a default constructor or a type converter.");
		}
		base.TraverseProperties(value, visitor, context, path);
	}
}
