using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Runtime.CompilerServices;
using HarmonyLib;
using JetBrains.Annotations;
using Splatform;
using UnityEngine;
using UnityEngine.UI;

namespace CreatureLevelControl;

[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(0)]
[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
public class CreatureSector : MonoBehaviour
{
	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	[HarmonyPatch(typeof(Hud), "Awake")]
	public class PatchMinimapAwake
	{
		[UsedImplicitly]
		private static void Postfix()
		{
			//IL_001a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0020: Expected Obj, but got Unknown
			//IL_0038: Unknown result type (might be due to invalid IL or missing references)
			//IL_003d: Unknown result type (might be due to invalid IL or missing references)
			//IL_004f: Expected Obj, but got Unknown
			//IL_0063: Unknown result type (might be due to invalid IL or missing references)
			//IL_0069: Expected Obj, but got Unknown
			//IL_0074: Unknown result type (might be due to invalid IL or missing references)
			//IL_008a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0105: Unknown result type (might be due to invalid IL or missing references)
			//IL_011b: Unknown result type (might be due to invalid IL or missing references)
			RectTransform val = (RectTransform)GameObject.Find("MiniMap").transform.Find("small");
			GameObject val2 = new GameObject("sectorlevellabel", new Type[1] { typeof(RectTransform) })
			{
				layer = LayerMask.NameToLayer("UI")
			};
			val2.transform.SetParent((Transform)(object)val, false);
			RectTransform val3 = (RectTransform)val2.transform;
			val3.sizeDelta = new Vector2(250f, 300f);
			val3.anchoredPosition = new Vector2(-35f, 60f);
			minimapSectorText = val2.AddComponent<Text>();
			minimapSectorText.font = Resources.FindObjectsOfTypeAll<Font>().FirstOrDefault((Font x) => ((Object)x).name == "AveriaSerifLibre-Bold");
			minimapSectorText.fontSize = 12;
			minimapSectorText.text = "Sector Level: 0";
			minimapSectorText.alignment = (TextAnchor)8;
			Outline val4 = val2.AddComponent<Outline>();
			((Shadow)val4).effectColor = Color.black;
			((Shadow)val4).effectDistance = new Vector2(1f, -1f);
			updateVisibility();
			CreatureLevelControl.displayCreatureSectorLevel.SettingChanged += (object _, EventArgs _) =>
			{
				updateVisibility();
			};
		}

		private static void updateVisibility()
		{
			Text minimapSectorText = CreatureSector.minimapSectorText;
			if (minimapSectorText != null)
			{
				((Component)minimapSectorText).gameObject.SetActive(CreatureLevelControl.displayCreatureSectorLevel.GetToggle());
			}
		}
	}

	[HarmonyPatch(typeof(Minimap), "OnDestroy")]
	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	public class PatchMinimapDestroy
	{
		[UsedImplicitly]
		private static void Postfix()
		{
			minimapSectorText = null;
		}
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	[HarmonyPatch(typeof(Minimap), "Update")]
	public class PatchMinimapSectorUpdate
	{
		[UsedImplicitly]
		private static void Postfix()
		{
			//IL_0081: Unknown result type (might be due to invalid IL or missing references)
			//IL_004a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0060: Unknown result type (might be due to invalid IL or missing references)
			//IL_0065: Unknown result type (might be due to invalid IL or missing references)
			if (!((Object)(object)minimapSectorText != (Object)null))
			{
				return;
			}
			Player localPlayer = Player.m_localPlayer;
			Vector2s? val;
			if (localPlayer == null)
			{
				val = null;
			}
			else
			{
				ZNetView nview = ((Character)localPlayer).m_nview;
				if (nview == null)
				{
					val = null;
				}
				else
				{
					ZDO zDO = nview.GetZDO();
					val = ((zDO != null) ? new Vector2s?(zDO.GetSector()) : ((Vector2s?)null));
				}
			}
			Vector2s? val2 = val;
			if (val2.HasValue)
			{
				Vector2s valueOrDefault = val2.GetValueOrDefault();
				if (true)
				{
					minimapSectorText.text = LocalizationWrapper.getTranslationWithPlaceholders("MinimapSectorLevel", "level", sectorBonusLevel(valueOrDefault).ToString());
				}
			}
		}
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	private struct Pin
	{
		public double removalTime;

		[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(1)]
		public PinData pin;
	}

	[HarmonyPatch(typeof(ZNet), "Awake")]
	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	private static class RegisterRPCPatch
	{
		[UsedImplicitly]
		private static void Postfix()
		{
			ZRoutedRpc.instance.Register<ZPackage>("cllc creaturesectorlevelup", (Action<long, ZPackage>)HandleSectorLevelUp);
		}

		[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
		private static void HandleSectorLevelUp(long id, ZPackage package)
		{
			//IL_0002: Unknown result type (might be due to invalid IL or missing references)
			//IL_0007: Unknown result type (might be due to invalid IL or missing references)
			//IL_0014: Unknown result type (might be due to invalid IL or missing references)
			//IL_001e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0024: Unknown result type (might be due to invalid IL or missing references)
			Vector3 val = package.ReadVector3();
			string text = package.ReadString();
			PinData pin = Minimap.instance.AddPin(val, (PinType)13, text, false, false, 0L, default(PlatformUserID));
			pins.Enqueue(new Pin
			{
				removalTime = ZNet.instance.GetTimeSeconds() + (double)CreatureLevelControl.creatureSectorPingTime.Value,
				pin = pin
			});
		}
	}

	[HarmonyPatch(typeof(ZNetView), "Awake")]
	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	private class SkipAwakeInit
	{
		public static bool skipAwake;

		[UsedImplicitly]
		private static bool Prefix()
		{
			return !skipAwake;
		}
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	[HarmonyPatch(typeof(ZNetScene), "Awake")]
	private class PatchCreatureSectors
	{
		[UsedImplicitly]
		[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
		private static void Prefix(ZNetScene __instance)
		{
			//IL_000c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0011: Unknown result type (might be due to invalid IL or missing references)
			//IL_001a: Expected Obj, but got Unknown
			SkipAwakeInit.skipAwake = true;
			GameObject val = new GameObject("CLLC_CreatureSector")
			{
				hideFlags = (HideFlags)1
			};
			ZNetView val2 = val.AddComponent<ZNetView>();
			val2.m_persistent = true;
			val.AddComponent<CreatureSector>();
			__instance.m_prefabs.Add(val);
			SkipAwakeInit.skipAwake = false;
			creatureSectors = new HashSet<CreatureSector>();
		}
	}

	private static HashSet<CreatureSector> creatureSectors = new HashSet<CreatureSector>();

	private ZNetView zNetView = null;

	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)]
	private static Text minimapSectorText;

	private static readonly Queue<Pin> pins = new Queue<Pin>();

	private float lastSectorKill
	{
		get
		{
			return zNetView.GetZDO().GetFloat("last kill", 0f);
		}
		set
		{
			zNetView.GetZDO().Set("last kill", value);
		}
	}

	public float sectorKills
	{
		get
		{
			return (CreatureLevelControl.creatureSectorResetTime.Value == 0 || (double)lastSectorKill > ZNet.instance.GetTimeSeconds() - (double)(60 * CreatureLevelControl.creatureSectorResetTime.Value)) ? zNetView.GetZDO().GetFloat("kills", 0f) : 0f;
		}
		private set
		{
			zNetView.GetZDO().Set("kills", value);
		}
	}

	private static IEnumerable<float> SectorLevels => from s in CreatureLevelControl.creatureSectorLevelUp.Value.Split(new char[1] { ',' })
		select float.TryParse(s, NumberStyles.Float, CultureInfo.InvariantCulture, out var result) ? result : 0f into level
		where level != 0f
		select level;

	[return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)]
	public static CreatureSector currentSector(ZNetView netView)
	{
		//IL_000e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0013: Unknown result type (might be due to invalid IL or missing references)
		Vector2s sector = netView.GetZDO().GetSector();
		return creatureSectors.FirstOrDefault([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (CreatureSector cz) =>
		{
			//IL_000b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0011: Unknown result type (might be due to invalid IL or missing references)
			return cz.zNetView.GetZDO().GetSector() == sector;
		});
	}

	public void Awake()
	{
		creatureSectors.Add(this);
		zNetView = ((Component)this).GetComponent<ZNetView>();
	}

	public void OnDestroy()
	{
		creatureSectors.Remove(this);
	}

	private static int sectorBonusLevel(float kills, float[] sectorLevels)
	{
		for (int num = sectorLevels.Length - 1; num >= 0; num--)
		{
			if (kills > sectorLevels[num])
			{
				return num + 1;
			}
		}
		return 0;
	}

	public static int sectorBonusLevel(Character character)
	{
		//IL_005b: Unknown result type (might be due to invalid IL or missing references)
		float[] array = Utils.ReadWithWorldLevelFromConfig(character, [return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 2 })] (CreatureConfig c) => c.sectorStars);
		int starMultiplier = 1;
		if (array != null && array.Length == 1 && array[0] <= 0f)
		{
			starMultiplier = (int)(0f - array[0]);
			array = null;
		}
		return sectorBonusLevel(((Component)character).GetComponent<ZNetView>().GetZDO().GetSector(), array, starMultiplier);
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(2)]
	public static int sectorBonusLevel(Vector2s sector, float[] starThresholds = null, int starMultiplier = 1)
	{
		//IL_004b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0062: Unknown result type (might be due to invalid IL or missing references)
		//IL_0067: Unknown result type (might be due to invalid IL or missing references)
		//IL_0073: Unknown result type (might be due to invalid IL or missing references)
		//IL_0074: Unknown result type (might be due to invalid IL or missing references)
		//IL_0075: Unknown result type (might be due to invalid IL or missing references)
		//IL_007a: Unknown result type (might be due to invalid IL or missing references)
		//IL_007c: Unknown result type (might be due to invalid IL or missing references)
		//IL_008b: Unknown result type (might be due to invalid IL or missing references)
		if (starThresholds == null)
		{
			starThresholds = SectorLevels.ToArray();
		}
		float num = 0f;
		foreach (CreatureSector creatureSector in creatureSectors)
		{
			ZDO zDO = creatureSector.zNetView.GetZDO();
			Vector2s? val = ((zDO != null) ? new Vector2s?(zDO.GetSector()) : ((Vector2s?)null));
			if (!val.HasValue)
			{
				continue;
			}
			Vector2s valueOrDefault = val.GetValueOrDefault();
			if (true)
			{
				Vector2s val2 = valueOrDefault - sector;
				if (Math.Abs(val2.x) <= 1 && Math.Abs(val2.y) <= 1 && num < creatureSector.sectorKills)
				{
					num = creatureSector.sectorKills;
				}
			}
		}
		return sectorBonusLevel(num, starThresholds) * starMultiplier;
	}

	public void Update()
	{
		while (pins.Count > 0 && pins.Peek().removalTime < ZNet.instance.GetTimeSeconds())
		{
			Minimap.instance.RemovePin(pins.Dequeue().pin);
		}
	}

	private void increaseSectorKills(List<CreatureSector> neighborSectors, float count)
	{
		//IL_00fc: Unknown result type (might be due to invalid IL or missing references)
		//IL_0107: Unknown result type (might be due to invalid IL or missing references)
		//IL_010c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0111: Unknown result type (might be due to invalid IL or missing references)
		//IL_0113: Unknown result type (might be due to invalid IL or missing references)
		//IL_011f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0180: Unknown result type (might be due to invalid IL or missing references)
		//IL_0187: Expected Obj, but got Unknown
		//IL_0193: Unknown result type (might be due to invalid IL or missing references)
		float maxKills = neighborSectors.Max([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (CreatureSector cz) => cz.sectorKills);
		sectorKills += count;
		if (sectorKills > maxKills && SectorLevels.Count((float s) => s < maxKills) != SectorLevels.Count((float s) => s < sectorKills))
		{
			string translationWithPlaceholders = LocalizationWrapper.getTranslationWithPlaceholders("CreatureSectorLevelIncrease", "player", ((Character)Player.m_localPlayer).GetHoverName());
			foreach (Player allPlayer in Player.GetAllPlayers())
			{
				switch (CreatureLevelControl.creatureSectorAnnouncementScope.Value)
				{
				case CreatureLevelControl.CreatureSectorAnnouncementScope.Global:
					((Character)allPlayer).Message((MessageType)2, translationWithPlaceholders, 0, (Sprite)null, false);
					break;
				case CreatureLevelControl.CreatureSectorAnnouncementScope.Local:
				{
					Vector3 val = ((Component)allPlayer).transform.position - ((Component)this).transform.position;
					if (Math.Max(Math.Abs(val.x), Math.Abs(val.y)) < 96f)
					{
						((Character)allPlayer).Message((MessageType)2, translationWithPlaceholders, 0, (Sprite)null, false);
					}
					break;
				}
				}
			}
			if (CreatureLevelControl.creatureSectorPingTime.Value > 0)
			{
				ZPackage val2 = new ZPackage();
				val2.Write(((Component)Player.m_localPlayer).transform.position);
				val2.Write(Player.m_localPlayer.GetPlayerName());
				ZRoutedRpc.instance.InvokeRoutedRPC(0L, "cllc creaturesectorlevelup", new object[1] { val2 });
			}
		}
		lastSectorKill = (float)ZNet.instance.GetTimeSeconds();
	}

	public static void increaseSectorKills(Character character)
	{
		//IL_0028: Unknown result type (might be due to invalid IL or missing references)
		//IL_002d: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ce: Unknown result type (might be due to invalid IL or missing references)
		//IL_00d3: Unknown result type (might be due to invalid IL or missing references)
		//IL_00d4: Unknown result type (might be due to invalid IL or missing references)
		//IL_00d9: Unknown result type (might be due to invalid IL or missing references)
		//IL_00db: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ea: Unknown result type (might be due to invalid IL or missing references)
		//IL_0107: Unknown result type (might be due to invalid IL or missing references)
		//IL_0113: Unknown result type (might be due to invalid IL or missing references)
		//IL_0178: Unknown result type (might be due to invalid IL or missing references)
		//IL_0182: Unknown result type (might be due to invalid IL or missing references)
		//IL_0187: Unknown result type (might be due to invalid IL or missing references)
		//IL_018c: Unknown result type (might be due to invalid IL or missing references)
		//IL_018e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0190: Unknown result type (might be due to invalid IL or missing references)
		//IL_0195: Unknown result type (might be due to invalid IL or missing references)
		//IL_01a6: Unknown result type (might be due to invalid IL or missing references)
		//IL_01a8: Unknown result type (might be due to invalid IL or missing references)
		ZNetView component = ((Component)character).GetComponent<ZNetView>();
		if (!component.GetZDO().IsOwner())
		{
			return;
		}
		Vector2s sector = component.GetZDO().GetSector();
		Dictionary<int, HashSet<int>> dictionary = new Dictionary<int, HashSet<int>>
		{
			{
				-1,
				new HashSet<int> { -1, 0, 1 }
			},
			{
				0,
				new HashSet<int> { -1, 0, 1 }
			},
			{
				1,
				new HashSet<int> { -1, 0, 1 }
			}
		};
		List<CreatureSector> list = new List<CreatureSector>();
		foreach (CreatureSector creatureSector in creatureSectors)
		{
			Vector2s val = creatureSector.zNetView.GetZDO().GetSector() - sector;
			if (Math.Abs(val.x) <= 1 && Math.Abs(val.y) <= 1)
			{
				dictionary[val.x].Remove(val.y);
				list.Add(creatureSector);
			}
		}
		foreach (KeyValuePair<int, HashSet<int>> item in dictionary)
		{
			foreach (int item2 in item.Value)
			{
				Vector2s val2 = sector + new Vector2s(item.Key, item2);
				Vector3 zonePos = ZoneSystem.GetZonePos(val2);
				GameObject val3 = Object.Instantiate<GameObject>(ZNetScene.instance.GetPrefab("CLLC_CreatureSector"), zonePos, Quaternion.identity);
				list.Add(val3.GetComponent<CreatureSector>());
			}
		}
		float? num = Utils.ReadWithWorldLevelAndStarsFromConfig(character, [return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 2 })] (CreatureConfig c) => c.sectorCount);
		foreach (CreatureSector item3 in list)
		{
			item3.increaseSectorKills(list, num ?? 1f);
		}
	}

	public static void resetSectorKills(ZNetView netView)
	{
		//IL_0007: Unknown result type (might be due to invalid IL or missing references)
		//IL_000c: Unknown result type (might be due to invalid IL or missing references)
		//IL_002f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0034: Unknown result type (might be due to invalid IL or missing references)
		//IL_0035: Unknown result type (might be due to invalid IL or missing references)
		//IL_003a: Unknown result type (might be due to invalid IL or missing references)
		//IL_003b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0049: Unknown result type (might be due to invalid IL or missing references)
		Vector2s sector = netView.GetZDO().GetSector();
		foreach (CreatureSector creatureSector in creatureSectors)
		{
			Vector2s val = creatureSector.zNetView.GetZDO().GetSector() - sector;
			if (Math.Abs(val.x) <= 1 && Math.Abs(val.y) <= 1)
			{
				((Component)creatureSector).GetComponent<ZNetView>().ClaimOwnership();
				ZNetScene.instance.Destroy(((Component)creatureSector).gameObject);
			}
		}
	}
}
