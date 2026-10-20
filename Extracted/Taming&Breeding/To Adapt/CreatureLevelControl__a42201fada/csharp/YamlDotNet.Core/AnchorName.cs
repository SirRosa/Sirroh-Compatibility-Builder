using System;
using System.Runtime.CompilerServices;
using System.Text.RegularExpressions;

namespace YamlDotNet.Core;

[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
internal struct AnchorName : IEquatable<AnchorName>
{
	public static readonly AnchorName Empty = default;

	private static readonly Regex AnchorPattern = new Regex("^[^\\[\\]\\{\\},]+$", RegexOptions.Compiled);

	[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)]
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

	[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(2)]
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

	public static implicit operator AnchorName(string value)
	{
		if (value != null)
		{
			return new AnchorName(value);
		}
		return Empty;
	}
}
