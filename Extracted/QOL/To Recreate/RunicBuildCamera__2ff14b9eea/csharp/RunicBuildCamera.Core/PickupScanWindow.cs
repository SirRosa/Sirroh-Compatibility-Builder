using System;
using System.Collections.Generic;

namespace RunicBuildCamera.Core;

internal static class PickupScanWindow
{
	internal static int CopyNext<T>(IReadOnlyList<T> items, T[] buffer, ref int cursor)
	{
		if (items == null || items.Count == 0 || buffer.Length == 0)
		{
			cursor = 0;
			return 0;
		}
		int count = items.Count;
		if (cursor < 0 || cursor >= count)
		{
			cursor = 0;
		}
		int num = Math.Min(count, buffer.Length);
		for (int i = 0; i < num; i++)
		{
			buffer[i] = items[cursor];
			cursor = (cursor + 1) % count;
		}
		return num;
	}
}
