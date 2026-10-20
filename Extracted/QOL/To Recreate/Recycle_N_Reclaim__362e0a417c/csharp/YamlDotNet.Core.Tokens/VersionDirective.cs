using System.Runtime.CompilerServices;

namespace YamlDotNet.Core.Tokens;

[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
internal sealed class VersionDirective : Token
{
	public Version Version { get; }

	public VersionDirective(Version version)
		: this(version, Mark.Empty, Mark.Empty)
	{
	}

	public VersionDirective(Version version, Mark start, Mark end)
		: base(in start, in end)
	{
		Version = version;
	}

	[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(2)]
	public override bool Equals(object obj)
	{
		if (obj is VersionDirective versionDirective)
		{
			return Version.Equals(versionDirective.Version);
		}
		return false;
	}

	public override int GetHashCode()
	{
		return Version.GetHashCode();
	}
}
