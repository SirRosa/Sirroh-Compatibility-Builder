using System.Runtime.CompilerServices;
using UnityEngine;

namespace AzuAutoStore.Util;

public class HighLightChest : MonoBehaviour
{
	[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(2)]
	private WearNTear wnt;

	private void Awake()
	{
		WearNTear val = default;
		wnt = (((Component)this).TryGetComponent<WearNTear>(ref val) ? val : null);
		if ((Object)(object)wnt == (Object)null)
		{
			DestroyNow();
		}
		else
		{
			Trigger();
		}
	}

	public void Trigger()
	{
		((MonoBehaviour)this).InvokeRepeating("DestroyNow", 10f, 1f);
	}

	public void DestroyNow()
	{
		Object.DestroyImmediate((Object)(object)this);
	}

	private void Update()
	{
		WearNTear val = wnt;
		if (val != null)
		{
			val.Highlight();
		}
	}
}
