using System.Runtime.CompilerServices;

namespace YamlDotNet.Core.ObjectPool;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal abstract class ObjectPool<T> where T : class
{
	public abstract T Get();

	public abstract void Return(T obj);
}
[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal static class ObjectPool
{
	public static ObjectPool<T> Create<T>([_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(new byte[] { 2, 1 })] IPooledObjectPolicy<T> policy = null) where T : class, new()
	{
		return new DefaultObjectPool<T>(policy ?? new DefaultPooledObjectPolicy<T>());
	}

	public static ObjectPool<T> Create<T>(int maximumRetained, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(new byte[] { 2, 1 })] IPooledObjectPolicy<T> policy = null) where T : class, new()
	{
		return new DefaultObjectPool<T>(policy ?? new DefaultPooledObjectPolicy<T>(), maximumRetained);
	}
}
