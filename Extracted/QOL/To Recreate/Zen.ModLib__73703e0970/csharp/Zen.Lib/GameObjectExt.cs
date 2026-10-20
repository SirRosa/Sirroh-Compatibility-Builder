using System;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

namespace Zen.Lib;

public static class GameObjectExt
{
	private static readonly Collider[] HitDataBuffer = new Collider[1000];

	public static int GetPrefabHash(this GameObject gameObject)
	{
		return StringExtensionMethods.GetStableHashCode(gameObject.GetPrefabName());
	}

	public static string GetPrefabName(this GameObject gameObject)
	{
		return Utils.GetPrefabName(((Object)gameObject).name);
	}

	public static T? GetClosest<T>(this GameObject self, float range, Func<T, bool>? filter = null) where T : MonoBehaviour
	{
		//IL_0031: Unknown result type (might be due to invalid IL or missing references)
		T result = default;
		float num = float.MaxValue;
		foreach (T nearbyPiece in self.GetNearbyPieces<T>(range, false))
		{
			float num2 = ((MonoBehaviour)(object)nearbyPiece).DistanceToSqr(self.transform.position);
			if (!(num2 > num) && (filter == null || filter(nearbyPiece)))
			{
				num = num2;
				result = nearbyPiece;
			}
		}
		return result;
	}

	public static IEnumerable<Piece> GetNearbyPiecesXZ(this GameObject self, float range)
	{
		return self.GetNearbyPieces(range, isOnlyXZ: true);
	}

	public static IEnumerable<Piece> GetNearbyPieces(this GameObject self, float range, bool isOnlyXZ = false)
	{
		Piece selfPiece = self.GetComponentInParent<Piece>();
		foreach (Piece s_allPiece in Piece.s_allPieces)
		{
			if (((Component)s_allPiece).gameObject.layer != Piece.s_ghostLayer && GetDistance(s_allPiece) < range && !((Object)(object)s_allPiece == (Object)(object)selfPiece) && Object.op_Implicit((Object)(object)s_allPiece))
			{
				yield return s_allPiece;
			}
		}
		float GetDistance(Piece p)
		{
			if (!isOnlyXZ)
			{
				return self.DistanceTo(((Component)p).gameObject);
			}
			return self.DistanceToXZ(((Component)p).gameObject);
		}
	}

	public static IEnumerable<T> GetNearbyPiecesXZ<T>(this GameObject self, float range) where T : Component
	{
		return self.GetNearbyPieces<T>(range, isOnlyXZ: true);
	}

	public static IEnumerable<T> GetNearbyPieces<T>(this GameObject self, float range, bool isOnlyXZ = false) where T : Component
	{
		T selfComponent = self.GetComponentInChildren<T>();
		return from piece in self.GetNearbyPieces(range, isOnlyXZ)
			select ((Component)piece).GetComponentInChildren<T>() into c
			where Object.op_Implicit((Object)(object)c) && (Object)(object)c != (Object)(object)selfComponent
			select c;
	}

	public static IEnumerable<T> GetNearbyFromOverlapSphere<T>(this GameObject self, float range, LayerMask layerMask) where T : Component
	{
		//IL_0016: Unknown result type (might be due to invalid IL or missing references)
		//IL_0017: Unknown result type (might be due to invalid IL or missing references)
		int hitCount = Physics.OverlapSphereNonAlloc(self.transform.position, range, HitDataBuffer, LayerMask.op_Implicit(layerMask));
		T selfComponent = self.GetComponentInParent<T>();
		for (int i = 0; i < hitCount; i++)
		{
			T componentInParent = ((Component)HitDataBuffer[i]).GetComponentInParent<T>();
			if (Object.op_Implicit((Object)(object)componentInParent) && (!Object.op_Implicit((Object)(object)selfComponent) || !((Object)(object)selfComponent == (Object)(object)componentInParent)))
			{
				yield return componentInParent;
			}
		}
	}
}
