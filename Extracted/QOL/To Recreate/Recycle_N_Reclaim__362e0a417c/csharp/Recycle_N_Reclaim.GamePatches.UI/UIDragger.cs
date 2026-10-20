using System.Runtime.CompilerServices;
using UnityEngine;
using UnityEngine.EventSystems;

namespace Recycle_N_Reclaim.GamePatches.UI;

[_003Cc6ee30b4_002D1fc8_002D48a6_002Db646_002D32a3d54a7999_003ENullable(0)]
[_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(1)]
public class UIDragger : EventTrigger
{
	[_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(0)]
	public delegate void UIDroppedHandler(object source, Vector3 newLocalPosition);

	private bool _isDragging;

	public event UIDroppedHandler OnUIDropped;

	public void Update()
	{
		//IL_000f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0019: Unknown result type (might be due to invalid IL or missing references)
		//IL_0023: Unknown result type (might be due to invalid IL or missing references)
		//IL_0028: Unknown result type (might be due to invalid IL or missing references)
		if (_isDragging)
		{
			((Component)this).transform.position = Vector2.op_Implicit(new Vector2(Input.mousePosition.x, Input.mousePosition.y));
		}
	}

	public override void OnPointerDown(PointerEventData eventData)
	{
		//IL_0001: Unknown result type (might be due to invalid IL or missing references)
		//IL_0007: Invalid comparison between Unknown and I4
		if ((int)eventData.button == 1 && Input.GetKey((KeyCode)306))
		{
			_isDragging = true;
		}
	}

	public override void OnPointerUp(PointerEventData eventData)
	{
		//IL_0001: Unknown result type (might be due to invalid IL or missing references)
		//IL_0007: Invalid comparison between Unknown and I4
		//IL_0023: Unknown result type (might be due to invalid IL or missing references)
		//IL_0033: Unknown result type (might be due to invalid IL or missing references)
		//IL_0042: Unknown result type (might be due to invalid IL or missing references)
		if ((int)eventData.button == 1)
		{
			_isDragging = false;
			OnUIDropped?.Invoke(this, new Vector3(((Component)this).transform.localPosition.x, ((Component)this).transform.localPosition.y, -1f));
		}
	}
}
