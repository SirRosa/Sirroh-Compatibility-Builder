using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UnityEngine;

namespace LongshipUpgrades;

public class ShipTurret : MonoBehaviour, Hoverable, Interactable
{
	public string m_name = "$piece_turret";

	public ZNetView m_nview;

	[Header("Turret")]
	public GameObject m_turretBody;

	public GameObject m_turretBodyArmed;

	public GameObject m_turretBodyUnarmed;

	public GameObject m_turretNeck;

	public GameObject m_eye;

	[Header("Look & Scan")]
	public float m_turnRate = 50f;

	public float m_horizontalAngle = 60f;

	public float m_verticalAngle = 70f;

	public float m_viewDistance = 30f;

	public float m_noTargetScanRate = 7f;

	public float m_lookAcceleration = 1.4f;

	public float m_lookDeacceleration = 0.05f;

	public float m_lookMinDegreesDelta = 0.005f;

	[Header("Attack Settings (rest in projectile)")]
	public ItemDrop m_defaultAmmo;

	public float m_attackCooldown = 2f;

	public float m_attackWarmup = 1f;

	public float m_hitNoise = 10f;

	public float m_shootWhenAimDiff = 0.99998f;

	public float m_predictionModifier = 2f;

	public float m_updateTargetIntervalNear = 1f;

	public float m_updateTargetIntervalFar = 4f;

	[Header("Ammo")]
	public int m_maxAmmo = 100;

	public string m_ammoType = "$ammo_turretbolt";

	public List<AmmoType> m_allowedAmmo = new List<AmmoType>();

	public bool m_returnAmmoOnDestroy = true;

	public float m_holdRepeatInterval = 0.2f;

	[Header("Target mode: Everything")]
	public bool m_targetEnemies = true;

	[Header("Target mode: Configured")]
	public bool m_targetTamedConfig = true;

	public List<TrophyTarget> m_configTargets = new List<TrophyTarget>();

	public int m_maxConfigTargets = 1;

	public GameObject m_lastProjectile;

	public ItemData m_lastAmmo;

	public Character m_target;

	public bool m_haveTarget;

	public Quaternion m_lastRotation;

	public float m_aimDiffToTarget;

	public float m_updateTargetTimer;

	public float m_lastUseTime;

	public float m_scan;

	public readonly List<ItemDrop> m_targetItems = new List<ItemDrop>();

	public readonly List<Character> m_targetCharacters = new List<Character>();

	public string m_targetsText;

	public readonly StringBuilder sb = new StringBuilder(20);

	public uint m_lastUpdateTargetRevision = uint.MaxValue;

	public int m_scanDirection = 1;

	public float m_scanDistance = 1f;

	public bool m_isLeftTurret;

	public float m_hoverOffset;

	public static readonly int s_lastAttackLeft = StringExtensionMethods.GetStableHashCode("lastAttackLeft");

	public static readonly int s_lastAttackRight = StringExtensionMethods.GetStableHashCode("lastAttackRight");

	public static readonly int s_targetsLeft = StringExtensionMethods.GetStableHashCode("targetsLeft");

	public static readonly int s_targetsRight = StringExtensionMethods.GetStableHashCode("targetsRight");

	[Header("Effects")]
	public static EffectList m_shootEffect = new EffectList();

	public static EffectList m_addAmmoEffect = new EffectList();

	public static EffectList m_reloadEffect = new EffectList();

	public static EffectList m_warmUpStartEffect = new EffectList();

	public static EffectList m_newTargetEffect = new EffectList();

	public static EffectList m_lostTargetEffect = new EffectList();

	public static EffectList m_setTargetEffect = new EffectList();

	public GameObject m_destroyedLootPrefab;

	public ShipTurret SetPositionAtShip(bool isLeft)
	{
		m_isLeftTurret = isLeft;
		if (m_isLeftTurret)
		{
			m_scanDirection = -1;
			m_scan = m_noTargetScanRate * 0.05f;
			WearNTear componentInParent = ((Component)this).GetComponentInParent<WearNTear>();
			if (Object.op_Implicit((Object)(object)componentInParent))
			{
				componentInParent.m_onDestroyed = (Action)Delegate.Combine(componentInParent.m_onDestroyed, new Action(OnDestroyed));
			}
		}
		if (Object.op_Implicit((Object)(object)m_nview) && m_nview.IsValid())
		{
			m_nview.Register<ZDOID>(GetNameSetTargetRPC(), (Action<long, ZDOID>)RPC_SetTarget);
			if (m_isLeftTurret)
			{
				m_nview.Register<string>("RPC_AddAmmo", (Action<long, string>)RPC_AddAmmo);
			}
		}
		return this;
	}

	public ShipTurret FillAllowedAmmo(List<AmmoType> turretList)
	{
		//IL_000d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0012: Unknown result type (might be due to invalid IL or missing references)
		//IL_001c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0024: Unknown result type (might be due to invalid IL or missing references)
		//IL_003c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0056: Unknown result type (might be due to invalid IL or missing references)
		foreach (AmmoType turret in turretList)
		{
			m_allowedAmmo.Add(new AmmoType
			{
				m_ammo = turret.m_ammo,
				m_visual = ((Component)m_turretBody.transform.Find(((Object)turret.m_visual).name)).gameObject
			});
		}
		if (Object.op_Implicit((Object)(object)m_nview) && m_nview.IsValid())
		{
			UpdateVisualBolt();
		}
		return this;
	}

