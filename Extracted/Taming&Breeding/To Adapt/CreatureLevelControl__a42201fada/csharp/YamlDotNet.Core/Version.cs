using System;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Core;

internal sealed class Version
{
	public int Major { get; }

	public int Minor { get; }

	public Version(int major, int minor)
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

	[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(2)]
	public override bool Equals(object obj)
	{
		if (obj is Version version && Major == version.Major)
		{
			return Minor == version.Minor;
		}
		return false;
	}

	public override int GetHashCode()
	{
		return HashCode.CombineHashCodes(Major.GetHashCode(), Minor.GetHashCode());
	}
}
