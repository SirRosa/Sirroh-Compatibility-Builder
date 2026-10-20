using System.Runtime.CompilerServices;

namespace YamlDotNet.Core;

[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
internal sealed class Cursor
{
	public int Index { get; private set; }

	public int Line { get; private set; }

	public int LineOffset { get; private set; }

	public Cursor()
	{
		Line = 1;
	}

	public Cursor(Cursor cursor)
	{
		Index = cursor.Index;
		Line = cursor.Line;
		LineOffset = cursor.LineOffset;
	}

	public Mark Mark()
	{
		return new Mark(Index, Line, LineOffset + 1);
	}

	public void Skip()
	{
		Index++;
		LineOffset++;
	}

	public void SkipLineByOffset(int offset)
	{
		Index += offset;
		Line++;
		LineOffset = 0;
	}

	public void ForceSkipLineAfterNonBreak()
	{
		if (LineOffset != 0)
		{
			Line++;
			LineOffset = 0;
		}
	}
}
