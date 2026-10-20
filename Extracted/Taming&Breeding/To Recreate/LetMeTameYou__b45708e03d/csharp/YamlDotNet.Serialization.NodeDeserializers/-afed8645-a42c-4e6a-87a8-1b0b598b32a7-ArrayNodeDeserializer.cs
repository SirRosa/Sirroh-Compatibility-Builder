using System;
using System.Collections;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Serialization.Utilities;

namespace YamlDotNet.Serialization.NodeDeserializers;

[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
internal sealed class _003Cafed8645_002Da42c_002D4e6a_002D87a8_002D1b0b598b32a7_003EArrayNodeDeserializer : _003Cb785578c_002Db96c_002D492b_002D85eb_002Da7a6a41c8875_003EINodeDeserializer
{
	[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)]
	[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
	private sealed class ArrayList : IList, ICollection, IEnumerable
	{
		[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(new byte[] { 1, 2 })]
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

		[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(1)]
		public object SyncRoot
		{
			[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
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

		[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
		public void CopyTo(Array array, int index)
		{
			Array.Copy(data, 0, array, index, Count);
		}

		[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
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

	private readonly _003C6b570e97_002D8c61_002D429b_002D9b61_002D13cef86f0e8a_003EINamingConvention enumNamingConvention;

	private readonly _003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector typeInspector;

	public _003Cafed8645_002Da42c_002D4e6a_002D87a8_002D1b0b598b32a7_003EArrayNodeDeserializer(_003C6b570e97_002D8c61_002D429b_002D9b61_002D13cef86f0e8a_003EINamingConvention enumNamingConvention, _003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector typeInspector)
	{
		this.enumNamingConvention = enumNamingConvention;
		this.typeInspector = typeInspector;
	}

	public bool Deserialize(_003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser parser, Type expectedType, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(new byte[] { 1, 1, 1, 2 })] Func<_003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser, Type, object> nestedObjectDeserializer, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] out object value, _003Ccf1bb9c3_002D9707_002D4afa_002Daa6b_002D02a0a9430a5f_003EObjectDeserializer rootDeserializer)
	{
		if (!expectedType.IsArray)
		{
			value = false;
			return false;
		}
		Type itemType = expectedType.GetElementType();
		ArrayList arrayList = new ArrayList();
		Array array = null;
		_003Cc8fa7753_002Dab8f_002D4083_002Da847_002D6f80918e02b0_003ECollectionNodeDeserializer.DeserializeHelper(itemType, parser, nestedObjectDeserializer, arrayList, canUpdate: true, enumNamingConvention, typeInspector, PromiseResolvedHandler);
		array = Array.CreateInstance(itemType, arrayList.Count);
		arrayList.CopyTo(array, 0);
		value = array;
		return true;
		[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)]
		void PromiseResolvedHandler(int index, object value2)
		{
			if (array == null)
			{
				throw new InvalidOperationException("Destination array is still null");
			}
			array.SetValue(_003Cd3168ea3_002D9f8f_002D48fd_002Db39d_002D58bb322fb29c_003ETypeConverter.ChangeType(value2, itemType, enumNamingConvention, typeInspector), index);
		}
	}
}
