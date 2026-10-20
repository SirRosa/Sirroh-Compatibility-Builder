using System;
using System.Collections.Generic;
using System.Linq;
using HarmonyLib;
using UnityEngine;

namespace LongshipUpgrades;

public class LongshipCustomizableParts : MonoBehaviour
{
	public static bool prefabInit = false;

	private Ship m_ship;

	private ZNetView m_nview;

	private ZDO m_zdo;

	private Container m_container;

	private bool m_customMast;

	private WearNTear m_wnt;

	private GameObject m_beamMast;

	private GameObject m_beamTent;

	private GameObject m_beamMesh;

	private GameObject m_beamTentCollider;

	private GameObject m_beamSailCollider;

	private GameObject m_insects;

	private GameObject m_tent;

	private GameObject m_lantern;

	private GameObject m_holdersRight;

	private GameObject m_holdersLeft;

	private GameObject m_mastUpgrade;

	private GameObject m_storageUpgrade;

	private GameObject m_healthUpgrade;

	private GameObject m_shieldsStyles;

	private GameObject m_headStyles;

	private GameObject m_turrets;

	private GameObject m_turretsUpgrade;

	private GameObject m_itemstandObject;

	private GameObject m_wispUpgrade;

	private GameObject m_mapTableUpgrade;

	private GameObject m_mast;

	private GameObject m_ropes;

	private GameObject m_sail;

	private GameObject m_wisp;

	private GameObject m_mapTable;

	private MeshRenderer m_lampRenderer;

	private Light m_light;

	private ParticleSystem m_flare;

	private ShipTrophyStand m_trophyStand;

	private EffectArea m_fireWarmth;

	private GameObject[] m_containerPartsLvl1;

	private GameObject[] m_containerPartsLvl2;

	private GameObject[] m_protectiveParts;

	private GameObject[] m_heads;

	private bool m_containerUpgradedLvl1;

	private bool m_containerUpgradedLvl2;

	private bool m_healthUpgraded;

	private bool m_ashlandsUpgraded;

	private bool m_isLampLightDisabled;

	private int m_headStyle;

	private int m_shieldsStyle;

	private int m_tentStyle;

	private int m_sailStyle;

	private GameObject m_destroyedLootPrefab;

	public const string prefabName = "VikingShip";

	public const string turretName = "piece_turret";

	public const string moderBossStone = "BossStone_DragonQueen";

	public const string wisptorchName = "piece_groundtorch_mist";

	public const string mapTablePrefabName = "maptable";

	private static bool prefabInitialized = false;

	public static int prefabInt = StringExtensionMethods.GetStableHashCode("VikingShip");

	private static Shader shaderStandard;

	private static Material standSharedMaterial;

	private static Material storageSharedMaterial;

	private static Material plankSharedMaterial;

	private static GameObject s_lanternPrefab;

	private static GameObject s_turretPrefab;

	private static GameObject s_standBossDragonPrefab;

	private static GameObject s_wisptorchPrefab;

	private static GameObject s_mapTablePrefab;

	private static Color flareColor;

	private static bool isNightTime;

	private static bool isTimeToLight = true;

	public static readonly int s_mastUpgraded = StringExtensionMethods.GetStableHashCode("MastUpgraded");

	public static readonly int s_mastRemoved = StringExtensionMethods.GetStableHashCode("MastRemoved");

	public static readonly int s_lanternUpgraded = StringExtensionMethods.GetStableHashCode("LanternUpgraded");

	public static readonly int s_lanternDisabled = StringExtensionMethods.GetStableHashCode("LanternDisabled");

	public static readonly int s_tentUpgraded = StringExtensionMethods.GetStableHashCode("TentUpgraded");

	public static readonly int s_tentDisabled = StringExtensionMethods.GetStableHashCode("TentDisabled");

	public static readonly int s_lightsDisabled = StringExtensionMethods.GetStableHashCode("LightDisabled");

	public static readonly int s_wispUpgraded = StringExtensionMethods.GetStableHashCode("WispUpgraded");

	public static readonly int s_wispRemoved = StringExtensionMethods.GetStableHashCode("WispRemoved");

	public static readonly int s_mapTableUpgraded = StringExtensionMethods.GetStableHashCode("MapTableUpgraded");

	public static readonly int s_mapDataCompressed = StringExtensionMethods.GetStableHashCode("MapDataCompressed");

	public static readonly int s_containerUpgradedLvl1 = StringExtensionMethods.GetStableHashCode("ContainerUpgradedLvl1");

	public static readonly int s_containerUpgradedLvl2 = StringExtensionMethods.GetStableHashCode("ContainerUpgradedLvl2");

	public static readonly int s_healthUpgraded = StringExtensionMethods.GetStableHashCode("HealthUpgraded");

	public static readonly int s_ashlandsUpgraded = StringExtensionMethods.GetStableHashCode("AshlandsUpgraded");

	public static readonly int s_turretsUpgraded = StringExtensionMethods.GetStableHashCode("TurretsUpgraded");

	public static readonly int s_turretsDisabled = StringExtensionMethods.GetStableHashCode("TurretsDisabled");

	public static readonly int s_headStyle = StringExtensionMethods.GetStableHashCode("HeadStyle");

	public static readonly int s_shieldsStyle = StringExtensionMethods.GetStableHashCode("ShieldsStyle");

	public static readonly int s_tentStyle = StringExtensionMethods.GetStableHashCode("TentStyle");

	public static readonly int s_sailStyle = StringExtensionMethods.GetStableHashCode("SailStyle");

	public bool blocksIsDirty;

	public readonly Dictionary<Renderer, MaterialPropertyBlock> s_propertyBlocks = new Dictionary<Renderer, MaterialPropertyBlock>();

	public static Texture2D s_ashlandsHull = new Texture2D(2, 2);

	public static Texture2D s_ashlandsHullDamaged = new Texture2D(2, 2);

	public const int piece_nonsolid = 16;

	public const int vehicle = 28;

	public static List<Texture2D> customTents = new List<Texture2D>();

	public static List<Texture2D> customSails = new List<Texture2D>();

	public static List<Texture2D> customShields = new List<Texture2D>();

	private static readonly Dictionary<string, EffectList> buildEffects = new Dictionary<string, EffectList>();

	public static EffectList partEffects = new EffectList();

	public const int fabricSwitch = 0;

	public const int woodSwitch = 1;

	public const int lampEnable = 2;

	public const int lampDisable = 3;

	public const int turretsEnable = 4;

	public const int turretsDisable = 5;

	public const int wisptorchEnable = 6;

	private static readonly Dictionary<GameObject, LongshipCustomizableParts> s_allInstances = new Dictionary<GameObject, LongshipCustomizableParts>();

	private static readonly List<DamageModPair> s_fireResistantModifiers = new List<DamageModPair>
	{
		new DamageModPair
		{
			m_type = (DamageType)32,
			m_modifier = (DamageModifier)5
		}
	};

	private static readonly int s_shipMapDataRevision = StringExtensionMethods.GetStableHashCode("ShipMapDataRevision");

	private float m_nextShipMapDataRequestTime;

	private int m_lastRequestedShipMapRevision;

	private void Awake()
	{
		if (prefabInit)
		{
			return;
		}
		m_ship = ((Component)this).GetComponent<Ship>();
		m_wnt = ((Component)this).GetComponent<WearNTear>();
		m_nview = ((Component)this).GetComponent<ZNetView>();
		ZNetView nview = m_nview;
		m_zdo = ((nview != null) ? nview.GetZDO() : null);
		((Behaviour)this).enabled = m_nview.IsValid();
		if (((Behaviour)this).enabled)
		{
			m_nview.Register<int, int, int, string>("SetVariant", (Method<int, int, int, string>)RPC_SetVariant);
			m_nview.Register<int, bool, int, string>("SetActive", (Method<int, bool, int, string>)RPC_SetActive);
			m_nview.Register<int, string, string>("SetBuilt", (Action<long, int, string, string>)RPC_SetBuilt);
		}
		m_lastRequestedShipMapRevision = 0;
		m_container = (from container in ((Component)this).GetComponentsInChildren<Container>()
			where ((Object)((Component)container).gameObject).name == "piece_chest"
			select container).FirstOrDefault();
		m_destroyedLootPrefab = m_container?.m_destroyedLootPrefab;
		if (Object.op_Implicit((Object)(object)m_wnt))
		{
			m_wnt.m_onDestroyed = (Action)Delegate.Combine(m_wnt.m_onDestroyed, new Action(OnDestroyed));
		}
		if (buildEffects.Count == 0)
		{
			ObjectDB instance = ObjectDB.instance;
			if (instance != null)
			{
				CollectionExtensions.Do<Recipe>(instance.m_recipes.Where((Recipe recipe) => (Object)(object)recipe.m_craftingStation != (Object)null && recipe.m_craftingStation.m_craftItemEffects.HasEffects()), (Action<Recipe>)((Recipe recipe) =>
				{
					buildEffects[recipe.m_craftingStation.m_name] = recipe.m_craftingStation.m_craftItemEffects;
				}));
			}
		}
		CheckEffects();
		GetHildirMapTable();
		s_allInstances.Add(((Component)this).gameObject, this);
	}

	private void Start()
	{
		if (!prefabInit)
		{
			InitializeParts();
		}
	}

	private void OnDisable()
	{
		UpdateFireWarmth(heatActive: false);
	}

	public void OnDestroy()
	{
		if (!prefabInit)
		{
			UpdateFireWarmth(heatActive: false);
			s_allInstances.Remove(((Component)this).gameObject);
		}
	}

