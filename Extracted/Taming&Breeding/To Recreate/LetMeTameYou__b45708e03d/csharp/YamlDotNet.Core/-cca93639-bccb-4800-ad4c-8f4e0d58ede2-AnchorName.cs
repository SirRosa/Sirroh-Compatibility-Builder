using System;
using System.Runtime.CompilerServices;
using System.Text.RegularExpressions;

namespace YamlDotNet.Core;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal readonly struct _003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName : IEquatable<_003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName>
{
	public static readonly _003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName Empty;

	private static readonly Regex AnchorPattern = new Regex("^[^\\[\\]\\{\\},]+$", RegexOptions.Compiled);

	[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	private readonly string value;

	public string Value => value ?? throw new InvalidOperationException("Cannot read the Value of an empty anchor");

	public bool IsEmpty => value == null;

	public _003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName(string value)
	{
		this.value = value ?? throw new ArgumentNullException("value");
		if (!AnchorPattern.IsMatch(value))
		{
			throw new ArgumentException("Anchor cannot be empty or contain disallowed characters: []{},\nThe value was '" + value + "'.", "value");
		}
	}

	public override string ToString()
	{
		return value ?? "[empty]";
	}

	public bool Equals(_003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName other)
	{
		return object.Equals(value, other.value);
	}

	[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)]
	public override bool Equals(object obj)
	{
		if (obj is _003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName other)
		{
			return Equals(other);
		}
		return false;
	}

	public override int GetHashCode()
	{
		return value?.GetHashCode() ?? 0;
	}

	public static bool operator ==(_003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName left, _003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName right)
	{
		return left.Equals(right);
	}

	public static bool operator !=(_003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName left, _003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName right)
	{
		return !(left == right);
	}

	[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)]
	public static implicit operator _003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName(string value)
	{
		if (value != null)
		{
			return new _003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName(value);
		}
		return Empty;
	}
}
