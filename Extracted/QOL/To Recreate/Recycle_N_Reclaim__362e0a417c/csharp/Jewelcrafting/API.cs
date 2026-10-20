using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using BepInEx.Configuration;
using JetBrains.Annotations;
using UnityEngine;

namespace Jewelcrafting;

[_003C967b9f38_002D976d_002D4a25_002D97ef_002Df07f0d12d5a8_003ENullableContext(1)]
[_003C96fffd91_002Dd0cc_002D4e8f_002D89c5_002Da3d60f7cf3d4_003ENullable(0)]
[PublicAPI]
internal static class API
{
	[_003C96fffd91_002Dd0cc_002D4e8f_002D89c5_002Da3d60f7cf3d4_003ENullable(0)]
	[PublicAPI]
	public class GemInfo(string gemPrefab, Sprite gemSprite, Dictionary<string, float> gemEffects, Dictionary<string, float[]> gemEffectsPowerRange, [_003C96fffd91_002Dd0cc_002D4e8f_002D89c5_002Da3d60f7cf3d4_003ENullable(new byte[] { 2, 1 })] Dictionary<string, uint> gemSeed = null)
	{
		public readonly string gemPrefab = gemPrefab;

		[_003C96fffd91_002Dd0cc_002D4e8f_002D89c5_002Da3d60f7cf3d4_003ENullable(new byte[] { 2, 1 })]
		public readonly Dictionary<string, uint> gemSeed = gemSeed;

		public readonly Sprite gemSprite = gemSprite;

		public readonly Dictionary<string, float> gemEffects = gemEffects;

		public readonly Dictionary<string, float[]> gemEffectsPowerRange = gemEffectsPowerRange;
	}

	[_003C967b9f38_002D976d_002D4a25_002D97ef_002Df07f0d12d5a8_003ENullableContext(0)]
	public delegate bool GemBreakHandler([_003C96fffd91_002Dd0cc_002D4e8f_002D89c5_002Da3d60f7cf3d4_003ENullable(2)] ItemData container, ItemData gem, int count = 1);

	[_003C967b9f38_002D976d_002D4a25_002D97ef_002Df07f0d12d5a8_003ENullableContext(0)]
	public delegate bool ItemBreakHandler(ItemData container);

	[_003C967b9f38_002D976d_002D4a25_002D97ef_002Df07f0d12d5a8_003ENullableContext(0)]
	public delegate bool ItemMirroredHandler(ItemData item);

	[_003C96fffd91_002Dd0cc_002D4e8f_002D89c5_002Da3d60f7cf3d4_003ENullable(2)]
	[method: _003C967b9f38_002D976d_002D4a25_002D97ef_002Df07f0d12d5a8_003ENullableContext(2)]
	[field: _003C96fffd91_002Dd0cc_002D4e8f_002D89c5_002Da3d60f7cf3d4_003ENullable(2)]
	public static event Action OnEffectRecalc;

	public static bool IsLoaded()
	{
		return false;
	}

	internal static void InvokeEffectRecalc()
	{
		OnEffectRecalc?.Invoke();
	}

	public static GameObject CreateNecklaceFromTemplate(string colorName, Color color)
	{
		return null;
	}

	public static GameObject CreateNecklaceFromTemplate(string colorName, Material material)
	{
		return null;
	}

	public static GameObject CreateRingFromTemplate(string colorName, Color color)
	{
		return null;
	}

	public static GameObject CreateRingFromTemplate(string colorName, Material material)
	{
		return null;
	}

	public static void MarkJewelry(GameObject jewelry)
	{
	}

	public static void AddGems(string type, string colorName, Color color)
	{
	}

	public static List<GameObject> AddGems(string type, string colorName, Material material, Color color)
	{
		return null;
	}

	public static GameObject AddDestructibleFromTemplate(string type, string colorName, Color color)
	{
		return null;
	}

	public static GameObject AddDestructibleFromTemplate(string type, string colorName, Material material)
	{
		return null;
	}

	public static GameObject AddUncutFromTemplate(string type, string colorName, Color color)
	{
		return null;
	}

	public static GameObject AddUncutFromTemplate(string type, string colorName, Material material)
	{
		return null;
	}

