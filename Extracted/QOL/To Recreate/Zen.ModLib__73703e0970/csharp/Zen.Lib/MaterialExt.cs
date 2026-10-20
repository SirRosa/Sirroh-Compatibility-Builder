using UnityEngine;

namespace Zen.Lib;

public static class MaterialExt
{
	private static readonly int EmissionColor = Shader.PropertyToID("_EmissionColor");

	private static readonly int Metallic = Shader.PropertyToID("_Metallic");

	private static readonly int Glossiness = Shader.PropertyToID("_Glossiness");

	public static void SetMetalic(this Material mat, float range)
	{
		mat.SetFloat(Metallic, range);
	}

	public static void SetGlossiness(this Material mat, float range)
	{
		mat.SetFloat(Glossiness, range);
	}

	public static void SetGlow(this Material mat, float intensity)
	{
		//IL_0001: Unknown result type (might be due to invalid IL or missing references)
		//IL_0007: Unknown result type (might be due to invalid IL or missing references)
		mat.SetEmission(Color.white * intensity);
	}

	public static void SetEmission(this Material mat, Color color)
	{
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		mat.SetColor(EmissionColor, color);
	}
}