	public ShipTurret FillTrophyTargets(List<TrophyTarget> trophyTargets)
	{
		//IL_000d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0012: Unknown result type (might be due to invalid IL or missing references)
		//IL_001c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0024: Unknown result type (might be due to invalid IL or missing references)
		//IL_0031: Unknown result type (might be due to invalid IL or missing references)
		//IL_003e: Unknown result type (might be due to invalid IL or missing references)
		//IL_004e: Unknown result type (might be due to invalid IL or missing references)
		foreach (TrophyTarget trophyTarget in trophyTargets)
		{
			m_configTargets.Add(new TrophyTarget
			{
				m_nameOverride = trophyTarget.m_nameOverride,
				m_item = trophyTarget.m_item,
				m_targets = trophyTarget.m_targets.ToList()
			});
		}
		if (Object.op_Implicit((Object)(object)m_nview) && m_nview.IsValid())
		{
			ReadTargets();
		}
		return this;
	}

	public void Awake()
	{
		m_nview = ((Component)this).GetComponentInParent<ZNetView>();
		m_turretBody = ((Component)((Component)this).transform.Find("BodyRotation")).gameObject;
		m_turretBodyArmed = ((Component)((Component)this).transform.Find("BodyRotation/Body")).gameObject;
		m_turretBodyUnarmed = ((Component)((Component)this).transform.Find("BodyRotation/Body_Unarmed")).gameObject;
		m_turretNeck = ((Component)((Component)this).transform.Find("NeckRotation")).gameObject;
		m_eye = ((Component)((Component)this).transform.Find("BodyRotation/Eye")).gameObject;
		m_updateTargetTimer = Random.Range(0f, m_updateTargetIntervalNear);
		ReadTargets();
	}

	public void FixedUpdate()
	{
		float fixedDeltaTime = Time.fixedDeltaTime;
		UpdateReloadState();
		if (!m_nview.IsValid())
		{
			return;
		}
		UpdateTurretRotation(fixedDeltaTime);
		UpdateVisualBolt();
		if (!m_nview.IsOwner())
		{
			if (m_nview.IsValid() && m_lastUpdateTargetRevision != m_nview.GetZDO().DataRevision)
			{
				m_lastUpdateTargetRevision = m_nview.GetZDO().DataRevision;
				ReadTargets();
			}
		}
		else
		{
			UpdateTarget(fixedDeltaTime);
			UpdateAttack();
		}
	}

