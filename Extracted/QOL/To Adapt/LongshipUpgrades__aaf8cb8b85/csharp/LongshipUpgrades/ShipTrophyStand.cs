using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using HarmonyLib;
using UnityEngine;

namespace LongshipUpgrades;

public class ShipTrophyStand : MonoBehaviour, Hoverable, Interactable
{
	public string m_name = "$guardianstone_hook_name";

	public Transform m_attachOther;

	public Transform m_dropSpawnPoint;

	public EffectList m_effects = new EffectList();

	public EffectList m_destroyEffects = new EffectList();

	[Header("Guardian power")]
	public float m_powerActivationDelay = 2f;

	public StatusEffect m_guardianPower;

	public EffectList m_activatePowerEffects = new EffectList();

	public EffectList m_activatePowerEffectsPlayer = new EffectList();

	public int m_visualHash;

	public int m_visualQuality;

	public int m_visualVariant;

	public GameObject m_visualItem;

	[NonSerialized]
	public string m_currentItemName = "";

	public ItemData m_queuedItem;

	public ZNetView m_nview;

	public Piece m_piece;

	public float m_hoverOffset;

	public static ItemType supportedItemType = (ItemType)13;

	private static readonly List<ItemData> tempItems = new List<ItemData>();

	private static readonly StringBuilder sb = new StringBuilder(20);

	private static readonly Dictionary<string, SE_Stats> trophyEffects = new Dictionary<string, SE_Stats>();

	public void Awake()
	{
		m_nview = ((Component)this).GetComponentInParent<ZNetView>();
		if (m_nview.IsValid())
		{
			m_nview.Register("DropItem", (Action<long>)RPC_DropItem);
			m_nview.Register("RequestOwn", (Action<long>)RPC_RequestOwn);
			m_nview.Register("DestroyAttachment", (Action<long>)RPC_DestroyAttachment);
			m_nview.Register<int, int, int>("SetVisualItem", (Action<long, int, int, int>)RPC_SetVisualItem);
			((MonoBehaviour)this).InvokeRepeating("UpdateVisual", 1f, 4f);
		}
		if (trophyEffects.Count == 0)
		{
			FillTrophyEffects();
		}
		m_piece = ((Component)this).GetComponentInParent<Piece>();
	}

	public string GetHoverText()
	{
		//IL_0023: Unknown result type (might be due to invalid IL or missing references)
		if (!Object.op_Implicit((Object)(object)Player.m_localPlayer))
		{
			return "";
		}
		if (!PrivateArea.CheckAccess(((Component)this).transform.position, 0f, false, false))
		{
			return Localization.instance.Localize(m_name + "\n$piece_noaccess");
		}
		sb.Clear();
		if (HaveAttachment())
		{
			sb.Append(m_currentItemName);
			if (!LongshipUpgrades.onlyCreatorStand.Value || (Object)(object)m_piece == (Object)null || m_piece.IsCreator())
			{
				sb.Append("\n[<color=yellow><b>$KEY_Use</b></color>] $piece_itemstand_take");
			}
			if (LongshipUpgrades.itemStandForsakenPower.Value && (Object)(object)m_guardianPower != (Object)null)
			{
				if (((MonoBehaviour)this).IsInvoking("DelayedPowerActivation"))
				{
					return "";
				}
				sb.Append("\n");
				sb.AppendFormat("\n<color=orange>{0}</color>", m_guardianPower.m_name);
				if (IsGuardianPowerActive((Humanoid)(object)Player.m_localPlayer))
				{
					sb.Append("\n$guardianstone_hook_power_activate");
				}
				else if (IsGuardianPowerOnCooldown(Player.m_localPlayer))
				{
					sb.Append("\n$hud_powernotready");
				}
				else
				{
					string arg = ((!ZInput.IsNonClassicFunctionality() || !ZInput.IsGamepadActive()) ? "$KEY_AltPlace" : "$KEY_JoyAltKeys");
					sb.AppendFormat("\n[<color=yellow><b>{0} + $KEY_Use</b></color>] $guardianstone_hook_activate", arg);
				}
				sb.Append("\n\n");
				sb.Append(m_guardianPower.GetTooltipString());
			}
		}
		else
		{
			sb.Append(m_name);
			if (!LongshipUpgrades.onlyCreatorStand.Value || (Object)(object)m_piece == (Object)null || m_piece.IsCreator())
			{
				sb.Append("\n[<color=yellow><b>$KEY_Use</b></color>][<color=yellow><b>1-8</b></color>] $piece_itemstand_attach");
			}
		}
		return Localization.instance.Localize(sb.ToString());
	}

