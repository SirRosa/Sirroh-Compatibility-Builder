using System.Runtime.CompilerServices;
using YamlDotNet.Core.Tokens;

namespace YamlDotNet.Core;

internal static class Constants
{
	[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(1)]
	public static readonly TagDirective[] DefaultTagDirectives = new TagDirective[2]
	{
		new TagDirective("!", "!"),
		new TagDirective("!!", "tag:yaml.org,2002:")
	};

	public const int MajorVersion = 1;

	public const int MinorVersion = 3;
}