	private void FixedUpdate()
	{
		//IL_0505: Unknown result type (might be due to invalid IL or missing references)
		//IL_0539: Unknown result type (might be due to invalid IL or missing references)
		//IL_056d: Unknown result type (might be due to invalid IL or missing references)
		//IL_05a1: Unknown result type (might be due to invalid IL or missing references)
		if (prefabInit)
		{
			return;
		}
		if (m_zdo == null || !Object.op_Implicit((Object)(object)m_ship))
		{
			UpdateFireWarmth(heatActive: false);
			return;
		}
		RequestMissingShipMapData();
		m_customMast = LongshipUpgrades.mastEnabled.Value && m_zdo.GetBool(s_mastUpgraded, false);
		GameObject mastUpgrade = m_mastUpgrade;
		if (mastUpgrade != null)
		{
			mastUpgrade.SetActive((LongshipUpgrades.mastEnabled.Value && !m_customMast) || LongshipUpgrades.mastRemovable.Value);
		}
		GameObject mast = m_mast;
		if (mast != null)
		{
			mast.SetActive(!m_zdo.GetBool(s_mastRemoved, false));
		}
		GameObject ropes = m_ropes;
		if (ropes != null)
		{
			ropes.SetActive(m_mast.activeSelf);
		}
		GameObject wisp = m_wisp;
		if (wisp != null)
		{
			wisp.SetActive(LongshipUpgrades.wispEnabled.Value && m_mast.activeSelf && m_zdo.GetBool(s_wispUpgraded, false) && !m_zdo.GetBool(s_wispRemoved, false));
		}
		GameObject mapTable = m_mapTable;
		if (mapTable != null)
		{
			mapTable.SetActive(LongshipUpgrades.mapTableEnabled.Value && m_zdo.GetBool(s_mapTableUpgraded, false));
		}
		GameObject beamTent = m_beamTent;
		if (beamTent != null)
		{
			beamTent.SetActive(m_customMast && (LongshipUpgrades.lanternEnabled.Value || LongshipUpgrades.tentEnabled.Value));
		}
		GameObject beamMast = m_beamMast;
		if (beamMast != null)
		{
			beamMast.SetActive(!m_mast.activeSelf && (Object)(object)m_beamTent != (Object)null && m_beamTent.activeInHierarchy);
		}
		GameObject beamSailCollider = m_beamSailCollider;
		if (beamSailCollider != null)
		{
			beamSailCollider.SetActive((!Object.op_Implicit((Object)(object)m_beamMast) || !m_beamMast.activeSelf) && m_mast.activeSelf);
		}
		GameObject wispUpgrade = m_wispUpgrade;
		if (wispUpgrade != null)
		{
			wispUpgrade.SetActive(LongshipUpgrades.wispEnabled.Value && m_mast.activeSelf);
		}
		GameObject mapTableUpgrade = m_mapTableUpgrade;
		if (mapTableUpgrade != null)
		{
			mapTableUpgrade.SetActive(LongshipUpgrades.mapTableEnabled.Value && !m_mapTable.activeSelf);
		}
		GameObject tent = m_tent;
		if (tent != null)
		{
			tent.SetActive(m_customMast && LongshipUpgrades.tentEnabled.Value && m_zdo.GetBool(s_tentUpgraded, false) && !m_zdo.GetBool(s_tentDisabled, false));
		}
		GameObject lantern = m_lantern;
		if (lantern != null)
		{
			lantern.SetActive(LongshipUpgrades.lanternEnabled.Value && m_customMast && m_zdo.GetBool(s_lanternUpgraded, false) && !m_zdo.GetBool(s_lanternDisabled, false));
		}
		GameObject holdersRight = m_holdersRight;
		if (holdersRight != null)
		{
			holdersRight.SetActive(IsTentActive());
		}
		GameObject holdersLeft = m_holdersLeft;
		if (holdersLeft != null)
		{
			holdersLeft.SetActive(IsTentActive());
		}
		UpdateFireWarmth(LongshipUpgrades.tentHeat.Value && Object.op_Implicit((Object)(object)m_lantern) && m_lantern.activeInHierarchy && IsTentActive());
		GameObject turretsUpgrade = m_turretsUpgrade;
		if (turretsUpgrade != null)
		{
			turretsUpgrade.SetActive(LongshipUpgrades.turretsEnabled.Value);
		}
		GameObject turrets = m_turrets;
		if (turrets != null)
		{
			turrets.SetActive(LongshipUpgrades.turretsEnabled.Value && m_zdo.GetBool(s_turretsUpgraded, false));
		}
		GameObject itemstandObject = m_itemstandObject;
		if (itemstandObject != null)
		{
			itemstandObject.SetActive(LongshipUpgrades.itemStandEnabled.Value);
		}
		bool flag = false;
		if ((Object)(object)m_light != (Object)null && Object.op_Implicit((Object)(object)m_lantern) && m_lantern.activeInHierarchy && (m_isLampLightDisabled != m_zdo.GetBool(s_lightsDisabled, false) || (flag = isTimeToLight != IsTimeToLight()) || isNightTime != IsNightTime()))
		{
			isNightTime = IsNightTime();
			isTimeToLight = IsTimeToLight();
			if ((LongshipUpgrades.lanternAutoSwtich.Value & flag) && m_nview.IsValid() && m_nview.IsOwner())
			{
				m_zdo.Set(s_lightsDisabled, !isTimeToLight);
			}
			m_isLampLightDisabled = m_zdo.GetBool(s_lightsDisabled, false);
			UpdateLights();
		}
		if (Object.op_Implicit((Object)(object)m_beamMesh))
		{
			m_beamMesh.transform.localPosition = new Vector3(0f, 0f, IsTentActive() ? 0f : (-0.9f));
			m_beamMesh.transform.localScale = new Vector3(1f, 1f, IsTentActive() ? 1f : 0.5f);
			m_beamTentCollider.transform.localPosition = new Vector3(0f, 1.58f, IsTentActive() ? 0.23f : (-0.49f));
			m_beamTentCollider.transform.localScale = new Vector3(0.16f, 0.16f, IsTentActive() ? 2.05f : 0.6f);
		}
		if (LongshipUpgrades.containerEnabled.Value && Object.op_Implicit((Object)(object)m_storageUpgrade) && m_containerUpgradedLvl2 != m_zdo.GetBool(s_containerUpgradedLvl2, false))
		{
			m_containerUpgradedLvl2 = m_zdo.GetBool(s_containerUpgradedLvl2, false);
			GameObject[] containerPartsLvl = m_containerPartsLvl2;
			if (containerPartsLvl != null)
			{
				CollectionExtensions.Do<GameObject>((IEnumerable<GameObject>)containerPartsLvl, (Action<GameObject>)((GameObject part) =>
				{
					if (part != null)
					{
						part.SetActive(m_containerUpgradedLvl2);
					}
				}));
			}
			if (m_containerUpgradedLvl2 && m_container.m_height < LongshipUpgrades.containerHeight.Value)
			{
				string name = ((object)m_container).GetType().Name;
				m_zdo.Set("HasFields", true);
				m_zdo.Set(StringExtensionMethods.GetStableHashCode("HasFields" + name), true);
				m_zdo.Set(name + ".m_height", LongshipUpgrades.containerHeight.Value);
				m_container.m_height = LongshipUpgrades.containerHeight.Value;
			}
			if (m_containerUpgradedLvl2 && m_container.GetInventory().GetHeight() < LongshipUpgrades.containerHeight.Value)
			{
				string name2 = ((object)m_container.GetInventory()).GetType().Name;
				m_zdo.Set("HasFields", true);
				m_zdo.Set(StringExtensionMethods.GetStableHashCode("HasFields" + name2), true);
				m_zdo.Set(name2 + ".m_height", LongshipUpgrades.containerHeight.Value);
				m_container.GetInventory().m_height = LongshipUpgrades.containerHeight.Value;
			}
		}
		if (LongshipUpgrades.containerEnabled.Value && Object.op_Implicit((Object)(object)m_storageUpgrade) && m_containerUpgradedLvl1 != m_zdo.GetBool(s_containerUpgradedLvl1, false))
		{
			m_containerUpgradedLvl1 = m_zdo.GetBool(s_containerUpgradedLvl1, false);
			GameObject[] containerPartsLvl2 = m_containerPartsLvl1;
			if (containerPartsLvl2 != null)
			{
				CollectionExtensions.Do<GameObject>((IEnumerable<GameObject>)containerPartsLvl2, (Action<GameObject>)((GameObject part) =>
				{
					if (part != null)
					{
						part.SetActive(m_containerUpgradedLvl1);
					}
				}));
			}
			if (m_containerUpgradedLvl1 && m_container.m_width < LongshipUpgrades.containerWidth.Value)
			{
				m_container.m_width = LongshipUpgrades.containerWidth.Value;
				string name3 = ((object)m_container).GetType().Name;
				m_zdo.Set("HasFields", true);
				m_zdo.Set(StringExtensionMethods.GetStableHashCode("HasFields" + name3), true);
				m_zdo.Set(name3 + ".m_width", LongshipUpgrades.containerWidth.Value);
			}
			if (m_containerUpgradedLvl1 && m_container.GetInventory().GetWidth() < LongshipUpgrades.containerWidth.Value)
			{
				m_container.GetInventory().m_width = LongshipUpgrades.containerWidth.Value;
				string name4 = ((object)m_container.GetInventory()).GetType().Name;
				m_zdo.Set("HasFields", true);
				m_zdo.Set(StringExtensionMethods.GetStableHashCode("HasFields" + name4), true);
				m_zdo.Set(name4 + ".m_width", LongshipUpgrades.containerWidth.Value);
			}
		}
		GameObject storageUpgrade = m_storageUpgrade;
		if (storageUpgrade != null)
		{
			storageUpgrade.SetActive(LongshipUpgrades.containerEnabled.Value && !m_containerUpgradedLvl2);
		}
		bool flag2 = false;
		if (LongshipUpgrades.healthEnabled.Value && m_protectiveParts != null && Object.op_Implicit((Object)(object)m_wnt) && m_healthUpgraded != m_zdo.GetBool(s_healthUpgraded, false))
		{
			m_healthUpgraded = m_zdo.GetBool(s_healthUpgraded, false);
			CollectionExtensions.Do<GameObject>((IEnumerable<GameObject>)m_protectiveParts, (Action<GameObject>)((GameObject part) =>
			{
				if (part != null)
				{
					part.SetActive(m_healthUpgraded);
				}
			}));
			if (m_healthUpgraded && m_wnt.m_health < (float)LongshipUpgrades.healthUpgradeLvl1.Value)
			{
				m_wnt.m_health = LongshipUpgrades.healthUpgradeLvl1.Value;
				flag2 = true;
			}
		}
		if (LongshipUpgrades.healthEnabled.Value && Object.op_Implicit((Object)(object)m_wnt))
		{
			if (m_ashlandsUpgraded != (m_ashlandsUpgraded = m_zdo.GetBool(s_ashlandsUpgraded, false)))
			{
				if (m_ashlandsUpgraded && LongshipUpgrades.healthUpgradeLvl2.Value > 0 && m_wnt.m_health < (float)LongshipUpgrades.healthUpgradeLvl2.Value)
				{
					m_wnt.m_health = LongshipUpgrades.healthUpgradeLvl2.Value;
					flag2 = true;
				}
				string name5 = ((object)m_ship).GetType().Name;
				m_zdo.Set("HasFields", true);
				m_zdo.Set(StringExtensionMethods.GetStableHashCode("HasFields" + name5), true);
				m_zdo.Set(name5 + ".m_ashlandsReady", true);
				name5 = ((object)m_wnt).GetType().Name;
				m_zdo.Set(StringExtensionMethods.GetStableHashCode("HasFields" + name5), true);
				m_zdo.Set(name5 + ".m_ashDamageResist", true);
				m_zdo.Set(name5 + ".m_burnable", false);
				UpdateHullPropertyBlocks();
			}
			if (m_ashlandsUpgraded && LongshipUpgrades.ashlandsProtection.Value)
			{
				m_ship.m_ashlandsReady = true;
				m_ship.m_ashlandsDmgTimer = 0f;
				if (m_ship.m_ashdamageEffects.activeSelf)
				{
					m_ship.m_ashdamageEffects.SetActive(false);
					CollectionExtensions.Do<AudioSource>((IEnumerable<AudioSource>)m_ship.m_ashlandsFxAudio, (Action<AudioSource>)((AudioSource item) =>
					{
						item.Stop();
					}));
				}
				if (!m_wnt.m_ashDamageResist)
				{
					m_wnt.m_ashDamageResist = true;
					m_wnt.m_burnable = false;
					m_wnt.m_damages.Apply(s_fireResistantModifiers);
				}
			}
		}
		if (flag2 && m_nview.IsValid() && m_nview.IsOwner())
		{
			m_nview.InvokeRPC(ZNetView.Everybody, "RPC_HealthChanged", new object[1] { m_nview.GetZDO().GetFloat(ZDOVars.s_health, m_wnt.m_health) });
		}
		GameObject healthUpgrade = m_healthUpgrade;
		if (healthUpgrade != null)
		{
			healthUpgrade.SetActive(LongshipUpgrades.healthEnabled.Value && !m_ashlandsUpgraded);
		}
		if (LongshipUpgrades.changeShields.Value && LongshipUpgrades.healthEnabled.Value && m_protectiveParts != null && m_healthUpgraded && m_shieldsStyle != m_zdo.GetInt(s_shieldsStyle, 0))
		{
			m_shieldsStyle = m_zdo.GetInt(s_shieldsStyle, 0);
			if (LongshipUpgrades.maxShields.Value != 0 && m_shieldsStyle > LongshipUpgrades.maxShields.Value && m_nview.IsValid() && m_nview.IsOwner())
			{
				m_shieldsStyle %= LongshipUpgrades.maxShields.Value;
				m_zdo.Set(s_shieldsStyle, m_shieldsStyle, false);
			}
			UpdateShieldsPropertyBlocks();
		}
		GameObject shieldsStyles = m_shieldsStyles;
		if (shieldsStyles != null)
		{
			shieldsStyles.SetActive(m_healthUpgraded);
		}
		if (LongshipUpgrades.changeTent.Value && IsTentActive() && m_tentStyle != m_zdo.GetInt(s_tentStyle, 0))
		{
			m_tentStyle = m_zdo.GetInt(s_tentStyle, 0);
			UpdateTentPropertyBlocks();
		}
		if (LongshipUpgrades.changeSail.Value && (Object)(object)m_sail != (Object)null && m_sail.activeInHierarchy && m_sailStyle != m_zdo.GetInt(s_sailStyle, 0))
		{
			m_sailStyle = m_zdo.GetInt(s_sailStyle, 0);
			UpdateSailPropertyBlocks();
		}
		if (LongshipUpgrades.changeHead.Value && m_heads != null && Object.op_Implicit((Object)(object)m_wnt) && m_headStyle != m_zdo.GetInt(s_headStyle, 0))
		{
			m_headStyle = m_zdo.GetInt(s_headStyle, 0);
			for (int num = 0; num < m_heads.Length; num++)
			{
				m_heads[num].SetActive(m_headStyle == num + 1);
			}
			GameObject[] array = new GameObject[3]
			{
				((Component)m_wnt.m_new.transform.Find("skull_head")).gameObject,
				((Component)m_wnt.m_worn.transform.Find("skull_head")).gameObject,
				((Component)m_wnt.m_broken.transform.Find("skull_head")).gameObject
			};
			foreach (GameObject val in array)
			{
				val.SetActive(m_headStyle == 0);
			}
		}
		GameObject headStyles = m_headStyles;
		if (headStyles != null)
		{
			headStyles.SetActive(LongshipUpgrades.changeHead.Value);
		}
		SetPropertyBlocks();
	}

	private void UpdateFireWarmth(bool heatActive)
	{
		//IL_0060: Unknown result type (might be due to invalid IL or missing references)
		if (!Object.op_Implicit((Object)(object)m_fireWarmth))
		{
			return;
		}
		Collider collider = m_fireWarmth.m_collider;
		heatActive = heatActive && ((Behaviour)m_fireWarmth).isActiveAndEnabled && Object.op_Implicit((Object)(object)collider) && collider.enabled;
		m_fireWarmth.m_isHeatType = heatActive;
		m_fireWarmth.m_type = (Type)(heatActive ? 3 : 0);
		List<Character> collidedWithCharacter = m_fireWarmth.m_collidedWithCharacter;
		if (!heatActive)
		{
			collidedWithCharacter.Clear();
			return;
		}
		for (int num = collidedWithCharacter.Count - 1; num >= 0; num--)
		{
			if (!IsInsideFireWarmth(collidedWithCharacter[num], collider))
			{
				collidedWithCharacter.RemoveAt(num);
			}
		}
		Player localPlayer = Player.m_localPlayer;
		if (Object.op_Implicit((Object)(object)localPlayer) && !collidedWithCharacter.Contains((Character)(object)localPlayer) && IsInsideFireWarmth((Character)(object)localPlayer, collider))
		{
			collidedWithCharacter.Add((Character)(object)localPlayer);
		}
	}

	private static bool IsInsideFireWarmth(Character character, Collider areaCollider)
	{
		//IL_0087: Unknown result type (might be due to invalid IL or missing references)
		//IL_008c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0091: Unknown result type (might be due to invalid IL or missing references)
		//IL_00b9: Unknown result type (might be due to invalid IL or missing references)
		//IL_00bf: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c6: Unknown result type (might be due to invalid IL or missing references)
		//IL_00cc: Unknown result type (might be due to invalid IL or missing references)
		if (!Object.op_Implicit((Object)(object)character) || !((Behaviour)character).isActiveAndEnabled || !character.IsPlayer() || character.IsDead() || !Object.op_Implicit((Object)(object)character.m_nview) || !character.m_nview.IsValid() || !character.IsOwner())
		{
			return false;
		}
		CapsuleCollider collider = character.GetCollider();
		if (!Object.op_Implicit((Object)(object)collider) || !((Collider)collider).enabled || !((Component)collider).gameObject.activeInHierarchy)
		{
			return false;
		}
		Bounds bounds = areaCollider.bounds;
		if (!bounds.Intersects(((Collider)collider).bounds))
		{
			return false;
		}
		Transform transform = ((Component)areaCollider).transform;
		Transform transform2 = ((Component)collider).transform;
		Vector3 val = default;
		float num = default;
		return Physics.ComputePenetration(areaCollider, transform.position, transform.rotation, (Collider)(object)collider, transform2.position, transform2.rotation, ref val, ref num);
	}

	public void RPC_SetVariant(long uid, int zdoVar, int variant, int effectVariant, string position)
	{
		//IL_0037: Unknown result type (might be due to invalid IL or missing references)
		//IL_003c: Unknown result type (might be due to invalid IL or missing references)
		//IL_004b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0051: Unknown result type (might be due to invalid IL or missing references)
		if (m_nview.IsValid() && m_nview.IsOwner())
		{
			m_zdo.Set(zdoVar, variant, false);
			partEffects.Create(ParseVector3(position), Quaternion.identity, (Transform)null, 1f, effectVariant, default(ZDOID));
		}
	}

