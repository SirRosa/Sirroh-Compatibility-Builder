namespace Zen.Lib;

public static class ZRoutedRpcExt
{
	public static void Unregister(this ZRoutedRpc? zrpc, string name)
	{
		if (zrpc != null && zrpc.m_functions.Remove(StringExtensionMethods.GetStableHashCode(name)))
		{
			Logging<ModLib>.InterpolatedString msg = new Logging<ModLib>.InterpolatedString(18, 1, out var shouldAppend);
			if (shouldAppend)
			{
				msg.AppendLiteral("Unregistered RPC: ");
				msg.AppendFormatted(name);
			}
			Logging<ModLib>.Info(msg);
		}
	}
}
