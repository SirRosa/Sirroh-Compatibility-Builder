using System;
using System.Diagnostics.CodeAnalysis;
using System.IO;
using System.Runtime.CompilerServices;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Core;

[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
internal static class ParserExtensions
{
	public static T Consume<[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)] T>(this IParser parser) where T : ParsingEvent
	{
		T result = parser.Require<T>();
		parser.MoveNext();
		return result;
	}

	public static bool TryConsume<[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)] T>(this IParser parser, [MaybeNullWhen(false)] out T @event) where T : ParsingEvent
	{
		if (parser.Accept<T>(out @event))
		{
			parser.MoveNext();
			return true;
		}
		return false;
	}

	public static T Require<[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)] T>(this IParser parser) where T : ParsingEvent
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

	public static bool Accept<[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)] T>(this IParser parser, [MaybeNullWhen(false)] out T @event) where T : ParsingEvent
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
	public static T Expect<[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)] T>(this IParser parser) where T : ParsingEvent
	{
		return parser.Consume<T>();
	}

	[Obsolete("Please use TryConsume<T>(out var evt) instead")]
	[return: _003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)]
	public static T Allow<[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)] T>(this IParser parser) where T : ParsingEvent
	{
		if (!parser.TryConsume<T>(out var @event))
		{
			return null;
		}
		return @event;
	}

	[Obsolete("Please use Accept<T>(out var evt) instead")]
	[return: _003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)]
	public static T Peek<[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)] T>(this IParser parser) where T : ParsingEvent
	{
		if (!parser.Accept<T>(out var @event))
		{
			return null;
		}
		return @event;
	}

	[Obsolete("Please use TryConsume<T>(out var evt) or Accept<T>(out var evt) instead")]
	public static bool Accept<[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)] T>(this IParser parser) where T : ParsingEvent
	{
		T @event;
		return parser.Accept<T>(out @event);
	}
}
