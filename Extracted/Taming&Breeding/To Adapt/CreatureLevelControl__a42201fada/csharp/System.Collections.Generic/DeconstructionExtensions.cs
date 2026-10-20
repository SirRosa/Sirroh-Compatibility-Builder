using System.Runtime.CompilerServices;

namespace System.Collections.Generic;

internal static class DeconstructionExtensions
{
	[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
	public static void Deconstruct<[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)] TKey, [_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)] TValue>([_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(new byte[] { 0, 1, 1 })] this KeyValuePair<TKey, TValue> pair, out TKey key, out TValue value)
	{
		key = pair.Key;
		value = pair.Value;
	}
}
