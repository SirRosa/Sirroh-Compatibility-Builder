using System;
using System.IO;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;
using YamlDotNet.Serialization.Utilities;

namespace YamlDotNet.Serialization;

[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
internal sealed class Deserializer : IDeserializer
{
	private readonly IValueDeserializer valueDeserializer;

	public Deserializer()
		: this(new DeserializerBuilder().BuildValueDeserializer())
	{
	}

	private Deserializer(IValueDeserializer valueDeserializer)
	{
		this.valueDeserializer = valueDeserializer ?? throw new ArgumentNullException("valueDeserializer");
	}

	public static Deserializer FromValueDeserializer(IValueDeserializer valueDeserializer)
	{
		return new Deserializer(valueDeserializer);
	}

	public T Deserialize<[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] T>(string input)
	{
		using StringReader input2 = new StringReader(input);
		return Deserialize<T>(input2);
	}

	public T Deserialize<[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] T>(TextReader input)
	{
		return Deserialize<T>(new Parser(input));
	}

	[return: _003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)]
	public object Deserialize(TextReader input)
	{
		return Deserialize(input, typeof(object));
	}

	[return: _003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)]
	public object Deserialize(string input, Type type)
	{
		using StringReader input2 = new StringReader(input);
		return Deserialize(input2, type);
	}

	[return: _003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)]
	public object Deserialize(TextReader input, Type type)
	{
		return Deserialize(new Parser(input), type);
	}

	public T Deserialize<[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] T>(IParser parser)
	{
		return (T)Deserialize(parser, typeof(T));
	}

	[return: _003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)]
	public object Deserialize(IParser parser)
	{
		return Deserialize(parser, typeof(object));
	}

	[return: _003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)]
	public object Deserialize(IParser parser, Type type)
	{
		if (parser == null)
		{
			throw new ArgumentNullException("parser");
		}
		if (type == null)
		{
			throw new ArgumentNullException("type");
		}
		bool flag = parser.TryConsume<StreamStart>(out var _);
		bool flag2 = parser.TryConsume<DocumentStart>(out var _);
		object result = null;
		if (!parser.Accept<DocumentEnd>(out var _) && !parser.Accept<StreamEnd>(out var _))
		{
			using SerializerState serializerState = new SerializerState();
			result = valueDeserializer.DeserializeValue(parser, type, serializerState, valueDeserializer);
			serializerState.OnDeserialization();
		}
		if (flag2)
		{
			parser.Consume<DocumentEnd>();
		}
		if (flag)
		{
			parser.Consume<StreamEnd>();
		}
		return result;
	}
}
