using System;
using System.Diagnostics;
using System.Runtime.CompilerServices;
using System.Text;

namespace YamlDotNet.Core.ObjectPool;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
[DebuggerStepThrough]
internal static class StringBuilderPool
{
	[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
	internal readonly struct BuilderWrapper(StringBuilder builder, ObjectPool<StringBuilder> pool) : IDisposable
	{
		public readonly StringBuilder Builder = builder;

		private readonly ObjectPool<StringBuilder> pool = pool;

		public override string ToString()
		{
			return Builder.ToString();
		}

		public void Dispose()
		{
			pool.Return(Builder);
		}
	}

	private static readonly ObjectPool<StringBuilder> Pool = ObjectPool.Create(new StringBuilderPooledObjectPolicy
	{
		InitialCapacity = 16,
		MaximumRetainedCapacity = 1024
	});

	public static BuilderWrapper Rent()
	{
		StringBuilder builder = Pool.Get();
		return new BuilderWrapper(builder, Pool);
	}
}
