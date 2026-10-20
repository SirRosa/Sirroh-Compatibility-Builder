using System.Collections;
using System.Collections.Generic;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Helpers;

[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
internal interface IOrderedDictionary<TKey, [_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)] TValue> : IDictionary<TKey, TValue>, ICollection<KeyValuePair<TKey, TValue>>, IEnumerable<KeyValuePair<TKey, TValue>>, IEnumerable
{
	[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(new byte[] { 0, 1, 1 })]
	KeyValuePair<TKey, TValue> this[int index]
	{
		[return: _003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(new byte[] { 0, 1, 1 })]
		get;
		[param: _003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(new byte[] { 0, 1, 1 })]
		set;
	}

	void Insert(int index, TKey key, TValue value);

	void RemoveAt(int index);
}
