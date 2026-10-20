using System.Runtime.CompilerServices;

namespace YamlDotNet.RepresentationModel;

[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
internal interface IYamlVisitor
{
	void Visit(YamlStream stream);

	void Visit(YamlDocument document);

	void Visit(YamlScalarNode scalar);

	void Visit(YamlSequenceNode sequence);

	void Visit(YamlMappingNode mapping);
}
