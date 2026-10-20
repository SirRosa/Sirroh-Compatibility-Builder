using System.Runtime.CompilerServices;
using YamlDotNet.Core.Tokens;

namespace YamlDotNet.Core;

internal static class Constants
{
	[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(1)]
	public static readonly TagDirective[] DefaultTagDirectives = new TagDirective[2]
	{
		new TagDirective("!", "!"),
		new TagDirective("!!", "tag:yaml.org,2002:")
	};

	public const int MajorVersion = 1;

	public const int MinorVersion = 3;
}