	public void RPC_SetActive(long uid, int zdoVar, bool active, int effectVariant, string position)
	{
		//IL_0036: Unknown result type (might be due to invalid IL or missing references)
		//IL_003b: Unknown result type (might be due to invalid IL or missing references)
		//IL_004a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0050: Unknown result type (might be due to invalid IL or missing references)
		if (m_nview.IsValid() && m_nview.IsOwner())
		{
			m_zdo.Set(zdoVar, active);
			partEffects.Create(ParseVector3(position), Quaternion.identity, (Transform)null, 1f, effectVariant, default(ZDOID));
		}
	}

	public void RPC_SetBuilt(long uid, int zdoVar, string stationName, string position)
	{
		//IL_0053: Unknown result type (might be due to invalid IL or missing references)
		//IL_0058: Unknown result type (might be due to invalid IL or missing references)
		//IL_0066: Unknown result type (might be due to invalid IL or missing references)
		//IL_006c: Unknown result type (might be due to invalid IL or missing references)
		if (m_nview.IsValid() && m_nview.IsOwner())
		{
			m_zdo.Set(zdoVar, true);
			if (!string.IsNullOrWhiteSpace(stationName) && buildEffects.TryGetValue(stationName, out var value) && value != null)
			{
				value.Create(ParseVector3(position), Quaternion.identity, (Transform)null, 1f, -1, default(ZDOID));
			}
		}
	}

	private void RequestMissingShipMapData()
	{
		//IL_007a: Unknown result type (might be due to invalid IL or missing references)
		if (!LongshipUpgrades.ShipMapsEnabled || !m_zdo.GetBool(s_mapTableUpgraded, false) || !m_zdo.GetBool(s_mapDataCompressed, false))
		{
			m_lastRequestedShipMapRevision = 0;
			m_nextShipMapDataRequestTime = 0f;
			return;
		}
		int num = m_zdo.GetInt(s_shipMapDataRevision, 0);
		if (num > 0)
		{
			if (LongshipUpgrades.TryGetShipMapData(m_zdo.m_uid, out var entry) && entry.Data != null && entry.Revision >= num)
			{
				m_lastRequestedShipMapRevision = 0;
			}
			else if (!(Time.time < m_nextShipMapDataRequestTime) || m_lastRequestedShipMapRevision != num)
			{
				m_lastRequestedShipMapRevision = num;
				m_nextShipMapDataRequestTime = Time.time + 2f;
				LongshipUpgrades.RequestShipMapDataFromServer(m_zdo, num);
			}
		}
	}

	private void UpdateSailPropertyBlocks()
	{
		GameObject sail = m_sail;
		Renderer val = ((sail != null) ? sail.GetComponentInChildren<Renderer>() : null);
		if (!((Object)(object)val == (Object)null))
		{
			if (m_sailStyle == 0 || customSails.Count == 0)
			{
				ResetPropertyBlock(val);
			}
			else
			{
				SetPropertyBlock(val, ShaderProps._MainTex, customSails[(m_sailStyle - 1) % ((LongshipUpgrades.maxSails.Value == 0) ? customSails.Count : Math.Min(LongshipUpgrades.maxSails.Value, customSails.Count))]);
			}
		}
	}

	private void UpdateTentPropertyBlocks()
	{
		GameObject tent = m_tent;
		Renderer val = ((tent != null) ? tent.GetComponentInChildren<Renderer>() : null);
		if (!((Object)(object)val == (Object)null))
		{
			if (m_tentStyle == 0 || customTents.Count == 0)
			{
				ResetPropertyBlock(val);
			}
			else
			{
				SetPropertyBlock(val, ShaderProps._MainTex, customTents[(m_tentStyle - 1) % ((LongshipUpgrades.maxTents.Value == 0) ? customTents.Count : Math.Min(LongshipUpgrades.maxTents.Value, customTents.Count))]);
			}
		}
	}

	private void UpdateHullPropertyBlocks()
	{
		if (!m_ashlandsUpgraded || LongshipUpgrades.healthUpgradeLvl2.Value <= 0 || !LongshipUpgrades.ashlandsProtection.Value)
		{
			return;
		}
		foreach (Renderer item in new List<Renderer>
		{
			((Component)m_wnt.m_new.transform.Find("hull")).gameObject.GetComponent<Renderer>(),
			((Component)m_wnt.m_new.transform.Find("skull_head")).gameObject.GetComponent<Renderer>()
		})
		{
			SetPropertyBlock(item, ShaderProps._MainTex, s_ashlandsHull);
		}
		foreach (Renderer item2 in new List<Renderer>
		{
			((Component)m_wnt.m_worn.transform.Find("hull")).gameObject.GetComponent<Renderer>(),
			((Component)m_wnt.m_broken.transform.Find("hull")).gameObject.GetComponent<Renderer>(),
			((Component)m_wnt.m_worn.transform.Find("skull_head")).gameObject.GetComponent<Renderer>(),
			((Component)m_wnt.m_broken.transform.Find("skull_head")).gameObject.GetComponent<Renderer>()
		})
		{
			SetPropertyBlock(item2, ShaderProps._MainTex, s_ashlandsHullDamaged);
		}
		if (m_heads == null)
		{
			return;
		}
		foreach (Renderer item3 in m_heads.Select((GameObject head) => head.GetComponent<Renderer>()))
		{
			SetPropertyBlock(item3, ShaderProps._MainTex, s_ashlandsHull);
		}
	}

	private void UpdateShieldsPropertyBlocks()
	{
		if (!LongshipUpgrades.changeShields.Value || !LongshipUpgrades.healthEnabled.Value || m_protectiveParts == null || !m_healthUpgraded)
		{
			return;
		}
		int style = ((m_shieldsStyle > 3) ? ((m_shieldsStyle - 1) % 3 + 1) : m_shieldsStyle);
		int num = ((m_shieldsStyle > 3) ? ((m_shieldsStyle - 4) / 3) : (-1));
		foreach (Renderer item in m_protectiveParts.Select((GameObject head) => head.GetComponent<Renderer>()))
		{
			ResetPropertyBlock(item);
			SetPropertyBlock(item, ShaderProps._Style, style);
			if (-1 < num && num < customShields.Count)
			{
				SetPropertyBlock(item, LongshipPropertyBlocks._StyleTex, customShields[num]);
			}
		}
	}

	private void UpdatePropertyBlocks()
	{
		CollectionExtensions.Do<Renderer>((IEnumerable<Renderer>)s_propertyBlocks.Keys, (Action<Renderer>)((Renderer renderer) =>
		{
			renderer.SetPropertyBlock((MaterialPropertyBlock)null);
		}));
		s_propertyBlocks.Clear();
		UpdateHullPropertyBlocks();
		UpdateShieldsPropertyBlocks();
		UpdateTentPropertyBlocks();
		UpdateSailPropertyBlocks();
		SetPropertyBlocks();
	}

	private void UpdateLights()
	{
		//IL_006c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0071: Unknown result type (might be due to invalid IL or missing references)
		//IL_005b: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ae: Unknown result type (might be due to invalid IL or missing references)
		//IL_00b3: Unknown result type (might be due to invalid IL or missing references)
		//IL_00b6: Unknown result type (might be due to invalid IL or missing references)
		//IL_00bb: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c1: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c6: Unknown result type (might be due to invalid IL or missing references)
		//IL_0104: Unknown result type (might be due to invalid IL or missing references)
		//IL_00f7: Unknown result type (might be due to invalid IL or missing references)
		//IL_00fc: Unknown result type (might be due to invalid IL or missing references)
		//IL_00fd: Unknown result type (might be due to invalid IL or missing references)
		GameObject insects = m_insects;
		if (insects != null)
		{
			insects.SetActive(isNightTime && !m_isLampLightDisabled);
		}
		if (Object.op_Implicit((Object)(object)m_light))
		{
			((Component)m_light).gameObject.SetActive(!m_isLampLightDisabled);
			m_light.color = LongshipUpgrades.lanternLightColor.Value;
		}
		Color value = LongshipUpgrades.lanternLightColor.Value;
		value.a = 0f;
		if (Object.op_Implicit((Object)(object)m_flare))
		{
			((Component)m_flare).gameObject.SetActive(!m_isLampLightDisabled);
			MainModule main = m_flare.main;
			main.startColor = MinMaxGradient.op_Implicit(Color.Lerp(flareColor, value, 0.5f));
		}
		if (Object.op_Implicit((Object)(object)m_lampRenderer))
		{
			SetPropertyBlock((Renderer)(object)m_lampRenderer, ShaderProps._EmissionColor, m_isLampLightDisabled ? Color.grey : (Color.white + value));
		}
	}

	private void SetPropertyBlock(Renderer renderer, int nameID, Texture2D tex)
	{
		if (!((Object)(object)renderer == (Object)null))
		{
			GetPropertyBlock(renderer).SetTexture(nameID, (Texture)(object)tex);
		}
	}

	private void SetPropertyBlock(Renderer renderer, int nameID, int style)
	{
		if (!((Object)(object)renderer == (Object)null))
		{
			GetPropertyBlock(renderer).SetInt(nameID, style);
		}
	}

	private void SetPropertyBlock(Renderer renderer, int nameID, Color color)
	{
		//IL_0016: Unknown result type (might be due to invalid IL or missing references)
		if (!((Object)(object)renderer == (Object)null))
		{
			GetPropertyBlock(renderer).SetColor(nameID, color);
		}
	}

	private void ResetPropertyBlock(Renderer renderer)
	{
		if (s_propertyBlocks.ContainsKey(renderer))
		{
			renderer.SetPropertyBlock((MaterialPropertyBlock)null);
			s_propertyBlocks.Remove(renderer);
			blocksIsDirty = true;
		}
	}

	private MaterialPropertyBlock GetPropertyBlock(Renderer renderer)
	{
		//IL_001e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0024: Expected Obj, but got Unknown
		blocksIsDirty = true;
		if (!s_propertyBlocks.TryGetValue(renderer, out var value))
		{
			value = new MaterialPropertyBlock();
			s_propertyBlocks[renderer] = value;
		}
		return value;
	}

	private void CombinePropertyBlocks(MaterialPropertyBlock propertyBlockToCombine)
	{
		//IL_003a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0069: Unknown result type (might be due to invalid IL or missing references)
		foreach (MaterialPropertyBlock value in s_propertyBlocks.Values)
		{
			if (propertyBlockToCombine.HasColor(ShaderProps._Color))
			{
				value.SetColor(ShaderProps._Color, propertyBlockToCombine.GetColor(ShaderProps._Color));
				blocksIsDirty = true;
			}
			if (propertyBlockToCombine.HasColor(ShaderProps._EmissionColor))
			{
				value.SetColor(ShaderProps._EmissionColor, propertyBlockToCombine.GetColor(ShaderProps._EmissionColor));
				blocksIsDirty = true;
			}
		}
		SetPropertyBlocks();
	}

	private void SetPropertyBlocks()
	{
		if (blocksIsDirty)
		{
			CollectionExtensions.Do<KeyValuePair<Renderer, MaterialPropertyBlock>>((IEnumerable<KeyValuePair<Renderer, MaterialPropertyBlock>>)s_propertyBlocks, (Action<KeyValuePair<Renderer, MaterialPropertyBlock>>)((KeyValuePair<Renderer, MaterialPropertyBlock> rendererBlock) =>
			{
				rendererBlock.Key.SetPropertyBlock(rendererBlock.Value.isEmpty ? null : rendererBlock.Value);
			}));
		}
		blocksIsDirty = false;
	}

