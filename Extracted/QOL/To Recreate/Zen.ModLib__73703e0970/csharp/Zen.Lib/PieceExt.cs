using UnityEngine;

namespace Zen.Lib;

public static class PieceExt
{
	public static int GetPrefabHash(this Piece piece)
	{
		return StringExtensionMethods.GetStableHashCode(piece.GetPrefabName());
	}

	public static string GetPrefabName(this Piece piece)
	{
		return Utils.GetPrefabName(((Object)piece).name);
	}

	public static bool IsStackOrPile(this Piece piece)
	{
		string prefabName = piece.GetPrefabName();
		if (!prefabName.EndsWith("_stack"))
		{
			return prefabName.EndsWith("_pile");
		}
		return true;
	}
}
