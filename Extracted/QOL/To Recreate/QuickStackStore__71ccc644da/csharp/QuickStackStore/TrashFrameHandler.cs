using UnityEngine;

namespace QuickStackStore;

public class TrashFrameHandler : MonoBehaviour
{
	internal GameObject frame;

	protected void Update()
	{
		frame.SetActive(ZInput.IsGamepadActive() && InventoryGui.instance.m_activeGroup == 1);
	}
}