	private void InitializeParts()
	{
		//IL_0596: Unknown result type (might be due to invalid IL or missing references)
		//IL_05aa: Unknown result type (might be due to invalid IL or missing references)
		//IL_05af: Unknown result type (might be due to invalid IL or missing references)
		//IL_05d4: Unknown result type (might be due to invalid IL or missing references)
		//IL_05ee: Unknown result type (might be due to invalid IL or missing references)
		//IL_0602: Unknown result type (might be due to invalid IL or missing references)
		//IL_0607: Unknown result type (might be due to invalid IL or missing references)
		//IL_066e: Unknown result type (might be due to invalid IL or missing references)
		//IL_068a: Unknown result type (might be due to invalid IL or missing references)
		//IL_06bd: Unknown result type (might be due to invalid IL or missing references)
		//IL_06d9: Unknown result type (might be due to invalid IL or missing references)
		//IL_070c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0728: Unknown result type (might be due to invalid IL or missing references)
		//IL_075b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0777: Unknown result type (might be due to invalid IL or missing references)
		//IL_09ca: Unknown result type (might be due to invalid IL or missing references)
		//IL_0a13: Unknown result type (might be due to invalid IL or missing references)
		//IL_0a2f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0a4b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0a7f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0a9b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0ab7: Unknown result type (might be due to invalid IL or missing references)
		//IL_0aeb: Unknown result type (might be due to invalid IL or missing references)
		//IL_0b07: Unknown result type (might be due to invalid IL or missing references)
		//IL_0b23: Unknown result type (might be due to invalid IL or missing references)
		//IL_01d6: Unknown result type (might be due to invalid IL or missing references)
		//IL_01db: Unknown result type (might be due to invalid IL or missing references)
		//IL_0fe7: Unknown result type (might be due to invalid IL or missing references)
		//IL_0fee: Expected Obj, but got Unknown
		//IL_0c31: Unknown result type (might be due to invalid IL or missing references)
		//IL_0c36: Unknown result type (might be due to invalid IL or missing references)
		//IL_0c44: Expected Obj, but got Unknown
		//IL_0c5d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0c67: Unknown result type (might be due to invalid IL or missing references)
		//IL_0ca3: Unknown result type (might be due to invalid IL or missing references)
		//IL_0cd5: Unknown result type (might be due to invalid IL or missing references)
		//IL_0cf7: Unknown result type (might be due to invalid IL or missing references)
		//IL_0cfc: Unknown result type (might be due to invalid IL or missing references)
		//IL_020b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0229: Unknown result type (might be due to invalid IL or missing references)
		//IL_022e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0d76: Unknown result type (might be due to invalid IL or missing references)
		//IL_0dbc: Unknown result type (might be due to invalid IL or missing references)
		//IL_0dd8: Unknown result type (might be due to invalid IL or missing references)
		//IL_0df4: Unknown result type (might be due to invalid IL or missing references)
		//IL_0d12: Unknown result type (might be due to invalid IL or missing references)
		//IL_0d17: Unknown result type (might be due to invalid IL or missing references)
		//IL_0d1b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0d20: Unknown result type (might be due to invalid IL or missing references)
		//IL_0d24: Unknown result type (might be due to invalid IL or missing references)
		//IL_0d29: Unknown result type (might be due to invalid IL or missing references)
		//IL_026b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0ee9: Unknown result type (might be due to invalid IL or missing references)
		//IL_0efb: Unknown result type (might be due to invalid IL or missing references)
		//IL_0f05: Unknown result type (might be due to invalid IL or missing references)
		//IL_053d: Unknown result type (might be due to invalid IL or missing references)
		//IL_104d: Unknown result type (might be due to invalid IL or missing references)
		//IL_1069: Unknown result type (might be due to invalid IL or missing references)
		//IL_0e93: Unknown result type (might be due to invalid IL or missing references)
		//IL_0295: Unknown result type (might be due to invalid IL or missing references)
		//IL_032c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0360: Unknown result type (might be due to invalid IL or missing references)
		//IL_037c: Unknown result type (might be due to invalid IL or missing references)
		//IL_03da: Unknown result type (might be due to invalid IL or missing references)
		//IL_04f4: Unknown result type (might be due to invalid IL or missing references)
		//IL_0512: Unknown result type (might be due to invalid IL or missing references)
		//IL_0517: Unknown result type (might be due to invalid IL or missing references)
		//IL_0407: Unknown result type (might be due to invalid IL or missing references)
		//IL_042f: Unknown result type (might be due to invalid IL or missing references)
		//IL_045c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0484: Unknown result type (might be due to invalid IL or missing references)
		//IL_04ae: Unknown result type (might be due to invalid IL or missing references)
		//IL_04d8: Unknown result type (might be due to invalid IL or missing references)
		//IL_119f: Unknown result type (might be due to invalid IL or missing references)
		//IL_11bb: Unknown result type (might be due to invalid IL or missing references)
		//IL_11d7: Unknown result type (might be due to invalid IL or missing references)
		//IL_11fc: Unknown result type (might be due to invalid IL or missing references)
		//IL_120b: Unknown result type (might be due to invalid IL or missing references)
		//IL_1321: Unknown result type (might be due to invalid IL or missing references)
		//IL_132b: Expected Obj, but got Unknown
		//IL_1418: Unknown result type (might be due to invalid IL or missing references)
		//IL_1422: Expected Obj, but got Unknown
		//IL_1463: Unknown result type (might be due to invalid IL or missing references)
		//IL_147f: Unknown result type (might be due to invalid IL or missing references)
		//IL_149b: Unknown result type (might be due to invalid IL or missing references)
		//IL_14cf: Unknown result type (might be due to invalid IL or missing references)
		//IL_14eb: Unknown result type (might be due to invalid IL or missing references)
		//IL_1507: Unknown result type (might be due to invalid IL or missing references)
		//IL_153b: Unknown result type (might be due to invalid IL or missing references)
		//IL_1557: Unknown result type (might be due to invalid IL or missing references)
		//IL_1573: Unknown result type (might be due to invalid IL or missing references)
		//IL_15a7: Unknown result type (might be due to invalid IL or missing references)
		//IL_15c3: Unknown result type (might be due to invalid IL or missing references)
		//IL_15df: Unknown result type (might be due to invalid IL or missing references)
		//IL_1613: Unknown result type (might be due to invalid IL or missing references)
		//IL_162f: Unknown result type (might be due to invalid IL or missing references)
		//IL_164b: Unknown result type (might be due to invalid IL or missing references)
		//IL_167f: Unknown result type (might be due to invalid IL or missing references)
		//IL_169b: Unknown result type (might be due to invalid IL or missing references)
		//IL_16b7: Unknown result type (might be due to invalid IL or missing references)
		//IL_195b: Unknown result type (might be due to invalid IL or missing references)
		//IL_1977: Unknown result type (might be due to invalid IL or missing references)
		//IL_1993: Unknown result type (might be due to invalid IL or missing references)
		//IL_17c1: Unknown result type (might be due to invalid IL or missing references)
		//IL_17c8: Expected Obj, but got Unknown
		//IL_1a72: Unknown result type (might be due to invalid IL or missing references)
		//IL_1a77: Unknown result type (might be due to invalid IL or missing references)
		//IL_1a85: Expected Obj, but got Unknown
		//IL_1ac5: Unknown result type (might be due to invalid IL or missing references)
		//IL_1ae1: Unknown result type (might be due to invalid IL or missing references)
		//IL_1c15: Unknown result type (might be due to invalid IL or missing references)
		//IL_1c1f: Unknown result type (might be due to invalid IL or missing references)
		//IL_1c40: Unknown result type (might be due to invalid IL or missing references)
		//IL_1c61: Unknown result type (might be due to invalid IL or missing references)
		//IL_1c86: Unknown result type (might be due to invalid IL or missing references)
		//IL_1ca2: Unknown result type (might be due to invalid IL or missing references)
		//IL_1cdc: Unknown result type (might be due to invalid IL or missing references)
		//IL_1cfd: Unknown result type (might be due to invalid IL or missing references)
		//IL_1e25: Unknown result type (might be due to invalid IL or missing references)
		//IL_1e2a: Unknown result type (might be due to invalid IL or missing references)
		//IL_1e38: Expected Obj, but got Unknown
		//IL_1ede: Unknown result type (might be due to invalid IL or missing references)
		//IL_1ee8: Unknown result type (might be due to invalid IL or missing references)
		//IL_18fb: Unknown result type (might be due to invalid IL or missing references)
		//IL_1f6a: Unknown result type (might be due to invalid IL or missing references)
		//IL_1f77: Unknown result type (might be due to invalid IL or missing references)
		//IL_1f81: Unknown result type (might be due to invalid IL or missing references)
		//IL_1fbf: Unknown result type (might be due to invalid IL or missing references)
		//IL_1fe0: Unknown result type (might be due to invalid IL or missing references)
		//IL_1fea: Unknown result type (might be due to invalid IL or missing references)
		//IL_200b: Unknown result type (might be due to invalid IL or missing references)
		//IL_202c: Unknown result type (might be due to invalid IL or missing references)
		//IL_204d: Unknown result type (might be due to invalid IL or missing references)
		//IL_1f31: Unknown result type (might be due to invalid IL or missing references)
		//IL_1f36: Unknown result type (might be due to invalid IL or missing references)
		//IL_1f47: Expected Obj, but got Unknown
		//IL_21b6: Unknown result type (might be due to invalid IL or missing references)
		//IL_21c0: Unknown result type (might be due to invalid IL or missing references)
		//IL_21e5: Unknown result type (might be due to invalid IL or missing references)
		//IL_224c: Unknown result type (might be due to invalid IL or missing references)
		//IL_2271: Unknown result type (might be due to invalid IL or missing references)
		//IL_2276: Unknown result type (might be due to invalid IL or missing references)
		//IL_23ef: Unknown result type (might be due to invalid IL or missing references)
		//IL_23f9: Unknown result type (might be due to invalid IL or missing references)
		//IL_241e: Unknown result type (might be due to invalid IL or missing references)
		//IL_2443: Unknown result type (might be due to invalid IL or missing references)
		//IL_24bf: Unknown result type (might be due to invalid IL or missing references)
		//IL_24c9: Expected Obj, but got Unknown
		//IL_24c9: Unknown result type (might be due to invalid IL or missing references)
		//IL_24d3: Expected Obj, but got Unknown
		//IL_24ee: Unknown result type (might be due to invalid IL or missing references)
		//IL_24f8: Expected Obj, but got Unknown
		//IL_24f8: Unknown result type (might be due to invalid IL or missing references)
		//IL_2502: Expected Obj, but got Unknown
		//IL_253a: Unknown result type (might be due to invalid IL or missing references)
		//IL_2544: Expected Obj, but got Unknown
		//IL_2544: Unknown result type (might be due to invalid IL or missing references)
		//IL_254e: Expected Obj, but got Unknown
		//IL_2569: Unknown result type (might be due to invalid IL or missing references)
		//IL_2573: Expected Obj, but got Unknown
		//IL_2573: Unknown result type (might be due to invalid IL or missing references)
		//IL_257d: Expected Obj, but got Unknown
		//IL_22be: Unknown result type (might be due to invalid IL or missing references)
		//IL_22da: Unknown result type (might be due to invalid IL or missing references)
		//IL_25b6: Unknown result type (might be due to invalid IL or missing references)
		//IL_25d2: Unknown result type (might be due to invalid IL or missing references)
		//IL_25ea: Unknown result type (might be due to invalid IL or missing references)
		Transform val = ((Component)this).transform.Find("ship/visual/Mast");
		m_mast = ((val != null) ? ((Component)val).gameObject : null);
		Transform val2 = ((Component)this).transform.Find("ship/visual/ropes");
		m_ropes = ((val2 != null) ? ((Component)val2).gameObject : null);
		Transform val3 = ((Component)this).transform.Find("ship/visual/Mast/Karve_Sail/Karve_Sail");
		m_sail = ((val3 != null) ? ((Component)val3).gameObject : null);
		Transform val4 = ((Component)this).transform.Find("ship/visual/Customize");
		if (!Object.op_Implicit((Object)(object)val4))
		{
			return;
		}
		((Component)val4).gameObject.SetActive(true);
		Transform val5 = val4.Find("ShipTentHolders");
		m_holdersRight = ((val5 != null) ? ((Component)val5).gameObject : null);
		Transform val6 = val4.Find("ShipTentHolders (1)");
		m_holdersLeft = ((val6 != null) ? ((Component)val6).gameObject : null);
		GameObject holdersRight = m_holdersRight;
		if (holdersRight != null)
		{
			holdersRight.SetActive(false);
		}
		GameObject holdersLeft = m_holdersLeft;
		if (holdersLeft != null)
		{
			holdersLeft.SetActive(false);
		}
		Transform val7 = val4.Find("storage");
		if (Object.op_Implicit((Object)(object)val7))
		{
			List<GameObject> list = new List<GameObject>();
			List<GameObject> list2 = new List<GameObject>();
			List<GameObject> list3 = new List<GameObject>();
			for (int i = 0; i < val7.childCount; i++)
			{
				GameObject gameObject = ((Component)val7.GetChild(i)).gameObject;
				if (((Object)gameObject).name.StartsWith("barrel"))
				{
					list.Add(gameObject);
				}
				else if (((Object)gameObject).name.StartsWith("Shield"))
				{
					list3.Add(gameObject);
				}
				else
				{
					list2.Add(gameObject);
				}
				gameObject.SetActive(false);
			}
			m_containerPartsLvl1 = list.ToArray();
			m_containerPartsLvl2 = list2.ToArray();
			m_protectiveParts = list3.ToArray();
			State state = Random.state;
			Random.InitState((int)m_zdo.m_uid.ID);
			for (int j = 0; j < list.Count; j++)
			{
				Transform transform = list[j].transform;
				transform.localEulerAngles += new Vector3(0f, Random.Range(0f, 360f), 0f);
				switch (j)
				{
				case 0:
					list[j].transform.localPosition = new Vector3(-0.69f, 0.18f, -0.88f);
					break;
				case 1:
					list[j].transform.localPosition = new Vector3(-0.36f, 0.18f, -0.87f);
					break;
				}
				BoxCollider componentInChildren = list[j].GetComponentInChildren<BoxCollider>();
				GameObject gameObject2 = ((Component)componentInChildren).gameObject;
				Object.Destroy((Object)(object)componentInChildren);
				gameObject2.AddComponent<CapsuleCollider>();
			}
			for (int k = 0; k < list2.Count; k++)
			{
				switch (k)
				{
				case 0:
				case 5:
				{
					Transform transform2 = new GameObject("ladder_TargetPoint").transform;
					transform2.SetParent(list2[k].transform, false);
					transform2.localPosition = new Vector3(0.4f, 0.82f, 0f);
					transform2.localEulerAngles = new Vector3(0f, 270f, 0f);
					Ladder val8 = list2[k].AddComponent<Ladder>();
					val8.m_useDistance = 1.5f;
					val8.m_targetPos = transform2;
					val8.m_name = "$lu_box_name";
					continue;
				}
				case 1:
					list2[k].transform.localPosition = new Vector3(0.08f, 0f, -0.45f);
					break;
				case 3:
					list2[k].transform.localPosition = new Vector3(0f, 0f, -0.84f);
					list2[k].transform.localScale = new Vector3(0.35f, 0.4f, 0.35f);
					break;
				case 4:
					list2[k].transform.localPosition = new Vector3(0.36f, -0.02f, -0.82f);
					list2[k].transform.localScale = new Vector3(0.35f, 0.4f, 0.35f);
					break;
				case 6:
					list2[k].transform.localPosition = new Vector3(0f, 0.26f, -0.57f);
					break;
				case 8:
					list2[k].transform.localScale = new Vector3(0.35f, 0.4f, 0.35f);
					break;
				}
				Transform transform3 = list2[k].transform;
				transform3.localEulerAngles += new Vector3(0f, Random.Range(0f, 360f), 0f);
			}
			Random.state = state;
		}
		Transform val9 = val4.Find("ShipTen2_beam");
		if (Object.op_Implicit((Object)(object)val9))
		{
			m_beamMast = Object.Instantiate<GameObject>(((Component)val9).gameObject, val9.parent);
			((Object)m_beamMast).name = "ShipTen2_mast";
			Transform transform4 = m_beamMast.transform;
			transform4.localEulerAngles += new Vector3(90f, 0.1f, 0f);
			m_beamMast.transform.localPosition = new Vector3(0.58f, 0.35f, 0f);
			m_beamMast.SetActive(false);
			val9.localPosition += new Vector3(0.1f, 0f, 0f);
			m_beamTent = ((Component)val9).gameObject;
			m_beamTent.SetActive(false);
			m_beamMesh = ((Component)((Component)val9).GetComponentInChildren<Renderer>()).gameObject;
			Transform val10 = AddCollider(m_beamMast.transform, "mast_beam", typeof(BoxCollider));
			val10.localPosition = new Vector3(0f, 1.58f, -0.48f);
			val10.localScale = new Vector3(0.16f, 0.16f, 2.5f);
			Transform val11 = AddCollider(val9, "lantern_beam", typeof(BoxCollider));
			val11.localPosition = new Vector3(0f, 1.58f, -1.41f);
			val11.localScale = new Vector3(0.16f, 0.16f, 0.8f);
			Transform val12 = AddCollider(val9, "tent_beam", typeof(BoxCollider));
			val12.localPosition = new Vector3(0f, 1.58f, 0.23f);
			val12.localScale = new Vector3(0.16f, 0.16f, 2.05f);
			Transform val13 = AddCollider(val9, "sail_beam", typeof(BoxCollider));
			val13.localPosition = new Vector3(0f, 1.4f, -0.9f);
			val13.localScale = new Vector3(0.23f, 0.55f, 0.2f);
			m_beamTentCollider = ((Component)val12).gameObject;
			m_beamSailCollider = ((Component)val13).gameObject;
			if (LongshipUpgrades.lanternEnabled.Value)
			{
				LongshipPartController longshipPartController = ((Component)val11).gameObject.AddComponent<LongshipPartController>();
				longshipPartController.m_name = "$lu_part_lantern_name";
				longshipPartController.m_zdoPartDisabled = (LongshipUpgrades.lanternRemovable.Value ? s_lanternDisabled : 0);
				longshipPartController.m_messageEnable = "$lu_part_lantern_enable";
				longshipPartController.m_enableEffects = 1;
				longshipPartController.m_messageDisable = "$lu_part_lantern_disable";
				longshipPartController.m_disableEffects = 1;
				longshipPartController.m_nview = m_nview;
				longshipPartController.m_useDistance = 3f;
				longshipPartController.AddUpgradeRequirement(s_lanternUpgraded, "$lu_part_lantern_upgrade", LongshipUpgrades.ParseRequirements(LongshipUpgrades.lanternUpgradeRecipe.Value), LongshipUpgrades.lanternStation.Value, LongshipUpgrades.lanternStationLvl.Value, LongshipUpgrades.lanternStationRange.Value);
			}
			if (LongshipUpgrades.tentEnabled.Value)
			{
				LongshipPartController longshipPartController2 = ((Component)val12).gameObject.AddComponent<LongshipPartController>();
				longshipPartController2.m_name = "$lu_part_tent_name";
				longshipPartController2.m_zdoPartDisabled = (LongshipUpgrades.tentRemovable.Value ? s_tentDisabled : 0);
				longshipPartController2.m_messageEnable = "$lu_part_tent_enable";
				longshipPartController2.m_enableEffects = 0;
				longshipPartController2.m_messageDisable = "$lu_part_tent_disable";
				longshipPartController2.m_disableEffects = 0;
				longshipPartController2.m_nview = m_nview;
				longshipPartController2.m_useDistance = 3f;
				longshipPartController2.AddUpgradeRequirement(s_tentUpgraded, "$lu_part_tent_upgrade", LongshipUpgrades.ParseRequirements(LongshipUpgrades.tentUpgradeRecipe.Value), LongshipUpgrades.tentStation.Value, LongshipUpgrades.tentStationLvl.Value, LongshipUpgrades.tentStationRange.Value);
			}
			if (LongshipUpgrades.changeSail.Value)
			{
				LongshipPartController longshipPartController3 = ((Component)val13).gameObject.AddComponent<LongshipPartController>();
				longshipPartController3.m_name = "$lu_part_sail_name";
				longshipPartController3.m_nview = m_nview;
				longshipPartController3.m_messageSwitch = "$lu_part_sail_switch";
				longshipPartController3.m_zdoPartVariant = s_sailStyle;
				longshipPartController3.m_variants = customSails.Count + 1;
				longshipPartController3.m_switchEffects = 0;
			}
		}
		Transform val14 = val4.Find("ShipTen2 (1)");
		if (Object.op_Implicit((Object)(object)val14))
		{
			m_tent = ((Component)val14).gameObject;
			Transform transform5 = new GameObject("colliders").transform;
			transform5.SetParent(m_tent.transform, false);
			Transform val15 = AddCollider(transform5, "collider_right", typeof(BoxCollider));
			val15.localPosition = new Vector3(1.58f, 1.18f, -0.65f);
			val15.localScale = new Vector3(1.9f, 0.01f, 2.6f);
			val15.localEulerAngles = new Vector3(0f, 0f, -6f);
			Transform val16 = AddCollider(transform5, "collider_left", typeof(BoxCollider));
			val16.localPosition = new Vector3(-1.05f, 0.95f, -0.65f);
			val16.localScale = new Vector3(1f, 0.01f, 2.5f);
			val16.localEulerAngles = new Vector3(0f, 0f, 23f);
			Transform val17 = AddCollider(transform5, "collider_left (1)", typeof(BoxCollider));
			val17.localPosition = new Vector3(-2.1f, 0.7f, -0.55f);
			val17.localScale = new Vector3(1.15f, 0.01f, 3f);
			val17.localEulerAngles = new Vector3(0f, 0f, 6f);
			m_tent.SetActive(false);
			if (LongshipUpgrades.changeTent.Value)
			{
				for (int l = 0; l < transform5.childCount; l++)
				{
					LongshipPartController longshipPartController4 = ((Component)transform5.GetChild(l)).gameObject.AddComponent<LongshipPartController>();
					longshipPartController4.m_name = "$lu_part_tent_name";
					longshipPartController4.m_nview = m_nview;
					longshipPartController4.m_messageSwitch = "$lu_part_tent_switch";
					longshipPartController4.m_zdoPartVariant = s_tentStyle;
					longshipPartController4.m_variants = customTents.Count + 1;
					longshipPartController4.m_switchEffects = 0;
				}
			}
		}
		if ((Object)(object)s_lanternPrefab == (Object)null)
		{
			GameObject itemPrefab = ObjectDB.instance.GetItemPrefab("Lantern");
			object prefab;
			if (itemPrefab == null)
			{
				prefab = null;
			}
			else
			{
				Transform val18 = itemPrefab.transform.Find("attach/equiped");
				prefab = ((val18 != null) ? ((Component)val18).gameObject : null);
			}
			s_lanternPrefab = PrefabAudio.Clone((GameObject)prefab);
		}
		if (Object.op_Implicit((Object)(object)s_lanternPrefab))
		{
			m_lantern = new GameObject("Lantern")
			{
				layer = 28
			};
			Transform transform6 = m_lantern.transform;
			transform6.SetParent(val4, false);
			transform6.localScale = Vector3.one * 0.45f;
			Transform transform7 = Object.Instantiate<GameObject>(s_lanternPrefab, transform6).transform;
			((Object)transform7).name = "Lamp";
			transform7.localPosition = new Vector3(0.23f, 1.9f, 0f);
			((Component)transform7).gameObject.layer = 28;
			m_light = ((Component)transform7).GetComponentInChildren<Light>();
			m_light.color = LongshipUpgrades.lanternLightColor.Value;
			m_flare = ((Component)transform7.Find("flare")).GetComponent<ParticleSystem>();
			if (flareColor == Color.clear)
			{
				MainModule main = m_flare.main;
				MinMaxGradient startColor = main.startColor;
				flareColor = startColor.color;
			}
			m_lampRenderer = ((Component)transform7.Find("default")).GetComponent<MeshRenderer>();
			ConfigurableJoint component = ((Component)transform7).GetComponent<ConfigurableJoint>();
			((Joint)component).autoConfigureConnectedAnchor = false;
			((Joint)component).connectedBody = ((Component)this).GetComponent<Rigidbody>();
			((Joint)component).connectedAnchor = new Vector3(0f, 3.01f, -0.45f);
			((Component)transform7).GetComponent<CapsuleCollider>().height = 0.44f;
			Transform val19 = AddCollider(transform6, "collider", typeof(BoxCollider));
			val19.localPosition = new Vector3(0.2f, 2f, 0f);
			val19.localScale = new Vector3(0.02f, 0.02f, 0.5f);
			val19.localEulerAngles = new Vector3(90f, 0f, 0f);
			Transform val20 = val4.Find("TraderLamp");
			if (Object.op_Implicit((Object)(object)val20))
			{
				((Component)val20).gameObject.SetActive(false);
				Transform val21 = val20.Find("insects");
				if (Object.op_Implicit((Object)(object)val21))
				{
					m_insects = Object.Instantiate<GameObject>(((Component)val21).gameObject, transform6);
					((Object)m_insects).name = "insects";
					m_insects.SetActive(false);
					m_insects.transform.localPosition = new Vector3(0.42f, 1.85f, 0f);
					m_insects.layer = 8;
				}
			}
			GameObject gameObject3 = ((Component)AddCollider(val4, "FireWarmth", typeof(SphereCollider))).gameObject;
			gameObject3.layer = 14;
			gameObject3.transform.localPosition = new Vector3(-1f, 0f, 0f);
			gameObject3.transform.localScale = Vector3.one * 0.45f;
			SphereCollider component2 = gameObject3.GetComponent<SphereCollider>();
			component2.radius = 3f;
			((Collider)component2).isTrigger = true;
			m_fireWarmth = gameObject3.gameObject.AddComponent<EffectArea>();
			m_fireWarmth.m_playerOnly = true;
			if (LongshipUpgrades.lanternSwitchable.Value)
			{
				LongshipPartController longshipPartController5 = ((Component)transform6).gameObject.AddComponent<LongshipPartController>();
				longshipPartController5.m_name = "$lu_part_lamp_name";
				longshipPartController5.m_zdoPartDisabled = s_lightsDisabled;
				longshipPartController5.m_messageEnable = "$lu_part_lamp_enable";
				longshipPartController5.m_messageDisable = "$lu_part_lamp_disable";
				longshipPartController5.m_enableEffects = 2;
				longshipPartController5.m_disableEffects = 3;
				longshipPartController5.m_nview = m_nview;
				longshipPartController5.m_useDistance = 2f;
			}
			((Component)transform7).gameObject.SetActive(true);
			m_lantern.SetActive(false);
		}
		GameObject val22 = new GameObject("interactive");
		Transform transform8 = val22.transform;
		transform8.SetParent(val4, false);
		if (LongshipUpgrades.mastEnabled.Value || LongshipUpgrades.mastRemovable.Value)
		{
			Transform val23 = AddCollider(transform8, "mast_controller", typeof(BoxCollider));
			val23.localPosition = new Vector3(-0.05f, 0.08f, 0f);
			val23.localScale = new Vector3(0.6f, 0.17f, 0.26f);
			m_mastUpgrade = ((Component)val23).gameObject;
			m_mastUpgrade.layer = 16;
			m_mastUpgrade.SetActive(true);
			LongshipPartController longshipPartController6 = ((Component)val23).gameObject.AddComponent<LongshipPartController>();
			longshipPartController6.m_name = "$lu_part_mast_name";
			longshipPartController6.m_zdoPartDisabled = (LongshipUpgrades.mastRemovable.Value ? s_mastRemoved : 0);
			longshipPartController6.m_messageEnable = "$lu_part_mast_enable";
			longshipPartController6.m_messageDisable = "$lu_part_mast_disable";
			longshipPartController6.m_enableEffects = 1;
			longshipPartController6.m_disableEffects = 1;
			longshipPartController6.m_nview = m_nview;
			longshipPartController6.m_useDistance = 2.5f;
			longshipPartController6.AddUpgradeRequirement(LongshipUpgrades.mastEnabled.Value ? s_mastUpgraded : 0, "$lu_part_mast_upgrade", LongshipUpgrades.ParseRequirements(LongshipUpgrades.mastUpgradeRecipe.Value), LongshipUpgrades.mastStation.Value, LongshipUpgrades.mastStationLvl.Value, LongshipUpgrades.mastStationRange.Value);
		}
		if (Object.op_Implicit((Object)(object)m_container))
		{
			Transform val24 = AddCollider(transform8, "storage_controller", typeof(BoxCollider));
			val24.localPosition = new Vector3(-1.9f, -0.02f, 0f);
			val24.localScale = new Vector3(0.45f, 0.45f, 0.18f);
			val24.localEulerAngles = new Vector3(0f, 270f, 0f);
			BoxCollider component3 = ((Component)m_container).GetComponent<BoxCollider>();
			BoxCollider component4 = ((Component)val24).GetComponent<BoxCollider>();
			component4.center = component3.center;
			component4.size = component3.size;
			LongshipPartController longshipPartController7 = ((Component)val24).gameObject.AddComponent<LongshipPartController>();
			longshipPartController7.m_name = (m_container.m_name.StartsWith("$") ? m_container.m_name : "$msg_cart_storage");
			longshipPartController7.m_nview = m_nview;
			longshipPartController7.AddUpgradeRequirement(s_containerUpgradedLvl1, "$lu_part_container_upgrade1", LongshipUpgrades.ParseRequirements(LongshipUpgrades.containerLvl1UpgradeRecipe.Value), LongshipUpgrades.containerLvl1Station.Value, LongshipUpgrades.containerLvl1StationLvl.Value, LongshipUpgrades.containerLvl1StationRange.Value);
			longshipPartController7.AddUpgradeRequirement(s_containerUpgradedLvl2, "$lu_part_container_upgrade2", LongshipUpgrades.ParseRequirements(LongshipUpgrades.containerLvl2UpgradeRecipe.Value), LongshipUpgrades.containerLvl2Station.Value, LongshipUpgrades.containerLvl2StationLvl.Value, LongshipUpgrades.containerLvl2StationRange.Value);
			m_storageUpgrade = ((Component)val24).gameObject;
			m_storageUpgrade.layer = 16;
			m_storageUpgrade.SetActive(false);
		}
		Transform healthParent;
		if (m_protectiveParts != null)
		{
			m_healthUpgrade = new GameObject("health");
			healthParent = m_healthUpgrade.transform;
			healthParent.SetParent(transform8, false);
			Transform val25 = ((Component)this).transform.Find("ship/colliders/left_side");
			if (Object.op_Implicit((Object)(object)val25))
			{
				for (int m = 1; m < Mathf.Min(val25.childCount, 5); m++)
				{
					AddHealthController(val25, m, "health_controller_left", 0.01f);
				}
			}
			Transform val26 = ((Component)this).transform.Find("ship/colliders/left_side (1)");
			if (Object.op_Implicit((Object)(object)val26))
			{
				for (int n = 1; n < Mathf.Min(val26.childCount, 5); n++)
				{
					AddHealthController(val26, n, "health_controller_right", -0.01f);
				}
			}
		}
		if (m_protectiveParts != null)
		{
			m_shieldsStyles = new GameObject("shields");
			Transform transform9 = m_shieldsStyles.transform;
			transform9.SetParent(transform8, false);
			Transform val27 = AddCollider(transform9, "shield_controller_right", typeof(BoxCollider));
			val27.localPosition = new Vector3(-1.16f, 0.2f, 1.11f);
			val27.localScale = new Vector3(0.95f, 0.45f, 0.05f);
			val27.localEulerAngles = new Vector3(3f, 355f, 0f);
			Transform val28 = AddCollider(transform9, "shield_controller_right (1)", typeof(BoxCollider));
			val28.localPosition = new Vector3(-0.23f, 0.2f, 1.16f);
			val28.localScale = new Vector3(0.91f, 0.43f, 0.05f);
			val28.localEulerAngles = new Vector3(3f, 0f, 0f);
			Transform val29 = AddCollider(transform9, "shield_controller_right (2)", typeof(BoxCollider));
			val29.localPosition = new Vector3(1.35f, 0.16f, 1.05f);
			val29.localScale = new Vector3(1.5f, 0.45f, 0.05f);
			val29.localEulerAngles = new Vector3(3f, 8f, 0f);
			Transform val30 = AddCollider(transform9, "shield_controller_left", typeof(BoxCollider));
			val30.localPosition = new Vector3(-1.18f, 0.27f, -1.11f);
			val30.localScale = new Vector3(0.95f, 0.45f, 0.05f);
			val30.localEulerAngles = new Vector3(0f, 4f, 0f);
			Transform val31 = AddCollider(transform9, "shield_controller_left (1)", typeof(BoxCollider));
			val31.localPosition = new Vector3(-0.25f, 0.27f, -1.16f);
			val31.localScale = new Vector3(0.89f, 0.45f, 0.05f);
			val31.localEulerAngles = new Vector3(0f, 2f, 0f);
			Transform val32 = AddCollider(transform9, "shield_controller_left (2)", typeof(BoxCollider));
			val32.localPosition = new Vector3(1.33f, 0.23f, -1.1f);
			val32.localScale = new Vector3(1.37f, 0.45f, 0.05f);
			val32.localEulerAngles = new Vector3(0f, 352f, 0f);
			if (LongshipUpgrades.changeShields.Value)
			{
				for (int num = 0; num < transform9.childCount; num++)
				{
					LongshipPartController longshipPartController8 = ((Component)transform9.GetChild(num)).gameObject.AddComponent<LongshipPartController>();
					longshipPartController8.m_name = "$lu_part_shields_name";
					longshipPartController8.m_nview = m_nview;
					longshipPartController8.m_messageSwitch = "$lu_part_shields_switch";
					longshipPartController8.m_zdoPartVariant = s_shieldsStyle;
					longshipPartController8.m_variants = 4 + 3 * customShields.Count;
					longshipPartController8.m_switchEffects = 1;
				}
			}
		}
		Transform val33 = val4.parent.Find("unused");
		if (Object.op_Implicit((Object)(object)val33))
		{
			WearNTear wnt = m_wnt;
			object obj;
			if (wnt == null)
			{
				obj = null;
			}
			else
			{
				GameObject val34 = wnt.m_new;
				if (val34 == null)
				{
					obj = null;
				}
				else
				{
					Transform transform10 = val34.transform;
					if (transform10 == null)
					{
						obj = null;
					}
					else
					{
						Transform val35 = transform10.Find("skull_head");
						obj = ((val35 != null) ? ((Renderer)((Component)val35).GetComponent<MeshRenderer>()).sharedMaterial : null);
					}
				}
			}
			Material sharedMaterial = (Material)obj;
			GameObject val36 = new GameObject("heads");
			Transform transform11 = val36.transform;
			transform11.SetParent(val4, false);
			List<GameObject> list4 = new List<GameObject>();
			Transform val37 = val33.Find("carnyx_head");
			if (Object.op_Implicit((Object)(object)val37))
			{
				GameObject val38 = Object.Instantiate<GameObject>(((Component)val37).gameObject, transform11, true);
				((Object)val38).name = ((Object)val37).name;
				((Renderer)val38.GetComponent<MeshRenderer>()).sharedMaterial = sharedMaterial;
				val38.SetActive(false);
				list4.Add(val38);
			}
			Transform val39 = val33.Find("dragon_head");
			if (Object.op_Implicit((Object)(object)val39))
			{
				GameObject val40 = Object.Instantiate<GameObject>(((Component)val39).gameObject, transform11, true);
				((Object)val40).name = ((Object)val39).name;
				((Renderer)val40.GetComponent<MeshRenderer>()).sharedMaterial = sharedMaterial;
				val40.SetActive(false);
				list4.Add(val40);
			}
			Transform val41 = val33.Find("oseberg_head");
			if (Object.op_Implicit((Object)(object)val41))
			{
				GameObject val42 = Object.Instantiate<GameObject>(((Component)val41).gameObject, transform11, true);
				((Object)val42).name = ((Object)val41).name;
				((Renderer)val42.GetComponent<MeshRenderer>()).sharedMaterial = sharedMaterial;
				val42.SetActive(false);
				val42.transform.localPosition = Vector3.zero;
				list4.Add(val42);
			}
			m_heads = list4.ToArray();
		}
		if (m_heads != null)
		{
			Transform val43 = AddCollider(transform8, "heads_controller", typeof(BoxCollider));
			val43.localPosition = new Vector3(-3.9f, 0.53f, 0f);
			val43.localScale = new Vector3(0.1f, 0.45f, 0.4f);
			val43.localEulerAngles = new Vector3(0f, 0f, 63f);
			m_headStyles = ((Component)val43).gameObject;
			m_headStyles.layer = 16;
			m_headStyles.SetActive(true);
			LongshipPartController longshipPartController9 = ((Component)val43).gameObject.AddComponent<LongshipPartController>();
			longshipPartController9.m_name = "$lu_part_head_name";
			longshipPartController9.m_nview = m_nview;
			longshipPartController9.m_messageSwitch = "$lu_part_head_switch";
			longshipPartController9.m_zdoPartVariant = s_headStyle;
			longshipPartController9.m_variants = 4;
			longshipPartController9.m_switchEffects = 1;
		}
		if (s_turretPrefab == null)
		{
			Turret? val44 = Resources.FindObjectsOfTypeAll<Turret>().FirstOrDefault((Turret ws) => ((Object)ws).name == "piece_turret");
			s_turretPrefab = ((val44 != null) ? ((Component)val44).gameObject : null);
		}
		if ((Object)(object)s_turretPrefab != (Object)null)
		{
			m_turrets = new GameObject("turrets")
			{
				layer = 28
			};
			Transform transform12 = m_turrets.transform;
			transform12.SetParent(val4, false);
			Transform val45 = AddCollider(transform8, "turrets_controller", typeof(BoxCollider));
			val45.localPosition = new Vector3(-3.35f, 0.1f, 0f);
			val45.localScale = new Vector3(0.04f, 0.35f, 0.45f);
			m_turretsUpgrade = ((Component)val45).gameObject;
			m_turretsUpgrade.layer = 16;
			m_turretsUpgrade.SetActive(true);
			LongshipPartController longshipPartController10 = ((Component)val45).gameObject.AddComponent<LongshipPartController>();
			longshipPartController10.m_name = "$lu_part_turrets_name";
			longshipPartController10.m_nview = m_nview;
			longshipPartController10.m_zdoPartDisabled = s_turretsDisabled;
			longshipPartController10.m_messageEnable = "$lu_part_turrets_enable";
			longshipPartController10.m_enableEffects = 4;
			longshipPartController10.m_messageDisable = "$lu_part_turrets_disable";
			longshipPartController10.m_disableEffects = 5;
			longshipPartController10.AddUpgradeRequirement(s_turretsUpgraded, "$lu_part_turrets_upgrade", LongshipUpgrades.ParseRequirements(LongshipUpgrades.turretsUpgradeRecipe.Value), LongshipUpgrades.turretsStation.Value, LongshipUpgrades.turretsStationLvl.Value, LongshipUpgrades.turretsStationRange.Value);
			GameObject val46 = Object.Instantiate<GameObject>(((Component)s_turretPrefab.transform.Find("New")).gameObject, transform12, false);
			((Object)val46).name = "turret_right";
			val46.layer = 16;
			val46.SetActive(true);
			((Component)val46.transform.Find("Base")).gameObject.SetActive(false);
			val46.transform.localScale = Vector3.one * 0.25f;
			val46.transform.localPosition = new Vector3(-3.3f, -0.01f, 0.53f);
			val46.transform.localEulerAngles = new Vector3(0f, 350f, 0f);
			BoxCollider val47 = val46.AddComponent<BoxCollider>();
			val47.center = new Vector3(0f, 0.7f, 0.1f);
			val47.size = new Vector3(1f, 2f, 1f);
			GameObject val48 = Object.Instantiate<GameObject>(val46, transform12, true);
			((Object)val48).name = "turret_left";
			val48.transform.localPosition = new Vector3(-3.3f, -0.01f, -0.53f);
			val48.transform.localEulerAngles = new Vector3(0f, 190f, 0f);
			Turret component5 = s_turretPrefab.GetComponent<Turret>();
			ShipTurret.m_shootEffect = component5.m_shootEffect;
			ShipTurret.m_addAmmoEffect = component5.m_addAmmoEffect;
			ShipTurret.m_reloadEffect = component5.m_reloadEffect;
			ShipTurret.m_warmUpStartEffect = component5.m_warmUpStartEffect;
			ShipTurret.m_newTargetEffect = component5.m_newTargetEffect;
			ShipTurret.m_lostTargetEffect = component5.m_lostTargetEffect;
			ShipTurret.m_setTargetEffect = component5.m_setTargetEffect;
			val46.AddComponent<ShipTurret>().SetPositionAtShip(isLeft: false).FillAllowedAmmo(component5.m_allowedAmmo)
				.FillTrophyTargets(component5.m_configTargets)
				.m_destroyedLootPrefab = m_destroyedLootPrefab;
			val48.AddComponent<ShipTurret>().SetPositionAtShip(isLeft: true).FillAllowedAmmo(component5.m_allowedAmmo)
				.FillTrophyTargets(component5.m_configTargets)
				.m_destroyedLootPrefab = m_destroyedLootPrefab;
		}
		if (s_standBossDragonPrefab == null)
		{
			ItemStand? val49 = Resources.FindObjectsOfTypeAll<ItemStand>().FirstOrDefault((ItemStand ws) => ((Object)((Component)((Component)ws).transform.root).gameObject).name == "BossStone_DragonQueen");
			s_standBossDragonPrefab = ((val49 != null) ? ((Component)val49).gameObject : null);
		}
		if ((Object)(object)s_standBossDragonPrefab != (Object)null)
		{
			m_itemstandObject = new GameObject("ItemStand_Bow")
			{
				layer = 28
			};
			Transform transform13 = m_itemstandObject.transform;
			transform13.SetParent(val4, false);
			m_itemstandObject.SetActive(false);
			GameObject val50 = Object.Instantiate<GameObject>(s_standBossDragonPrefab, transform13, false);
			((Object)val50).name = "itemstand";
			val50.layer = 16;
			Object.Destroy((Object)(object)((Component)val50.transform.Find("model/wood_pole (2)")).gameObject);
			Transform val51 = val50.transform.Find("model");
			((Component)val51).gameObject.layer = 16;
			((Component)val51).gameObject.SetActive(true);
			Transform val52 = val51.Find("plate");
			val52.localScale = Vector3.one * 0.3f;
			((Component)val52).gameObject.layer = 16;
			Object.Destroy((Object)(object)((Component)val52).GetComponent<MeshCollider>());
			MeshRenderer component6 = ((Component)val52).GetComponent<MeshRenderer>();
			if ((Object)(object)standSharedMaterial == (Object)null)
			{
				standSharedMaterial = new Material(((Renderer)component6).sharedMaterial)
				{
					shader = shaderStandard
				};
			}
			((Renderer)component6).sharedMaterial = standSharedMaterial;
			Transform val53 = val50.transform.Find("attach_trophie");
			val53.localPosition = Vector3.zero;
			val53.localScale = Vector3.one * 0.75f;
			((Component)val53).gameObject.layer = 16;
			Transform val54 = val50.transform.Find("dropspawn");
			val54.localPosition = new Vector3(0.01f, 0.5f, -0.69f);
			((Component)val54).gameObject.layer = 16;
			val50.transform.localScale = Vector3.one * 0.45f;
			val50.transform.localPosition = new Vector3(-4.6f, 0.7f, 0f);
			val50.transform.localEulerAngles = new Vector3(0f, 270f, 0f);
			val50.GetComponent<BoxCollider>().size = new Vector3(0.75f, 1f, 0.5f);
			ItemStand component7 = val50.GetComponent<ItemStand>();
			m_trophyStand = val50.AddComponent<ShipTrophyStand>();
			m_trophyStand.m_activatePowerEffects = component7.m_activatePowerEffects;
			m_trophyStand.m_activatePowerEffectsPlayer = component7.m_activatePowerEffectsPlayer;
			m_trophyStand.m_attachOther = component7.m_attachOther;
			m_trophyStand.m_dropSpawnPoint = component7.m_dropSpawnPoint;
			m_trophyStand.m_effects = component7.m_effects;
			m_trophyStand.m_destroyEffects = component7.m_destroyEffects;
			Object.Destroy((Object)(object)component7);
			if (LongshipUpgrades.itemStandDisableSpeaking.Value)
			{
				RandomSpeak componentInChildren2 = m_itemstandObject.GetComponentInChildren<RandomSpeak>();
				if (componentInChildren2 != null)
				{
					((Component)componentInChildren2).gameObject.SetActive(false);
				}
			}
			m_itemstandObject.SetActive(true);
		}
		if (s_wisptorchPrefab == null)
		{
			GameObject prefab2 = ZNetScene.instance.GetPrefab("piece_groundtorch_mist");
			s_wisptorchPrefab = ((prefab2 != null) ? prefab2.gameObject : null);
		}
		if ((Object)(object)s_wisptorchPrefab != (Object)null)
		{
			m_wisp = Object.Instantiate<GameObject>(((Component)s_wisptorchPrefab.transform.Find("_enabled")).gameObject, val4, false);
			((Object)m_wisp).name = "wisptorch";
			m_wisp.layer = 16;
			m_wisp.SetActive(false);
			m_wisp.transform.localScale = Vector3.one * 0.35f;
			m_wisp.transform.localPosition = new Vector3(-0.125f, 4.77f, -0.002f);
			Transform val55 = m_wisp.transform.Find("Particle System Force Field");
			Demister component8 = ((Component)val55).GetComponent<Demister>();
			component8.m_disableForcefieldDelay = 0f;
			((MonoBehaviour)component8).CancelInvoke("DisableForcefield");
			((Component)val55).GetComponent<ParticleSystemForceField>().endRange = 13f;
			val55.localPosition = new Vector3(-2f, -10f, 0f);
			MainModule main2 = ((Component)m_wisp.transform.Find("sparcs_front")).GetComponent<ParticleSystem>().main;
			main2.simulationSpace = (ParticleSystemSimulationSpace)1;
			if (LongshipUpgrades.wispEnabled.Value)
			{
				Transform val56 = AddCollider(transform8, "wisp_controller", typeof(BoxCollider));
				val56.localPosition = new Vector3(-0.13f, 1.22f, 0f);
				val56.localScale = new Vector3(0.11f, 0.25f, 0.12f);
				m_wispUpgrade = ((Component)val56).gameObject;
				m_wispUpgrade.layer = 16;
				m_wispUpgrade.SetActive(true);
				LongshipPartController longshipPartController11 = ((Component)val56).gameObject.AddComponent<LongshipPartController>();
				longshipPartController11.m_name = "$lu_part_wisp_name";
				longshipPartController11.m_zdoPartDisabled = s_wispRemoved;
				longshipPartController11.m_enableEffects = 6;
				longshipPartController11.m_disableEffects = 1;
				longshipPartController11.m_nview = m_nview;
				longshipPartController11.AddUpgradeRequirement(s_wispUpgraded, "$lu_part_wisp_upgrade", LongshipUpgrades.ParseRequirements(LongshipUpgrades.wispUpgradeRecipe.Value), LongshipUpgrades.wispStation.Value, LongshipUpgrades.wispStationLvl.Value, LongshipUpgrades.wispStationRange.Value);
			}
		}
		if ((Object)(object)s_mapTablePrefab != (Object)null)
		{
			m_mapTable = Object.Instantiate<GameObject>(s_mapTablePrefab, val4, false);
			((Object)m_mapTable).name = "maptable";
			m_mapTable.layer = 16;
			m_mapTable.SetActive(false);
			m_mapTable.transform.localScale = Vector3.one * 0.45f;
			m_mapTable.transform.localPosition = new Vector3(-1.14f, -0.05f, -0.73f);
			m_mapTable.transform.localEulerAngles = new Vector3(0f, 342.6f, 0f);
			MapTable component9 = m_mapTable.GetComponent<MapTable>();
			component9.m_nview = m_nview;
			component9.m_nview.Register<ZPackage>("MapData", (Action<long, ZPackage>)component9.RPC_MapData);
			component9.m_readSwitch = ((Component)((Component)component9).transform.Find("ReadMap")).GetComponent<Switch>();
			component9.m_readSwitch.m_onUse = (Callback)Delegate.Combine((Delegate?)(object)component9.m_readSwitch.m_onUse, (Delegate?)new Callback(component9.OnRead));
			component9.m_readSwitch.m_onHover = (TooltipCallback)Delegate.Combine((Delegate?)(object)component9.m_readSwitch.m_onHover, (Delegate?)new TooltipCallback(component9.GetReadHoverText));
			component9.m_writeSwitch = ((Component)((Component)component9).transform.Find("WriteMap")).GetComponent<Switch>();
			component9.m_writeSwitch.m_onUse = (Callback)Delegate.Combine((Delegate?)(object)component9.m_writeSwitch.m_onUse, (Delegate?)new Callback(component9.OnWrite));
			component9.m_writeSwitch.m_onHover = (TooltipCallback)Delegate.Combine((Delegate?)(object)component9.m_writeSwitch.m_onHover, (Delegate?)new TooltipCallback(component9.GetWriteHoverText));
			if (LongshipUpgrades.mapTableEnabled.Value)
			{
				Transform val57 = AddCollider(transform8, "mapTable_controller", typeof(BoxCollider));
				val57.localPosition = m_mapTable.transform.localPosition;
				val57.localScale = new Vector3(0.27f, 0.04f, 0.27f);
				val57.localEulerAngles = m_mapTable.transform.localEulerAngles;
				m_mapTableUpgrade = ((Component)val57).gameObject;
				m_mapTableUpgrade.layer = 16;
				m_mapTableUpgrade.SetActive(true);
				LongshipPartController longshipPartController12 = ((Component)val57).gameObject.AddComponent<LongshipPartController>();
				longshipPartController12.m_name = "$lu_part_maptable_name";
				longshipPartController12.m_nview = m_nview;
				longshipPartController12.AddUpgradeRequirement(s_mapTableUpgraded, "$lu_part_maptable_upgrade", LongshipUpgrades.ParseRequirements(LongshipUpgrades.mapTableUpgradeRecipe.Value), LongshipUpgrades.mapTableStation.Value, LongshipUpgrades.mapTableStationLvl.Value, LongshipUpgrades.mapTableStationRange.Value);
			}
		}
		void AddHealthController(Transform parent, int num2, string name, float offset)
		{
			//IL_0040: Unknown result type (might be due to invalid IL or missing references)
			//IL_0051: Unknown result type (might be due to invalid IL or missing references)
			//IL_0056: Unknown result type (might be due to invalid IL or missing references)
			GameObject val58 = Object.Instantiate<GameObject>(((Component)parent.GetChild(num2)).gameObject, healthParent, true);
			((Object)val58).name = ((num2 == 0) ? name : $"{name} ({num2})");
			Transform transform14 = val58.transform;
			transform14.localPosition += new Vector3(0f, 0f, offset);
			LongshipPartController longshipPartController13 = val58.gameObject.AddComponent<LongshipPartController>();
			longshipPartController13.m_nview = m_nview;
			longshipPartController13.m_name = "$lu_part_hull_name";
			longshipPartController13.AddUpgradeRequirement(s_healthUpgraded, "$lu_part_hull_upgrade1", LongshipUpgrades.ParseRequirements(LongshipUpgrades.healthUpgradeRecipe.Value), LongshipUpgrades.healthLvl1Station.Value, LongshipUpgrades.healthLvl1StationLvl.Value, LongshipUpgrades.healthLvl1StationRange.Value);
			if (LongshipUpgrades.healthUpgradeLvl2.Value != 0)
			{
				longshipPartController13.AddUpgradeRequirement(s_ashlandsUpgraded, Localization.instance.Localize("$lu_part_hull_upgrade2", new string[1] { LongshipUpgrades.ashlandsProtection.Value ? "\n$lu_part_hull_upgrade2_ashlands" : "" }), LongshipUpgrades.ParseRequirements(LongshipUpgrades.ashlandsUpgradeRecipe.Value), LongshipUpgrades.healthLvl2Station.Value, LongshipUpgrades.healthLvl2StationLvl.Value, LongshipUpgrades.healthLvl2StationRange.Value);
			}
			val58.gameObject.SetActive(true);
			val58.gameObject.layer = 16;
		}
	}

