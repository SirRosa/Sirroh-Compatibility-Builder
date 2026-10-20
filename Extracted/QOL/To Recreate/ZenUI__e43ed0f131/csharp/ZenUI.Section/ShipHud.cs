using HarmonyLib;
using UnityEngine;
using Zen.Lib;

namespace ZenUI.Section;

[HarmonyPatch]
internal static class ShipHud
{
	private static Vector3 _hpBarPosDefault;

	private static Vector3 _hpBarPosShip;

	private static (Ship? Ship, WearNTear? WnT) Cache;

	internal static void Init()
	{
		//IL_000f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0014: Unknown result type (might be due to invalid IL or missing references)
		//IL_0023: Unknown result type (might be due to invalid IL or missing references)
		//IL_0028: Unknown result type (might be due to invalid IL or missing references)
		_hpBarPosDefault = ((Component)Hud.instance.m_pieceHealthRoot).transform.localPosition;
		_hpBarPosShip = new Vector3(-50f, 20f);
		ClearCache();
	}

	private static bool ClearCache()
	{
		Cache = default;
		return false;
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(Hud), "UpdateShipHud")]
	private static void Hud_UpdateShipHud(Hud __instance)
	{
		if (!Configs.ShowShipSailIndicator.Value && __instance.m_shipHudRoot.activeSelf)
		{
			__instance.m_fullSail.SetActive(false);
			__instance.m_halfSail.SetActive(false);
		}
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(Hud), "UpdateCrosshair")]
	private static void Hud_UpdateCrosshair(Player player, Hud __instance)
	{
		if (Configs.ShowShipHP.Value)
		{
			ShowShipHP();
		}
		else
		{
			ClearCache();
		}
	}

	private static void ShowShipHP()
	{
		//IL_006e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0067: Unknown result type (might be due to invalid IL or missing references)
		Transform transform = ((Component)Hud.instance.m_pieceHealthRoot).transform;
		Transform transform2 = Hud.instance.m_shipControlsRoot.transform;
		Transform parent = ((Component)Hud.instance.m_crosshair).transform.parent;
		Transform val = (TryUpdateShipHP() ? transform2 : parent);
		if (!((Object)(object)transform.parent == (Object)(object)val))
		{
			transform.SetParent(val, false);
			transform.localPosition = (((Object)(object)transform.parent == (Object)(object)transform2) ? _hpBarPosShip : _hpBarPosDefault);
		}
		static bool TryUpdateShipHP()
		{
			Player localPlayer = Player.m_localPlayer;
			if (!localPlayer.IsReady() || !((Character)localPlayer).IsAttachedToShip())
			{
				return ClearCache();
			}
			Ship controlledShip = localPlayer.GetControlledShip();
			if (!Object.op_Implicit((Object)(object)controlledShip))
			{
				return ClearCache();
			}
			WearNTear val2 = (((Object)(object)Cache.Ship == (Object)(object)controlledShip) ? Cache.WnT : null);
			if (!Object.op_Implicit((Object)(object)val2) && !((Component)controlledShip).TryGetComponent<WearNTear>(ref val2))
			{
				return ClearCache();
			}
			Cache = (Ship: controlledShip, WnT: val2);
			((Component)Hud.instance.m_pieceHealthRoot).gameObject.SetActive(true);
			Hud.instance.m_pieceHealthBar.SetValue(val2.GetHealthPercentage());
			return true;
		}
	}
}
