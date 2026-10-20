using System;
using System.Collections;
using System.Collections.Generic;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Helpers;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal sealed class _003Cd373bcab_002D2c3e_002D415f_002Db75b_002D9b34da7d0852_003EGenericDictionaryToNonGenericAdapter<TKey, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] TValue> : IDictionary, ICollection, IEnumerable
{
	[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
	private class DictionaryEnumerator : IDictionaryEnumerator, IEnumerator
	{
		[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(new byte[] { 1, 0, 1, 1 })]
		private readonly IEnumerator<KeyValuePair<TKey, TValue>> enumerator;

		public DictionaryEntry Entry => new DictionaryEntry(Key, Value);

		public object Key => enumerator.Current.Key;

		[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
		public object Value
		{
			[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)]
			get
			{
				return enumerator.Current.Value;
			}
		}

		public object Current => Entry;

		public DictionaryEnumerator([_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(new byte[] { 1, 0, 1, 1 })] IEnumerator<KeyValuePair<TKey, TValue>> enumerator)
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

	[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	public object this[object key]
	{
		[return: _003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
		get
		{
			throw new NotSupportedException();
		}
		[param: _003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
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

	public _003Cd373bcab_002D2c3e_002D415f_002Db75b_002D9b34da7d0852_003EGenericDictionaryToNonGenericAdapter(IDictionary<TKey, TValue> genericDictionary)
	{
		this.genericDictionary = genericDictionary ?? throw new ArgumentNullException("genericDictionary");
	}

	public void Add(object key, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] object value)
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
