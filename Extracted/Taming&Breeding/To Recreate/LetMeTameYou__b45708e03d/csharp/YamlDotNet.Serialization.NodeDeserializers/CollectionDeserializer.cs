using System;
using System.Collections;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Serialization.NodeDeserializers;

internal abstract class CollectionDeserializer
{
	[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
	protected static void DeserializeHelper(Type tItem, _003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser parser, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(new byte[] { 1, 1, 1, 2 })] Func<_003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser, Type, object> nestedObjectDeserializer, IList result, bool canUpdate, _003C86c651de_002D54a3_002D4b26_002D8421_002D77d942e1f3bb_003EIObjectFactory objectFactory)
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
				int index = result.Add(objectFactory.CreatePrimitive(tItem));
				obj2.ValueAvailable += [_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)] (object v) =>
				{
					result[index] = v;
				};
			}
			else
			{
				result.Add(obj);
			}
		}
	}
}
