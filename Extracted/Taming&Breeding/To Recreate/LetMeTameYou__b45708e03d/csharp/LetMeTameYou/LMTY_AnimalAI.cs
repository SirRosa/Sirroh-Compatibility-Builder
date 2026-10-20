using UnityEngine;

namespace LetMeTameYou;

public class LMTY_AnimalAI : MonsterAI
{
	public float m_timeToSafe = 4f;

	public override bool UpdateAI(float dt)
	{
		//IL_004b: Unknown result type (might be due to invalid IL or missing references)
		//IL_013e: Unknown result type (might be due to invalid IL or missing references)
		//IL_011c: Unknown result type (might be due to invalid IL or missing references)
		//IL_01f1: Unknown result type (might be due to invalid IL or missing references)
		if (((BaseAI)this).m_afraidOfFire && ((BaseAI)this).AvoidFire(dt, (Character)null, true))
		{
			return true;
		}
		base.m_updateTargetTimer -= dt;
		if (base.m_updateTargetTimer <= 0f)
		{
			base.m_updateTargetTimer = (Character.IsCharacterInRange(((Component)this).transform.position, 32f) ? 2f : 10f);
			Character val = ((BaseAI)this).FindEnemy();
			if (Object.op_Implicit((Object)(object)val))
			{
				base.m_targetCreature = val;
			}
		}
		if (Object.op_Implicit((Object)(object)((BaseAI)this).m_tamable) && Object.op_Implicit((Object)(object)((BaseAI)this).m_tamable.m_saddle) && ((BaseAI)this).m_tamable.m_saddle.UpdateRiding(dt))
		{
			return true;
		}
		if (Object.op_Implicit((Object)(object)base.m_targetCreature) && base.m_targetCreature.IsDead())
		{
			base.m_targetCreature = null;
		}
		if (Object.op_Implicit((Object)(object)base.m_targetCreature))
		{
			bool flag = ((BaseAI)this).CanSenseTarget(base.m_targetCreature);
			((BaseAI)this).SetTargetInfo(base.m_targetCreature.GetZDOID());
			if (flag)
			{
				((BaseAI)this).SetAlerted(true);
			}
		}
		else
		{
			((BaseAI)this).SetTargetInfo(ZDOID.None);
		}
		if (((BaseAI)this).IsAlerted())
		{
			base.m_timeSinceSensedTargetCreature += dt;
			if (base.m_timeSinceSensedTargetCreature > m_timeToSafe)
			{
				base.m_targetCreature = null;
				((BaseAI)this).SetAlerted(false);
			}
		}
		if (!((BaseAI)this).IsAlerted() || ((Object)(object)base.m_targetStatic == (Object)null && (Object)(object)base.m_targetCreature == (Object)null))
		{
			Character character = ((BaseAI)this).m_character;
			if (((MonsterAI)this).UpdateConsumeItem((Humanoid)(object)((character is Humanoid) ? character : null), dt))
			{
				return true;
			}
		}
		if (Object.op_Implicit((Object)(object)base.m_targetCreature))
		{
			((BaseAI)this).Flee(dt, ((Component)base.m_targetCreature).transform.position);
			base.m_targetCreature.OnTargeted(false, false);
			return true;
		}
		if (Object.op_Implicit((Object)(object)base.m_follow))
		{
			((BaseAI)this).Follow(base.m_follow, dt);
		}
		else
		{
			((BaseAI)this).IdleMovement(dt);
			((BaseAI)this).m_randomMoveUpdateTimer = ((BaseAI)this).m_randomMoveUpdateTimer - dt;
		}
		((BaseAI)this).ChargeStop();
		((BaseAI)this).UpdateRegeneration(dt);
		return true;
	}
}
