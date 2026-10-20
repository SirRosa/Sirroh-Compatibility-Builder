using System;
using System.IO;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;
using YamlDotNet.Serialization.Utilities;

namespace YamlDotNet.Serialization;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal sealed class _003C2aa38692_002Dee91_002D43ae_002D9a5e_002D18f66e95392e_003EDeserializer : _003Cdd442f31_002Dab93_002D475f_002Da633_002D58df98d94172_003EIDeserializer
{
	private readonly _003Cc60e9164_002D145a_002D4198_002Db719_002D2e6f55daf468_003EIValueDeserializer valueDeserializer;

	public _003C2aa38692_002Dee91_002D43ae_002D9a5e_002D18f66e95392e_003EDeserializer()
		: this(new _003C5c3292ef_002Dc3cf_002D4d7f_002Db19a_002D9963be43175e_003EDeserializerBuilder().BuildValueDeserializer())
	{
	}

	private _003C2aa38692_002Dee91_002D43ae_002D9a5e_002D18f66e95392e_003EDeserializer(_003Cc60e9164_002D145a_002D4198_002Db719_002D2e6f55daf468_003EIValueDeserializer valueDeserializer)
	{
		this.valueDeserializer = valueDeserializer ?? throw new ArgumentNullException("valueDeserializer");
	}

	public static _003C2aa38692_002Dee91_002D43ae_002D9a5e_002D18f66e95392e_003EDeserializer FromValueDeserializer(_003Cc60e9164_002D145a_002D4198_002Db719_002D2e6f55daf468_003EIValueDeserializer valueDeserializer)
	{
		return new _003C2aa38692_002Dee91_002D43ae_002D9a5e_002D18f66e95392e_003EDeserializer(valueDeserializer);
	}

	public T Deserialize<[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] T>(string input)
	{
		using StringReader input2 = new StringReader(input);
		return Deserialize<T>(input2);
	}

	public T Deserialize<[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] T>(TextReader input)
	{
		return Deserialize<T>(new _003Cfa4ba9b2_002D285f_002D4c5d_002Daf0b_002Dfe78ab17fd25_003EParser(input));
	}

	public T Deserialize<[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] T>(_003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser parser)
	{
		return (T)Deserialize(parser, typeof(T));
	}

	[return: _003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	public object Deserialize(string input)
	{
		return Deserialize<object>(input);
	}

	[return: _003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	public object Deserialize(TextReader input)
	{
		return Deserialize<object>(input);
	}

	[return: _003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	public object Deserialize(_003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser parser)
	{
		return Deserialize<object>(parser);
	}

	[return: _003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	public object Deserialize(string input, Type type)
	{
		using StringReader input2 = new StringReader(input);
		return Deserialize(input2, type);
	}

	[return: _003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	public object Deserialize(TextReader input, Type type)
	{
		return Deserialize(new _003Cfa4ba9b2_002D285f_002D4c5d_002Daf0b_002Dfe78ab17fd25_003EParser(input), type);
	}

	[return: _003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	public object Deserialize(_003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser parser, Type type)
	{
		if (parser == null)
		{
			throw new ArgumentNullException("parser");
		}
		if (type == null)
		{
			throw new ArgumentNullException("type");
		}
		bool flag = parser.TryConsume<_003Cd41714f7_002D4f61_002D432e_002D8a83_002Ded593f31e526_003EStreamStart>(out var _);
		bool flag2 = parser.TryConsume<_003C11d343a3_002Dad11_002D4df1_002D9f55_002Da2bc7ef77934_003EDocumentStart>(out var _);
		object result = null;
		if (!parser.Accept<_003C7d138b59_002Dd981_002D4379_002Daac9_002D8cdf906ac673_003EDocumentEnd>(out var _) && !parser.Accept<_003C50667387_002D32a0_002D4cfa_002D90ba_002D9e18d76632e5_003EStreamEnd>(out var _))
		{
			using _003Cda3bae27_002D43f3_002D4951_002Db3b1_002D1040cb481116_003ESerializerState obj = new _003Cda3bae27_002D43f3_002D4951_002Db3b1_002D1040cb481116_003ESerializerState();
			result = valueDeserializer.DeserializeValue(parser, type, obj, valueDeserializer);
			obj.OnDeserialization();
		}
		if (flag2)
		{
			parser.Consume<_003C7d138b59_002Dd981_002D4379_002Daac9_002D8cdf906ac673_003EDocumentEnd>();
		}
		if (flag)
		{
			parser.Consume<_003C50667387_002D32a0_002D4cfa_002D90ba_002D9e18d76632e5_003EStreamEnd>();
		}
		return result;
	}
}
