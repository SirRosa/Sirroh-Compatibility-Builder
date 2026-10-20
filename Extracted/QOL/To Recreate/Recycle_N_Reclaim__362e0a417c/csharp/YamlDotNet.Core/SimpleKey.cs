using System.Runtime.CompilerServices;

namespace YamlDotNet.Core;

[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
internal sealed class SimpleKey
{
	private readonly Cursor cursor;

	public bool IsPossible { get; private set; }

	public bool IsRequired { get; }

	public int TokenNumber { get; }

	public int Index => cursor.Index;

	public int Line => cursor.Line;

	public int LineOffset => cursor.LineOffset;

	public Mark Mark => cursor.Mark();

	public void MarkAsImpossible()
	{
		IsPossible = false;
	}

	public SimpleKey()
	{
		cursor = new Cursor();
	}

	public SimpleKey(bool isRequired, int tokenNumber, Cursor cursor)
	{
		IsPossible = true;
		IsRequired = isRequired;
		TokenNumber = tokenNumber;
		this.cursor = new Cursor(cursor);
	}
}
