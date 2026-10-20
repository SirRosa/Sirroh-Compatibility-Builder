namespace YamlDotNet.Helpers;

internal static class _003Ca7a37fde_002D5f65_002D42cc_002Da170_002Dc7ccc055fb1c_003ENumberExtensions
{
	public static bool IsPowerOfTwo(this int value)
	{
		return (value & (value - 1)) == 0;
	}
}
