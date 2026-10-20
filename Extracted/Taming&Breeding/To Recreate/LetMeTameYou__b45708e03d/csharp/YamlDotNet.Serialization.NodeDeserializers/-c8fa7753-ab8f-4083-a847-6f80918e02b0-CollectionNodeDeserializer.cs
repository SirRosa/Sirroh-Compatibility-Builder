using System;
using System.Collections;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;
using YamlDotNet.Helpers;
using YamlDotNet.Serialization.Utilities;

namespace YamlDotNet.Serialization.NodeDeserializers;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal sealed class _003Cc8fa7753_002Dab8f_002D4083_002Da847_002D6f80918e02b0_003ECollectionNodeDeserializer : _003Cb785578c_002Db96c_002D492b_002D85eb_002Da7a6a41c8875_003EINodeDeserializer
{
	private readonly _003C86c651de_002D54a3_002D4b26_002D8421_002D77d942e1f3bb_003EIObjectFactory objectFactory;

	private readonly _003C6b570e97_002D8c61_002D429b_002D9b61_002D13cef86f0e8a_003EINamingConvention enumNamingConvention;

	private readonly _003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector typeInspector;

	public _003Cc8fa7753_002Dab8f_002D4083_002Da847_002D6f80918e02b0_003ECollectionNodeDeserializer(_003C86c651de_002D54a3_002D4b26_002D8421_002D77d942e1f3bb_003EIObjectFactory objectFactory, _003C6b570e97_002D8c61_002D429b_002D9b61_002D13cef86f0e8a_003EINamingConvention enumNamingConvention, _003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector typeInspector)
	{
		this.objectFactory = objectFactory ?? throw new ArgumentNullException("objectFactory");
		this.enumNamingConvention = enumNamingConvention;
		this.typeInspector = typeInspector;
	}

	public bool Deserialize(_003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser parser, Type expectedType, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(new byte[] { 1, 1, 1, 2 })] Func<_003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser, Type, object> nestedObjectDeserializer, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] out object value, _003Ccf1bb9c3_002D9707_002D4afa_002Daa6b_002D02a0a9430a5f_003EObjectDeserializer rootDeserializer)
	{
		bool canUpdate = true;
		Type implementationOfOpenGenericInterface = expectedType.GetImplementationOfOpenGenericInterface(typeof(ICollection<>));
		Type type;
		IList list;
		if (implementationOfOpenGenericInterface != null)
		{
			Type[] genericArguments = implementationOfOpenGenericInterface.GetGenericArguments();
			type = genericArguments[0];
			value = objectFactory.Create(expectedType);
			list = value as IList;
			if (list == null)
			{
				Type implementationOfOpenGenericInterface2 = expectedType.GetImplementationOfOpenGenericInterface(typeof(IList<>));
				canUpdate = implementationOfOpenGenericInterface2 != null;
				list = (IList)Activator.CreateInstance(typeof(_003Cf9935bad_002D19ae_002D4093_002Db324_002D5f7ca136b22f_003EGenericCollectionToNonGenericAdapter<>).MakeGenericType(type), value);
			}
		}
		else
		{
			if (!typeof(IList).IsAssignableFrom(expectedType))
			{
				value = null;
				return false;
			}
			type = typeof(object);
			value = objectFactory.Create(expectedType);
			list = (IList)value;
		}
		DeserializeHelper(type, parser, nestedObjectDeserializer, list, canUpdate, enumNamingConvention, typeInspector);
		return true;
	}

	internal static void DeserializeHelper(Type tItem, _003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser parser, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(new byte[] { 1, 1, 1, 2 })] Func<_003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser, Type, object> nestedObjectDeserializer, IList result, bool canUpdate, _003C6b570e97_002D8c61_002D429b_002D9b61_002D13cef86f0e8a_003EINamingConvention enumNamingConvention, _003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector typeInspector, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] Action<int, object> promiseResolvedHandler = null)
	{
		parser.Consume<_003C9f7de5d2_002Dfe16_002D493d_002D8158_002D378a5bfd51bb_003ESequenceStart>();
		_003Caa8581b2_002D1caa_002D46f6_002Db8ec_002D0b62fd9dce90_003ESequenceEnd @event;
		while (!parser.TryConsume<_003Caa8581b2_002D1caa_002D46f6_002Db8ec_002D0b62fd9dce90_003ESequenceEnd>(out @event))
		{
			_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent current = parser.Current;
			object obj = nestedObjectDeserializer(parser, tItem);
			if (obj is _003C9bf148ef_002Dec3e_002D48e2_002Db55a_002D857a8fcd2a5e_003EIValuePromise obj2)
			{
				if (!canUpdate)
				{
					throw new _003Cea5a280d_002D8774_002D46dd_002D96b4_002D5b2ce92461ba_003EForwardAnchorNotSupportedException(current?.Start ?? _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty, current?.End ?? _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty, "Forward alias references are not allowed because this type does not implement IList<>");
				}
				int index = result.Add(_003Ce06d2af1_002D43d5_002D4dae_002Db4f7_002D148c660b753e_003EReflectionExtensions.IsValueType(tItem) ? Activator.CreateInstance(tItem) : null);
				if (promiseResolvedHandler != null)
				{
					obj2.ValueAvailable += [_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)] (object v) =>
					{
						promiseResolvedHandler(index, v);
					};
				}
				else
				{
					obj2.ValueAvailable += [_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)] (object v) =>
					{
						result[index] = _003Cd3168ea3_002D9f8f_002D48fd_002Db39d_002D58bb322fb29c_003ETypeConverter.ChangeType(v, tItem, enumNamingConvention, typeInspector);
					};
				}
			}
			else
			{
				result.Add(_003Cd3168ea3_002D9f8f_002D48fd_002Db39d_002D58bb322fb29c_003ETypeConverter.ChangeType(obj, tItem, enumNamingConvention, typeInspector));
			}
		}
	}
}
