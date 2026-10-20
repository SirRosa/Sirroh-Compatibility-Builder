using System.Runtime.CompilerServices;

namespace YamlDotNet.Core.Tokens;

[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
internal sealed class _003Cf27dd385_002D3eaa_002D42f1_002D8a3f_002Dd10c08c1b0c1_003EVersionDirective : _003Cf0484293_002Dc2f9_002D46d3_002Dbedc_002D375db65eb72f_003EToken
{
	public _003Cea849434_002D302f_002D4f54_002D8316_002D45c7b2236612_003EVersion Version { get; }

	public _003Cf27dd385_002D3eaa_002D42f1_002D8a3f_002Dd10c08c1b0c1_003EVersionDirective(_003Cea849434_002D302f_002D4f54_002D8316_002D45c7b2236612_003EVersion version)
		: this(version, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty)
	{
	}

	public _003Cf27dd385_002D3eaa_002D42f1_002D8a3f_002Dd10c08c1b0c1_003EVersionDirective(_003Cea849434_002D302f_002D4f54_002D8316_002D45c7b2236612_003EVersion version, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark start, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark end)
		: base(in start, in end)
	{
		Version = version;
	}

	[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)]
	public override bool Equals(object obj)
	{
		if (obj is _003Cf27dd385_002D3eaa_002D42f1_002D8a3f_002Dd10c08c1b0c1_003EVersionDirective obj2)
		{
			return Version.Equals(obj2.Version);
		}
		return false;
	}

	public override int GetHashCode()
	{
		return Version.GetHashCode();
	}
}
