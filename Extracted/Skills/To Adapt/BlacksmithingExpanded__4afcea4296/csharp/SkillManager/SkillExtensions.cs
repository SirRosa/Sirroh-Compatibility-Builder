using JetBrains.Annotations;

namespace SkillManager;

[PublicAPI]
public static class SkillExtensions
{
	public static float GetSkillFactor(this Character character, string name)
	{
		//IL_0002: Unknown result type (might be due to invalid IL or missing references)
		return character.GetSkillFactor(Skill.fromName(name)) * Skill.skillByName[name].SkillEffectFactor;
	}

	public static float GetSkillFactor(this Skills skills, string name)
	{
		//IL_0002: Unknown result type (might be due to invalid IL or missing references)
		return skills.GetSkillFactor(Skill.fromName(name)) * Skill.skillByName[name].SkillEffectFactor;
	}

	public static void RaiseSkill(this Character character, string name, float value = 1f)
	{
		//IL_0002: Unknown result type (might be due to invalid IL or missing references)
		character.RaiseSkill(Skill.fromName(name), value);
	}

	public static void RaiseSkill(this Skills skill, string name, float value = 1f)
	{
		//IL_0002: Unknown result type (might be due to invalid IL or missing references)
		skill.RaiseSkill(Skill.fromName(name), value);
	}

	public static void LowerSkill(this Character character, string name, float factor = 1f)
	{
		character.GetSkills().LowerSkill(name, factor);
	}

	public static void LowerSkill(this Skills skills, string name, float factor)
	{
		//IL_0010: Unknown result type (might be due to invalid IL or missing references)
		if (factor > 0f && skills.m_skillData.TryGetValue(Skill.fromName(name), out var value))
		{
			Skill val = value;
			val.m_level -= value.m_level * factor;
			value.m_accumulator = 0f;
		}
	}
}
