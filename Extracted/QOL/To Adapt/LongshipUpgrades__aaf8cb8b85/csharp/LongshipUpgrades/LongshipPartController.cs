using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using HarmonyLib;
using UnityEngine;

namespace LongshipUpgrades;

public class LongshipPartController : MonoBehaviour, Hoverable, Interactable
{
	public class UpgradeRequirements
	{
		public int m_zdoVar;

		public Requirement[] m_requirements = new Requirement[0];

		public string m_messageUpgrade = "";

		public string m_stationName;

		public int m_stationLevel;

		public int m_stationRange;

		public UpgradeRequirements(int zdoVar, string message, Requirement[] requirements, string station, int level, int range)
		{
			m_zdoVar = zdoVar;
			m_requirements = requirements;
			m_messageUpgrade = message;
			m_stationName = station.GetCraftingStationName();
			m_stationLevel = level;
			m_stationRange = range;
		}

		public bool FillUpgradeHover(ZDO zdo, string name)
		{
			if (m_zdoVar == 0 || zdo.GetBool(m_zdoVar, false))
			{
				return false;
			}
			sb.Clear();
			if (!Player.m_localPlayer.NoCostCheat() && !string.IsNullOrWhiteSpace(m_stationName) && !Player.m_localPlayer.KnowStationLevel(m_stationName, m_stationLevel))
			{
				AddUpgradeHintToHover("$lu_controller_message_unknownupgrade");
				return true;
			}
			sb.Append(name);
			if (HaveCraftinStationInRange(out var lvlMet))
			{
				if (lvlMet)
				{
					sb.Append("\n[<color=yellow><b>$KEY_Use</b></color>] $inventory_upgradebutton");
				}
				AddUpgradeHintToHover(m_messageUpgrade);
				AddUpgradeRequirementsToHint(lvlMet);
			}
			else
			{
				AddUpgradeHintToHover(m_messageUpgrade);
				sb.Append("\n\n$msg_missingrequirement:");
				AddRequiredStationToHover();
			}
			return true;
		}

		public bool CheckConsume(ZNetView nview, Player player, Vector3 position, out bool result)
		{
			result = false;
			if (m_zdoVar == 0 || nview.GetZDO().GetBool(m_zdoVar, false))
			{
				return false;
			}
			if (!RemoveRequiredItems(player))
			{
				((Character)player).Message((MessageType)2, "$msg_missingrequirement", 0, (Sprite)null, false);
				return true;
			}
			nview.InvokeRPC("SetBuilt", new object[3]
			{
				m_zdoVar,
				m_stationName,
				((object)position/*cast due to constrained. prefix*/).ToString()
			});
			PlayerProfile playerProfile = Game.instance.GetPlayerProfile();
			playerProfile.IncrementStat((PlayerStatType)1, 1f, false);
			playerProfile.IncrementStat((PlayerStatType)14, 1f, false);
			result = true;
			return true;
		}

		public void AddSpentUpgrades(ZDO zdo, Dictionary<int, Requirement[]> upgradeReqs)
		{
			if (m_zdoVar != 0 && zdo.GetBool(m_zdoVar, false) && m_requirements.Length != 0)
			{
				upgradeReqs[m_zdoVar] = m_requirements;
			}
		}

		private void AddUpgradeRequirementsToHint(bool lvlMet)
		{
			//IL_0058: Unknown result type (might be due to invalid IL or missing references)
			//IL_0083: Unknown result type (might be due to invalid IL or missing references)
			//IL_008d: Unknown result type (might be due to invalid IL or missing references)
			//IL_00d3: Unknown result type (might be due to invalid IL or missing references)
			//IL_00bb: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c0: Unknown result type (might be due to invalid IL or missing references)
			if (m_requirements == null || m_requirements.Length == 0 || string.IsNullOrWhiteSpace(m_stationName))
			{
				return;
			}
			sb.Append("\n");
			if (ZoneSystem.instance.GetGlobalKey((GlobalKeys)24))
			{
				sb.AppendFormat("\n<color=#{0}>$menu_nobuildcost</color>", ColorUtility.ToHtmlStringRGBA(LongshipUpgrades.hintStationColor.Value));
			}
			sb.Append("\n$hud_require");
			if (lvlMet)
			{
				AddRequiredStationToHover(LongshipUpgrades.hintStationColor.Value, LongshipUpgrades.hintStationColor.Value);
			}
			else if (Mathf.Sin(Time.time * 10f) > 0f)
			{
				AddRequiredStationToHover(LongshipUpgrades.hintStationColor.Value, Color.red);
			}
			else
			{
				AddRequiredStationToHover(LongshipUpgrades.hintStationColor.Value);
			}
			sb.Append(":");
			Requirement[] requirements = m_requirements;
			if (requirements != null)
			{
				CollectionExtensions.Do<Requirement>((IEnumerable<Requirement>)requirements, (Action<Requirement>)((Requirement req) =>
				{
					AddItemRequirementToHover(req);
				}));
			}
		}

