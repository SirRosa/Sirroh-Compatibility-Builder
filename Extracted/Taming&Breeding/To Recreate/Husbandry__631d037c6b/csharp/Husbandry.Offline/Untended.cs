namespace Husbandry.Offline;

internal static class Untended
{
	internal static bool Yes(bool hasOwner, bool ownerIsPresent)
	{
		if (hasOwner)
		{
			return !ownerIsPresent;
		}
		return true;
	}
}