	public void OnDestroyed()
	{
		if (m_nview.IsValid() && m_nview.IsOwner())
		{
			DropItemStand();
			DropSpentUpgrades();
		}
	}

	private void DropItemStand()
	{
		//IL_0053: Unknown result type (might be due to invalid IL or missing references)
		//IL_0058: Unknown result type (might be due to invalid IL or missing references)
		//IL_005a: Unknown result type (might be due to invalid IL or missing references)
		//IL_005f: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c4: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c9: Unknown result type (might be due to invalid IL or missing references)
		//IL_00cb: Unknown result type (might be due to invalid IL or missing references)
		//IL_00db: Unknown result type (might be due to invalid IL or missing references)
		//IL_00e0: Unknown result type (might be due to invalid IL or missing references)
		//IL_00e2: Unknown result type (might be due to invalid IL or missing references)
		//IL_0116: Unknown result type (might be due to invalid IL or missing references)
		//IL_0120: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a2: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a7: Unknown result type (might be due to invalid IL or missing references)
		//IL_00b0: Unknown result type (might be due to invalid IL or missing references)
		//IL_00b5: Unknown result type (might be due to invalid IL or missing references)
		if (!Object.op_Implicit((Object)(object)m_trophyStand) || !m_trophyStand.HaveAttachment())
		{
			return;
		}
		GameObject itemPrefab = ObjectDB.instance.GetItemPrefab(m_trophyStand.GetAttachedItem());
		if (!Object.op_Implicit((Object)(object)itemPrefab))
		{
			return;
		}
		Vector3 val = Vector3.zero;
		Quaternion val2 = Quaternion.identity;
		Transform val3 = itemPrefab.transform.Find("attach");
		if (Object.op_Implicit((Object)(object)itemPrefab.transform.Find("attachobj")) && Object.op_Implicit((Object)(object)val3))
		{
			val2 = ((Component)val3).transform.localRotation;
			val = ((Component)val3).transform.localPosition;
		}
		GameObject val4 = Object.Instantiate<GameObject>(itemPrefab, m_trophyStand.m_dropSpawnPoint.position + val, m_trophyStand.m_dropSpawnPoint.rotation * val2);
		ItemDrop component = val4.GetComponent<ItemDrop>();
		component.LoadFromExternalZDO(m_trophyStand.m_nview.GetZDO());
		val4.GetComponent<Rigidbody>().linearVelocity = Vector3.up * 4f;
		if (Object.op_Implicit((Object)(object)m_destroyedLootPrefab))
		{
			Inventory val5 = SpawnContainer(m_destroyedLootPrefab);
			if (val5.AddItem(component.m_itemData))
			{
				ZNetScene.instance.Destroy(val4);
			}
		}
	}