	public void UpdateTurretRotation(float dt)
	{
		//IL_0211: Unknown result type (might be due to invalid IL or missing references)
		//IL_0225: Unknown result type (might be due to invalid IL or missing references)
		//IL_022a: Unknown result type (might be due to invalid IL or missing references)
		//IL_022f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0239: Unknown result type (might be due to invalid IL or missing references)
		//IL_023a: Unknown result type (might be due to invalid IL or missing references)
		//IL_023f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0244: Unknown result type (might be due to invalid IL or missing references)
		//IL_0247: Unknown result type (might be due to invalid IL or missing references)
		//IL_024c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0253: Unknown result type (might be due to invalid IL or missing references)
		//IL_0258: Unknown result type (might be due to invalid IL or missing references)
		//IL_025c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0353: Unknown result type (might be due to invalid IL or missing references)
		//IL_0358: Unknown result type (might be due to invalid IL or missing references)
		//IL_035a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0379: Unknown result type (might be due to invalid IL or missing references)
		//IL_037e: Unknown result type (might be due to invalid IL or missing references)
		//IL_038c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0391: Unknown result type (might be due to invalid IL or missing references)
		//IL_03a1: Unknown result type (might be due to invalid IL or missing references)
		//IL_03c4: Unknown result type (might be due to invalid IL or missing references)
		//IL_03d3: Unknown result type (might be due to invalid IL or missing references)
		//IL_028f: Unknown result type (might be due to invalid IL or missing references)
		//IL_01ab: Unknown result type (might be due to invalid IL or missing references)
		//IL_01b0: Unknown result type (might be due to invalid IL or missing references)
		//IL_01b4: Unknown result type (might be due to invalid IL or missing references)
		//IL_03e9: Unknown result type (might be due to invalid IL or missing references)
		//IL_03eb: Unknown result type (might be due to invalid IL or missing references)
		//IL_0092: Unknown result type (might be due to invalid IL or missing references)
		//IL_0097: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a7: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ac: Unknown result type (might be due to invalid IL or missing references)
		//IL_00d4: Unknown result type (might be due to invalid IL or missing references)
		//IL_00db: Unknown result type (might be due to invalid IL or missing references)
		//IL_00e6: Unknown result type (might be due to invalid IL or missing references)
		//IL_00eb: Unknown result type (might be due to invalid IL or missing references)
		//IL_00f8: Unknown result type (might be due to invalid IL or missing references)
		//IL_00fd: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ff: Unknown result type (might be due to invalid IL or missing references)
		//IL_010f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0114: Unknown result type (might be due to invalid IL or missing references)
		//IL_0119: Unknown result type (might be due to invalid IL or missing references)
		//IL_01f6: Unknown result type (might be due to invalid IL or missing references)
		//IL_01fb: Unknown result type (might be due to invalid IL or missing references)
		//IL_0200: Unknown result type (might be due to invalid IL or missing references)
		//IL_0205: Unknown result type (might be due to invalid IL or missing references)
		//IL_02de: Unknown result type (might be due to invalid IL or missing references)
		//IL_02ed: Unknown result type (might be due to invalid IL or missing references)
		//IL_02f3: Unknown result type (might be due to invalid IL or missing references)
		//IL_02fa: Unknown result type (might be due to invalid IL or missing references)
		//IL_031d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0332: Unknown result type (might be due to invalid IL or missing references)
		//IL_0338: Unknown result type (might be due to invalid IL or missing references)
		//IL_033f: Unknown result type (might be due to invalid IL or missing references)
		if (IsCoolingDown())
		{
			return;
		}
		bool flag = false;
		Vector3 val2;
		Quaternion rotation;
		if (HasAmmoAndEnabled())
		{
			flag = Object.op_Implicit((Object)(object)m_target);
			if (flag)
			{
				if (m_lastAmmo == null)
				{
					m_lastAmmo = GetAmmoItem();
				}
				if (m_lastAmmo == null)
				{
					LongshipUpgrades.LogWarning("Turret had invalid ammo, resetting ammo");
					m_nview.GetZDO().Set(ZDOVars.s_ammo, 0, false);
					return;
				}
				float num = Vector2.Distance(Vector2.op_Implicit(((Component)m_target).transform.position), Vector2.op_Implicit(m_eye.transform.position)) / m_lastAmmo.m_shared.m_attack.m_projectileVel;
				Vector3 val = m_target.GetVelocity() * num * m_predictionModifier;
				val2 = ((Component)m_target).transform.position + val - m_turretBody.transform.position;
				CapsuleCollider componentInChildren = ((Component)m_target).GetComponentInChildren<CapsuleCollider>();
				val2.y += (Object.op_Implicit((Object)(object)componentInChildren) ? (componentInChildren.height / 2f) : 1f);
			}
			else
			{
				m_scan += dt;
				if (m_scan > m_noTargetScanRate * 2f)
				{
					m_scan = 0f;
					m_scanDistance = Random.Range(0.5f, 1f);
				}
				rotation = ((Component)this).transform.rotation;
				val2 = Quaternion.Euler(0f, rotation.eulerAngles.y + (float)((m_scan - m_noTargetScanRate > 0f) ? m_scanDirection : (-m_scanDirection)) * m_horizontalAngle * m_scanDistance, 0f) * Vector3.forward;
			}
		}
		else
		{
			val2 = ((Component)this).transform.forward + new Vector3(0f, -0.3f, 0f);
		}
		val2.Normalize();
		Quaternion val3 = Quaternion.LookRotation(val2, Vector3.up);
		Vector3 eulerAngles = val3.eulerAngles;
		rotation = ((Component)this).transform.rotation;
		float y = rotation.eulerAngles.y;
		eulerAngles.y -= y;
		if (m_horizontalAngle >= 0f)
		{
			float num2 = eulerAngles.y;
			if (num2 > 180f)
			{
				num2 -= 360f;
			}
			else if (num2 < -180f)
			{
				num2 += 360f;
			}
			if (num2 > m_horizontalAngle)
			{
				eulerAngles = new Vector3(eulerAngles.x, m_horizontalAngle + y, eulerAngles.z);
				val3.eulerAngles = eulerAngles;
			}
			else if (num2 < 0f - m_horizontalAngle)
			{
				eulerAngles = new Vector3(eulerAngles.x, 0f - m_horizontalAngle + y, eulerAngles.z);
				val3.eulerAngles = eulerAngles;
			}
		}
		Quaternion val4 = Utils.RotateTorwardsSmooth(m_turretBody.transform.rotation, val3, m_lastRotation, m_turnRate * dt, m_lookAcceleration, m_lookDeacceleration, m_lookMinDegreesDelta);
		m_lastRotation = m_turretBody.transform.rotation;
		m_turretBody.transform.rotation = val4;
		m_turretNeck.transform.localEulerAngles = new Vector3(0f, m_turretBody.transform.localEulerAngles.y, 0f);
		m_aimDiffToTarget = (flag ? Math.Abs(Quaternion.Dot(val4, val3)) : (-1f));
	}

