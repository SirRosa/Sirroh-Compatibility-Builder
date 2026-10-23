namespace AzuAutoStore;

public static class ToggleExtensions
{
	public static bool IsOn(this AzuAutoStorePlugin.Toggle toggle)
	{
		return toggle == AzuAutoStorePlugin.Toggle.On;
	}

	public static bool IsOff(this AzuAutoStorePlugin.Toggle toggle)
	{
		return toggle == AzuAutoStorePlugin.Toggle.Off;
	}
}
