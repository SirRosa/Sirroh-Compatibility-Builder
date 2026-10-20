using System;
using System.Collections.Concurrent;
using System.Runtime.CompilerServices;
using System.Threading;

namespace YamlDotNet.Core.ObjectPool;

[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(new byte[] { 0, 1 })]
[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
internal class DefaultObjectPool<T> : ObjectPool<T> where T : class
{
	private readonly Func<T> createFunc;

	private readonly Func<T, bool> returnFunc;

	private readonly int maxCapacity;

	private int numItems;

	private protected readonly ConcurrentQueue<T> items = new ConcurrentQueue<T>();

	[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	private protected T fastItem;

	public DefaultObjectPool(IPooledObjectPolicy<T> policy)
		: this(policy, Environment.ProcessorCount * 2)
	{
	}

	public DefaultObjectPool(IPooledObjectPolicy<T> policy, int maximumRetained)
	{
		createFunc = policy.Create;
		returnFunc = policy.Return;
		maxCapacity = maximumRetained - 1;
	}

	public override T Get()
	{
		T result = fastItem;
		if (result == null || Interlocked.CompareExchange(ref fastItem, null, result) != result)
		{
			if (items.TryDequeue(out result))
			{
				Interlocked.Decrement(ref numItems);
				return result;
			}
			return createFunc();
		}
		return result;
	}

	public override void Return(T obj)
	{
		ReturnCore(obj);
	}

	private protected bool ReturnCore(T obj)
	{
		if (!returnFunc(obj))
		{
			return false;
		}
		if (fastItem != null || Interlocked.CompareExchange(ref fastItem, obj, null) != null)
		{
			if (Interlocked.Increment(ref numItems) <= maxCapacity)
			{
				items.Enqueue(obj);
				return true;
			}
			Interlocked.Decrement(ref numItems);
			return false;
		}
		return true;
	}
}
