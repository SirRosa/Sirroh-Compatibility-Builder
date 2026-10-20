using System;

namespace Zen.Lib;

internal static class MathLib
{
	public static ulong GetCantorID(Vector2i v)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		return GetCantorID(v.x, v.y);
	}

	public static ulong GetCantorID(int x, int y)
	{
		ulong num = ToUnsigned(x);
		ulong num2 = ToUnsigned(y);
		return (num + num2) * (num + num2 + 1) / 2 + num2;
		static ulong ToUnsigned(int n)
		{
			if (n < 0)
			{
				return (ulong)((long)n * -2L - 1);
			}
			return (ulong)n * 2uL;
		}
	}

	public static Vector2i FromCantorID(ulong id)
	{
		//IL_0049: Unknown result type (might be due to invalid IL or missing references)
		ulong num = (ulong)Math.Floor((Math.Sqrt(8 * id + 1) - 1.0) / 2.0);
		ulong num2 = (num * num + num) / 2;
		uint num3 = (uint)(id - num2);
		int num4 = FromUnsigned((uint)(num - num3));
		int num5 = FromUnsigned(num3);
		return new Vector2i(num4, num5);
		static int FromUnsigned(uint n)
		{
			return (int)((n % 2 == 0) ? (n / 2) : ((n + 1) / -2));
		}
	}
}
