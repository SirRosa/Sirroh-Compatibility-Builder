using System.Collections.Generic;
using System.Globalization;
using UnityEngine;

namespace Zen.Lib;

public static class PlayerExt
{
	public static bool HaveUniqueKeyValueAny(this Player? player, string key)
	{
		string text = default;
		if (Object.op_Implicit((Object)(object)player))
		{
			return player.TryGetUniqueKeyValue(key, ref text);
		}
		return false;
	}

	public static void AddUniqueKeyValue(this Player player, string key, int value)
	{
		player.AddUniqueKeyValue(key, value.ToString());
	}

	public static void AddUniqueKeyValue(this Player player, string key, float value, string format = "F")
	{
		player.AddUniqueKeyValue(key, value.ToString(format));
	}

	public static bool TryGetUniqueKeyInt(this Player? player, string key, out int value)
	{
		value = 0;
		string s = default;
		if (Object.op_Implicit((Object)(object)player) && player.TryGetUniqueKeyValue(key, ref s))
		{
			return int.TryParse(s, out value);
		}
		return false;
	}

	public static bool TryGetUniqueKeyFloat(this Player? player, string key, out float value)
	{
		value = 0f;
		string s = default;
		if (Object.op_Implicit((Object)(object)player) && player.TryGetUniqueKeyValue(key, ref s))
		{
			return float.TryParse(s, NumberStyles.Float, CultureInfo.InvariantCulture, out value);
		}
		return false;
	}

	public static void RefreshInventorySize(this Player player)
	{
		if (Object.op_Implicit((Object)(object)player) && player.TryGetUniqueKeyInt("invrows", out var value))
		{
			player.SetInventorySize(value);
		}
	}

	public static HashSet<Biome> KnownBiomes(this Player player)
	{
		//IL_002f: Unknown result type (might be due to invalid IL or missing references)
		HashSet<Biome> hashSet = new HashSet<Biome>();
		if (player.m_knownBiome == null)
		{
			return hashSet;
		}
		foreach (string item in player.m_knownBiome)
		{
			if (item.TryGetBiomeFromTranslationName(out var biome))
			{
				hashSet.Add(biome);
			}
		}
		return hashSet;
	}

	public static bool IsBiomeKnown(this Player player, Biome biome)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_0003: Unknown result type (might be due to invalid IL or missing references)
		//IL_0009: Invalid comparison between Unknown and I4
		//IL_0017: Unknown result type (might be due to invalid IL or missing references)
		//IL_0018: Unknown result type (might be due to invalid IL or missing references)
		//IL_0022: Expected Obj, but got Unknown
		if ((int)biome != 0)
		{
			if ((int)biome == 895)
			{
				return true;
			}
			return player.IsBiomeKnown(new BiomeSector((AltBiomeWorldData)null, biome));
		}
		return false;
	}

	public static bool IsReady(this Player? player)
	{
		if (Object.op_Implicit((Object)(object)player) && !((Character)player).IsDead())
		{
			return !((Character)player).IsTeleporting();
		}
		return false;
	}

	public static bool Is(this Player? player, Character other)
	{
		if (player.IsReady())
		{
			return (Object)(object)player == (Object)(object)other;
		}
		return false;
	}

	public static bool IsGodMode(this Player? player)
	{
		if (Object.op_Implicit((Object)(object)player))
		{
			return ((Character)player).InGodMode();
		}
		return false;
	}

	public static bool IsNot(this Player? player, Character other)
	{
		return !player.Is(other);
	}

	public static void SelectRepairTool(this Player player)
	{
		//IL_0001: Unknown result type (might be due to invalid IL or missing references)
		player.SetSelectedPiece(Vector2Int.zero);
	}

	public static void RemoveGuardianPower(this Player player)
	{
		player.m_guardianPower = string.Empty;
		player.m_guardianPowerHash = 0;
		player.m_guardianSE = null;
	}

	public static bool IsShipCaptain(this Player player)
	{
		return Object.op_Implicit((Object)(object)player.GetControlledShip());
	}

	public static T? GetControlled<T>(this Player player) where T : MonoBehaviour
	{
		IDoodadController doodadController = player.GetDoodadController();
		if (doodadController == null || !doodadController.IsValid())
		{
			return default;
		}
		T val = (T)(object)((doodadController is T) ? doodadController : null);
		if (val == null)
		{
			Component controlledComponent = doodadController.GetControlledComponent();
			val = (T)(object)((controlledComponent is T) ? controlledComponent : null);
		}
		return val;
	}

	public static ItemData? GetTorch(this Player player)
	{
		if (((Humanoid)player).LeftItem.IsTorch())
		{
			return ((Humanoid)player).LeftItem;
		}
		if (((Humanoid)player).RightItem.IsTorch())
		{
			return ((Humanoid)player).RightItem;
		}
		if (((Humanoid)player).m_hiddenLeftItem.IsTorch())
		{
			return ((Humanoid)player).m_hiddenLeftItem;
		}
		if (((Humanoid)player).m_hiddenRightItem.IsTorch())
		{
			return ((Humanoid)player).m_hiddenRightItem;
		}
		foreach (ItemData item in ((Humanoid)player).GetInventory().GetAllItemsInGridOrder())
		{
			if (item.IsTorch())
			{
				return item;
			}
		}
		return null;
	}
}
