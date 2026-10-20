namespace QuickStackStore;

internal struct RestockData(ItemData itemData, int potentialCurrentStackSize, int maximumWantedStackSize)
{
	internal ItemData itemData = itemData;

	internal int potentialCurrentStackSize = potentialCurrentStackSize;

	internal int maximumWantedStackSize = maximumWantedStackSize;
}
