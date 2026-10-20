using System.Runtime.CompilerServices;

namespace YamlDotNet.Core.Events;

[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
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