	public string GetHoverName()
	{
		return m_name;
	}

	public float GetHoverOffset()
	{
		return m_hoverOffset;
	}

	public bool Interact(Humanoid user, bool hold, bool alt)
	{
		//IL_0013: Unknown result type (might be due to invalid IL or missing references)
		//IL_01ca: Unknown result type (might be due to invalid IL or missing references)
		//IL_011c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0127: Unknown result type (might be due to invalid IL or missing references)
		//IL_0135: Unknown result type (might be due to invalid IL or missing references)
		//IL_013b: Unknown result type (might be due to invalid IL or missing references)
		//IL_014f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0154: Unknown result type (might be due to invalid IL or missing references)
		//IL_0167: Unknown result type (might be due to invalid IL or missing references)
		//IL_016d: Unknown result type (might be due to invalid IL or missing references)
		if (hold)
		{
			return false;
		}
		if (!PrivateArea.CheckAccess(((Component)this).transform.position, 0f, true, false))
		{
			return true;
		}
		if (HaveAttachment())
		{
			if (!alt)
			{
				if (!LongshipUpgrades.onlyCreatorStand.Value || (Object)(object)m_piece == (Object)null || m_piece.IsCreator())
				{
					m_nview.InvokeRPC("DropItem", Array.Empty<object>());
				}
				return true;
			}
			if (LongshipUpgrades.itemStandForsakenPower.Value && (Object)(object)m_guardianPower != (Object)null)
			{
				if (((MonoBehaviour)this).IsInvoking("DelayedPowerActivation"))
				{
					return false;
				}
				if (IsGuardianPowerActive(user))
				{
					return false;
				}
				if (IsGuardianPowerOnCooldown((Player)(object)((user is Player) ? user : null)))
				{
					return false;
				}
				((Character)user).Message((MessageType)2, "$guardianstone_hook_power_activate", 0, (Sprite)null, false);
				m_activatePowerEffects.Create(((Component)this).transform.position, ((Component)this).transform.rotation, (Transform)null, 1f, -1, default(ZDOID));
				m_activatePowerEffectsPlayer.Create(((Component)user).transform.position, Quaternion.identity, ((Component)user).transform, 1f, -1, default(ZDOID));
				((MonoBehaviour)this).Invoke("DelayedPowerActivation", m_powerActivationDelay);
				return true;
			}
		}
		else
		{
			if (!LongshipUpgrades.onlyCreatorStand.Value || (Object)(object)m_piece == (Object)null || m_piece.IsCreator())
			{
				user.GetInventory().GetAllItems(supportedItemType, tempItems);
				if (tempItems.Count > 0)
				{
					UseItem(user, tempItems[0]);
					return true;
				}
			}
			((Character)user).Message((MessageType)2, "$piece_itemstand_missingitem", 0, (Sprite)null, false);
		}
		return false;
	}

	public bool IsGuardianPowerActive(Humanoid user)
	{
		return ((Character)user).GetSEMan().HaveStatusEffect(m_guardianPower.m_nameHash);
	}

	public bool IsGuardianPowerOnCooldown(Player player)
	{
		return (Object)(object)player != (Object)null && player.GetGuardianPowerName() != "" && player.m_guardianPowerCooldown > 0f;
	}

	public void DelayedPowerActivation()
	{
		Player localPlayer = Player.m_localPlayer;
		if (Object.op_Implicit((Object)(object)localPlayer) && (Object)(object)m_guardianPower != (Object)null)
		{
			if (localPlayer.GetGuardianPowerName() == "")
			{
				localPlayer.SetGuardianPower(((Object)m_guardianPower).name);
			}
			((Character)localPlayer).GetSEMan().AddStatusEffect(m_guardianPower, false, 0, 0f, (short)(-1));
			localPlayer.m_guardianPowerCooldown = m_guardianPower.m_cooldown;
		}
	}

	public bool UseItem(Humanoid user, ItemData item)
	{
		if (HaveAttachment())
		{
			return false;
		}
		if (!CanAttach(item))
		{
			((Character)user).Message((MessageType)2, "$piece_itemstand_cantattach", 0, (Sprite)null, false);
			return true;
		}
		if (!m_nview.IsOwner())
		{
			m_nview.InvokeRPC("RequestOwn", Array.Empty<object>());
		}
		m_queuedItem = item;
		((MonoBehaviour)this).CancelInvoke("UpdateAttach");
		((MonoBehaviour)this).InvokeRepeating("UpdateAttach", 0f, 0.1f);
		return true;
	}

