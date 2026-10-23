using System.Runtime.CompilerServices;
using UnityEngine;

namespace AzuAutoStore.Util;

public class ChestPingEffect : MonoBehaviour
{
	[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(1)]
	private GameObject pingObject;

	private void Awake()
	{
		//IL_002c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0031: Unknown result type (might be due to invalid IL or missing references)
		if (!string.IsNullOrWhiteSpace(AzuAutoStorePlugin.PingVfxString.Value))
		{
			pingObject = Object.Instantiate<GameObject>(ZNetScene.instance.GetPrefab(AzuAutoStorePlugin.PingVfxString.Value), ((Component)this).transform.position, Quaternion.identity);
			Trigger();
		}
	}

	public void Trigger()
	{
		((MonoBehaviour)this).InvokeRepeating("DestroyNow", 10f, 1f);
	}

	public void DestroyNow()
	{
		if ((Object)(object)pingObject != (Object)null)
		{
			ZNetScene.instance.Destroy(pingObject);
		}
		Object.DestroyImmediate((Object)(object)this);
	}
}