		private void AddRequiredStationToHover()
		{
			if (!string.IsNullOrWhiteSpace(m_stationName))
			{
				sb.AppendFormat(" {0}", m_stationName);
				if (m_stationLevel > 1)
				{
					sb.AppendFormat(" $msg_level {0}", m_stationLevel);
				}
			}
		}

		private void AddRequiredStationToHover(Color station, Color level)
		{
			//IL_001c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0045: Unknown result type (might be due to invalid IL or missing references)
			if (!string.IsNullOrWhiteSpace(m_stationName))
			{
				sb.AppendFormat(" <color=#{0}>{1}</color>", ColorUtility.ToHtmlStringRGBA(station), m_stationName);
				if (m_stationLevel > 1)
				{
					sb.AppendFormat(" $msg_level <color=#{0}>{1}</color>", ColorUtility.ToHtmlStringRGBA(level), m_stationLevel);
				}
			}
		}

		private void AddRequiredStationToHover(Color station)
		{
			//IL_001c: Unknown result type (might be due to invalid IL or missing references)
			if (!string.IsNullOrWhiteSpace(m_stationName))
			{
				sb.AppendFormat(" <color=#{0}>{1}</color>", ColorUtility.ToHtmlStringRGBA(station), m_stationName);
				if (m_stationLevel > 1)
				{
					sb.AppendFormat(" $msg_level {0}", m_stationLevel);
				}
			}
		}

		private void AddUpgradeHintToHover(string message)
		{
			//IL_001d: Unknown result type (might be due to invalid IL or missing references)
			if (!string.IsNullOrWhiteSpace(message))
			{
				sb.AppendFormat("\n<color=#{0}>{1}</color>", ColorUtility.ToHtmlStringRGBA(LongshipUpgrades.hintColor.Value), message);
			}
		}

		private bool HaveCraftinStationInRange(out bool lvlMet)
		{
			//IL_0044: Unknown result type (might be due to invalid IL or missing references)
			lvlMet = true;
			if (string.IsNullOrWhiteSpace(m_stationName) || Player.m_localPlayer.NoCostCheat())
			{
				return true;
			}
			lvlMet = false;
			craftingStations.Clear();
			CraftingStation.FindStationsInRange(m_stationName, ((Component)Player.m_localPlayer).transform.position, (float)m_stationRange, craftingStations);
			if (craftingStations.Count == 0)
			{
				return false;
			}
			lvlMet = craftingStations.Any((CraftingStation station) => station.GetLevel(true) >= m_stationLevel);
			return true;
		}

		private void AddItemRequirementToHover(Requirement requirement)
		{
			//IL_0043: Unknown result type (might be due to invalid IL or missing references)
			//IL_0064: Unknown result type (might be due to invalid IL or missing references)
			if (!((Object)(object)requirement.m_resItem == (Object)null))
			{
				string name = requirement.m_resItem.m_itemData.m_shared.m_name;
				sb.AppendFormat("\n<color=#{0}>{1}</color> <color=#{2}>{3}</color>", new object[4]
				{
					ColorUtility.ToHtmlStringRGBA(LongshipUpgrades.hintAmountColor.Value),
					requirement.GetAmount(1),
					ColorUtility.ToHtmlStringRGBA(LongshipUpgrades.hintItemColor.Value),
					(Player.m_localPlayer.NoCostCheat() || Player.m_localPlayer.IsMaterialKnown(name)) ? name : "$lu_controller_message_unknownitem"
				});
			}
		}

		private bool RemoveRequiredItems(Player player)
		{
			if (player.NoCostCheat())
			{
				return true;
			}
			if (!string.IsNullOrWhiteSpace(m_stationName) && m_stationLevel > 0 && !player.KnowStationLevel(m_stationName, m_stationLevel))
			{
				return false;
			}
			if (!HaveCraftinStationInRange(out var lvlMet) || !lvlMet)
			{
				return false;
			}
			if (ZoneSystem.instance.GetGlobalKey((GlobalKeys)24))
			{
				return true;
			}
			if (m_requirements.Length == 0)
			{
				return true;
			}
			tempRecipe.m_resources = m_requirements;
			if (!player.HaveRequirementItems(tempRecipe, false, 1, 1))
			{
				return false;
			}
			player.ConsumeResources(m_requirements, 1, -1, 1);
			return true;
		}
	}