	public void RPC_DropItem(long sender)
	{
		if (m_nview.IsOwner())
		{
			DropItem();
		}
	}

	public void DestroyAttachment()
	{
		m_nview.InvokeRPC("DestroyAttachment", Array.Empty<object>());
	}

	public void RPC_DestroyAttachment(long sender)
	{
		//IL_0067: Unknown result type (might be due to invalid IL or missing references)
		//IL_006c: Unknown result type (might be due to invalid IL or missing references)
		//IL_007a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0080: Unknown result type (might be due to invalid IL or missing references)
		if (m_nview.IsOwner() && HaveAttachment())
		{
			SetAttachedItem(0);
			m_nview.InvokeRPC(ZNetView.Everybody, "SetVisualItem", new object[3] { 0, 0, 0 });
			m_destroyEffects.Create(m_dropSpawnPoint.position, Quaternion.identity, (Transform)null, 1f, -1, default(ZDOID));
		}
	}

	public void DropItem()
	{
		//IL_0060: Unknown result type (might be due to invalid IL or missing references)
		//IL_0065: Unknown result type (might be due to invalid IL or missing references)
		//IL_0067: Unknown result type (might be due to invalid IL or missing references)
		//IL_006c: Unknown result type (might be due to invalid IL or missing references)
		//IL_00cc: Unknown result type (might be due to invalid IL or missing references)
		//IL_00d1: Unknown result type (might be due to invalid IL or missing references)
		//IL_00d3: Unknown result type (might be due to invalid IL or missing references)
		//IL_00de: Unknown result type (might be due to invalid IL or missing references)
		//IL_00e3: Unknown result type (might be due to invalid IL or missing references)
		//IL_00e5: Unknown result type (might be due to invalid IL or missing references)
		//IL_0110: Unknown result type (might be due to invalid IL or missing references)
		//IL_011a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0131: Unknown result type (might be due to invalid IL or missing references)
		//IL_0136: Unknown result type (might be due to invalid IL or missing references)
		//IL_0144: Unknown result type (might be due to invalid IL or missing references)
		//IL_014a: Unknown result type (might be due to invalid IL or missing references)
		//IL_00af: Unknown result type (might be due to invalid IL or missing references)
		//IL_00b4: Unknown result type (might be due to invalid IL or missing references)
		//IL_00bd: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c2: Unknown result type (might be due to invalid IL or missing references)
		if (!HaveAttachment())
		{
			return;
		}
		int attachedItem = GetAttachedItem();
		GameObject itemPrefab = ObjectDB.instance.GetItemPrefab(attachedItem);
		if (!Object.op_Implicit((Object)(object)itemPrefab))
		{
			LongshipUpgrades.LogWarning("Cannot drop trophy because its item prefab is missing: " + attachedItem);
			return;
		}
		if (Object.op_Implicit((Object)(object)itemPrefab))
		{
			Vector3 val = Vector3.zero;
			Quaternion val2 = Quaternion.identity;
			Transform val3 = itemPrefab.transform.Find("attach");
			if (Object.op_Implicit((Object)(object)itemPrefab.transform.Find("attachobj")) && Object.op_Implicit((Object)(object)val3))
			{
				val2 = ((Component)val3).transform.localRotation;
				val = ((Component)val3).transform.localPosition;
			}
			GameObject val4 = Object.Instantiate<GameObject>(itemPrefab, m_dropSpawnPoint.position + val, m_dropSpawnPoint.rotation * val2);
			val4.GetComponent<ItemDrop>().LoadFromExternalZDO(m_nview.GetZDO());
			val4.GetComponent<Rigidbody>().linearVelocity = Vector3.up * 4f;
			m_effects.Create(m_dropSpawnPoint.position, Quaternion.identity, (Transform)null, 1f, -1, default(ZDOID));
		}
		SetAttachedItem(0);
		m_nview.InvokeRPC(ZNetView.Everybody, "SetVisualItem", new object[3] { 0, 0, 0 });
	}

	public Transform GetAttach(ItemData item)
	{
		return m_attachOther;
	}