	public void UpdateTarget(float dt)
	{
		//IL_008f: Unknown result type (might be due to invalid IL or missing references)
		//IL_004b: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c4: Unknown result type (might be due to invalid IL or missing references)
		//IL_0225: Unknown result type (might be due to invalid IL or missing references)
		//IL_0241: Unknown result type (might be due to invalid IL or missing references)
		//IL_024c: Unknown result type (might be due to invalid IL or missing references)
		//IL_025a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0260: Unknown result type (might be due to invalid IL or missing references)
		//IL_016e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0179: Unknown result type (might be due to invalid IL or missing references)
		//IL_0187: Unknown result type (might be due to invalid IL or missing references)
		//IL_018d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0138: Unknown result type (might be due to invalid IL or missing references)
		//IL_0143: Unknown result type (might be due to invalid IL or missing references)
		//IL_0151: Unknown result type (might be due to invalid IL or missing references)
		//IL_0157: Unknown result type (might be due to invalid IL or missing references)
		//IL_01c1: Unknown result type (might be due to invalid IL or missing references)
		//IL_01b8: Unknown result type (might be due to invalid IL or missing references)
		if (!m_nview.IsValid())
		{
			return;
		}
		if (!HasAmmoAndEnabled())
		{
			if (m_haveTarget)
			{
				m_nview.InvokeRPC(ZNetView.Everybody, GetNameSetTargetRPC(), new object[1] { ZDOID.None });
			}
			return;
		}
		m_updateTargetTimer -= dt;
		if (m_updateTargetTimer <= 0f)
		{
			m_updateTargetTimer = (Character.IsCharacterInRange(((Component)this).transform.position, 40f) ? m_updateTargetIntervalNear : m_updateTargetIntervalFar);
			Character val = BaseAI.FindClosestCreature(((Component)this).transform, m_eye.transform.position, 0f, m_viewDistance, m_horizontalAngle, false, false, true, false, m_targetItems.Count > 0 && m_targetTamedConfig, m_targetEnemies, m_targetCharacters);
			if ((Object)(object)val != (Object)(object)m_target)
			{
				if (Object.op_Implicit((Object)(object)val))
				{
					m_newTargetEffect.Create(((Component)this).transform.position, ((Component)this).transform.rotation, (Transform)null, 1f, -1, default(ZDOID));
				}
				else
				{
					m_lostTargetEffect.Create(((Component)this).transform.position, ((Component)this).transform.rotation, (Transform)null, 1f, -1, default(ZDOID));
				}
				m_nview.InvokeRPC(ZNetView.Everybody, GetNameSetTargetRPC(), new object[1] { Object.op_Implicit((Object)(object)val) ? val.GetZDOID() : ZDOID.None });
			}
		}
		if (m_haveTarget && (!Object.op_Implicit((Object)(object)m_target) || m_target.IsDead()))
		{
			LongshipUpgrades.LogInfo("Target is gone");
			m_nview.InvokeRPC(ZNetView.Everybody, GetNameSetTargetRPC(), new object[1] { ZDOID.None });
			m_lostTargetEffect.Create(((Component)this).transform.position, ((Component)this).transform.rotation, (Transform)null, 1f, -1, default(ZDOID));
		}
	}

	public void UpdateAttack()
	{
		if (Object.op_Implicit((Object)(object)m_target) && !(m_aimDiffToTarget < m_shootWhenAimDiff) && HasAmmoAndEnabled() && !IsCoolingDown())
		{
			ShootProjectile();
		}
	}

