using System;
using System.Diagnostics.CodeAnalysis;
using System.IO;
using System.Runtime.CompilerServices;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Core;

[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
internal static class ParserExtensions
{
	public static T Consume<[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)] T>(this IParser parser) where T : ParsingEvent
	{
		T result = parser.Require<T>();
		parser.MoveNext();
		return result;
	}

	public static bool TryConsume<[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)] T>(this IParser parser, [MaybeNullWhen(false)] out T @event) where T : ParsingEvent
	{
		if (parser.Accept<T>(out @event))
		{
			parser.MoveNext();
			return true;
		}
		return false;
	}

	public static T Require<[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)] T>(this IParser parser) where T : ParsingEvent
	{
		if (!parser.Accept<T>(out var @event))
		{
			ParsingEvent current = parser.Current;
			if (current == null)
			{
				throw new YamlException("Expected '" + typeof(T).Name + "', got nothing.");
			}
			throw new YamlException(current.Start, current.End, $"Expected '{typeof(T).Name}', got '{current.GetType().Name}' (at {current.Start}).");
		}
		return @event;
	}

	public static bool Accept<[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)] T>(this IParser parser, [MaybeNullWhen(false)] out T @event) where T : ParsingEvent
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

	public static void SkipThisAndNestedEvents(this IParser parser)
	{
		int num = 0;
		do
		{
			ParsingEvent parsingEvent = parser.Consume<ParsingEvent>();
			num += parsingEvent.NestingIncrease;
		}
		while (num > 0);
	}

	[Obsolete("Please use Consume<T>() instead")]
	public static T Expect<[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)] T>(this IParser parser) where T : ParsingEvent
	{
		return parser.Consume<T>();
	}

	[Obsolete("Please use TryConsume<T>(out var evt) instead")]
	[return: MaybeNull]
	[return: _003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)]
	public static T Allow<[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)] T>(this IParser parser) where T : ParsingEvent
	{
		if (!parser.TryConsume<T>(out var @event))
		{
			return null;
		}
		return @event;
	}

	[Obsolete("Please use Accept<T>(out var evt) instead")]
	[return: _003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)]
	[return: MaybeNull]
	public static T Peek<[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)] T>(this IParser parser) where T : ParsingEvent
	{
		if (!parser.Accept<T>(out var @event))
		{
			return null;
		}
		return @event;
	}

	[Obsolete("Please use TryConsume<T>(out var evt) or Accept<T>(out var evt) instead")]
	public static bool Accept<[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)] T>(this IParser parser) where T : ParsingEvent
	{
		T @event;
		return parser.Accept<T>(out @event);
	}

	public static bool TryFindMappingEntry(this IParser parser, Func<Scalar, bool> selector, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)][MaybeNullWhen(false)] out Scalar key, [MaybeNullWhen(false)][_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] out ParsingEvent value)
	{
		if (parser.TryConsume<MappingStart>(out var _))
		{
			while (parser.Current != null)
			{
				ParsingEvent current = parser.Current;
				if (!(current is Scalar scalar))
				{
					if (current is MappingStart || current is SequenceStart)
					{
						parser.SkipThisAndNestedEvents();
					}
					else
					{
						parser.MoveNext();
					}
					continue;
				}
				bool flag = selector(scalar);
				parser.MoveNext();
				if (flag)
				{
					value = parser.Current;
					key = scalar;
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
