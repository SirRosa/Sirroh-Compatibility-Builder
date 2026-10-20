using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;

namespace YamlDotNet.RepresentationModel;

[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
internal class YamlStream : IEnumerable<YamlDocument>, IEnumerable
{
	private readonly IList<YamlDocument> documents = new List<YamlDocument>();

	public IList<YamlDocument> Documents => documents;

	public YamlStream()
	{
	}

	public YamlStream(params YamlDocument[] documents)
		: this((IEnumerable<YamlDocument>)documents)
	{
	}

	public YamlStream(IEnumerable<YamlDocument> documents)
	{
		foreach (YamlDocument document in documents)
		{
			this.documents.Add(document);
		}
	}

	public void Add(YamlDocument document)
	{
		documents.Add(document);
	}

	public void Load(TextReader input)
	{
		Load(new Parser(input));
	}

	public void Load(IParser parser)
	{
		documents.Clear();
		parser.Consume<StreamStart>();
		StreamEnd @event;
		while (!parser.TryConsume<StreamEnd>(out @event))
		{
			YamlDocument item = new YamlDocument(parser);
			documents.Add(item);
		}
	}

	public void Save(TextWriter output)
	{
		Save(output, assignAnchors: true);
	}

	public void Save(TextWriter output, bool assignAnchors)
	{
		Save(new Emitter(output), assignAnchors);
	}

	public void Save(IEmitter emitter, bool assignAnchors)
	{
		emitter.Emit(new StreamStart());
		foreach (YamlDocument document in documents)
		{
			document.Save(emitter, assignAnchors);
		}
		emitter.Emit(new StreamEnd());
	}

	public void Accept(IYamlVisitor visitor)
	{
		visitor.Visit(this);
	}

	public IEnumerator<YamlDocument> GetEnumerator()
	{
		return documents.GetEnumerator();
	}

	IEnumerator IEnumerable.GetEnumerator()
	{
		return GetEnumerator();
	}
}
