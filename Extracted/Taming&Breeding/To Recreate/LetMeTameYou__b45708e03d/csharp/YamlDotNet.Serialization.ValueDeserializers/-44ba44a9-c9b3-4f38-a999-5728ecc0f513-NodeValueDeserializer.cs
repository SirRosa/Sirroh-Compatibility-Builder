using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;
using YamlDotNet.Serialization.Utilities;

namespace YamlDotNet.Serialization.ValueDeserializers;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal sealed class _003C44ba44a9_002Dc9b3_002D4f38_002Da999_002D5728ecc0f513_003ENodeValueDeserializer : _003Cc60e9164_002D145a_002D4198_002Db719_002D2e6f55daf468_003EIValueDeserializer
{
	private readonly IList<_003Cb785578c_002Db96c_002D492b_002D85eb_002Da7a6a41c8875_003EINodeDeserializer> deserializers;

	private readonly IList<_003C5d87a147_002Dae74_002D49a7_002D8626_002Dec84a8adca93_003EINodeTypeResolver> typeResolvers;

	private readonly ITypeConverter typeConverter;

	private readonly _003C6b570e97_002D8c61_002D429b_002D9b61_002D13cef86f0e8a_003EINamingConvention enumNamingConvention;

	private readonly _003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector typeInspector;

	public _003C44ba44a9_002Dc9b3_002D4f38_002Da999_002D5728ecc0f513_003ENodeValueDeserializer(IList<_003Cb785578c_002Db96c_002D492b_002D85eb_002Da7a6a41c8875_003EINodeDeserializer> deserializers, IList<_003C5d87a147_002Dae74_002D49a7_002D8626_002Dec84a8adca93_003EINodeTypeResolver> typeResolvers, ITypeConverter typeConverter, _003C6b570e97_002D8c61_002D429b_002D9b61_002D13cef86f0e8a_003EINamingConvention enumNamingConvention, _003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector typeInspector)
	{
		this.deserializers = deserializers ?? throw new ArgumentNullException("deserializers");
		this.typeResolvers = typeResolvers ?? throw new ArgumentNullException("typeResolvers");
		this.typeConverter = typeConverter ?? throw new ArgumentNullException("typeConverter");
		this.enumNamingConvention = enumNamingConvention ?? throw new ArgumentNullException("enumNamingConvention");
		this.typeInspector = typeInspector;
	}

	[return: _003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	public object DeserializeValue(_003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser parser, Type expectedType, _003Cda3bae27_002D43f3_002D4951_002Db3b1_002D1040cb481116_003ESerializerState state, _003Cc60e9164_002D145a_002D4198_002Db719_002D2e6f55daf468_003EIValueDeserializer nestedObjectDeserializer)
	{
		parser.Accept<_003C1af307a4_002D0546_002D4fb8_002D9199_002D3379b8888e00_003ENodeEvent>(out var @event);
		Type typeFromEvent = GetTypeFromEvent(@event, expectedType);
		_003Ccf1bb9c3_002D9707_002D4afa_002Daa6b_002D02a0a9430a5f_003EObjectDeserializer rootDeserializer = [return: _003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] (Type x) => DeserializeValue(parser, x, state, nestedObjectDeserializer);
		try
		{
			foreach (_003Cb785578c_002Db96c_002D492b_002D85eb_002Da7a6a41c8875_003EINodeDeserializer deserializer in deserializers)
			{
				if (deserializer.Deserialize(parser, typeFromEvent, [return: _003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] (_003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser r, Type t) => nestedObjectDeserializer.DeserializeValue(r, t, state, nestedObjectDeserializer), out var value, rootDeserializer))
				{
					return typeConverter.ChangeType(value, expectedType, enumNamingConvention, typeInspector);
				}
			}
		}
		catch (_003C98bbf7cf_002D29a6_002D4379_002Dbeba_002Df0efbbce1348_003EYamlException)
		{
			throw;
		}
		catch (Exception innerException)
		{
			throw new _003C98bbf7cf_002D29a6_002D4379_002Dbeba_002Df0efbbce1348_003EYamlException(@event?.Start ?? _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty, @event?.End ?? _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty, "Exception during deserialization", innerException);
		}
		throw new _003C98bbf7cf_002D29a6_002D4379_002Dbeba_002Df0efbbce1348_003EYamlException(@event?.Start ?? _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty, @event?.End ?? _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty, "No node deserializer was able to deserialize the node into type " + expectedType.AssemblyQualifiedName);
	}

	private Type GetTypeFromEvent([_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] _003C1af307a4_002D0546_002D4fb8_002D9199_002D3379b8888e00_003ENodeEvent nodeEvent, Type currentType)
	{
		foreach (_003C5d87a147_002Dae74_002D49a7_002D8626_002Dec84a8adca93_003EINodeTypeResolver typeResolver in typeResolvers)
		{
			if (typeResolver.Resolve(nodeEvent, ref currentType))
			{
				break;
			}
		}
		return currentType;
	}
}
