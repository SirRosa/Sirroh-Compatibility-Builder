using System.Collections.Generic;
using System.Runtime.CompilerServices;

namespace Recycle_N_Reclaim.GamePatches.MarkAsTrash;

public static class CollectionExtension
{
	[_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(1)]
	public static bool XAdd<[_003Cc6ee30b4_002D1fc8_002D48a6_002Db646_002D32a3d54a7999_003ENullable(2)] T>(this HashSet<T> instance, T item, bool isToggle = true)
	{
		if (isToggle)
		{
			if (instance.Contains(item))
			{
				instance.Remove(item);
				return false;
			}
			instance.Add(item);
			return true;
		}
		if (!instance.Contains(item))
		{
			instance.Add(item);
			return true;
		}
		return false;
	}
}
