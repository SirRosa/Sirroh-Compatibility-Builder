using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using YamlDotNet.Serialization.Utilities;

namespace YamlDotNet.Serialization.ObjectGraphTraversalStrategies;

[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
internal class _003Cb192437f_002Dbd1e_002D4f75_002Dbaf6_002D5a6b0e86d935_003ERoundtripObjectGraphTraversalStrategy : _003Ca079ef9c_002D85aa_002D4d79_002D91da_002D46578d914a96_003EFullObjectGraphTraversalStrategy
{
	private readonly TypeConverterCache converters;

	private readonly Settings settings;

	public _003Cb192437f_002Dbd1e_002D4f75_002Dbaf6_002D5a6b0e86d935_003ERoundtripObjectGraphTraversalStrategy(IEnumerable<_003C5384a3d0_002D8336_002D4a99_002Db8c4_002D408e36f4fefa_003EIYamlTypeConverter> converters, _003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector typeDescriptor, _003C9a18e817_002D7f53_002D45f5_002D8cc8_002D78dd60e37121_003EITypeResolver typeResolver, int maxRecursion, _003C6b570e97_002D8c61_002D429b_002D9b61_002D13cef86f0e8a_003EINamingConvention namingConvention, Settings settings, _003C86c651de_002D54a3_002D4b26_002D8421_002D77d942e1f3bb_003EIObjectFactory factory)
		: base(typeDescriptor, typeResolver, maxRecursion, namingConvention, factory)
	{
		this.converters = new TypeConverterCache(converters);
		this.settings = settings;
	}

	protected override void TraverseProperties<[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] TContext>(_003C7939ce99_002D9715_002D4aac_002D881a_002Dac56bffa0212_003EIObjectDescriptor value, _003Cd0224a9c_002Da50e_002D4b39_002D9113_002Dc2af3da8da9e_003EIObjectGraphVisitor<TContext> visitor, TContext context, Stack<ObjectPathSegment> path, _003Cff01c211_002D8732_002D4686_002Db12e_002D1c8f5a0f67f9_003EObjectSerializer serializer)
	{
		if (!value.Type.HasDefaultConstructor(settings.AllowPrivateConstructors) && !converters.TryGetConverterForType(value.Type, out var _))
		{
			throw new InvalidOperationException($"Type '{value.Type}' cannot be deserialized because it does not have a default constructor or a type converter.");
		}
		base.TraverseProperties(value, visitor, context, path, serializer);
	}
}
