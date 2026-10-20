namespace YamlDotNet.Core;

internal interface _003C33a4e672_002D71cf_002D4c8e_002D8d57_002Dd5f7e20fac15_003EILookAheadBuffer
{
	bool EndOfInput { get; }

	char Peek(int offset);

	void Skip(int length);
}
