using BetterTames.Scripts.CatchUp;
using HarmonyLib;
using UnityEngine;

namespace BetterTames.Scripts.Portals;

public static class Portals
{
	private static readonly FieldRef<TeleportWorld, ZNetView> PortalView = AccessTools.FieldRefAccess<TeleportWorld, ZNetView>("m_nview");

	private static readonly FieldRef<TeleportWorld, float> ExitDistance = AccessTools.FieldRefAccess<TeleportWorld, float>("m_exitDistance");

	public static void OnTeleport(TeleportWorld portal, Player player)
	{
		//IL_0068: Unknown result type (might be due to invalid IL or missing references)
		//IL_0073: Unknown result type (might be due to invalid IL or missing references)
		//IL_0084: Unknown result type (might be due to invalid IL or missing references)
		//IL_0085: Unknown result type (might be due to invalid IL or missing references)
		//IL_008a: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c0: Unknown result type (might be due to invalid IL or missing references)
		if (!Plugin.portalTeleport.Value || (Object)(object)player != (Object)(object)Player.m_localPlayer || !((Character)player).IsTeleporting() || !TryGetExit(portal, out var exit))
		{
			return;
		}
		float value = Plugin.massCommandRange.Value;
		foreach (Character item in BetterTames.Scripts.CatchUp.CatchUp.FollowersOf(player.GetPlayerName()))
		{
			if (!(Vector3.Distance(((Component)item).transform.position, ((Component)player).transform.position) > value))
			{
				Vector3 position = BetterTames.Scripts.CatchUp.CatchUp.MoveTo(item, exit);
				ZNetView component = ((Component)item).GetComponent<ZNetView>();
				if ((Object)(object)component != (Object)null && component.IsValid() && component.IsOwner())
				{
					component.GetZDO().SetPosition(position);
				}
			}
		}
	}

	private static bool TryGetExit(TeleportWorld portal, out Vector3 exit)
	{
		//IL_0001: Unknown result type (might be due to invalid IL or missing references)
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		//IL_003d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0051: Unknown result type (might be due to invalid IL or missing references)
		//IL_0056: Unknown result type (might be due to invalid IL or missing references)
		//IL_0059: Unknown result type (might be due to invalid IL or missing references)
		//IL_005e: Unknown result type (might be due to invalid IL or missing references)
		//IL_005f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0064: Unknown result type (might be due to invalid IL or missing references)
		//IL_0075: Unknown result type (might be due to invalid IL or missing references)
		//IL_007a: Unknown result type (might be due to invalid IL or missing references)
		//IL_007f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0084: Unknown result type (might be due to invalid IL or missing references)
		//IL_0089: Unknown result type (might be due to invalid IL or missing references)
		exit = Vector3.zero;
		ZNetView val = PortalView.Invoke(portal);
		if ((Object)(object)val == (Object)null || !val.IsValid())
		{
			return false;
		}
		ZDO zDO = ZDOMan.instance.GetZDO(val.GetZDO().GetConnectionZDOID((ConnectionType)1));
		if (zDO == null)
		{
			return false;
		}
		Quaternion rotation = zDO.GetRotation();
		exit = zDO.GetPosition() + rotation * Vector3.forward * ExitDistance.Invoke(portal) + Vector3.up;
		return true;
	}
}