	public void UpdateAttach()
	{
		//IL_015b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0160: Unknown result type (might be due to invalid IL or missing references)
		//IL_016e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0174: Unknown result type (might be due to invalid IL or missing references)
		if (m_nview.IsOwner())
		{
			((MonoBehaviour)this).CancelInvoke("UpdateAttach");
			Player localPlayer = Player.m_localPlayer;
			if (m_queuedItem != null && (Object)(object)localPlayer != (Object)null && ((Humanoid)localPlayer).GetInventory().ContainsItem(m_queuedItem) && !HaveAttachment())
			{
				ItemData val = m_queuedItem.Clone();
				val.m_stack = 1;
				int stableHashCode = StringExtensionMethods.GetStableHashCode(((Object)m_queuedItem.m_dropPrefab).name);
				SetAttachedItem(stableHashCode);
				ItemDrop.SaveToZDO(val, m_nview.GetZDO(), -1);
				m_nview.GetZDO().Set(ZDOVars.s_variant, val.m_variant, false);
				m_nview.GetZDO().Set(ZDOVars.s_quality, val.m_quality, false);
				((Humanoid)localPlayer).UnequipItem(m_queuedItem, true);
				((Humanoid)localPlayer).GetInventory().RemoveOneItem(m_queuedItem);
				m_nview.InvokeRPC(ZNetView.Everybody, "SetVisualItem", new object[3] { stableHashCode, val.m_variant, val.m_quality });
				Transform attach = GetAttach(m_queuedItem);
				m_effects.Create(((Component)attach).transform.position, Quaternion.identity, (Transform)null, 1f, -1, default(ZDOID));
				Game.instance.IncrementPlayerStat((PlayerStatType)24, 1f, false);
			}
			m_queuedItem = null;
		}
	}

	public void RPC_RequestOwn(long sender)
	{
		if (m_nview.IsOwner())
		{
			m_nview.GetZDO().SetOwner(sender);
		}
	}

	public void UpdateVisual()
	{
		if (!((Object)(object)m_nview == (Object)null) && m_nview.IsValid())
		{
			int attachedItem = GetAttachedItem();
			int variant = m_nview.GetZDO().GetInt(ZDOVars.s_variant, 0);
			int quality = m_nview.GetZDO().GetInt(ZDOVars.s_quality, 1);
			SetVisualItem(attachedItem, variant, quality);
		}
	}

	public void RPC_SetVisualItem(long sender, int itemHash, int variant, int quality)
	{
		SetVisualItem(itemHash, variant, quality);
	}

	public void SetVisualItem(int itemHash, int variant, int quality)
	{
		//IL_0141: Unknown result type (might be due to invalid IL or missing references)
		//IL_0148: Unknown result type (might be due to invalid IL or missing references)
		//IL_016a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0186: Unknown result type (might be due to invalid IL or missing references)
		//IL_01a2: Unknown result type (might be due to invalid IL or missing references)
		//IL_01b0: Unknown result type (might be due to invalid IL or missing references)
		//IL_01b5: Unknown result type (might be due to invalid IL or missing references)
		//IL_01d9: Unknown result type (might be due to invalid IL or missing references)
		//IL_01e0: Unknown result type (might be due to invalid IL or missing references)
		if (m_visualHash == itemHash && m_visualVariant == variant && m_visualQuality == quality)
		{
			return;
		}
		Object.Destroy((Object)(object)m_visualItem);
		m_visualItem = null;
		m_visualHash = itemHash;
		m_visualQuality = quality;
		m_visualVariant = variant;
		m_currentItemName = "";
		m_guardianPower = null;
		if (m_visualHash == 0)
		{
			Object.Destroy((Object)(object)m_visualItem);
			return;
		}
		GameObject itemPrefab = ObjectDB.instance.GetItemPrefab(itemHash);
		if ((Object)(object)itemPrefab == (Object)null)
		{
			LongshipUpgrades.LogWarning("Missing item prefab " + itemHash);
			return;
		}
		string name = ((Object)itemPrefab).name;
		m_guardianPower = (StatusEffect)(object)(trophyEffects.TryGetValue(name, out var value) ? value : null);
		GameObject attachPrefab = GetAttachPrefab(itemPrefab);
		if ((Object)(object)attachPrefab == (Object)null)
		{
			LongshipUpgrades.LogWarning("Failed to get attach prefab for item " + name);
			return;
		}
		ItemDrop component = itemPrefab.GetComponent<ItemDrop>();
		m_currentItemName = component.m_itemData.m_shared.m_name;
		Transform attach = GetAttach(component.m_itemData);
		GameObject attachGameObject = GetAttachGameObject(attachPrefab);
		m_visualItem = Object.Instantiate<GameObject>(attachGameObject, attach.position, attach.rotation, attach);
		m_visualItem.transform.localPosition = attachPrefab.transform.localPosition;
		m_visualItem.transform.localRotation = attachPrefab.transform.localRotation;
		m_visualItem.transform.localScale = Vector3.Scale(attachPrefab.transform.localScale, component.m_itemData.GetScale((float)quality));
		if (TryFindScaleOverride(name, out var scale))
		{
			m_visualItem.transform.localScale = Vector3.one * scale;
		}
		IEquipmentVisual componentInChildren = m_visualItem.GetComponentInChildren<IEquipmentVisual>();
		if (componentInChildren != null)
		{
			componentInChildren.Setup(m_visualVariant);
		}
		CollectionExtensions.DoIf<Collider>((IEnumerable<Collider>)m_visualItem.GetComponentsInChildren<Collider>(), (Func<Collider, bool>)((Collider collider) => collider.enabled && !collider.isTrigger), (Action<Collider>)Object.Destroy);
	}

