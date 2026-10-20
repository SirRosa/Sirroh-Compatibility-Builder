using System;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Core;

[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(2)]
[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
internal sealed class Mark : IEquatable<Mark>, IComparable<Mark>, IComparable
{
	[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(1)]
	public static readonly Mark Empty = new Mark();

	public int Index { get; }

	public int Line { get; }

	public int Column { get; }

	public Mark()
	{
		Line = 1;
		Column = 1;
	}

	public Mark(int index, int line, int column)
	{
		if (index < 0)
		{
			throw new ArgumentOutOfRangeException("index", "Index must be greater than or equal to zero.");
		}
		if (line < 1)
		{
			throw new ArgumentOutOfRangeException("line", "Line must be greater than or equal to 1.");
		}
		if (column < 1)
		{
			throw new ArgumentOutOfRangeException("column", "Column must be greater than or equal to 1.");
		}
		Index = index;
		Line = line;
		Column = column;
	}

	[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
	public override string ToString()
	{
		return $"Line: {Line}, Col: {Column}, Idx: {Index}";
	}

	public override bool Equals(object obj)
	{
		return Equals(obj as Mark);
	}

	public bool Equals(Mark other)
	{
		if (other != null && Index == other.Index && Line == other.Line)
		{
			return Column == other.Column;
		}
		return false;
	}

	public override int GetHashCode()
	{
		return HashCode.CombineHashCodes(Index.GetHashCode(), HashCode.CombineHashCodes(Line.GetHashCode(), Column.GetHashCode()));
	}

	public int CompareTo(object obj)
	{
		if (obj == null)
		{
			throw new ArgumentNullException("obj");
		}
		return CompareTo(obj as Mark);
	}

	public int CompareTo(Mark other)
	{
		if (other == null)
		{
			throw new ArgumentNullException("other");
		}
		int num = Line.CompareTo(other.Line);
		if (num == 0)
		{
			num = Column.CompareTo(other.Column);
		}
		return num;
	}
}
