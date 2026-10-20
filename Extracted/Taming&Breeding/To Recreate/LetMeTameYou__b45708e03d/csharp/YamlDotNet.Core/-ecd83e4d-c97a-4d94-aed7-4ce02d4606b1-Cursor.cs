using System.Diagnostics;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Core;

[DebuggerStepThrough]
internal sealed class _003Cecd83e4d_002Dc97a_002D4d94_002Daed7_002D4ce02d4606b1_003ECursor
{
	public long Index { get; private set; }

	public long Line { get; private set; }

	public long LineOffset { get; private set; }

	public _003Cecd83e4d_002Dc97a_002D4d94_002Daed7_002D4ce02d4606b1_003ECursor()
	{
		Line = 1L;
	}

	[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
	public _003Cecd83e4d_002Dc97a_002D4d94_002Daed7_002D4ce02d4606b1_003ECursor(_003Cecd83e4d_002Dc97a_002D4d94_002Daed7_002D4ce02d4606b1_003ECursor cursor)
	{
		Index = cursor.Index;
		Line = cursor.Line;
		LineOffset = cursor.LineOffset;
	}

	public _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark Mark()
	{
		return new _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark(Index, Line, LineOffset + 1);
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
		LineOffset = 0L;
	}

	public void ForceSkipLineAfterNonBreak()
	{
		if (LineOffset != 0L)
		{
			Line++;
			LineOffset = 0L;
		}
	}
}