	public void DropSpentUpgrades()
	{
		if (ZoneSystem.instance.GetGlobalKey((GlobalKeys)24))
		{
			return;
		}
		Dictionary<int, Requirement[]> dictionary = new Dictionary<int, Requirement[]>();
		LongshipPartController[] componentsInChildren = ((Component)this).GetComponentsInChildren<LongshipPartController>(true);
		foreach (LongshipPartController longshipPartController in componentsInChildren)
		{
			longshipPartController.AddSpentUpgrades(dictionary);
		}
		if (dictionary.Count != 0)
		{
			CollectionExtensions.Do<Requirement[]>((IEnumerable<Requirement[]>)dictionary.Values, (Action<Requirement[]>)((Requirement[] itemsToDrop) =>
			{
				DropRequirements(itemsToDrop.ToList());
			}));
		}
	}

	public void DropRequirements(List<Requirement> itemsToDrop)
	{
		//IL_00d3: Unknown result type (might be due to invalid IL or missing references)
		//IL_00d8: Unknown result type (might be due to invalid IL or missing references)
		//IL_00e2: Unknown result type (might be due to invalid IL or missing references)
		//IL_00e7: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ec: Unknown result type (might be due to invalid IL or missing references)
		//IL_00f6: Unknown result type (might be due to invalid IL or missing references)
		//IL_00fb: Unknown result type (might be due to invalid IL or missing references)
		//IL_0100: Unknown result type (might be due to invalid IL or missing references)
		//IL_0118: Unknown result type (might be due to invalid IL or missing references)
		//IL_011d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0135: Unknown result type (might be due to invalid IL or missing references)
		//IL_0137: Unknown result type (might be due to invalid IL or missing references)
		if (Object.op_Implicit((Object)(object)m_destroyedLootPrefab))
		{
			Inventory val = SpawnContainer(m_destroyedLootPrefab);
			while (itemsToDrop.Count > 0)
			{
				Requirement val2 = itemsToDrop[0];
				if (val2.m_amount <= 0)
				{
					itemsToDrop.RemoveAt(0);
				}
				else if (val.AddItem(ObjectDB.instance.GetItemPrefab(((Object)val2.m_resItem).name), 1))
				{
					val2.m_amount--;
				}
				else if (!val.HaveEmptySlot())
				{
					val = SpawnContainer(m_destroyedLootPrefab);
				}
				else
				{
					itemsToDrop.RemoveAt(0);
				}
			}
			return;
		}
		while (itemsToDrop.Count > 0)
		{
			Requirement val3 = itemsToDrop[0];
			while (val3.m_amount > 0)
			{
				Vector3 val4 = ((Component)this).transform.position + Vector3.up * 0.5f + Random.insideUnitSphere * 0.3f;
				Quaternion val5 = Quaternion.Euler(0f, (float)Random.Range(0, 360), 0f);
				ItemDrop component = Object.Instantiate<GameObject>(ObjectDB.instance.GetItemPrefab(((Object)val3.m_resItem).name), val4, val5).GetComponent<ItemDrop>();
				if ((Object)(object)component == (Object)null)
				{
					break;
				}
				component.SetStack(val3.m_amount);
				val3.m_amount -= component.m_itemData.m_stack;
			}
			itemsToDrop.RemoveAt(0);
		}
	}

