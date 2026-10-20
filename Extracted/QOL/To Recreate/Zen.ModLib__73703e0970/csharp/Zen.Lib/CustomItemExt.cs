using Jotunn.Entities;
using UnityEngine;

namespace Zen.Lib;

public static class CustomItemExt
{
	public static SharedData ApplyTextureToPrefab(this CustomItem item, Texture2D texture, float scale3D, Vector2 textureScale, Vector2 offset, string attachName = "", bool initShared = true, Color? color = null)
	{
		//IL_0031: Unknown result type (might be due to invalid IL or missing references)
		//IL_0038: Unknown result type (might be due to invalid IL or missing references)
		//IL_0054: Unknown result type (might be due to invalid IL or missing references)
		//IL_004b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0064: Unknown result type (might be due to invalid IL or missing references)
		//IL_006a: Unknown result type (might be due to invalid IL or missing references)
		//IL_00b3: Unknown result type (might be due to invalid IL or missing references)
		((Object)item.ItemPrefab.transform.GetChild(0)).name = attachName;
		MeshRenderer componentInChildren = item.ItemPrefab.GetComponentInChildren<MeshRenderer>();
		Material material = ((Renderer)componentInChildren).material;
		material.mainTexture = (Texture)(object)texture;
		material.mainTextureScale = textureScale;
		material.mainTextureOffset = offset;
		material.color = color ?? Color.white;
		Transform transform = ((Component)componentInChildren).transform;
		transform.localScale *= scale3D;
		SharedData shared = item.ItemDrop.m_itemData.m_shared;
		if (initShared)
		{
			shared.m_movementModifier = 0f;
			shared.m_useDurability = false;
			shared.m_canBeReparied = false;
			shared.m_maxQuality = 1;
			shared.m_value = 0;
			shared.m_itemType = (ItemType)16;
		}
		return shared;
	}
}