	public bool CanAttach(ItemData item)
	{
		//IL_005e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0063: Unknown result type (might be due to invalid IL or missing references)
		if (LongshipUpgrades.onlyCreatorStand.Value && (Object)(object)m_piece != (Object)null && !m_piece.IsCreator())
		{
			return false;
		}
		return item != null && (Object)(object)item.m_dropPrefab != (Object)null && (Object)(object)GetAttachPrefab(item.m_dropPrefab) != (Object)null && item.m_shared.m_itemType == supportedItemType;
	}

	public bool HaveAttachment()
	{
		return GetAttachedItem() != 0;
	}

	public int GetAttachedItem()
	{
		if ((Object)(object)m_nview == (Object)null || !m_nview.IsValid())
		{
			return 0;
		}
		ZDO zDO = m_nview.GetZDO();
		int num = zDO.GetInt(ZDOVars.s_item, 0);
		if (num != 0)
		{
			return num;
		}
		string text = zDO.GetString(ZDOVars.s_item, "");
		return (!string.IsNullOrEmpty(text)) ? StringExtensionMethods.GetStableHashCode(text) : 0;
	}

	private void SetAttachedItem(int itemHash)
	{
		ZDO zDO = m_nview.GetZDO();
		zDO.RemoveString(ZDOVars.s_item);
		zDO.Set(ZDOVars.s_item, itemHash, false);
	}

	internal static bool TryFindScaleOverride(string itemName, out float scale)
	{
		string[] array = LongshipUpgrades.itemStandTrophyRescale.Value.Split(new char[1] { ';' }, StringSplitOptions.RemoveEmptyEntries);
		foreach (string text in array)
		{
			string[] array2 = text.Split(new char[1] { ':' }, StringSplitOptions.RemoveEmptyEntries);
			if (array2.Length == 2 && array2[0] == itemName && float.TryParse(array2[1], out scale))
			{
				return true;
			}
		}
		scale = 0f;
		return false;
	}

	public static GameObject GetAttachPrefab(GameObject item)
	{
		Transform val = item.transform.Find("attach");
		return (val != null) ? ((Component)val).gameObject : null;
	}

	public static GameObject GetAttachGameObject(GameObject prefab)
	{
		Transform val = prefab.transform.Find("attachobj");
		return ((val != null) ? ((Component)val).gameObject : null) ?? prefab;
	}

	internal static void FillTrophyEffects()
	{
		trophyEffects.Clear();
		foreach (ItemStand item in from itemstand in Resources.FindObjectsOfTypeAll<ItemStand>()
			where itemstand.m_guardianPower is SE_Stats && itemstand.m_supportedItems.Count == 1 && (Object)(object)itemstand.m_supportedItems[0] != (Object)null
			select itemstand)
		{
			Dictionary<string, SE_Stats> dictionary = trophyEffects;
			string name = ((Object)item.m_supportedItems[0]).name;
			StatusEffect guardianPower = item.m_guardianPower;
			dictionary[name] = (SE_Stats)(object)((guardianPower is SE_Stats) ? guardianPower : null);
		}
	}

	public ShipTrophyStand()
	{
		//IL_000c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0016: Expected Obj, but got Unknown
		//IL_0017: Unknown result type (might be due to invalid IL or missing references)
		//IL_0021: Expected Obj, but got Unknown
		//IL_002d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0037: Expected Obj, but got Unknown
		//IL_0038: Unknown result type (might be due to invalid IL or missing references)
		//IL_0042: Expected Obj, but got Unknown
	}

	static ShipTrophyStand()
	{
		//IL_0002: Unknown result type (might be due to invalid IL or missing references)
	}
}
