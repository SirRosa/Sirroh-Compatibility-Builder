namespace Zen.Lib;

public static class MessageHudExt
{
	public static void ShowMessage(this MessageHud msgHud, long targetPeerID, MessageType type, string text)
	{
		//IL_0013: Unknown result type (might be due to invalid IL or missing references)
		//IL_0019: Expected I4, but got Unknown
		ZRoutedRpc.instance.InvokeRoutedRPC(targetPeerID, "ShowMessage", new object[2]
		{
			(int)type,
			text
		});
	}
}
