using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using UnityEngine;

namespace CreatureLevelControl;

public class OriginalCharacterData : MonoBehaviour
{
	private float fixedUpdateCount = 0f;

	public bool immutableExtra = false;

	public bool lastHitFromPlayerFaction = false;

	public float acceleration;

	public float swimAcceleration;

	public float runSpeed;

	public float runTurnSpeed;

	public float flySpeed;

	public float flyTurnSpeed;

	public float swimSpeed;

	public float swimTurnSpeed;

	public float viewRange;

	public float viewAngle;

	public float hearRange;

	public float minAttackInterval;

	public float circleTargetDistance;

	public float circleTargetDuration;

	public float circleTargetInterval;

	private float lowestHealth;

	public void Awake()
	{
		lowestHealth = ((Component)this).GetComponent<Character>().GetHealth();
	}

	private void FixedUpdate()
	{
		//IL_009d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0640: Unknown result type (might be due to invalid IL or missing references)
		//IL_0645: Unknown result type (might be due to invalid IL or missing references)
		//IL_0647: Unknown result type (might be due to invalid IL or missing references)
		//IL_0651: Unknown result type (might be due to invalid IL or missing references)
		//IL_0656: Unknown result type (might be due to invalid IL or missing references)
		//IL_0660: Unknown result type (might be due to invalid IL or missing references)
		//IL_0665: Unknown result type (might be due to invalid IL or missing references)
		//IL_0667: Unknown result type (might be due to invalid IL or missing references)
		//IL_066c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0675: Unknown result type (might be due to invalid IL or missing references)
		//IL_067a: Unknown result type (might be due to invalid IL or missing references)
		//IL_067c: Unknown result type (might be due to invalid IL or missing references)
		//IL_06a8: Unknown result type (might be due to invalid IL or missing references)
		//IL_06af: Unknown result type (might be due to invalid IL or missing references)
		//IL_0693: Unknown result type (might be due to invalid IL or missing references)
		fixedUpdateCount += Time.fixedDeltaTime;
		if ((double)fixedUpdateCount < 1.0)
		{
			return;
		}
		Character component = ((Component)this).GetComponent<Character>();
		if (!Object.op_Implicit((Object)(object)component) || !component.m_nview.IsValid())
		{
			return;
		}
		bool flag = component.m_nview.IsOwner();
		if (component.IsBoss() ? (API.GetAffixBoss(component) == BossAffix.Mending) : (API.GetExtraEffectCreature(component) == CreatureExtraEffect.Regenerating))
		{
			if (flag)
			{
				int num = Math.Max(1, Player.GetPlayersInRangeXZ(((Component)component).transform.localPosition, CreatureLevelControl.getMultiplayerRangeValue()));
				float num2 = component.m_health * (float)num * (1f + (float)(component.GetLevel() - 1) * 0.25f);
				float num3 = num2 * (7f * Mathf.Log10(Mathf.Max(10f, num2 - 1000f))) / (num2 + 1000f);
				float num4 = ((!component.IsBoss()) ? (Utils.ReadEffectPowerFromConfig(component, CreatureExtraEffect.Regenerating) ?? 1.5f) : (Utils.ReadValueFromEnumWithWorldLevelAndStarsFromConfig(component, BossAffix.Mending, [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)] [return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 2, 1, 2 })] (CreatureConfig cfg) => cfg.worldLevelToBossAffixFactor) ?? CreatureLevelControl.bossAffixPowerMending.Value));
				component.Heal(num3 * num4, false);
			}
		}
		else if (component.IsBoss() && (API.GetAffixBoss(component) == BossAffix.Summoner || API.GetAffixBoss(component) == BossAffix.Godlike))
		{
			float num5 = Utils.ReadValueFromEnumWithWorldLevelAndStarsFromConfig(component, BossAffix.Summoner, [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)] [return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 2, 1, 2 })] (CreatureConfig c) => c.worldLevelToBossAffixFactor) ?? ((float)CreatureLevelControl.bossAffixPowerSummoner.Value);
			float num6 = component.GetMaxHealth() / num5;
			if (component.GetHealth() < lowestHealth)
			{
				if (flag && lowestHealth % num6 < component.GetHealth() % num6)
				{
					string text = "";
					string text2 = "";
					int num7 = 1;
					int num8 = 0;
					if (((Object)component).name.StartsWith("Eikthyr", StringComparison.Ordinal))
					{
						num7 = 2;
						num8 = -2;
						text2 = LocalizationWrapper.getTranslationWithPlaceholders((API.GetAffixBoss(component) == BossAffix.Godlike) ? "GodlikeEikthyr" : "SummonerEikthyr", new Dictionary<string, string>
						{
							{
								"boss",
								component.GetHoverName()
							},
							{
								"number",
								num7.ToString()
							}
						});
						text = "Greydwarf";
					}
					if (((Object)component).name.StartsWith("gd_king", StringComparison.Ordinal))
					{
						num8 = -1;
						text2 = LocalizationWrapper.getTranslationWithPlaceholders((API.GetAffixBoss(component) == BossAffix.Godlike) ? "GodlikeElder" : "SummonerElder", new Dictionary<string, string>
						{
							{
								"boss",
								component.GetHoverName()
							},
							{
								"number",
								num7.ToString()
							}
						});
						text = "Greydwarf_Elite";
					}
					if (((Object)component).name.StartsWith("Bonemass", StringComparison.Ordinal))
					{
						num7 = 1;
						num8 = -1;
						text2 = LocalizationWrapper.getTranslationWithPlaceholders((API.GetAffixBoss(component) == BossAffix.Godlike) ? "GodlikeBonemass" : "SummonerBonemass", new Dictionary<string, string>
						{
							{
								"boss",
								component.GetHoverName()
							},
							{
								"number",
								num7.ToString()
							}
						});
						text = "Draugr_Elite";
					}
					if (((Object)component).name.StartsWith("Dragon", StringComparison.Ordinal))
					{
						num7 = 3;
						num8 = -3;
						text2 = LocalizationWrapper.getTranslationWithPlaceholders((API.GetAffixBoss(component) == BossAffix.Godlike) ? "GodlikeModer" : "SummonerModer", new Dictionary<string, string>
						{
							{
								"boss",
								component.GetHoverName()
							},
							{
								"number",
								num7.ToString()
							}
						});
						text = "Hatchling";
					}
					if (((Object)component).name.StartsWith("GoblinKing", StringComparison.Ordinal))
					{
						num8 = -2;
						text2 = LocalizationWrapper.getTranslationWithPlaceholders((API.GetAffixBoss(component) == BossAffix.Godlike) ? "GodlikeYagluth" : "SummonerYagluth", new Dictionary<string, string>
						{
							{
								"boss",
								component.GetHoverName()
							},
							{
								"number",
								num7.ToString()
							}
						});
						text = "GoblinBrute";
					}
					if (((Object)component).name.StartsWith("SeekerQueen", StringComparison.Ordinal))
					{
						num8 = -2;
						num7 = 3;
						text2 = LocalizationWrapper.getTranslationWithPlaceholders((API.GetAffixBoss(component) == BossAffix.Godlike) ? "GodlikeQueen" : "SummonerQueen", new Dictionary<string, string>
						{
							{
								"boss",
								component.GetHoverName()
							},
							{
								"number",
								num7.ToString()
							}
						});
						text = "Seeker";
					}
					if (((Object)component).name.StartsWith("Fader", StringComparison.Ordinal))
					{
						num8 = -2;
						num7 = 7;
						text2 = LocalizationWrapper.getTranslationWithPlaceholders((API.GetAffixBoss(component) == BossAffix.Godlike) ? "GodlikeFader" : "SummonerFader", new Dictionary<string, string>
						{
							{
								"boss",
								component.GetHoverName()
							},
							{
								"number",
								num7.ToString()
							}
						});
						text = "Charred_Archer_Fader";
					}
					if (((Object)component).name.StartsWith("FrozenKing", StringComparison.Ordinal))
					{
						num8 = -2;
						num7 = 2;
						text2 = LocalizationWrapper.getTranslationWithPlaceholders((API.GetAffixBoss(component) == BossAffix.Godlike) ? "GodlikeKing" : "SummonerKing", new Dictionary<string, string>
						{
							{
								"boss",
								component.GetHoverName()
							},
							{
								"number",
								num7.ToString()
							}
						});
						text = "JotunWitch";
					}
					if (text != "")
					{
						foreach (Player allPlayer in Player.GetAllPlayers())
						{
							((Character)allPlayer).Message((MessageType)2, text2, 0, (Sprite)null, false);
						}
						GameObject prefab = ZNetScene.instance.GetPrefab(text);
						for (int num9 = 0; num9 < num7; num9++)
						{
							Quaternion val = Quaternion.Euler(0f, Random.Range(0f, 360f), 0f);
							Vector3 val2 = Random.insideUnitSphere * 5f;
							GameObject val3 = Object.Instantiate<GameObject>(prefab, ((Component)component).transform.localPosition + val2, val);
							Vector3 insideUnitSphere = Random.insideUnitSphere;
							if (insideUnitSphere.y < 0f)
							{
								insideUnitSphere.y = 0f - insideUnitSphere.y;
							}
							val3.GetComponent<Rigidbody>().AddForce(insideUnitSphere * 5f, (ForceMode)2);
							val3.GetComponent<Character>().SetLevel(Math.Max(component.GetLevel() + num8, 1));
						}
					}
				}
				lowestHealth = component.GetHealth();
			}
		}
		fixedUpdateCount--;
	}
}
