using System;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Core;

[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
internal struct TagName : IEquatable<TagName>
{
	public static readonly TagName Empty;

	[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)]
	private readonly string value;

	public string Value => value ?? throw new InvalidOperationException("Cannot read the Value of a non-specific tag");

	public bool IsEmpty => value == null;

	public bool IsNonSpecific
	{
		get
		{
			if (!IsEmpty)
			{
				if (!(value == "!"))
				{
					return value == "?";
				}
				return true;
			}
			return false;
		}
	}

	public bool IsLocal
	{
		get
		{
			if (!IsEmpty)
			{
				return Value[0] == '!';
			}
			return false;
		}
	}

	public bool IsGlobal
	{
		get
		{
			if (!IsEmpty)
			{
				return !IsLocal;
			}
			return false;
		}
	}

	public TagName(string value)
	{
		this.value = value ?? throw new ArgumentNullException("value");
		if (value.Length == 0)
		{
			throw new ArgumentException("Tag value must not be empty.", "value");
		}
		if (IsGlobal && !Uri.IsWellFormedUriString(value, UriKind.RelativeOrAbsolute))
		{
			throw new ArgumentException("Global tags must be valid URIs.", "value");
		}
	}

	public override string ToString()
	{
		return value ?? "?";
	}

	public bool Equals(TagName other)
	{
		return object.Equals(value, other.value);
	}

	[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(2)]
	public override bool Equals(object obj)
	{
		if (obj is TagName other)
		{
			return Equals(other);
		}
		return false;
	}

	public override int GetHashCode()
	{
		return value?.GetHashCode() ?? 0;
	}

	public static bool operator ==(TagName left, TagName right)
	{
		return left.Equals(right);
	}

	public static bool operator !=(TagName left, TagName right)
	{
		return !(left == right);
	}

	public static bool operator ==(TagName left, string right)
	{
		return object.Equals(left.value, right);
	}

	public static bool operator !=(TagName left, string right)
	{
		return !(left == right);
	}

	public static implicit operator TagName(string value)
	{
		if (value != null)
		{
			return new TagName(value);
		}
		return Empty;
	}
}