	public void ShootProjectile()
	{
		//IL_0013: Unknown result type (might be due to invalid IL or missing references)
		//IL_0019: Unknown result type (might be due to invalid IL or missing references)
		//IL_0027: Unknown result type (might be due to invalid IL or missing references)
		//IL_002d: Unknown result type (might be due to invalid IL or missing references)
		//IL_011e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0123: Unknown result type (might be due to invalid IL or missing references)
		//IL_0125: Unknown result type (might be due to invalid IL or missing references)
		//IL_0127: Unknown result type (might be due to invalid IL or missing references)
		//IL_012c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0131: Unknown result type (might be due to invalid IL or missing references)
		//IL_0159: Unknown result type (might be due to invalid IL or missing references)
		//IL_015e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0163: Unknown result type (might be due to invalid IL or missing references)
		//IL_0174: Unknown result type (might be due to invalid IL or missing references)
		//IL_0176: Unknown result type (might be due to invalid IL or missing references)
		//IL_017b: Unknown result type (might be due to invalid IL or missing references)
		//IL_017d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0182: Unknown result type (might be due to invalid IL or missing references)
		//IL_0184: Unknown result type (might be due to invalid IL or missing references)
		//IL_0186: Unknown result type (might be due to invalid IL or missing references)
		//IL_0188: Unknown result type (might be due to invalid IL or missing references)
		//IL_018d: Unknown result type (might be due to invalid IL or missing references)
		//IL_01a6: Unknown result type (might be due to invalid IL or missing references)
		//IL_01ac: Unknown result type (might be due to invalid IL or missing references)
		//IL_01bb: Unknown result type (might be due to invalid IL or missing references)
		//IL_01c0: Unknown result type (might be due to invalid IL or missing references)
		//IL_01d7: Unknown result type (might be due to invalid IL or missing references)
		//IL_01ed: Unknown result type (might be due to invalid IL or missing references)
		//IL_0203: Unknown result type (might be due to invalid IL or missing references)
		//IL_021e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0253: Unknown result type (might be due to invalid IL or missing references)
		//IL_0269: Unknown result type (might be due to invalid IL or missing references)
		//IL_027f: Unknown result type (might be due to invalid IL or missing references)
		//IL_028b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0290: Unknown result type (might be due to invalid IL or missing references)
		//IL_0295: Unknown result type (might be due to invalid IL or missing references)
		//IL_02a1: Unknown result type (might be due to invalid IL or missing references)
		//IL_02a4: Unknown result type (might be due to invalid IL or missing references)
		//IL_02ab: Expected Obj, but got Unknown
		//IL_02b8: Unknown result type (might be due to invalid IL or missing references)
		//IL_030e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0325: Unknown result type (might be due to invalid IL or missing references)
		Transform transform = m_eye.transform;
		m_shootEffect.Create(transform.position, transform.rotation, (Transform)null, 1f, -1, default(ZDOID));
		m_nview.GetZDO().Set(GetLastAttackZDO(), (float)ZNet.instance.GetTimeSeconds());
		m_lastAmmo = GetAmmoItem();
		int ammo = GetAmmo();
		int num = Mathf.Min(1, (m_maxAmmo == 0) ? m_lastAmmo.m_shared.m_attack.m_projectiles : Mathf.Min(ammo, m_lastAmmo.m_shared.m_attack.m_projectiles));
		if (m_maxAmmo > 0)
		{
			m_nview.GetZDO().Set(ZDOVars.s_ammo, ammo - num, false);
		}
		LongshipUpgrades.LogInfo(string.Format("Turret '{0}' is shooting {1} projectiles, ammo: {2}/{3}", new object[4]
		{
			((Object)this).name,
			num,
			ammo,
			m_maxAmmo
		}));
		for (int i = 0; i < num; i++)
		{
			Vector3 forward = transform.forward;
			Vector3 val = Vector3.Cross(forward, Vector3.up);
			float projectileAccuracy = m_lastAmmo.m_shared.m_attack.m_projectileAccuracy;
			Quaternion val2 = Quaternion.AngleAxis(Random.Range(0f - projectileAccuracy, projectileAccuracy), Vector3.up);
			forward = Quaternion.AngleAxis(Random.Range(0f - projectileAccuracy, projectileAccuracy), val) * forward;
			forward = val2 * forward;
			m_lastProjectile = Object.Instantiate<GameObject>(m_lastAmmo.m_shared.m_attack.m_attackProjectile, transform.position, transform.rotation);
			HitData val3 = new HitData
			{
				m_toolTier = (short)m_lastAmmo.m_shared.m_toolTier,
				m_pushForce = m_lastAmmo.m_shared.m_attackForce,
				m_backstabBonus = m_lastAmmo.m_shared.m_backstabBonus,
				m_staggerMultiplier = m_lastAmmo.m_shared.m_attack.m_staggerMultiplier,
				m_statusEffectHash = (Object.op_Implicit((Object)(object)m_lastAmmo.m_shared.m_attackStatusEffect) ? m_lastAmmo.m_shared.m_attackStatusEffect.NameHash() : 0),
				m_blockable = m_lastAmmo.m_shared.m_blockable,
				m_dodgeable = m_lastAmmo.m_shared.m_dodgeable,
				m_skill = m_lastAmmo.m_shared.m_skillType,
				m_itemWorldLevel = (byte)Game.m_worldLevel,
				m_hitType = (HitType)16
			};
			val3.m_damage.Add(m_lastAmmo.GetDamage(), 1);
			if ((Object)(object)m_lastAmmo.m_shared.m_attackStatusEffect != (Object)null)
			{
				val3.m_statusEffectHash = m_lastAmmo.m_shared.m_attackStatusEffect.NameHash();
			}
			IProjectile component = m_lastProjectile.GetComponent<IProjectile>();
			if (component != null)
			{
				component.Setup((Character)null, forward * m_lastAmmo.m_shared.m_attack.m_projectileVel, m_hitNoise, val3, (ItemData)null, m_lastAmmo);
			}
		}
	}

	public bool IsCoolingDown()
	{
		if (!m_nview.IsValid())
		{
			return false;
		}
		return (double)(m_nview.GetZDO().GetFloat(GetLastAttackZDO(), 0f) + m_attackCooldown) > ZNet.instance.GetTimeSeconds();
	}

	public bool HasAmmoAndEnabled()
	{
		return !IsDeactivated() && HasAmmo();
	}

	public bool IsDeactivated()
	{
		return m_nview.GetZDO().GetBool(LongshipCustomizableParts.s_turretsDisabled, false);
	}

	public bool HasAmmo()
	{
		if (m_maxAmmo != 0)
		{
			return GetAmmo() > 0;
		}
		return true;
	}

	public int GetAmmo()
	{
		return m_nview.GetZDO().GetInt(ZDOVars.s_ammo, 0);
	}

	public string GetAmmoType()
	{
		if (!Object.op_Implicit((Object)(object)m_defaultAmmo))
		{
			return m_nview.GetZDO().GetString(ZDOVars.s_ammoType, "");
		}
		return ((Object)m_defaultAmmo).name;
	}

