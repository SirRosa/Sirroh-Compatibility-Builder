using System;
using System.IO;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Serialization;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal sealed class _003C109dd29f_002D4d8f_002D406e_002Daaa1_002Da67908c2e897_003ESerializer : _003C71c4f03b_002D8897_002D4b69_002D97f6_002Dd22b7b1b20c2_003EISerializer
{
	private readonly _003Cd24940d8_002Db261_002D4d22_002Da068_002D8208a07cf4f1_003EIValueSerializer valueSerializer;

	private readonly _003C2ff6c2f5_002D6a69_002D425e_002Dacb2_002Dae4d9d5cfb1d_003EEmitterSettings emitterSettings;

	public _003C109dd29f_002D4d8f_002D406e_002Daaa1_002Da67908c2e897_003ESerializer()
		: this(new _003Ca78f63fd_002D6092_002D46a6_002D81ca_002Da19792aa220a_003ESerializerBuilder().BuildValueSerializer(), _003C2ff6c2f5_002D6a69_002D425e_002Dacb2_002Dae4d9d5cfb1d_003EEmitterSettings.Default)
	{
	}

	private _003C109dd29f_002D4d8f_002D406e_002Daaa1_002Da67908c2e897_003ESerializer(_003Cd24940d8_002Db261_002D4d22_002Da068_002D8208a07cf4f1_003EIValueSerializer valueSerializer, _003C2ff6c2f5_002D6a69_002D425e_002Dacb2_002Dae4d9d5cfb1d_003EEmitterSettings emitterSettings)
	{
		this.valueSerializer = valueSerializer ?? throw new ArgumentNullException("valueSerializer");
		this.emitterSettings = emitterSettings ?? throw new ArgumentNullException("emitterSettings");
	}

	public static _003C109dd29f_002D4d8f_002D406e_002Daaa1_002Da67908c2e897_003ESerializer FromValueSerializer(_003Cd24940d8_002Db261_002D4d22_002Da068_002D8208a07cf4f1_003EIValueSerializer valueSerializer, _003C2ff6c2f5_002D6a69_002D425e_002Dacb2_002Dae4d9d5cfb1d_003EEmitterSettings emitterSettings)
	{
		return new _003C109dd29f_002D4d8f_002D406e_002Daaa1_002Da67908c2e897_003ESerializer(valueSerializer, emitterSettings);
	}

	public string Serialize([_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] object graph)
	{
		using StringWriter stringWriter = new StringWriter();
		Serialize(stringWriter, graph);
		return stringWriter.ToString();
	}

	public string Serialize([_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] object graph, Type type)
	{
		using StringWriter stringWriter = new StringWriter();
		Serialize(stringWriter, graph, type);
		return stringWriter.ToString();
	}

	public void Serialize(TextWriter writer, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] object graph)
	{
		Serialize(new _003Cba47a490_002D4523_002D4f6c_002D8c5a_002Dee60b80f2ccd_003EEmitter(writer, emitterSettings), graph);
	}

	public void Serialize(TextWriter writer, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] object graph, Type type)
	{
		Serialize(new _003Cba47a490_002D4523_002D4f6c_002D8c5a_002Dee60b80f2ccd_003EEmitter(writer, emitterSettings), graph, type);
	}

	public void Serialize(_003Ce3ac13c3_002D7cb5_002D4d88_002D8b7b_002D9dd21bdaf81d_003EIEmitter emitter, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] object graph)
	{
		if (emitter == null)
		{
			throw new ArgumentNullException("emitter");
		}
		EmitDocument(emitter, graph, null);
	}

	public void Serialize(_003Ce3ac13c3_002D7cb5_002D4d88_002D8b7b_002D9dd21bdaf81d_003EIEmitter emitter, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] object graph, Type type)
	{
		if (emitter == null)
		{
			throw new ArgumentNullException("emitter");
		}
		if (type == null)
		{
			throw new ArgumentNullException("type");
		}
		EmitDocument(emitter, graph, type);
	}

	[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)]
	private void EmitDocument([_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(1)] _003Ce3ac13c3_002D7cb5_002D4d88_002D8b7b_002D9dd21bdaf81d_003EIEmitter emitter, object graph, Type type)
	{
		emitter.Emit(new _003Cd41714f7_002D4f61_002D432e_002D8a83_002Ded593f31e526_003EStreamStart());
		emitter.Emit(new _003C11d343a3_002Dad11_002D4df1_002D9f55_002Da2bc7ef77934_003EDocumentStart());
		valueSerializer.SerializeValue(emitter, graph, type);
		emitter.Emit(new _003C7d138b59_002Dd981_002D4379_002Daac9_002D8cdf906ac673_003EDocumentEnd(isImplicit: true));
		emitter.Emit(new _003C50667387_002D32a0_002D4cfa_002D90ba_002D9e18d76632e5_003EStreamEnd());
	}
}
