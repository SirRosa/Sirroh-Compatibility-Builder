using UnityEngine;

namespace Zen.Lib;

public static class MathExt
{
	public static bool InRange(this GameObject self, GameObject target, float range)
	{
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		//IL_0011: Unknown result type (might be due to invalid IL or missing references)
		//IL_0016: Unknown result type (might be due to invalid IL or missing references)
		return Vector3.SqrMagnitude(self.transform.position - target.transform.position) < range * range;
	}

	public static bool InRange(this GameObject self, Vector3 target, float range)
	{
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		//IL_000b: Unknown result type (might be due to invalid IL or missing references)
		//IL_000c: Unknown result type (might be due to invalid IL or missing references)
		return Vector3.SqrMagnitude(self.transform.position - target) < range * range;
	}

	public static bool InRange(this MonoBehaviour self, Vector3 target, float range)
	{
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		//IL_000b: Unknown result type (might be due to invalid IL or missing references)
		//IL_000c: Unknown result type (might be due to invalid IL or missing references)
		return Vector3.SqrMagnitude(((Component)self).transform.position - target) < range * range;
	}

	public static bool InRange(this MonoBehaviour self, MonoBehaviour target, float range)
	{
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		//IL_0011: Unknown result type (might be due to invalid IL or missing references)
		//IL_0016: Unknown result type (might be due to invalid IL or missing references)
		return Vector3.SqrMagnitude(((Component)self).transform.position - ((Component)target).transform.position) < range * range;
	}

	public static bool InRange(this MonoBehaviour self, GameObject target, float range)
	{
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		//IL_0011: Unknown result type (might be due to invalid IL or missing references)
		//IL_0016: Unknown result type (might be due to invalid IL or missing references)
		return Vector3.SqrMagnitude(((Component)self).transform.position - target.transform.position) < range * range;
	}

	public static float DistanceToSqr(this GameObject self, Vector3 target)
	{
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		//IL_000b: Unknown result type (might be due to invalid IL or missing references)
		//IL_000c: Unknown result type (might be due to invalid IL or missing references)
		return Vector3.SqrMagnitude(self.transform.position - target);
	}

	public static float DistanceToSqr(this MonoBehaviour self, MonoBehaviour target)
	{
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		//IL_0011: Unknown result type (might be due to invalid IL or missing references)
		//IL_0016: Unknown result type (might be due to invalid IL or missing references)
		return Vector3.SqrMagnitude(((Component)self).transform.position - ((Component)target).transform.position);
	}

	public static float DistanceToSqr(this MonoBehaviour self, Vector3 target)
	{
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		//IL_000b: Unknown result type (might be due to invalid IL or missing references)
		//IL_000c: Unknown result type (might be due to invalid IL or missing references)
		return Vector3.SqrMagnitude(((Component)self).transform.position - target);
	}

