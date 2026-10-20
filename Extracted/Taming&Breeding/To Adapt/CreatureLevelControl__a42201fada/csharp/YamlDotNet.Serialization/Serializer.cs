using System;
using System.IO;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Serialization;

[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
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

	public void Serialize(TextWriter writer, object graph)
	{
		Serialize(new Emitter(writer, emitterSettings), graph);
	}

	public string Serialize(object graph)
	{
		using StringWriter stringWriter = new StringWriter();
		Serialize(stringWriter, graph);
		return stringWriter.ToString();
	}

	public void Serialize(TextWriter writer, object graph, Type type)
	{
		Serialize(new Emitter(writer, emitterSettings), graph, type);
	}

	public void Serialize(IEmitter emitter, object graph)
	{
		if (emitter == null)
		{
			throw new ArgumentNullException("emitter");
		}
		EmitDocument(emitter, graph, null);
	}

	public void Serialize(IEmitter emitter, object graph, Type type)
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

	private void EmitDocument(IEmitter emitter, object graph, [_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)] Type type)
	{
		emitter.Emit(new StreamStart());
		emitter.Emit(new DocumentStart());
		valueSerializer.SerializeValue(emitter, graph, type);
		emitter.Emit(new DocumentEnd(isImplicit: true));
		emitter.Emit(new StreamEnd());
	}
}