	public ZNetView m_nview;

	public Ship m_ship;

	public Piece m_piece;

	public string m_name = "Part";

	public bool m_checkGuardStone = true;

	public float m_useDistance = 0f;

	public float m_hoverOffset;

	public string m_messageEnable = "$lu_controller_message_enable";

	public string m_messageSwitch = "$lu_controller_message_switch";

	public string m_messageDisable = "$lu_controller_message_disable";

	public UpgradeRequirements[] m_upgradeRequirements = new UpgradeRequirements[0];

	public int m_zdoPartDisabled;

	public int m_zdoPartVariant;

	public int m_variants;

	public int m_switchEffects = -1;

	public int m_enableEffects = -1;

	public int m_disableEffects = -1;

	private static readonly StringBuilder sb = new StringBuilder(20);

	private static Recipe tempRecipe;

	private static readonly List<CraftingStation> craftingStations = new List<CraftingStation>();

	public void Awake()
	{
		if ((Object)(object)tempRecipe == (Object)null)
		{
			tempRecipe = ScriptableObject.CreateInstance<Recipe>();
			((Object)tempRecipe).name = "LongshipPartUpgradeTempRecipe";
		}
		if ((Object)(object)m_nview == (Object)null)
		{
			m_nview = ((Component)this).GetComponentInParent<ZNetView>();
		}
		m_ship = ((Component)this).GetComponentInParent<Ship>();
		m_piece = ((Component)this).GetComponentInParent<Piece>();
	}

	public string GetHoverText()
	{
		//IL_00c3: Unknown result type (might be due to invalid IL or missing references)
		if (!Object.op_Implicit((Object)(object)m_nview) || !m_nview.IsValid())
		{
			return "";
		}
		if (!IsPositionToInteract())
		{
			return "";
		}
		if (!InUseDistance((Humanoid)(object)Player.m_localPlayer))
		{
			return Localization.instance.Localize("<color=#888888>$piece_toofar</color>");
		}
		if (LongshipUpgrades.onlyCreatorUpgrades.Value && (Object)(object)m_piece != (Object)null && !m_piece.IsCreator())
		{
			return Localization.instance.Localize("<color=#888888>$piece_noaccess</color>");
		}
		if (m_checkGuardStone && !PrivateArea.CheckAccess(((Component)this).transform.position, 0f, false, false))
		{
			return Localization.instance.Localize(m_name + "\n$piece_noaccess");
		}
		ZDO zDO = m_nview.GetZDO();
		UpgradeRequirements[] upgradeRequirements = m_upgradeRequirements;
		foreach (UpgradeRequirements upgradeRequirements2 in upgradeRequirements)
		{
			if (upgradeRequirements2.FillUpgradeHover(zDO, m_name))
			{
				return Localization.instance.Localize(sb.ToString());
			}
		}
		if (m_zdoPartVariant != 0 && m_variants > 1)
		{
			sb.Clear();
			sb.Append(m_name);
			sb.Append("\n[<color=yellow><b>$KEY_Use</b></color>] ");
			sb.Append(m_messageSwitch);
			return Localization.instance.Localize(sb.ToString());
		}
		if (m_zdoPartDisabled != 0)
		{
			sb.Clear();
			sb.Append(m_name);
			sb.Append("\n[<color=yellow><b>$KEY_Use</b></color>] ");
			sb.Append(zDO.GetBool(m_zdoPartDisabled, false) ? m_messageEnable : m_messageDisable);
			return Localization.instance.Localize(sb.ToString());
		}
		return "";
	}

	public string GetHoverName()
	{
		return m_name;
	}

	public float GetHoverOffset()
	{
		return m_hoverOffset;
	}

