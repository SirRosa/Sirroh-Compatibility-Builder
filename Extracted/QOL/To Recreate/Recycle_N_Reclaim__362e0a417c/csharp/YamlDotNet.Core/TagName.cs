using System;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Core;

[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
internal readonly struct TagName : IEquatable<TagName>
{
	public static readonly TagName Empty;

	[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)]
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

	[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(2)]
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

	[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(2)]
	public static implicit operator TagName(string value)
	{
		if (value != null)
		{
			return new TagName(value);
		}
		return Empty;
	}
}