	public Inventory SpawnContainer(GameObject lootContainerPrefab)
	{
		//IL_0007: Unknown result type (might be due to invalid IL or missing references)
		//IL_000c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0016: Unknown result type (might be due to invalid IL or missing references)
		//IL_001b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0020: Unknown result type (might be due to invalid IL or missing references)
		//IL_0022: Unknown result type (might be due to invalid IL or missing references)
		//IL_0023: Unknown result type (might be due to invalid IL or missing references)
		Vector3 val = ((Component)this).transform.position + Random.insideUnitSphere * 1f;
		return Object.Instantiate<GameObject>(lootContainerPrefab, val, Random.rotation).GetComponent<Container>().GetInventory();
	}

	public bool IsTentActive()
	{
		return (Object)(object)m_tent != (Object)null && m_tent.activeInHierarchy;
	}

	public bool IsHeatActive()
	{
		return (Object)(object)m_fireWarmth != (Object)null && m_fireWarmth.m_isHeatType;
	}

	private static bool IsNightTime()
	{
		return EnvMan.IsNight();
	}

	private static bool IsTimeToLight()
	{
		if (!EnvMan.IsDaylight() || !Object.op_Implicit((Object)(object)EnvMan.instance))
		{
			return true;
		}
		float dayFraction = EnvMan.instance.GetDayFraction();
		if (!(dayFraction <= 0.28f))
		{
			return dayFraction >= 0.71f;
		}
		return true;
	}

