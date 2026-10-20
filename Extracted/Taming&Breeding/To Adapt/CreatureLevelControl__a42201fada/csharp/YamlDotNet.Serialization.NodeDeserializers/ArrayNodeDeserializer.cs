using System;
using System.Collections;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization.NodeDeserializers;

internal sealed class ArrayNodeDeserializer : INodeDeserializer
{
	[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(2)]
	[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
	private sealed class ArrayList : IList, ICollection, IEnumerable
	{
		[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(new byte[] { 1, 2 })]
		private object[] data;

		public bool IsFixedSize => false;

		public bool IsReadOnly => false;

		public object this[int index]
		{
			get
			{
				return data[index];
			}
			set
			{
				data[index] = value;
			}
		}

		public int Count { get; private set; }

		public bool IsSynchronized => false;

		[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(1)]
		public object SyncRoot
		{
			[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
			get
			{
				return data;
			}
		}

		public ArrayList()
		{
			Clear();
		}

		public int Add(object value)
		{
			if (Count == data.Length)
			{
				Array.Resize(ref data, data.Length * 2);
			}
			data[Count] = value;
			return Count++;
		}

		public void Clear()
		{
			data = new object[10];
			Count = 0;
		}

		bool IList.Contains(object value)
		{
			throw new NotSupportedException();
		}

		int IList.IndexOf(object value)
		{
			throw new NotSupportedException();
		}

		void IList.Insert(int index, object value)
		{
			throw new NotSupportedException();
		}

		void IList.Remove(object value)
		{
			throw new NotSupportedException();
		}

		void IList.RemoveAt(int index)
		{
			throw new NotSupportedException();
		}

		[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
		public void CopyTo(Array array, int index)
		{
			Array.Copy(data, 0, array, index, Count);
		}

		[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
		public IEnumerator GetEnumerator()
		{
			int i = 0;
			while (i < Count)
			{
				yield return data[i];
				int num = i + 1;
				i = num;
			}
		}
	}

	[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
	bool INodeDeserializer.Deserialize(IParser parser, Type expectedType, [_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(new byte[] { 1, 1, 1, 2 })] Func<IParser, Type, object> nestedObjectDeserializer, [_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)] out object value)
	{
		if (!expectedType.IsArray)
		{
			value = false;
			return false;
		}
		Type? elementType = expectedType.GetElementType();
		ArrayList arrayList = new ArrayList();
		CollectionNodeDeserializer.DeserializeHelper(elementType, parser, nestedObjectDeserializer, arrayList, canUpdate: true);
		Array array = Array.CreateInstance(elementType, arrayList.Count);
		arrayList.CopyTo(array, 0);
		value = array;
		return true;
	}
}
