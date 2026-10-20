using System;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Core;

internal sealed class _003Cea849434_002D302f_002D4f54_002D8316_002D45c7b2236612_003EVersion
{
	public int Major { get; }

	public int Minor { get; }

	public _003Cea849434_002D302f_002D4f54_002D8316_002D45c7b2236612_003EVersion(int major, int minor)
	{
		if (major < 0)
		{
			throw new ArgumentOutOfRangeException("major", $"{major} should be >= 0");
		}
		Major = major;
		if (minor < 0)
		{
			throw new ArgumentOutOfRangeException("minor", $"{minor} should be >= 0");
		}
		Minor = minor;
	}

	[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)]
	public override bool Equals(object obj)
	{
		if (obj is _003Cea849434_002D302f_002D4f54_002D8316_002D45c7b2236612_003EVersion obj2 && Major == obj2.Major)
		{
			return Minor == obj2.Minor;
		}
		return false;
	}

	public override int GetHashCode()
	{
		return _003Ceda05417_002Dc99c_002D442b_002D93de_002De22ef768bacb_003EHashCode.CombineHashCodes(Major.GetHashCode(), Minor.GetHashCode());
	}
}
