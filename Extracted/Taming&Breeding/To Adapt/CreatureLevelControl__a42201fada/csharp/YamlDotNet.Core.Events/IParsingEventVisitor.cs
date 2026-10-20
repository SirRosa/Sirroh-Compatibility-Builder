using System.Runtime.CompilerServices;

namespace YamlDotNet.Core.Events;

[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
internal interface IParsingEventVisitor
{
	void Visit(AnchorAlias e);

	void Visit(StreamStart e);

	void Visit(StreamEnd e);

	void Visit(DocumentStart e);

	void Visit(DocumentEnd e);

	void Visit(Scalar e);

	void Visit(SequenceStart e);

	void Visit(SequenceEnd e);

	void Visit(MappingStart e);

	void Visit(MappingEnd e);

	void Visit(Comment e);
}
