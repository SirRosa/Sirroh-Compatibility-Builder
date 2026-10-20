using UnityEngine;

namespace QuickStackStore;

internal class AreaStackRestockHelper
{
	internal static bool IsTrueSingleplayer()
	{
		return !ZNet.m_openServer && !ZNet.m_publicServer && Object.op_Implicit((Object)(object)ZNet.instance) && ZNet.instance.IsServer() && !ZNet.instance.IsDedicated() && ZNet.instance.GetConnectedPeers().Count == 0;
	}

	private static bool CheckWard(Container container)
	{
		//IL_000f: Unknown result type (might be due to invalid IL or missing references)
		return !container.m_checkGuardStone || PrivateArea.CheckAccess(((Component)container).transform.position, 0f, true, false);
	}

	private static bool CheckContainerPrivacy(Container container, long playerID)
	{
		return container.CheckAccess(playerID);
	}

	private static bool CheckPieceConfigs(Container container)
	{
		if (Object.op_Implicit((Object)(object)container.m_piece))
		{
			return container.m_piece.IsPlacedByPlayer() || QSSConfig.QuickStackRestockConfig.AllowAreaStackingToPhysicalNonPlayerBuiltContainers.Value;
		}
		return container.m_name == "piece_chest_drawer" || QSSConfig.QuickStackRestockConfig.AllowAreaStackingToNonPhysicalContainers.Value;
	}

	private static bool IsInUseClientSide(Container container)
	{
		return container.IsInUse() || (Object.op_Implicit((Object)(object)container.m_wagon) && container.m_wagon.InUse());
	}

	private static bool IsInUseServerSide(Container container)
	{
		return container.m_nview.GetZDO().GetInt("InUse", 0) == 1;
	}

	private static bool IsInUse(Container container)
	{
		return IsInUseServerSide(container) || IsInUseClientSide(container);
	}

	private static bool IsExcludedContainer(Container container)
	{
		Player component = ((Component)container.m_nview).GetComponent<Player>();
		return Object.op_Implicit((Object)(object)component) && (Object)(object)component != (Object)(object)Player.m_localPlayer;
	}

	private static bool IsNonMUCExcludedContainer(Container container)
	{
		bool flag = false;
		return flag | Object.op_Implicit((Object)(object)((Component)((Component)container).transform.root).GetComponentInChildren<Ship>());
	}

	internal static bool ShouldAffectNonOwnerContainer(Container container, long playerID, bool isSinglePlayer)
	{
		bool flag = !IsExcludedContainer(container) && CheckContainerPrivacy(container, playerID) && CheckWard(container) && CheckPieceConfigs(container);
		if (CompatibilitySupport.HasPlugin("com.maxsch.valheim.MultiUserChest"))
		{
			return flag;
		}
		if (!isSinglePlayer && IsNonMUCExcludedContainer(container))
		{
			return false;
		}
		return flag && !IsInUse(container);
	}

	internal static void SetNonMUCContainerInUse(Container container, bool isInUse)
	{
		//IL_0056: Unknown result type (might be due to invalid IL or missing references)
		container.m_inUse = isInUse;
		if (QSSConfig.QuickStackRestockConfig.SuppressContainerSoundAndVisuals.Value)
		{
			container.m_nview.GetZDO().Set("InUse", isInUse ? 1 : 0);
		}
		else
		{
			container.SetInUse(isInUse);
		}
		ZDOMan.instance.ForceSendZDO(ZNet.GetUID(), container.m_nview.GetZDO().m_uid);
	}
}