	public static float DistanceToSqr(this Vector3 source, Vector3 target)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_0001: Unknown result type (might be due to invalid IL or missing references)
		//IL_0002: Unknown result type (might be due to invalid IL or missing references)
		return Vector3.SqrMagnitude(source - target);
	}

	public static float DistanceToXZ(this GameObject self, GameObject target)
	{
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		//IL_0011: Unknown result type (might be due to invalid IL or missing references)
		return self.transform.position.DistanceToXZ(target.transform.position);
	}

	public static float DistanceToXZ(this MonoBehaviour self, MonoBehaviour target)
	{
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		//IL_0011: Unknown result type (might be due to invalid IL or missing references)
		return ((Component)self).transform.position.DistanceToXZ(((Component)target).transform.position);
	}

	public static float DistanceToXZ(this MonoBehaviour self, Vector3 target)
	{
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		//IL_000b: Unknown result type (might be due to invalid IL or missing references)
		return ((Component)self).transform.position.DistanceToXZ(target);
	}

	public static float DistanceToXZ(this Vector3 source, Vector3 target)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_0001: Unknown result type (might be due to invalid IL or missing references)
		//IL_000e: Unknown result type (might be due to invalid IL or missing references)
		//IL_000f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0010: Unknown result type (might be due to invalid IL or missing references)
		//IL_001d: Unknown result type (might be due to invalid IL or missing references)
		Vector3 val = source;
		val.y = 0f;
		Vector3 val2 = val;
		val = target;
		val.y = 0f;
		return Vector3.Distance(val2, val);
	}

	public static float DistanceTo(this GameObject self, GameObject target)
	{
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		//IL_0011: Unknown result type (might be due to invalid IL or missing references)
		return self.transform.position.DistanceTo(target.transform.position);
	}

	public static float DistanceTo(this MonoBehaviour self, MonoBehaviour target)
	{
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		//IL_0011: Unknown result type (might be due to invalid IL or missing references)
		return ((Component)self).transform.position.DistanceTo(((Component)target).transform.position);
	}

	public static float DistanceTo(this MonoBehaviour self, Vector3 target)
	{
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		//IL_000b: Unknown result type (might be due to invalid IL or missing references)
		return ((Component)self).transform.position.DistanceTo(target);
	}

	public static float DistanceTo(this Vector3 source, Vector3 target)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_0001: Unknown result type (might be due to invalid IL or missing references)
		return Vector3.Distance(source, target);
	}

	public static bool Approximately(this Vector3 self, Vector3 other)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_0001: Unknown result type (might be due to invalid IL or missing references)
		//IL_0002: Unknown result type (might be due to invalid IL or missing references)
		return Vector3.SqrMagnitude(self - other) < 0.0001f;
	}

	public static Vector3 XZY(this Vector3 self)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		//IL_000c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0012: Unknown result type (might be due to invalid IL or missing references)
		return new Vector3(self.x, self.z, self.y);
	}

	public static float DistanceToPlayer(this Vector3 position)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		return position.DistanceToCharacter((Character)(object)Player.m_localPlayer);
	}

	public static float DistanceToCharacter(this Vector3 position, Character c)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		return Mathf.Sqrt(position.DistanceToCharacterSqr(c));
	}

	public static float DistanceToCharacterSqr(this Vector3 position, Character c)
	{
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		//IL_000b: Unknown result type (might be due to invalid IL or missing references)
		//IL_000c: Unknown result type (might be due to invalid IL or missing references)
		return Vector3.SqrMagnitude(((Component)c).transform.position - position);
	}

	public static float AngleFromPlayer(this Vector3 position)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		return position.AngleFromCharacter((Character)(object)Player.m_localPlayer);
	}

	public static float AngleFromCharacter(this Vector3 position, Character c)
	{
		//IL_0007: Unknown result type (might be due to invalid IL or missing references)
		//IL_0009: Unknown result type (might be due to invalid IL or missing references)
		//IL_000e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0013: Unknown result type (might be due to invalid IL or missing references)
		//IL_0016: Unknown result type (might be due to invalid IL or missing references)
		//IL_001b: Unknown result type (might be due to invalid IL or missing references)
		//IL_001d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0022: Unknown result type (might be due to invalid IL or missing references)
		//IL_0023: Unknown result type (might be due to invalid IL or missing references)
		Transform transform = ((Component)c).transform;
		Vector3 val = position - transform.position;
		Vector3 normalized = val.normalized;
		return Vector3.SignedAngle(transform.forward, normalized, Vector3.up);
	}

	public static float AngleFromCamera(this Vector3 position)
	{
		//IL_0010: Unknown result type (might be due to invalid IL or missing references)
		//IL_0012: Unknown result type (might be due to invalid IL or missing references)
		//IL_0017: Unknown result type (might be due to invalid IL or missing references)
		//IL_001c: Unknown result type (might be due to invalid IL or missing references)
		//IL_001f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0024: Unknown result type (might be due to invalid IL or missing references)
		//IL_0026: Unknown result type (might be due to invalid IL or missing references)
		//IL_002b: Unknown result type (might be due to invalid IL or missing references)
		//IL_002c: Unknown result type (might be due to invalid IL or missing references)
		Transform transform = ((Component)GameCamera.instance.m_camera).transform;
		Vector3 val = position - transform.position;
		Vector3 normalized = val.normalized;
		return Vector3.SignedAngle(transform.forward, normalized, Vector3.up);
	}

	public static float AlignmentRatioTo(this Transform transform, Vector3 destPosition)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_0002: Unknown result type (might be due to invalid IL or missing references)
		//IL_0007: Unknown result type (might be due to invalid IL or missing references)
		//IL_000c: Unknown result type (might be due to invalid IL or missing references)
		//IL_000f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0014: Unknown result type (might be due to invalid IL or missing references)
		//IL_0016: Unknown result type (might be due to invalid IL or missing references)
		//IL_001b: Unknown result type (might be due to invalid IL or missing references)
		Vector3 val = destPosition - transform.position;
		Vector3 normalized = val.normalized;
		return Vector3.Dot(transform.forward, normalized);
	}

	public static Vector3 Abs(this Vector3 self)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_000b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0016: Unknown result type (might be due to invalid IL or missing references)
		//IL_0021: Unknown result type (might be due to invalid IL or missing references)
		return new Vector3(Mathf.Abs(self.x), Mathf.Abs(self.y), Mathf.Abs(self.z));
	}

	public static float Max(this Vector3 self)
	{
		//IL_0008: Unknown result type (might be due to invalid IL or missing references)
		//IL_0011: Unknown result type (might be due to invalid IL or missing references)
		//IL_001a: Unknown result type (might be due to invalid IL or missing references)
		return Mathf.Max(new float[3] { self.x, self.y, self.z });
	}

	public static float Min(this Vector3 self)
	{
		//IL_0008: Unknown result type (might be due to invalid IL or missing references)
		//IL_0011: Unknown result type (might be due to invalid IL or missing references)
		//IL_001a: Unknown result type (might be due to invalid IL or missing references)
		return Mathf.Min(new float[3] { self.x, self.y, self.z });
	}

	public static ulong GetCantorID(this Vector2i coord)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		return MathLib.GetCantorID(coord.x, coord.y);
	}

	public static ulong GetCantorID(this Vector2s coord)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		return MathLib.GetCantorID(coord.x, coord.y);
	}

	public static Vector2i FromCantorID(this ulong id)
	{
		//IL_0001: Unknown result type (might be due to invalid IL or missing references)
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		//IL_0007: Unknown result type (might be due to invalid IL or missing references)
		//IL_000d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0013: Unknown result type (might be due to invalid IL or missing references)
		Vector2i val = MathLib.FromCantorID(id);
		return new Vector2i(val.x, val.y);
	}
}
