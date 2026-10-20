using System.Runtime.CompilerServices;
using TMPro;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.UI;

namespace Recycle_N_Reclaim.GamePatches.UI;

[_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(1)]
[_003Cc6ee30b4_002D1fc8_002D48a6_002Db646_002D32a3d54a7999_003ENullable(0)]
public class ContainerRecyclingButtonHolder : MonoBehaviour
{
	[_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(0)]
	public delegate void RecycleAllHandler();

	private Button _recycleAllButton;

	private bool _prefired;

	private TMP_Text _textComponent;

	private Image _imageComponent;

	public event RecycleAllHandler OnRecycleAllTriggered;

	private void Start()
	{
		((MonoBehaviour)this).InvokeRepeating("EnsureRecyclingButtonExistsIfPossible", 0f, 5f);
	}

	private void EnsureRecyclingButtonExistsIfPossible()
	{
		if (!((Object)(object)InventoryGui.instance == (Object)null))
		{
			if ((Object)(object)_recycleAllButton == (Object)null)
			{
				SetupButton();
			}
			((Component)_recycleAllButton).gameObject.SetActive(Recycle_N_ReclaimPlugin.ContainerRecyclingEnabled.Value.IsOn());
		}
	}

	private void OnDestroy()
	{
		try
		{
			Object.Destroy((Object)(object)((Component)_recycleAllButton).gameObject);
		}
		catch
		{
		}
	}

	private void FixedUpdate()
	{
		if (!Recycle_N_ReclaimPlugin.ContainerRecyclingEnabled.Value.IsOff() && !((Object)(object)_recycleAllButton == (Object)null) && !InventoryGui.instance.IsContainerOpen() && _prefired)
		{
			SetButtonState(showPrefire: false);
		}
	}

	private void SetupButton()
	{
		//IL_0038: Unknown result type (might be due to invalid IL or missing references)
		//IL_003d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0091: Unknown result type (might be due to invalid IL or missing references)
		//IL_009d: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a7: Expected Obj, but got Unknown
		//IL_00b9: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c3: Expected Obj, but got Unknown
		if (!((Object)(object)_recycleAllButton != (Object)null))
		{
			if (Recycle_N_ReclaimPlugin.HasAuga)
			{
				_recycleAllButton = ((Component)((Transform)InventoryGui.instance.m_container).Find("RecycleAll")).GetComponent<Button>();
			}
			else
			{
				Vector3 savedButtonPosition = GetSavedButtonPosition();
				_recycleAllButton = Object.Instantiate<Button>(InventoryGui.instance.m_takeAllButton, ((Component)InventoryGui.instance.m_takeAllButton).transform);
				((Component)_recycleAllButton).transform.SetParent(((Component)InventoryGui.instance.m_takeAllButton).transform.parent);
				((Component)_recycleAllButton).transform.localPosition = savedButtonPosition;
			}
			_recycleAllButton.onClick = new ButtonClickedEvent();
			((UnityEvent)_recycleAllButton.onClick).AddListener((UnityAction)OnRecycleAllPressed);
			_textComponent = ((Component)_recycleAllButton).GetComponentInChildren<TMP_Text>();
			_imageComponent = ((Component)_recycleAllButton).GetComponentInChildren<Image>();
			((Component)_recycleAllButton).gameObject.AddComponent<UIDragger>().OnUIDropped += (object source, Vector3 position) =>
			{
				//IL_0005: Unknown result type (might be due to invalid IL or missing references)
				Recycle_N_ReclaimPlugin.ContainerRecyclingButtonPositionJsonString.Value = position;
			};
			SetButtonState(showPrefire: false);
		}
	}

	private Vector3 GetSavedButtonPosition()
	{
		//IL_0005: Unknown result type (might be due to invalid IL or missing references)
		return Recycle_N_ReclaimPlugin.ContainerRecyclingButtonPositionJsonString.Value;
	}

	private void SetButtonState(bool showPrefire)
	{
		//IL_0070: Unknown result type (might be due to invalid IL or missing references)
		//IL_0034: Unknown result type (might be due to invalid IL or missing references)
		if (showPrefire)
		{
			_prefired = true;
			_textComponent.text = Recycle_N_ReclaimPlugin.Localize("$azumatt_recycle_n_reclaim_confirm");
			((Graphic)_imageComponent).color = new Color(1f, 0.5f, 0.5f);
		}
		else
		{
			_prefired = false;
			_textComponent.text = Recycle_N_ReclaimPlugin.Localize("$azumatt_recycle_n_reclaim_reclaim_all");
			((Graphic)_imageComponent).color = new Color(0.5f, 1f, 0.5f);
		}
	}

	private void OnRecycleAllPressed()
	{
		if (Object.op_Implicit((Object)(object)Player.m_localPlayer))
		{
			if (!_prefired)
			{
				SetButtonState(showPrefire: true);
				return;
			}
			SetButtonState(showPrefire: false);
			OnRecycleAllTriggered?.Invoke();
		}
	}
}
