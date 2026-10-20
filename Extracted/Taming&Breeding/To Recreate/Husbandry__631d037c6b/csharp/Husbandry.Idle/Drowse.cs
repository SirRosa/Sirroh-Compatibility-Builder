using System.Runtime.CompilerServices;
using Husbandry.Config;
using Husbandry.Herd;
using UnityEngine;

namespace Husbandry.Idle;

internal static class Drowse
{
	private sealed class Holder
	{
		internal Nap Nap;
	}

	private static readonly ConditionalWeakTable<BaseAI, Holder> Banks = new ConditionalWeakTable<BaseAI, Holder>();

	internal static int Skipped { get; private set; }

	internal static int Thought { get; private set; }

	internal static int Dozing { get; private set; }

	internal static void ResetForTests()
	{
		Skipped = 0;
		Thought = 0;
		Dozing = 0;
	}

	internal static bool Skip(BaseAI ai, ref float dt)
	{
		if ((Object)(object)ai == (Object)null)
		{
			return false;
		}
		if (HusbandryConfig.ThrottleIdle == null || !HusbandryConfig.ThrottleIdle.Value)
		{
			return false;
		}
		Holder orCreateValue = Banks.GetOrCreateValue(ai);
		if (!Dozy(ai))
		{
			dt = Nap.Wake(ref orCreateValue.Nap, dt);
			Thought++;
			return false;
		}
		Dozing++;
		int every = Cadence.Every(Distance(ai), HusbandryConfig.NearRange.Value, HusbandryConfig.FarRange.Value, HusbandryConfig.MidSkip.Value, HusbandryConfig.FarSkip.Value);
		if (Nap.Think(ref orCreateValue.Nap, every, dt, out var give))
		{
			dt = give;
			Thought++;
			return false;
		}
		Skipped++;
		return true;
	}

	private static bool Dozy(BaseAI ai)
	{
		Character component = ((Component)ai).GetComponent<Character>();
		ZNetView component2 = ((Component)ai).GetComponent<ZNetView>();
		bool ours = Beast.Ours((Object)(object)component != (Object)null && component.IsTamed(), (Object)(object)component2 != (Object)null && component2.IsValid(), (Object)(object)component2 != (Object)null && component2.IsOwner());
		MonsterAI val = (MonsterAI)(object)((ai is MonsterAI) ? ai : null);
		return Beast.Dozy(following: (Object)(object)val != (Object)null && (Object)(object)val.GetFollowTarget() != (Object)null, ours: ours, alerted: ai.IsAlerted(), hasTarget: (Object)(object)ai.GetTargetCreature() != (Object)null);
	}

	private static float Distance(BaseAI ai)
	{
		//IL_001b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0027: Unknown result type (might be due to invalid IL or missing references)
		Player localPlayer = Player.m_localPlayer;
		if ((Object)(object)localPlayer == (Object)null)
		{
			return -1f;
		}
		return Cadence.FromCamera(((Component)ai).transform.position, havePlayer: true, ((Component)localPlayer).transform.position);
	}
}