	public void UpdateReloadState()
	{
		//IL_002c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0037: Unknown result type (might be due to invalid IL or missing references)
		//IL_0045: Unknown result type (might be due to invalid IL or missing references)
		//IL_004b: Unknown result type (might be due to invalid IL or missing references)
		bool flag = IsCoolingDown();
		if (!m_turretBodyArmed.activeInHierarchy && !flag)
		{
			m_reloadEffect.Create(((Component)this).transform.position, ((Component)this).transform.rotation, (Transform)null, 1f, -1, default(ZDOID));
		}
		m_turretBodyArmed.SetActive(!flag);
		m_turretBodyUnarmed.SetActive(flag);
	}

	public ItemData GetAmmoItem()
	{
		string ammoType = GetAmmoType();
		GameObject prefab = ZNetScene.instance.GetPrefab(ammoType);
		if (!Object.op_Implicit((Object)(object)prefab))
		{
			LongshipUpgrades.LogWarning("Turret '" + ((Object)this).name + "' is trying to fire but has no ammo or default ammo!");
			return null;
		}
		return prefab.GetComponent<ItemDrop>().m_itemData;
	}

	public string GetHoverText()
	{
		//IL_0047: Unknown result type (might be due to invalid IL or missing references)
		if (!m_nview.IsValid())
		{
			return "";
		}
		if (!m_targetEnemies)
		{
			return Localization.instance.Localize(m_name);
		}
		if (!PrivateArea.CheckAccess(((Component)this).transform.position, 0f, false, false))
		{
			return Localization.instance.Localize(m_name + "\n$piece_noaccess");
		}
		sb.Clear();
		sb.Append(m_name);
		if (IsDeactivated())
		{
			sb.Append(" disabled");
		}
		if (HasAmmo())
		{
			sb.AppendFormat(" ({0} / {1})", GetAmmo(), m_maxAmmo);
		}
		else
		{
			sb.Append(" ($piece_turret_noammo)");
		}
		if (m_targetCharacters.Count == 0)
		{
			sb.Append("\n$piece_turret_target $piece_turret_target_everything");
		}
		else
		{
			sb.Append("\n$piece_turret_target ");
			sb.Append(m_targetsText);
		}
		sb.Append("\n[<color=yellow><b>$KEY_Use</b></color>] $piece_turret_addammo\n[<color=yellow><b>1-8</b></color>] $piece_turret_target_set");
		return Localization.instance.Localize(sb.ToString());
	}

	public string GetHoverName()
	{
		return m_name;
	}

	public float GetHoverOffset()
	{
		return m_hoverOffset;
	}

	public bool Interact(Humanoid character, bool hold, bool alt)
	{
		if (hold)
		{
			if (m_holdRepeatInterval <= 0f)
			{
				return false;
			}
			if (Time.time - m_lastUseTime < m_holdRepeatInterval)
			{
				return false;
			}
		}
		m_lastUseTime = Time.time;
		return UseItem(character, null);
	}

	public bool UseItem(Humanoid user, ItemData item)
	{
		//IL_00ce: Unknown result type (might be due to invalid IL or missing references)
		//IL_00d3: Unknown result type (might be due to invalid IL or missing references)
		//IL_00e1: Unknown result type (might be due to invalid IL or missing references)
		//IL_0111: Unknown result type (might be due to invalid IL or missing references)
		//IL_012a: Unknown result type (might be due to invalid IL or missing references)
		//IL_016c: Unknown result type (might be due to invalid IL or missing references)
		//IL_01c9: Unknown result type (might be due to invalid IL or missing references)
		//IL_01d4: Unknown result type (might be due to invalid IL or missing references)
		//IL_01e2: Unknown result type (might be due to invalid IL or missing references)
		//IL_01e8: Unknown result type (might be due to invalid IL or missing references)
		if (item == null)
		{
			item = FindAmmoItem(user.GetInventory(), onlyCurrentlyLoadableType: true);
			if (item == null)
			{
				if (GetAmmo() > 0 && FindAmmoItem(user.GetInventory(), onlyCurrentlyLoadableType: false) != null)
				{
					ItemDrop component = ZNetScene.instance.GetPrefab(GetAmmoType()).GetComponent<ItemDrop>();
					((Character)user).Message((MessageType)2, Localization.instance.Localize("$msg_turretotherammo ") + Localization.instance.Localize(component.m_itemData.m_shared.m_name), 0, (Sprite)null, false);
					return false;
				}
				((Character)user).Message((MessageType)2, "$msg_noturretammo", 0, (Sprite)null, false);
				return false;
			}
		}
		foreach (TrophyTarget configTarget in m_configTargets)
		{
			if (!(item.m_shared.m_name == configTarget.m_item.m_itemData.m_shared.m_name))
			{
				continue;
			}
			if (m_targetItems.Contains(configTarget.m_item))
			{
				m_targetItems.Remove(configTarget.m_item);
			}
			else
			{
				if (m_targetItems.Count >= m_maxConfigTargets)
				{
					m_targetItems.RemoveAt(0);
				}
				m_targetItems.Add(configTarget.m_item);
			}
			SetTargets();
			((Character)Player.m_localPlayer).Message((MessageType)2, Localization.instance.Localize("$piece_turret_target_set_msg " + ((m_targetCharacters.Count == 0) ? "$piece_turret_target_everything" : m_targetsText)), 0, (Sprite)null, false);
			m_setTargetEffect.Create(((Component)this).transform.position, ((Component)this).transform.rotation, (Transform)null, 1f, -1, default(ZDOID));
			Game.instance.IncrementPlayerStat((PlayerStatType)79, 1f, false);
			return true;
		}
		if (!IsItemAllowed(((Object)item.m_dropPrefab).name))
		{
			((Character)user).Message((MessageType)2, "$msg_wontwork", 0, (Sprite)null, false);
			return false;
		}
		if (GetAmmo() > 0 && GetAmmoType() != ((Object)item.m_dropPrefab).name)
		{
			ItemDrop component2 = ZNetScene.instance.GetPrefab(GetAmmoType()).GetComponent<ItemDrop>();
			((Character)user).Message((MessageType)2, Localization.instance.Localize("$msg_turretotherammo ") + Localization.instance.Localize(component2.m_itemData.m_shared.m_name), 0, (Sprite)null, false);
			return false;
		}
		LongshipUpgrades.LogInfo("trying to add ammo " + item.m_shared.m_name);
		if (GetAmmo() >= m_maxAmmo)
		{
			((Character)user).Message((MessageType)2, "$msg_itsfull", 0, (Sprite)null, false);
			return false;
		}
		((Character)user).Message((MessageType)2, "$msg_added " + item.m_shared.m_name, 0, (Sprite)null, false);
		if (!((Player)((user is Player) ? user : null)).NoCostCheat() && !ZoneSystem.instance.GetGlobalKey((GlobalKeys)25))
		{
			user.GetInventory().RemoveItem(item, 1);
		}
		Game.instance.IncrementPlayerStat((PlayerStatType)78, 1f, false);
		m_nview.InvokeRPC("RPC_AddAmmo", new object[1] { ((Object)item.m_dropPrefab).name });
		return true;
	}

