using System;
using System.Diagnostics;
using System.Runtime.CompilerServices;
using System.Text;

namespace YamlDotNet.Helpers;

[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
[DebuggerStepThrough]
[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
internal static class StringBuilderPool
{
	[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
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
