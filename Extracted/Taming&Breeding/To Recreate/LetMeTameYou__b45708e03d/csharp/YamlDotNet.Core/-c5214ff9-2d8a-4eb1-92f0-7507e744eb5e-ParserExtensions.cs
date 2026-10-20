using System;
using System.Diagnostics.CodeAnalysis;
using System.IO;
using System.Runtime.CompilerServices;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Core;

[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
internal static class _003Cc5214ff9_002D2d8a_002D4eb1_002D92f0_002D7507e744eb5e_003EParserExtensions
{
	public static T Consume<[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)] T>(this _003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser parser) where T : _003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent
	{
		T result = parser.Require<T>();
		parser.MoveNext();
		return result;
	}

	public static bool TryConsume<[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)] T>(this _003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser parser, [_003C3e7b65c3_002D9a34_002D466b_002D9a0e_002Dc991173a4ba0_003EMaybeNullWhen(false)] out T @event) where T : _003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent
	{
		if (parser.Accept<T>(out @event))
		{
			parser.MoveNext();
			return true;
		}
		return false;
	}

	public static T Require<[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)] T>(this _003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser parser) where T : _003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent
	{
		if (!parser.Accept<T>(out var @event))
		{
			_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent current = parser.Current;
			if (current == null)
			{
				throw new _003C98bbf7cf_002D29a6_002D4379_002Dbeba_002Df0efbbce1348_003EYamlException("Expected '" + typeof(T).Name + "', got nothing.");
			}
			throw new _003C98bbf7cf_002D29a6_002D4379_002Dbeba_002Df0efbbce1348_003EYamlException(current.Start, current.End, $"Expected '{typeof(T).Name}', got '{current.GetType().Name}' (at {current.Start}).");
		}
		return @event;
	}

	public static bool Accept<[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)] T>(this _003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser parser, [_003C3e7b65c3_002D9a34_002D466b_002D9a0e_002Dc991173a4ba0_003EMaybeNullWhen(false)] out T @event) where T : _003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent
	{
		if (parser.Current == null && !parser.MoveNext())
		{
			throw new EndOfStreamException();
		}
		if (parser.Current is T val)
		{
			@event = val;
			return true;
		}
		@event = null;
		return false;
	}

	public static void SkipThisAndNestedEvents(this _003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser parser)
	{
		int num = 0;
		do
		{
			_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent obj = parser.Consume<_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent>();
			num += obj.NestingIncrease;
		}
		while (num > 0);
	}

	[Obsolete("Please use Consume<T>() instead")]
	public static T Expect<[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)] T>(this _003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser parser) where T : _003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent
	{
		return parser.Consume<T>();
	}

	[Obsolete("Please use TryConsume<T>(out var evt) instead")]
	[return: _003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	[return: _003C3d1e7086_002D102b_002D445d_002Da443_002D61677c23c63a_003EMaybeNull]
	public static T Allow<[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)] T>(this _003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser parser) where T : _003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent
	{
		if (!parser.TryConsume<T>(out var @event))
		{
			return null;
		}
		return @event;
	}

	[Obsolete("Please use Accept<T>(out var evt) instead")]
	[return: _003C3d1e7086_002D102b_002D445d_002Da443_002D61677c23c63a_003EMaybeNull]
	[return: _003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	public static T Peek<[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)] T>(this _003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser parser) where T : _003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent
	{
		if (!parser.Accept<T>(out var @event))
		{
			return null;
		}
		return @event;
	}

	[Obsolete("Please use TryConsume<T>(out var evt) or Accept<T>(out var evt) instead")]
	public static bool Accept<[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)] T>(this _003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser parser) where T : _003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent
	{
		T @event;
		return parser.Accept<T>(out @event);
	}

	public static bool TryFindMappingEntry(this _003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser parser, Func<_003C8284bc76_002D89b7_002D4bf8_002Daa46_002D39da1e634380_003EScalar, bool> selector, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)][_003C3e7b65c3_002D9a34_002D466b_002D9a0e_002Dc991173a4ba0_003EMaybeNullWhen(false)] out _003C8284bc76_002D89b7_002D4bf8_002Daa46_002D39da1e634380_003EScalar key, [_003C3e7b65c3_002D9a34_002D466b_002D9a0e_002Dc991173a4ba0_003EMaybeNullWhen(false)][_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] out _003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent value)
	{
		if (parser.TryConsume<_003Ca19ef90a_002D64a0_002D4d7e_002Db490_002D56e422b0103d_003EMappingStart>(out var _))
		{
			while (parser.Current != null)
			{
				_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent current = parser.Current;
				if (!(current is _003C8284bc76_002D89b7_002D4bf8_002Daa46_002D39da1e634380_003EScalar obj))
				{
					if (current is _003Ca19ef90a_002D64a0_002D4d7e_002Db490_002D56e422b0103d_003EMappingStart || current is _003C9f7de5d2_002Dfe16_002D493d_002D8158_002D378a5bfd51bb_003ESequenceStart)
					{
						parser.SkipThisAndNestedEvents();
					}
					else
					{
						parser.MoveNext();
					}
					continue;
				}
				bool flag = selector(obj);
				parser.MoveNext();
				if (flag)
				{
					value = parser.Current;
					key = obj;
					return true;
				}
				parser.SkipThisAndNestedEvents();
			}
		}
		key = null;
		value = null;
		return false;
	}
}
