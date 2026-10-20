using System.Runtime.CompilerServices;

namespace YamlDotNet.Core.Tokens;

[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
internal sealed class VersionDirective : Token
{
	public Version Version { get; }

	public VersionDirective(Version version)
		: this(version, Mark.Empty, Mark.Empty)
	{
	}

	public VersionDirective(Version version, Mark start, Mark end)
		: base(start, end)
	{
		Version = version;
	}

	[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(2)]
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
