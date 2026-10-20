using System.Diagnostics;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Core;

[DebuggerStepThrough]
internal sealed class Cursor
{
	public int Index { get; private set; }

	public int Line { get; private set; }

	public int LineOffset { get; private set; }

	public Cursor()
	{
		Line = 1;
	}

	[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
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
