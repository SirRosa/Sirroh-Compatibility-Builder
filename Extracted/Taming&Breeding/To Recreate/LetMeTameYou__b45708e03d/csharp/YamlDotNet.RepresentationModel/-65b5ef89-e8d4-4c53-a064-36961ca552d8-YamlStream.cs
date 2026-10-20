using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;

namespace YamlDotNet.RepresentationModel;

[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
internal class _003C65b5ef89_002De8d4_002D4c53_002Da064_002D36961ca552d8_003EYamlStream : IEnumerable<_003C4a108954_002Dfd76_002D4cb5_002D8c7c_002Dd49f730eff6c_003EYamlDocument>, IEnumerable
{
	private readonly List<_003C4a108954_002Dfd76_002D4cb5_002D8c7c_002Dd49f730eff6c_003EYamlDocument> documents = new List<_003C4a108954_002Dfd76_002D4cb5_002D8c7c_002Dd49f730eff6c_003EYamlDocument>();

	public IList<_003C4a108954_002Dfd76_002D4cb5_002D8c7c_002Dd49f730eff6c_003EYamlDocument> Documents => documents;

	public _003C65b5ef89_002De8d4_002D4c53_002Da064_002D36961ca552d8_003EYamlStream()
	{
	}

	public _003C65b5ef89_002De8d4_002D4c53_002Da064_002D36961ca552d8_003EYamlStream(params _003C4a108954_002Dfd76_002D4cb5_002D8c7c_002Dd49f730eff6c_003EYamlDocument[] documents)
		: this((IEnumerable<_003C4a108954_002Dfd76_002D4cb5_002D8c7c_002Dd49f730eff6c_003EYamlDocument>)documents)
	{
	}

	public _003C65b5ef89_002De8d4_002D4c53_002Da064_002D36961ca552d8_003EYamlStream(IEnumerable<_003C4a108954_002Dfd76_002D4cb5_002D8c7c_002Dd49f730eff6c_003EYamlDocument> documents)
	{
		foreach (_003C4a108954_002Dfd76_002D4cb5_002D8c7c_002Dd49f730eff6c_003EYamlDocument document in documents)
		{
			this.documents.Add(document);
		}
	}

	public void Add(_003C4a108954_002Dfd76_002D4cb5_002D8c7c_002Dd49f730eff6c_003EYamlDocument document)
	{
		documents.Add(document);
	}

	public void Load(TextReader input)
	{
		Load(new _003Cfa4ba9b2_002D285f_002D4c5d_002Daf0b_002Dfe78ab17fd25_003EParser(input));
	}

	public void Load(_003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser parser)
	{
		documents.Clear();
		parser.Consume<_003Cd41714f7_002D4f61_002D432e_002D8a83_002Ded593f31e526_003EStreamStart>();
		_003C50667387_002D32a0_002D4cfa_002D90ba_002D9e18d76632e5_003EStreamEnd @event;
		while (!parser.TryConsume<_003C50667387_002D32a0_002D4cfa_002D90ba_002D9e18d76632e5_003EStreamEnd>(out @event))
		{
			_003C4a108954_002Dfd76_002D4cb5_002D8c7c_002Dd49f730eff6c_003EYamlDocument item = new _003C4a108954_002Dfd76_002D4cb5_002D8c7c_002Dd49f730eff6c_003EYamlDocument(parser);
			documents.Add(item);
		}
	}

	public void Save(TextWriter output)
	{
		Save(output, assignAnchors: true);
	}

	public void Save(TextWriter output, bool assignAnchors)
	{
		Save(new _003Cba47a490_002D4523_002D4f6c_002D8c5a_002Dee60b80f2ccd_003EEmitter(output), assignAnchors);
	}

	public void Save(_003Ce3ac13c3_002D7cb5_002D4d88_002D8b7b_002D9dd21bdaf81d_003EIEmitter emitter, bool assignAnchors)
	{
		emitter.Emit(new _003Cd41714f7_002D4f61_002D432e_002D8a83_002Ded593f31e526_003EStreamStart());
		foreach (_003C4a108954_002Dfd76_002D4cb5_002D8c7c_002Dd49f730eff6c_003EYamlDocument document in documents)
		{
			document.Save(emitter, assignAnchors);
		}
		emitter.Emit(new _003C50667387_002D32a0_002D4cfa_002D90ba_002D9e18d76632e5_003EStreamEnd());
	}

	public void Accept(_003C27b184bf_002D18f6_002D479b_002D8c90_002D05f0cd8bd61f_003EIYamlVisitor visitor)
	{
		visitor.Visit(this);
	}

	public IEnumerator<_003C4a108954_002Dfd76_002D4cb5_002D8c7c_002Dd49f730eff6c_003EYamlDocument> GetEnumerator()
	{
		return documents.GetEnumerator();
	}

	IEnumerator IEnumerable.GetEnumerator()
	{
		return GetEnumerator();
	}
}
