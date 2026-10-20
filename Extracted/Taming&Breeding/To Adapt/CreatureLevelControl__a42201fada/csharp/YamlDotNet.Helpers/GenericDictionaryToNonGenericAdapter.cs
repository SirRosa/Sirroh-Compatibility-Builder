using System;
using System.Collections;
using System.Collections.Generic;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Helpers;

[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
internal sealed class GenericDictionaryToNonGenericAdapter<TKey, [_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)] TValue> : IDictionary, ICollection, IEnumerable
{
	[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
	private class DictionaryEnumerator : IDictionaryEnumerator, IEnumerator
	{
		[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(new byte[] { 1, 0, 1, 1 })]
		private readonly IEnumerator<KeyValuePair<TKey, TValue>> enumerator;

		public DictionaryEntry Entry => new DictionaryEntry(Key, Value);

		public object Key => enumerator.Current.Key;

		[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)]
		public object Value
		{
			[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(2)]
			get
			{
				return enumerator.Current.Value;
			}
		}

		public object Current => Entry;

		public DictionaryEnumerator([_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(new byte[] { 1, 0, 1, 1 })] IEnumerator<KeyValuePair<TKey, TValue>> enumerator)
		{
			this.enumerator = enumerator;
		}

		public bool MoveNext()
		{
			return enumerator.MoveNext();
		}

		public void Reset()
		{
			enumerator.Reset();
		}
	}

	private readonly IDictionary<TKey, TValue> genericDictionary;

	public bool IsFixedSize
	{
		get
		{
			throw new NotSupportedException();
		}
	}

	public bool IsReadOnly
	{
		get
		{
			throw new NotSupportedException();
		}
	}

	public ICollection Keys
	{
		get
		{
			throw new NotSupportedException();
		}
	}

	public ICollection Values
	{
		get
		{
			throw new NotSupportedException();
		}
	}

	[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)]
	public object this[object key]
	{
		[return: _003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)]
		get
		{
			throw new NotSupportedException();
		}
		[param: _003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)]
		set
		{
			genericDictionary[(TKey)key] = (TValue)value;
		}
	}

	public int Count
	{
		get
		{
			throw new NotSupportedException();
		}
	}

	public bool IsSynchronized
	{
		get
		{
			throw new NotSupportedException();
		}
	}

	public object SyncRoot
	{
		get
		{
			throw new NotSupportedException();
		}
	}

	public GenericDictionaryToNonGenericAdapter(IDictionary<TKey, TValue> genericDictionary)
	{
		this.genericDictionary = genericDictionary ?? throw new ArgumentNullException("genericDictionary");
	}

	public void Add(object key, [_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)] object value)
	{
		throw new NotSupportedException();
	}

	public void Clear()
	{
		throw new NotSupportedException();
	}

	public bool Contains(object key)
	{
		throw new NotSupportedException();
	}

	public IDictionaryEnumerator GetEnumerator()
	{
		return new DictionaryEnumerator(genericDictionary.GetEnumerator());
	}

	public void Remove(object key)
	{
		throw new NotSupportedException();
	}

	public void CopyTo(Array array, int index)
	{
		throw new NotSupportedException();
	}

	IEnumerator IEnumerable.GetEnumerator()
	{
		return GetEnumerator();
	}
}
