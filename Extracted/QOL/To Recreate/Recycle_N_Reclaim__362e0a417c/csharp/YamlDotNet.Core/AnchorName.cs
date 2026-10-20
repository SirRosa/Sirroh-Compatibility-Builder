using System;
using System.Runtime.CompilerServices;
using System.Text.RegularExpressions;

namespace YamlDotNet.Core;

[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
internal struct AnchorName : IEquatable<AnchorName>
{
	public static readonly AnchorName Empty = default;

	private static readonly Regex AnchorPattern = new Regex("^[^\\[\\]\\{\\},]+$", RegexOptions.Compiled);

	[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)]
	private readonly string value;

	public string Value => value ?? throw new InvalidOperationException("Cannot read the Value of an empty anchor");

	public bool IsEmpty => value == null;

	public AnchorName(string value)
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

	public bool Equals(AnchorName other)
	{
		return object.Equals(value, other.value);
	}

	[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(2)]
	public override bool Equals(object obj)
	{
		if (obj is AnchorName other)
		{
			return Equals(other);
		}
		return false;
	}

	public override int GetHashCode()
	{
		return value?.GetHashCode() ?? 0;
	}

	public static bool operator ==(AnchorName left, AnchorName right)
	{
		return left.Equals(right);
	}

	public static bool operator !=(AnchorName left, AnchorName right)
	{
		return !(left == right);
	}

	[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(2)]
	public static implicit operator AnchorName(string value)
	{
		if (value != null)
		{
			return new AnchorName(value);
		}
		return Empty;
	}
}
