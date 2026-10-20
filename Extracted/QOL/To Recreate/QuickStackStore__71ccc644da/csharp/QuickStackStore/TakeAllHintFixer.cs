using UnityEngine;
using UnityEngine.UI;

namespace QuickStackStore;

internal class TakeAllHintFixer : MonoBehaviour
{
	private Canvas canvas;

	private GraphicRaycaster graphicRaycaster;

	private bool fixedCanvas;

	protected void Start()
	{
		if (((Object)((Component)this).transform.parent).name != "TakeAll")
		{
			Object.Destroy((Object)(object)this);
		}
		fixedCanvas = false;
		canvas = ((Component)this).gameObject.GetComponent<Canvas>();
		graphicRaycaster = ((Component)this).gameObject.GetComponent<GraphicRaycaster>();
		if (!Object.op_Implicit((Object)(object)canvas))
		{
			canvas = ((Component)this).gameObject.AddComponent<Canvas>();
		}
		if (!Object.op_Implicit((Object)(object)graphicRaycaster))
		{
			graphicRaycaster = ((Component)this).gameObject.AddComponent<GraphicRaycaster>();
		}
	}

	protected void Update()
	{
		if (!fixedCanvas && Object.op_Implicit((Object)(object)canvas) && ((Behaviour)canvas).isActiveAndEnabled)
		{
			canvas.overrideSorting = true;
			canvas.sortingOrder = 1;
			fixedCanvas = true;
			Object.Destroy((Object)(object)this);
		}
	}
}
