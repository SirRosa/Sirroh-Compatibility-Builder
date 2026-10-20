using System.Runtime.CompilerServices;

namespace YamlDotNet.Core.ObjectPool;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
internal interface IPooledObjectPolicy<T>
{
	T Create();

	bool Return(T obj);
}
