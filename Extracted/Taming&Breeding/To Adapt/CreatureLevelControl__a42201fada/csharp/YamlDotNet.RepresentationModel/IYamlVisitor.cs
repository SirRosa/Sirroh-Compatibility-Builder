using System.Runtime.CompilerServices;

namespace YamlDotNet.RepresentationModel;

[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
internal interface IYamlVisitor
{
	void Visit(YamlStream stream);

	void Visit(YamlDocument document);

	void Visit(YamlScalarNode scalar);

	void Visit(YamlSequenceNode sequence);

	void Visit(YamlMappingNode mapping);
}