	public void RPC_AddAmmo(long sender, string name)
	{
		//IL_009b: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ac: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ba: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c0: Unknown result type (might be due to invalid IL or missing references)
		if (!m_nview.IsOwner())
		{
			return;
		}
		if (!IsItemAllowed(name))
		{
			LongshipUpgrades.LogInfo("Item not allowed " + name);
			return;
		}
		m_nview.GetZDO().Set(ZDOVars.s_ammo, GetAmmo() + 1, false);
		m_nview.GetZDO().Set(ZDOVars.s_ammoType, name);
		ShipTurret[] componentsInChildren = ((Component)((Component)this).transform.parent).GetComponentsInChildren<ShipTurret>();
		foreach (ShipTurret shipTurret in componentsInChildren)
		{
			m_addAmmoEffect.Create(shipTurret.m_turretBody.transform.position, shipTurret.m_turretBody.transform.rotation, (Transform)null, 1f, -1, default(ZDOID));
		}
		UpdateVisualBolt();
		LongshipUpgrades.LogInfo("Added ammo " + name);
	}

	public void RPC_SetTarget(long sender, ZDOID character)
	{
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		GameObject val = ZNetScene.instance.FindInstance(character);
		if (Object.op_Implicit((Object)(object)val))
		{
			Character component = val.GetComponent<Character>();
			if (Object.op_Implicit((Object)(object)component))
			{
				m_target = component;
				m_haveTarget = true;
				return;
			}
		}
		m_target = null;
		m_haveTarget = false;
		m_scan = 0f;
	}

	public void UpdateVisualBolt()
	{
		//IL_002e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0033: Unknown result type (might be due to invalid IL or missing references)
		//IL_0035: Unknown result type (might be due to invalid IL or missing references)
		//IL_0048: Unknown result type (might be due to invalid IL or missing references)
		string ammoType = GetAmmoType();
		bool flag = HasAmmo() && !IsCoolingDown();
		foreach (AmmoType item in m_allowedAmmo)
		{
			bool flag2 = ((Object)item.m_ammo).name == ammoType;
			item.m_visual.SetActive(flag2 & flag);
		}
	}

	public bool IsItemAllowed(string itemName)
	{
		//IL_0012: Unknown result type (might be due to invalid IL or missing references)
		//IL_0017: Unknown result type (might be due to invalid IL or missing references)
		//IL_0018: Unknown result type (might be due to invalid IL or missing references)
		foreach (AmmoType item in m_allowedAmmo)
		{
			if (((Object)item.m_ammo).name == itemName)
			{
				return true;
			}
		}
		return false;
	}

	public ItemData FindAmmoItem(Inventory inventory, bool onlyCurrentlyLoadableType)
	{
		if (onlyCurrentlyLoadableType && HasAmmo())
		{
			return inventory.GetAmmoItem(m_ammoType, GetAmmoType());
		}
		return inventory.GetAmmoItem(m_ammoType, (string)null);
	}

	public void OnDestroyed()
	{
		if (m_nview.IsOwner() && m_returnAmmoOnDestroy)
		{
			DropAllItems();
		}
	}

