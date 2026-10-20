using System;
using System.Diagnostics;
using System.Runtime.CompilerServices;
using System.Threading;

namespace YamlDotNet.Helpers;

[DebuggerStepThrough]
[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
internal sealed class ConcurrentObjectPool<T> where T : class
{
	[DebuggerDisplay("{value,nq}")]
	[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(0)]
	private struct Element
	{
		[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)]
		internal T value;
	}

	[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(0)]
	internal delegate T Factory();

	[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)]
	private T firstItem;

	[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(new byte[] { 1, 0, 0 })]
	private readonly Element[] items;

	[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(new byte[] { 1, 0 })]
	private readonly Factory factory;

	internal ConcurrentObjectPool([_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(new byte[] { 1, 0 })] Factory factory)
		: this(factory, Environment.ProcessorCount * 2)
	{
	}

	internal ConcurrentObjectPool([_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(new byte[] { 1, 0 })] Factory factory, int size)
	{
		this.factory = factory;
		items = new Element[size - 1];
	}

	private T CreateInstance()
	{
		return factory();
	}

	internal T Allocate()
	{
		T val = firstItem;
		if (val == null || val != Interlocked.CompareExchange(ref firstItem, null, val))
		{
			val = AllocateSlow();
		}
		return val;
	}

	private T AllocateSlow()
	{
		Element[] array = items;
		for (int i = 0; i < array.Length; i++)
		{
			T value = array[i].value;
			if (value != null && value == Interlocked.CompareExchange(ref array[i].value, null, value))
			{
				return value;
			}
		}
		return CreateInstance();
	}

	internal void Free(T obj)
	{
		if (firstItem == null)
		{
			firstItem = obj;
		}
		else
		{
			FreeSlow(obj);
		}
	}

	private void FreeSlow(T obj)
	{
		Element[] array = items;
		for (int i = 0; i < array.Length; i++)
		{
			if (array[i].value == null)
			{
				array[i].value = obj;
				break;
			}
		}
	}

	[Conditional("DEBUG")]
	private void Validate(object obj)
	{
		Element[] array = items;
		for (int i = 0; i < array.Length && array[i].value != null; i++)
		{
		}
	}
}