	public bool Interact(Humanoid human, bool hold, bool alt)
	{
		//IL_0055: Unknown result type (might be due to invalid IL or missing references)
		//IL_010c: Unknown result type (might be due to invalid IL or missing references)
		//IL_01a3: Unknown result type (might be due to invalid IL or missing references)
		//IL_01a8: Unknown result type (might be due to invalid IL or missing references)
		//IL_0234: Unknown result type (might be due to invalid IL or missing references)
		//IL_0239: Unknown result type (might be due to invalid IL or missing references)
		if (hold)
		{
			return false;
		}
		if (LongshipUpgrades.onlyCreatorUpgrades.Value && (Object)(object)m_piece != (Object)null && !m_piece.IsCreator())
		{
			return false;
		}
		if (m_checkGuardStone && !PrivateArea.CheckAccess(((Component)this).transform.position, 0f, true, false))
		{
			return false;
		}
		if (!InUseDistance(human))
		{
			return false;
		}
		if (!Object.op_Implicit((Object)(object)m_nview) || !m_nview.IsValid())
		{
			return false;
		}
		if (!IsPositionToInteract())
		{
			return false;
		}
		Player player = (Player)(object)((human is Player) ? human : null);
		ZDO zDO = m_nview.GetZDO();
		UpgradeRequirements[] upgradeRequirements = m_upgradeRequirements;
		foreach (UpgradeRequirements upgradeRequirements2 in upgradeRequirements)
		{
			if (upgradeRequirements2.CheckConsume(m_nview, player, ((Component)this).transform.position, out var result))
			{
				return result;
			}
		}
		if (m_zdoPartVariant != 0 && m_variants > 1)
		{
			m_nview.InvokeRPC("SetVariant", new object[4]
			{
				m_zdoPartVariant,
				(zDO.GetInt(m_zdoPartVariant, 0) + 1) % m_variants,
				m_switchEffects,
				((object)((Component)this).transform.position/*cast due to constrained. prefix*/).ToString()
			});
			return true;
		}
		if (m_zdoPartDisabled == 0)
		{
			return false;
		}
		bool flag = !zDO.GetBool(m_zdoPartDisabled, false);
		m_nview.InvokeRPC("SetActive", new object[4]
		{
			m_zdoPartDisabled,
			flag,
			flag ? m_disableEffects : m_enableEffects,
			((object)((Component)this).transform.position/*cast due to constrained. prefix*/).ToString()
		});
		return true;
	}

	public bool UseItem(Humanoid user, ItemData item)
	{
		return false;
	}

	public bool InUseDistance(Humanoid human)
	{
		//IL_0014: Unknown result type (might be due to invalid IL or missing references)
		//IL_001f: Unknown result type (might be due to invalid IL or missing references)
		return m_useDistance == 0f || Vector3.Distance(((Component)human).transform.position, ((Component)this).transform.position) < m_useDistance;
	}

	public void AddUpgradeRequirement(int zdoVar, string message, Requirement[] requirements, string station, int level, int range)
	{
		if (zdoVar != 0)
		{
			m_upgradeRequirements = CollectionExtensions.AddItem<UpgradeRequirements>((IEnumerable<UpgradeRequirements>)m_upgradeRequirements, new UpgradeRequirements(zdoVar, message, requirements, station, level, range)).ToArray();
		}
	}

	public void AddSpentUpgrades(Dictionary<int, Requirement[]> upgradeReqs)
	{
		ZDO zDO = m_nview.GetZDO();
		UpgradeRequirements[] upgradeRequirements = m_upgradeRequirements;
		foreach (UpgradeRequirements upgradeRequirements2 in upgradeRequirements)
		{
			upgradeRequirements2.AddSpentUpgrades(zDO, upgradeReqs);
		}
	}

	private bool IsPositionToInteract()
	{
		//IL_001c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0026: Unknown result type (might be due to invalid IL or missing references)
		//IL_002b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0036: Unknown result type (might be due to invalid IL or missing references)
		//IL_0045: Unknown result type (might be due to invalid IL or missing references)
		//IL_004a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0061: Unknown result type (might be due to invalid IL or missing references)
		//IL_0070: Unknown result type (might be due to invalid IL or missing references)
		//IL_0075: Unknown result type (might be due to invalid IL or missing references)
		//IL_0080: Unknown result type (might be due to invalid IL or missing references)
		//IL_008f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0094: Unknown result type (might be due to invalid IL or missing references)
		return (Object)(object)Ship.GetLocalShip() == (Object)(object)m_ship && Vector3.Dot(((Component)this).transform.position - ((Character)Player.m_localPlayer).GetEyePoint(), ((Component)this).transform.position - ((Component)Utils.GetMainCamera()).transform.position) > 0f && Vector3.Dot(((Component)this).transform.position - ((Component)Player.m_localPlayer).transform.position, ((Component)this).transform.position - ((Component)Utils.GetMainCamera()).transform.position) > 0f;
	}
}