	public void DropAllItems()
	{
		//IL_009f: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a4: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ae: Unknown result type (might be due to invalid IL or missing references)
		//IL_00b3: Unknown result type (might be due to invalid IL or missing references)
		//IL_00b8: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c2: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c7: Unknown result type (might be due to invalid IL or missing references)
		//IL_00cc: Unknown result type (might be due to invalid IL or missing references)
		//IL_00e4: Unknown result type (might be due to invalid IL or missing references)
		//IL_00e9: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ec: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ee: Unknown result type (might be due to invalid IL or missing references)
		int num = GetAmmo();
		if (num <= 0)
		{
			return;
		}
		GameObject prefab = ZNetScene.instance.GetPrefab(GetAmmoType());
		if (Object.op_Implicit((Object)(object)m_destroyedLootPrefab))
		{
			Inventory val = SpawnContainer(m_destroyedLootPrefab);
			while (num > 0)
			{
				if (val.AddItem(prefab, 1))
				{
					num--;
					continue;
				}
				if (!val.HaveEmptySlot())
				{
					val = SpawnContainer(m_destroyedLootPrefab);
					continue;
				}
				break;
			}
			return;
		}
		while (num > 0)
		{
			Vector3 val2 = ((Component)this).transform.position + Vector3.up * 0.5f + Random.insideUnitSphere * 0.3f;
			Quaternion val3 = Quaternion.Euler(0f, (float)Random.Range(0, 360), 0f);
			ItemDrop component = Object.Instantiate<GameObject>(prefab, val2, val3).GetComponent<ItemDrop>();
			if ((Object)(object)component == (Object)null)
			{
				break;
			}
			component.SetStack(num);
			num -= component.m_itemData.m_stack;
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

	public void SetTargets()
	{
		if (!m_nview.IsOwner())
		{
			m_nview.ClaimOwnership();
		}
		m_nview.GetZDO().Set(GetTargetsZDO(), m_targetItems.Count, false);
		for (int i = 0; i < m_targetItems.Count; i++)
		{
			m_nview.GetZDO().Set(GetTargetZDO(i), m_targetItems[i].m_itemData.m_shared.m_name);
		}
		ReadTargets();
	}

	public string GetNameSetTargetRPC()
	{
		return m_isLeftTurret ? "RPC_SetTargetLeft" : "RPC_SetTargetRight";
	}

	public int GetTargetsZDO()
	{
		return m_isLeftTurret ? s_targetsLeft : s_targetsRight;
	}

	public int GetLastAttackZDO()
	{
		return m_isLeftTurret ? s_lastAttackLeft : s_lastAttackRight;
	}

	public string GetTargetZDO(int i)
	{
		return (m_isLeftTurret ? "targetleft" : "targetright") + i;
	}

	public void ReadTargets()
	{
		//IL_009d: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a2: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a5: Unknown result type (might be due to invalid IL or missing references)
		//IL_00d6: Unknown result type (might be due to invalid IL or missing references)
		//IL_00e9: Unknown result type (might be due to invalid IL or missing references)
		//IL_0122: Unknown result type (might be due to invalid IL or missing references)
		//IL_013f: Unknown result type (might be due to invalid IL or missing references)
		//IL_01b8: Unknown result type (might be due to invalid IL or missing references)
		//IL_0162: Unknown result type (might be due to invalid IL or missing references)
		//IL_0183: Unknown result type (might be due to invalid IL or missing references)
		if (!Object.op_Implicit((Object)(object)m_nview) || !m_nview.IsValid())
		{
			return;
		}
		m_targetItems.Clear();
		m_targetCharacters.Clear();
		m_targetsText = "";
		int num = m_nview.GetZDO().GetInt(GetTargetsZDO(), 0);
		for (int i = 0; i < num; i++)
		{
			string text = m_nview.GetZDO().GetString(GetTargetZDO(i), "");
			foreach (TrophyTarget configTarget in m_configTargets)
			{
				if (!(configTarget.m_item.m_itemData.m_shared.m_name == text))
				{
					continue;
				}
				m_targetItems.Add(configTarget.m_item);
				m_targetCharacters.AddRange(configTarget.m_targets);
				if (m_targetsText.Length > 0)
				{
					m_targetsText += ", ";
				}
				if (!string.IsNullOrEmpty(configTarget.m_nameOverride))
				{
					m_targetsText += configTarget.m_nameOverride;
					break;
				}
				for (int j = 0; j < configTarget.m_targets.Count; j++)
				{
					m_targetsText += configTarget.m_targets[j].m_name;
					if (j + 1 < configTarget.m_targets.Count)
					{
						m_targetsText += ", ";
					}
				}
				break;
			}
		}
	}

	static ShipTurret()
	{
		//IL_003c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0046: Expected Obj, but got Unknown
		//IL_0046: Unknown result type (might be due to invalid IL or missing references)
		//IL_0050: Expected Obj, but got Unknown
		//IL_0050: Unknown result type (might be due to invalid IL or missing references)
		//IL_005a: Expected Obj, but got Unknown
		//IL_005a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0064: Expected Obj, but got Unknown
		//IL_0064: Unknown result type (might be due to invalid IL or missing references)
		//IL_006e: Expected Obj, but got Unknown
		//IL_006e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0078: Expected Obj, but got Unknown
		//IL_0078: Unknown result type (might be due to invalid IL or missing references)
		//IL_0082: Expected Obj, but got Unknown
	}
}
