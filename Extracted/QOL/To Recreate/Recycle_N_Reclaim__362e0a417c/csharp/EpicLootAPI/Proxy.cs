using System.ComponentModel;
using JetBrains.Annotations;
using UnityEngine;

namespace EpicLootAPI;

[PublicAPI]
[Description("Functions are converted into delegates when registered to epic loot")]
internal class Proxy
{
	protected Player Player;

	public string AbilityID = "";

	public float Cooldown;

	public virtual string CooldownEndKey => "EpicLoot." + AbilityID + ".CooldownEnd";

	public virtual void Initialize(Player player, string id, float cooldown)
	{
		Player = player;
		AbilityID = id;
		Cooldown = cooldown;
	}

	public virtual void OnUpdate()
	{
	}

	public virtual bool ShouldTrigger()
	{
		return false;
	}

	public virtual bool IsOnCooldown()
	{
		if (HasCooldown())
		{
			return GetTime() < GetCooldownEndTime();
		}
		return false;
	}

	public virtual float TimeUntilCooldownEnds()
	{
		return Mathf.Max(0f, GetCooldownEndTime() - GetTime());
	}

	public virtual float PercentCooldownComplete()
	{
		if (HasCooldown() && IsOnCooldown())
		{
			return 1f - TimeUntilCooldownEnds() / Cooldown;
		}
		return 1f;
	}

	public virtual bool CanActivate()
	{
		return !IsOnCooldown();
	}

	public virtual void TryActivate()
	{
		if (CanActivate())
		{
			Activate();
		}
	}

	public virtual void Activate()
	{
		if (HasCooldown())
		{
			float cooldownEndTime = GetTime() + Cooldown;
			SetCooldownEndTime(cooldownEndTime);
		}
	}

	public virtual void ActivateCustomAction()
	{
	}

	public virtual void ActivateStatusEffectAction()
	{
	}

	public virtual bool HasCooldown()
	{
		return Cooldown > 0f;
	}

	public virtual void SetCooldownEndTime(float cooldownEndTime)
	{
		if (!((Object)(object)Player == (Object)null))
		{
			((Character)Player).m_nview.GetZDO().Set(CooldownEndKey, cooldownEndTime);
		}
	}

	public virtual float GetCooldownEndTime()
	{
		if ((Object)(object)Player == (Object)null)
		{
			return 0f;
		}
		return ((Character)Player).m_nview.GetZDO().GetFloat(CooldownEndKey, 0f);
	}

	public virtual void OnRemoved()
	{
	}

	protected static float GetTime()
	{
		return (float)ZNet.instance.GetTimeSeconds();
	}
}
