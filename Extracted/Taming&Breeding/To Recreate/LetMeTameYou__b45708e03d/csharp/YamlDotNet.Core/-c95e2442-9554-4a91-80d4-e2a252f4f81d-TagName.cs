using System;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Core;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal readonly struct _003Cc95e2442_002D9554_002D4a91_002D80d4_002De2a252f4f81d_003ETagName : IEquatable<_003Cc95e2442_002D9554_002D4a91_002D80d4_002De2a252f4f81d_003ETagName>
{
	public static readonly _003Cc95e2442_002D9554_002D4a91_002D80d4_002De2a252f4f81d_003ETagName Empty;

	[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
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

	public _003Cc95e2442_002D9554_002D4a91_002D80d4_002De2a252f4f81d_003ETagName(string value)
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

	public bool Equals(_003Cc95e2442_002D9554_002D4a91_002D80d4_002De2a252f4f81d_003ETagName other)
	{
		return object.Equals(value, other.value);
	}

	[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)]
	public override bool Equals(object obj)
	{
		if (obj is _003Cc95e2442_002D9554_002D4a91_002D80d4_002De2a252f4f81d_003ETagName other)
		{
			return Equals(other);
		}
		return false;
	}

	public override int GetHashCode()
	{
		return value?.GetHashCode() ?? 0;
	}

	public static bool operator ==(_003Cc95e2442_002D9554_002D4a91_002D80d4_002De2a252f4f81d_003ETagName left, _003Cc95e2442_002D9554_002D4a91_002D80d4_002De2a252f4f81d_003ETagName right)
	{
		return left.Equals(right);
	}

	public static bool operator !=(_003Cc95e2442_002D9554_002D4a91_002D80d4_002De2a252f4f81d_003ETagName left, _003Cc95e2442_002D9554_002D4a91_002D80d4_002De2a252f4f81d_003ETagName right)
	{
		return !(left == right);
	}

	public static bool operator ==(_003Cc95e2442_002D9554_002D4a91_002D80d4_002De2a252f4f81d_003ETagName left, string right)
	{
		return object.Equals(left.value, right);
	}

	public static bool operator !=(_003Cc95e2442_002D9554_002D4a91_002D80d4_002De2a252f4f81d_003ETagName left, string right)
	{
		return !(left == right);
	}

	[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)]
	public static implicit operator _003Cc95e2442_002D9554_002D4a91_002D80d4_002De2a252f4f81d_003ETagName(string value)
	{
		if (value != null)
		{
			return new _003Cc95e2442_002D9554_002D4a91_002D80d4_002De2a252f4f81d_003ETagName(value);
		}
		return Empty;
	}
}
