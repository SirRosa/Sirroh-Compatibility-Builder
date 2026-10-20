using System.Runtime.CompilerServices;

namespace YamlDotNet.Core.ObjectPool;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal class DefaultPooledObjectPolicy<T> : IPooledObjectPolicy<T> where T : class, new()
{
	public T Create()
	{
		return new T();
	}

	public bool Return(T obj)
	{
		if (obj is IResettable resettable)
		{
			return resettable.TryReset();
		}
		return true;
	}
}
