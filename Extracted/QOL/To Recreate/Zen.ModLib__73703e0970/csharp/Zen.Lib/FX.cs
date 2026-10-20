using UnityEngine;

namespace Zen.Lib;

public static class FX
{
	public static GameObject? PlayFX(this MonoBehaviour target, string fxPrefabName)
	{
		return Play(fxPrefabName, target);
	}

	public static GameObject? Play(string fxPrefabName, MonoBehaviour target)
	{
		//IL_0009: Unknown result type (might be due to invalid IL or missing references)
		//IL_000f: Unknown result type (might be due to invalid IL or missing references)
		Transform transform = ((Component)target).transform;
		return Play(fxPrefabName, transform.position, transform.rotation);
	}

	public static GameObject? Play(string fxPrefabName, Vector3 position, Quaternion rotation)
	{
		//IL_001f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0020: Unknown result type (might be due to invalid IL or missing references)
		if (!GlobalStatic.TryGetPrefab(fxPrefabName, out GameObject prefab))
		{
			Logging<ModLib>.Error("fx prefab missing: " + fxPrefabName, 0);
			return null;
		}
		return Object.Instantiate<GameObject>(prefab, position, rotation);
	}
}