	internal static void OnGlobalStart()
	{
		shaderStandard = null;
		isNightTime = false;
		isTimeToLight = true;
		FixPrefab();
	}

	internal static void OnGlobalDestroy()
	{
		shaderStandard = null;
		PrefabAudio.Clear();
		partEffects.m_effectPrefabs = Array.Empty<EffectData>();
		s_lanternPrefab = null;
		s_turretPrefab = null;
		s_standBossDragonPrefab = null;
		s_wisptorchPrefab = null;
		Object.Destroy((Object)(object)s_mapTablePrefab);
		s_mapTablePrefab = null;
	}

	private static void FixPrefab()
	{
		//IL_017e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0183: Unknown result type (might be due to invalid IL or missing references)
		//IL_0194: Expected Obj, but got Unknown
		//IL_00f5: Unknown result type (might be due to invalid IL or missing references)
		//IL_00fa: Unknown result type (might be due to invalid IL or missing references)
		//IL_010b: Expected Obj, but got Unknown
		//IL_023b: Unknown result type (might be due to invalid IL or missing references)
		//IL_024f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0254: Unknown result type (might be due to invalid IL or missing references)
		//IL_0282: Unknown result type (might be due to invalid IL or missing references)
		//IL_0296: Unknown result type (might be due to invalid IL or missing references)
		//IL_029b: Unknown result type (might be due to invalid IL or missing references)
		//IL_02bb: Unknown result type (might be due to invalid IL or missing references)
		//IL_02cf: Unknown result type (might be due to invalid IL or missing references)
		//IL_02d4: Unknown result type (might be due to invalid IL or missing references)
		//IL_02e2: Unknown result type (might be due to invalid IL or missing references)
		//IL_02f6: Unknown result type (might be due to invalid IL or missing references)
		//IL_02fb: Unknown result type (might be due to invalid IL or missing references)
		//IL_0349: Unknown result type (might be due to invalid IL or missing references)
		//IL_035d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0362: Unknown result type (might be due to invalid IL or missing references)
		//IL_037e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0392: Unknown result type (might be due to invalid IL or missing references)
		//IL_0397: Unknown result type (might be due to invalid IL or missing references)
		//IL_03b7: Unknown result type (might be due to invalid IL or missing references)
		//IL_03cb: Unknown result type (might be due to invalid IL or missing references)
		//IL_03d0: Unknown result type (might be due to invalid IL or missing references)
		//IL_03de: Unknown result type (might be due to invalid IL or missing references)
		//IL_03f2: Unknown result type (might be due to invalid IL or missing references)
		//IL_03f7: Unknown result type (might be due to invalid IL or missing references)
		ZNetScene instance = ZNetScene.instance;
		object obj = ((instance != null) ? instance.GetPrefab("VikingShip") : null);
		if (obj == null)
		{
			Ship? val = Resources.FindObjectsOfTypeAll<Ship>().FirstOrDefault((Ship ws) => ((Object)ws).name == "VikingShip");
			obj = ((val != null) ? ((Component)val).gameObject : null);
		}
		GameObject val2 = (GameObject)obj;
		if ((Object)(object)val2 == (Object)null)
		{
			return;
		}
		shaderStandard = ((Renderer)((Component)val2.transform.Find("piece_chest/visual/Cube")).GetComponent<MeshRenderer>()).sharedMaterial.shader;
		Transform val3 = val2.transform.Find("ship/visual/Customize/storage");
		for (int num = 0; num < val3.childCount; num++)
		{
			Transform child = val3.GetChild(num);
			if (((Object)child).name.StartsWith("default"))
			{
				MeshRenderer component = ((Component)child).GetComponent<MeshRenderer>();
				if ((Object)(object)storageSharedMaterial == (Object)null || storageSharedMaterial == null)
				{
					storageSharedMaterial = new Material(((Renderer)component).sharedMaterial)
					{
						shader = shaderStandard
					};
				}
				else
				{
					storageSharedMaterial.shader = shaderStandard;
				}
				((Renderer)component).sharedMaterial = storageSharedMaterial;
			}
		}
		MeshRenderer component2 = ((Component)val2.transform.Find("ship/visual/hull_worn/plank")).GetComponent<MeshRenderer>();
		if ((Object)(object)plankSharedMaterial == (Object)null || plankSharedMaterial == null)
		{
			plankSharedMaterial = new Material(((Renderer)component2).sharedMaterial)
			{
				shader = shaderStandard
			};
		}
		else
		{
			plankSharedMaterial.shader = shaderStandard;
		}
		((Renderer)component2).sharedMaterial = plankSharedMaterial;
		((Renderer)((Component)val2.transform.Find("ship/visual/hull_worn/plank (1)")).GetComponent<MeshRenderer>()).sharedMaterial = plankSharedMaterial;
		((Renderer)((Component)val2.transform.Find("ship/visual/hull_broken/plank")).GetComponent<MeshRenderer>()).sharedMaterial = plankSharedMaterial;
		((Renderer)((Component)val2.transform.Find("ship/visual/hull_broken/plank (1)")).GetComponent<MeshRenderer>()).sharedMaterial = plankSharedMaterial;
		if (!prefabInitialized)
		{
			prefabInitialized = true;
			Transform val4 = val2.transform.Find("ship/visual/Customize/ShipTen2_beam");
			val4.localPosition += new Vector3(0f, 0.1f, 0f);
			((Component)val4).gameObject.layer = 28;
			Transform val5 = val2.transform.Find("ship/visual/Customize/ShipTen2 (1)");
			val5.localPosition += new Vector3(0f, 0.08f, 0f);
			Transform val6 = val2.transform.Find("OnboardTrigger");
			val6.localScale += new Vector3(0.1f, 2f, 0f);
			val6.localPosition += new Vector3(-0.05f, 1f, 0f);
			Material sharedMaterial = ((Renderer)((Component)val5).GetComponentInChildren<MeshRenderer>()).sharedMaterial;
			sharedMaterial.SetFloat("_RippleSpeed", 75f);
			sharedMaterial.SetFloat("_RippleDistance", 1.25f);
			Transform val7 = val2.transform.Find("ship/visual/Mast");
			val7.localPosition += new Vector3(0f, 0.21f, 0f);
			Transform val8 = val2.transform.Find("ship/visual/Customize/ShipTentHolders");
			val8.localPosition += new Vector3(0f, 0.01f, 0f);
			Transform val9 = val2.transform.Find("ship/visual/Customize/ShipTentHolders (1)");
			val9.localPosition += new Vector3(0.1f, -0.18f, 0.11f);
			val9.localEulerAngles += new Vector3(0f, 5f, 6.6f);
			Transform val10 = val2.transform.Find("ship/visual/Customize/TraderLamp");
			((Component)val10).gameObject.SetActive(false);
			prefabInit = true;
			val2.AddComponent<LongshipCustomizableParts>();
			prefabInit = false;
		}
	}

	private static Transform AddCollider(Transform transform, string name, Type type)
	{
		//IL_000c: Unknown result type (might be due to invalid IL or missing references)
		Transform transform2 = new GameObject(name, new Type[1] { type }).transform;
		transform2.SetParent(transform, false);
		((Component)transform2).gameObject.layer = 28;
		return transform2;
	}

	internal static void AddCustomTent(string filename)
	{
		AddCustomTexture(customTents, filename);
	}

	internal static void AddCustomSail(string filename)
	{
		AddCustomTexture(customSails, filename);
	}

	internal static void AddCustomShields(string filename)
	{
		AddCustomTexture(customShields, filename);
	}

	private static void AddCustomTexture(List<Texture2D> list, string filename)
	{
		//IL_0003: Unknown result type (might be due to invalid IL or missing references)
		//IL_0009: Expected Obj, but got Unknown
		Texture2D tex = new Texture2D(2, 2);
		if (LongshipUpgrades.LoadTextureFromConfigDirectory(filename, ref tex))
		{
			list.Add(tex);
		}
	}

	private static void CheckEffects()
	{
		List<EffectData> effectPrefabs;
		if (!partEffects.HasEffects())
		{
			effectPrefabs = new List<EffectData>();
			AddEffect(0, "vfx_Place_HildirFabricRoll");
			AddEffect(1, "sfx_gui_repairitem_workbench");
			AddEffect(2, "sfx_FireAddFuel");
			AddEffect(3, "fx_candle_off");
			AddEffect(4, "fx_guardstone_permitted_add");
			AddEffect(5, "fx_guardstone_permitted_removed");
			AddEffect(6, "sfx_demister_start");
			partEffects.m_effectPrefabs = effectPrefabs.ToArray();
		}
		void AddEffect(int variant, string prefabName)
		{
			//IL_0019: Unknown result type (might be due to invalid IL or missing references)
			//IL_001e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0025: Unknown result type (might be due to invalid IL or missing references)
			//IL_0032: Unknown result type (might be due to invalid IL or missing references)
			//IL_003e: Expected Obj, but got Unknown
			GameObject val = PrefabAudio.Clone(ZNetScene.instance.GetPrefab(prefabName));
			effectPrefabs.Insert(variant, new EffectData
			{
				m_prefab = val,
				m_enabled = ((Object)(object)val != (Object)null),
				m_variant = variant
			});
		}
	}

	internal static void UpdatePropertyBlocks(GameObject go)
	{
		if (s_allInstances.TryGetValue(go, out var value))
		{
			value.UpdatePropertyBlocks();
		}
	}

	internal static void CombinePropertyBlocks(GameObject go, MaterialPropertyBlock propertyBlockToCombine)
	{
		if (s_allInstances.TryGetValue(go, out var value))
		{
			value.CombinePropertyBlocks(propertyBlockToCombine);
		}
	}

	internal static bool HasShipComponent(GameObject go)
	{
		return s_allInstances.ContainsKey(go);
	}

	internal static bool TryGetShipComponent(Ship ship, out LongshipCustomizableParts parts)
	{
		return s_allInstances.TryGetValue(((Component)ship).gameObject, out parts) || ((Component)ship).TryGetComponent<LongshipCustomizableParts>(ref parts);
	}

	public static Vector3 ParseVector3(string rString)
	{
		//IL_0052: Unknown result type (might be due to invalid IL or missing references)
		//IL_0057: Unknown result type (might be due to invalid IL or missing references)
		//IL_005b: Unknown result type (might be due to invalid IL or missing references)
		string[] array = rString.Substring(1, rString.Length - 2).Split(',');
		float num = float.Parse(array[0].Replace('.', ','));
		float num2 = float.Parse(array[1].Replace('.', ','));
		float num3 = float.Parse(array[2].Replace('.', ','));
		return new Vector3(num, num2, num3);
	}

	private static void GetHildirMapTable()
	{
		//IL_006a: Unknown result type (might be due to invalid IL or missing references)
		//IL_016a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0185: Unknown result type (might be due to invalid IL or missing references)
		//IL_01f3: Unknown result type (might be due to invalid IL or missing references)
		//IL_020f: Unknown result type (might be due to invalid IL or missing references)
		if (!Object.op_Implicit((Object)(object)s_mapTablePrefab))
		{
			ZoneLocation val = ZoneSystem.instance.m_locations.Find((ZoneLocation loc) => loc.m_prefabName == "Hildir_camp");
			if (val != null && val.m_prefab.IsValid)
			{
				val.m_prefab.Load();
				Transform val2 = val.m_prefab.Asset.transform.Find("stuff/hildir_maptable");
				s_mapTablePrefab = Object.Instantiate<GameObject>((val2 != null) ? ((Component)val2).gameObject : null);
				((Object)s_mapTablePrefab).name = "LongshipUpgrades_MapTable";
				s_mapTablePrefab.SetActive(false);
				Transform val3 = s_mapTablePrefab.transform.Find("default");
				LongshipUpgrades.FixMeshRendererProperties(((Component)val3).GetComponent<MeshRenderer>());
				val.m_prefab.Release();
				Object.DestroyImmediate((Object)(object)((Component)val3).GetComponent<MeshCollider>());
				Object.DestroyImmediate((Object)(object)s_mapTablePrefab.GetComponent<Vegvisir>());
				Object.DestroyImmediate((Object)(object)s_mapTablePrefab.GetComponent<LODGroup>());
				Transform val4 = s_mapTablePrefab.transform.Find("low");
				Object.DestroyImmediate((Object)(object)((val4 != null) ? ((Component)val4).gameObject : null));
				Transform val5 = AddCollider(s_mapTablePrefab.transform, "ReadMap", typeof(BoxCollider));
				val5.localPosition = new Vector3(-0.2f, 0.9f, 0f);
				val5.localScale = new Vector3(0.4f, 0.1f, 0.6f);
				Switch val6 = ((Component)val5).gameObject.AddComponent<Switch>();
				val6.m_name = "$piece_cartographytable";
				((Component)val5).gameObject.layer = 28;
				((Component)val5).gameObject.SetActive(true);
				Transform val7 = AddCollider(s_mapTablePrefab.transform, "WriteMap", typeof(BoxCollider));
				val7.localPosition = new Vector3(0.2f, 0.9f, 0f);
				val7.localScale = new Vector3(0.4f, 0.1f, 0.6f);
				Switch val8 = ((Component)val7).gameObject.AddComponent<Switch>();
				val8.m_name = "$piece_cartographytable";
				((Component)val7).gameObject.layer = 28;
				((Component)val7).gameObject.SetActive(true);
				MapTable val9 = s_mapTablePrefab.AddComponent<MapTable>();
				GameObject prefab = ZNetScene.instance.GetPrefab("piece_cartographytable");
				val9.m_writeEffects = ((prefab == null) ? null : prefab.GetComponent<MapTable>()?.m_writeEffects);
				val9.m_name = "$piece_cartographytable";
			}
		}
	}

	static LongshipCustomizableParts()
	{
		//IL_015e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0168: Expected Obj, but got Unknown
		//IL_016a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0174: Expected Obj, but got Unknown
		//IL_019c: Unknown result type (might be due to invalid IL or missing references)
		//IL_01a6: Expected Obj, but got Unknown
		//IL_01b8: Unknown result type (might be due to invalid IL or missing references)
		//IL_01c2: Unknown result type (might be due to invalid IL or missing references)
		//IL_01ca: Unknown result type (might be due to invalid IL or missing references)
		//IL_01cf: Unknown result type (might be due to invalid IL or missing references)
	}
}
