using UnityEngine;

namespace Zen.Lib;

public interface IRedecorate
{
	void OnRedecorateBefore();

	void OnRedecorateAfter((Vector3 Position, Quaternion Rotation) before);
}
