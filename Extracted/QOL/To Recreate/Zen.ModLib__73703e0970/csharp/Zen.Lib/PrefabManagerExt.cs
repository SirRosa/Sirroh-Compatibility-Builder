using Jotunn.Configs;
using Jotunn.Managers;
using UnityEngine;

namespace Zen.Lib;

public static class PrefabManagerExt
{
	public static CraftingStation? GetCraftingStation(this PrefabManager prefabManager, string stationName)
	{
		string internalName = CraftingStations.GetInternalName(stationName);
		GameObject prefab = prefabManager.GetPrefab(internalName);
		if (!Object.op_Implicit((Object)(object)prefab))
		{
			return null;
		}
		return prefab.GetComponent<CraftingStation>();
	}
}
