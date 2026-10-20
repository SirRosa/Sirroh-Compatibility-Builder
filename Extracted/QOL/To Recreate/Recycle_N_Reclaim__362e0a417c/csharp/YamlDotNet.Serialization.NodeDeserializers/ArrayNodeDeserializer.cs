using System;
using System.Collections;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization.NodeDeserializers;

internal sealed class ArrayNodeDeserializer : INodeDeserializer
{
	[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
	[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(2)]
	private sealed class ArrayList : IList, ICollection, IEnumerable
	{
		[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(new byte[] { 1, 2 })]
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

		[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(1)]
		public object SyncRoot
		{
			[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
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

		[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
		public void CopyTo(Array array, int index)
		{
			Array.Copy(data, 0, array, index, Count);
		}

		[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
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

	[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
	public bool Deserialize(IParser parser, Type expectedType, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(new byte[] { 1, 1, 1, 2 })] Func<IParser, Type, object> nestedObjectDeserializer, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] out object value)
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
