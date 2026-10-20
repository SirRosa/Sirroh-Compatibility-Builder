using UnityEngine;

namespace LetMeTameYou;

public class ZDOChanger : MonoBehaviour
{
	public string newName = null;

	private void Awake()
	{
		ZNetView component = ((Component)this).gameObject.GetComponent<ZNetView>();
		if (!Object.op_Implicit((Object)(object)component) || !component.IsValid())
		{
			DBG.blogDebug(" ZDOChanger invalid ZNetView");
			return;
		}
		if (newName == null)
		{
			newName = ((Object)((Component)this).gameObject).name.Replace("_tamed", "").Replace("(Clone)", "");
			DBG.blogDebug("Replaced Name");
		}
		if (!Object.op_Implicit((Object)(object)ZNetScene.instance.GetPrefab(StringExtensionMethods.GetStableHashCode(newName))))
		{
			DBG.blogWarning("Did not find Prefab " + newName + " in ZNetView");
			return;
		}
		((Object)((Component)this).gameObject).name = newName + "(Clone)";
		component.GetZDO().SetPrefab(StringExtensionMethods.GetStableHashCode(newName));
		DBG.blogDebug("Set new ZDO Prefab");
	}
}
