using System;
using System.Collections;
using System.Collections.Generic;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Helpers;

[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(2)]
[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
internal sealed class GenericCollectionToNonGenericAdapter<T> : IList, ICollection, IEnumerable
{
	[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(1)]
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

	[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(1)]
	public object SyncRoot
	{
		[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
		get
		{
			throw new NotSupportedException();
		}
	}

	[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
	public GenericCollectionToNonGenericAdapter(ICollection<T> genericCollection)
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

	[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
	public void CopyTo(Array array, int index)
	{
		throw new NotSupportedException();
	}

	[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
	public IEnumerator GetEnumerator()
	{
		return genericCollection.GetEnumerator();
	}
}
