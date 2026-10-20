using System;
using System.Collections;
using System.Collections.Generic;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Helpers;

[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)]
internal sealed class _003Cf9935bad_002D19ae_002D4093_002Db324_002D5f7ca136b22f_003EGenericCollectionToNonGenericAdapter<T> : IList, ICollection, IEnumerable
{
	[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(1)]
	private readonly ICollection<T> genericCollection;

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

	public object this[int index]
	{
		get
		{
			throw new NotSupportedException();
		}
		set
		{
			((IList<T>)genericCollection)[index] = (T)value;
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

	[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(1)]
	public object SyncRoot
	{
		[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
		get
		{
			throw new NotSupportedException();
		}
	}

	[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
	public _003Cf9935bad_002D19ae_002D4093_002Db324_002D5f7ca136b22f_003EGenericCollectionToNonGenericAdapter(ICollection<T> genericCollection)
	{
		this.genericCollection = genericCollection ?? throw new ArgumentNullException("genericCollection");
	}

	public int Add(object value)
	{
		int count = genericCollection.Count;
		genericCollection.Add((T)value);
		return count;
	}

	public void Clear()
	{
		genericCollection.Clear();
	}

	public bool Contains(object value)
	{
		throw new NotSupportedException();
	}

	public int IndexOf(object value)
	{
		throw new NotSupportedException();
	}

	public void Insert(int index, object value)
	{
		throw new NotSupportedException();
	}

	public void Remove(object value)
	{
		throw new NotSupportedException();
	}

	public void RemoveAt(int index)
	{
		throw new NotSupportedException();
	}

	[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
	public void CopyTo(Array array, int index)
	{
		throw new NotSupportedException();
	}

	[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
	public IEnumerator GetEnumerator()
	{
		return genericCollection.GetEnumerator();
	}
}
