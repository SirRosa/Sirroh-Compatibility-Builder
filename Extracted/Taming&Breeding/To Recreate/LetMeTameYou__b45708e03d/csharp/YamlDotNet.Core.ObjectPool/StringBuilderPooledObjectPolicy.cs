using System.Runtime.CompilerServices;
using System.Text;

namespace YamlDotNet.Core.ObjectPool;

[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
internal class StringBuilderPooledObjectPolicy : IPooledObjectPolicy<StringBuilder>
{
	public int InitialCapacity { get; set; } = 100;

	public int MaximumRetainedCapacity { get; set; } = 4096;

	public StringBuilder Create()
	{
		return new StringBuilder(InitialCapacity);
	}

	public bool Return(StringBuilder obj)
	{
		if (obj.Capacity > MaximumRetainedCapacity)
		{
			return false;
		}
		obj.Clear();
		return true;
	}
}