	public static GameObject AddAndRegisterUncutFromTemplate(string type, string colorName, Color color)
	{
		return null;
	}

	public static GameObject AddAndRegisterUncutFromTemplate(string type, string colorName, Material material)
	{
		return null;
	}

	public static GameObject AddShardFromTemplate(string type, string colorName, Color color)
	{
		return null;
	}

	public static GameObject AddShardFromTemplate(string type, string colorName, Material material)
	{
		return null;
	}

	public static GameObject[] AddTieredGemFromTemplate(string type, string colorName, Color color)
	{
		return null;
	}

	public static GameObject[] AddTieredGemFromTemplate(string type, string colorName, Material material, Color color)
	{
		return null;
	}

	public static void AddGem(GameObject prefab, string colorName)
	{
	}

	public static void AddShard(GameObject prefab, string colorName)
	{
	}

	public static void AddDestructible(GameObject prefab, string colorName)
	{
	}

	public static void AddUncutGem(GameObject prefab, string colorName, [_003C96fffd91_002Dd0cc_002D4e8f_002D89c5_002Da3d60f7cf3d4_003ENullable(2)] ConfigEntry<float> dropChance = null)
	{
	}

	[_003C967b9f38_002D976d_002D4a25_002D97ef_002Df07f0d12d5a8_003ENullableContext(2)]
	public static void AddGemEffect<[_003C96fffd91_002Dd0cc_002D4e8f_002D89c5_002Da3d60f7cf3d4_003ENullable(0)] T>([_003C96fffd91_002Dd0cc_002D4e8f_002D89c5_002Da3d60f7cf3d4_003ENullable(1)] string name, string englishDescription = null, string englishDescriptionDetailed = null) where T : struct
	{
	}

	public static void AddGemConfig(string yaml)
	{
	}

	[_003C967b9f38_002D976d_002D4a25_002D97ef_002Df07f0d12d5a8_003ENullableContext(0)]
	public static T GetEffectPower<T>([_003C96fffd91_002Dd0cc_002D4e8f_002D89c5_002Da3d60f7cf3d4_003ENullable(1)] this Player player, [_003C96fffd91_002Dd0cc_002D4e8f_002D89c5_002Da3d60f7cf3d4_003ENullable(1)] string name) where T : struct
	{
		return default;
	}

	[return: _003C96fffd91_002Dd0cc_002D4e8f_002D89c5_002Da3d60f7cf3d4_003ENullable(new byte[] { 1, 2 })]
	public static List<GemInfo> GetGems(ItemData item)
	{
		return new List<GemInfo>();
	}

	public static bool SetGems(ItemData item, [_003C96fffd91_002Dd0cc_002D4e8f_002D89c5_002Da3d60f7cf3d4_003ENullable(new byte[] { 1, 2 })] List<GemInfo> gems)
	{
		return false;
	}

	public static Sprite GetSocketBorder()
	{
		return null;
	}

	public static GameObject GetGemcuttersTable()
	{
		return null;
	}

	public static void AddParticleEffect(string prefabName, GameObject effect, VisualEffectCondition displayCondition)
	{
	}

	public static void SetSocketsLock(ItemData item, bool enabled)
	{
	}

	public static void OnGemBreak(GemBreakHandler callback)
	{
	}

	public static void OnItemBreak(ItemBreakHandler callback)
	{
	}

	public static void OnItemMirrored(ItemMirroredHandler callback)
	{
	}

	public static bool IsJewelryEquipped(Player player, string prefabName)
	{
		return false;
	}

	public static bool BlacklistItem(GameObject item)
	{
		return false;
	}

	[return: _003C96fffd91_002Dd0cc_002D4e8f_002D89c5_002Da3d60f7cf3d4_003ENullable(2)]
	public static Transform GetJewelcraftingTooltipRoot(GameObject tooltip)
	{
		return null;
	}

	public static bool FillItemContainerTooltip([_003C96fffd91_002Dd0cc_002D4e8f_002D89c5_002Da3d60f7cf3d4_003ENullable(2)] ItemData item, Transform root, bool showInteract)
	{
		return false;
	}

	public static Color? GetSocketableItemColor(ItemData item)
	{
		return null;
	}
}
