using System;
using System.Runtime.CompilerServices;
using YamlDotNet.Helpers;

namespace YamlDotNet.Core;

internal readonly struct _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark : IEquatable<_003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark>, IComparable<_003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark>, IComparable
{
	public static readonly _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark Empty = new _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark(0L, 1L, 1L);

	public long Index { get; }

	public long Line { get; }

	public long Column { get; }

	public _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark(long index, long line, long column)
	{
		if (index < 0)
		{
			ThrowHelper.ThrowArgumentOutOfRangeException("index", "Index must be greater than or equal to zero.");
		}
		if (line < 1)
		{
			ThrowHelper.ThrowArgumentOutOfRangeException("line", "Line must be greater than or equal to 1.");
		}
		if (column < 1)
		{
			ThrowHelper.ThrowArgumentOutOfRangeException("column", "Column must be greater than or equal to 1.");
		}
		Index = index;
		Line = line;
		Column = column;
	}

	[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
	public override string ToString()
	{
		return $"Line: {Line}, Col: {Column}, Idx: {Index}";
	}

	[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)]
	public override bool Equals(object obj)
	{
		return Equals((_003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark)(obj ?? ((object)Empty)));
	}

	public bool Equals(_003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark other)
	{
		if (Index == other.Index && Line == other.Line)
		{
			return Column == other.Column;
		}
		return false;
	}

	public override int GetHashCode()
	{
		return _003Ceda05417_002Dc99c_002D442b_002D93de_002De22ef768bacb_003EHashCode.CombineHashCodes(Index.GetHashCode(), _003Ceda05417_002Dc99c_002D442b_002D93de_002De22ef768bacb_003EHashCode.CombineHashCodes(Line.GetHashCode(), Column.GetHashCode()));
	}

	[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)]
	public int CompareTo(object obj)
	{
		return CompareTo((_003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark)(obj ?? ((object)Empty)));
	}

	public int CompareTo(_003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark other)
	{
		int num = Line.CompareTo(other.Line);
		if (num == 0)
		{
			num = Column.CompareTo(other.Column);
		}
		return num;
	}

	public static bool operator ==(_003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark left, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark right)
	{
		return left.Equals(right);
	}

	public static bool operator !=(_003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark left, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark right)
	{
		return !(left == right);
	}

	public static bool operator <(_003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark left, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark right)
	{
		return left.CompareTo(right) < 0;
	}

	public static bool operator <=(_003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark left, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark right)
	{
		return left.CompareTo(right) <= 0;
	}

	public static bool operator >(_003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark left, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark right)
	{
		return left.CompareTo(right) > 0;
	}

	public static bool operator >=(_003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark left, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark right)
	{
		return left.CompareTo(right) >= 0;
	}
}
