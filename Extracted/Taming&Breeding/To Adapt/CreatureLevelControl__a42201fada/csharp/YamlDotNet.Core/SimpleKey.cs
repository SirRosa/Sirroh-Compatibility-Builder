using System.Runtime.CompilerServices;

namespace YamlDotNet.Core;

[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
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
