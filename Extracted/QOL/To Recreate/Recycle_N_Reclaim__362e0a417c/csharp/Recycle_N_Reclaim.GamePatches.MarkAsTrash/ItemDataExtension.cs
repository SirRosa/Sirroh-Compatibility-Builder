using System.Runtime.CompilerServices;

namespace Recycle_N_Reclaim.GamePatches.MarkAsTrash;

public static class ItemDataExtension
{
	[_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(1)]
	public static int GridVectorToGridIndex(this ItemData item, int width)
	{
		return item.m_gridPos.y * width + item.m_gridPos.x;
	}
}
