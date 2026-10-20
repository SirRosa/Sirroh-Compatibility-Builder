using System;
using System.IO;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Serialization;

[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
internal sealed class Serializer : ISerializer
{
	private readonly IValueSerializer valueSerializer;

	private readonly EmitterSettings emitterSettings;

	public Serializer()
		: this(new SerializerBuilder().BuildValueSerializer(), EmitterSettings.Default)
	{
	}

	private Serializer(IValueSerializer valueSerializer, EmitterSettings emitterSettings)
	{
		this.valueSerializer = valueSerializer ?? throw new ArgumentNullException("valueSerializer");
		this.emitterSettings = emitterSettings ?? throw new ArgumentNullException("emitterSettings");
	}

	public static Serializer FromValueSerializer(IValueSerializer valueSerializer, EmitterSettings emitterSettings)
	{
		return new Serializer(valueSerializer, emitterSettings);
	}

	public void Serialize(TextWriter writer, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] object graph)
	{
		Serialize(new Emitter(writer, emitterSettings), graph);
	}

	public string Serialize([_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] object graph)
	{
		using StringWriter stringWriter = new StringWriter();
		Serialize(stringWriter, graph);
		return stringWriter.ToString();
	}

	public void Serialize(TextWriter writer, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] object graph, Type type)
	{
		Serialize(new Emitter(writer, emitterSettings), graph, type);
	}

	public void Serialize(IEmitter emitter, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] object graph)
	{
		if (emitter == null)
		{
			throw new ArgumentNullException("emitter");
		}
		EmitDocument(emitter, graph, null);
	}

	public void Serialize(IEmitter emitter, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] object graph, Type type)
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

	[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(2)]
	private void EmitDocument([_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(1)] IEmitter emitter, object graph, Type type)
	{
		emitter.Emit(new StreamStart());
		emitter.Emit(new DocumentStart());
		valueSerializer.SerializeValue(emitter, graph, type);
		emitter.Emit(new DocumentEnd(isImplicit: true));
		emitter.Emit(new StreamEnd());
	}
}
