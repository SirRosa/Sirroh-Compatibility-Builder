using System;
using System.Diagnostics;
using System.Text;

namespace YamlDotNet.Helpers;

[DebuggerStepThrough]
internal static class StringBuilderPool
{
	internal readonly struct BuilderWrapper(StringBuilder builder, ConcurrentObjectPool<StringBuilder> pool) : IDisposable
	{
		public readonly StringBuilder Builder = builder;

		private readonly ConcurrentObjectPool<StringBuilder> _pool = pool;

		public override string ToString()
		{
			return Builder.ToString();
		}

		public void Dispose()
		{
			StringBuilder builder = Builder;
			if (builder.Capacity <= 1024)
			{
				builder.Length = 0;
				_pool.Free(builder);
			}
		}
	}

	private static readonly ConcurrentObjectPool<StringBuilder> Pool;

	static StringBuilderPool()
	{
		Pool = new ConcurrentObjectPool<StringBuilder>(() => new StringBuilder());
	}

	public static BuilderWrapper Rent()
	{
		return new BuilderWrapper(Pool.Allocate(), Pool);
	}
}
