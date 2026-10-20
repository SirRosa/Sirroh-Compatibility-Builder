namespace Recycle_N_Reclaim;

public static class ToggleExtensions
{
	public static bool IsOn(this Recycle_N_ReclaimPlugin.Toggle toggle)
	{
		return toggle == Recycle_N_ReclaimPlugin.Toggle.On;
	}

	public static bool IsOff(this Recycle_N_ReclaimPlugin.Toggle toggle)
	{
		return toggle == Recycle_N_ReclaimPlugin.Toggle.Off;
	}
}
