using System;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Core.ObjectPool;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal static class StringLookAheadBufferPool
{
	[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
	internal readonly struct BufferWrapper(_003C3ccba267_002Dcc21_002D47f6_002D87b1_002Dacd20b3e4fe6_003EStringLookAheadBuffer buffer, ObjectPool<_003C3ccba267_002Dcc21_002D47f6_002D87b1_002Dacd20b3e4fe6_003EStringLookAheadBuffer> pool) : IDisposable
	{
		public readonly _003C3ccba267_002Dcc21_002D47f6_002D87b1_002Dacd20b3e4fe6_003EStringLookAheadBuffer Buffer = buffer;

		private readonly ObjectPool<_003C3ccba267_002Dcc21_002D47f6_002D87b1_002Dacd20b3e4fe6_003EStringLookAheadBuffer> pool = pool;

		public override string ToString()
		{
			return Buffer.ToString();
		}

		public void Dispose()
		{
			pool.Return(Buffer);
		}
	}

	private static readonly ObjectPool<_003C3ccba267_002Dcc21_002D47f6_002D87b1_002Dacd20b3e4fe6_003EStringLookAheadBuffer> Pool = ObjectPool.Create(new DefaultPooledObjectPolicy<_003C3ccba267_002Dcc21_002D47f6_002D87b1_002Dacd20b3e4fe6_003EStringLookAheadBuffer>());

	public static BufferWrapper Rent(string value)
	{
		_003C3ccba267_002Dcc21_002D47f6_002D87b1_002Dacd20b3e4fe6_003EStringLookAheadBuffer obj = Pool.Get();
		obj.Value = value;
		return new BufferWrapper(obj, Pool);
	}
}
