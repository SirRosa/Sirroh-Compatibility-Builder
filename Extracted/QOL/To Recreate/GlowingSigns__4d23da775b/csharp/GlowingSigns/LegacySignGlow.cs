using System;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

namespace GlowingSigns;

internal static class LegacySignGlow
{
	private const string LegacyShaderName = "TextMeshPro/Distance Field";

	private static readonly int FaceColorId = Shader.PropertyToID("_FaceColor");

	private static readonly Dictionary<int, Material> MaterialsByFontMaterial = new Dictionary<int, Material>();

	private static Shader? _legacyShader;

	private static bool _loggedSuccess;

	private static bool _loggedMissingShader;

	private static bool _loggedFailure;

	internal static void Apply(Sign sign)
	{
		try
		{
			TextMeshProUGUI textWidget = sign.m_textWidget;
			if ((Object)(object)textWidget == (Object)null)
			{
				return;
			}
			Shader val = FindLegacyShader();
			if ((Object)(object)val == (Object)null)
			{
				return;
			}
			TMP_FontAsset font = ((TMP_Text)textWidget).font;
			Material val2 = ((font != null) ? ((TMP_Asset)font).material : null);
			if ((Object)(object)val2 == (Object)null)
			{
				return;
			}
			Material orCreateLegacyMaterial = GetOrCreateLegacyMaterial(val2, val);
			if (!((Object)(object)((TMP_Text)textWidget).fontSharedMaterial == (Object)(object)orCreateLegacyMaterial))
			{
				((TMP_Text)textWidget).fontSharedMaterial = orCreateLegacyMaterial;
				((TMP_Text)textWidget).UpdateMeshPadding();
				((Graphic)textWidget).SetMaterialDirty();
				if (!_loggedSuccess)
				{
					_loggedSuccess = true;
					Plugin.Log.LogInfo((object)"Legacy sign glow is active; glow colors follow the displayed text colors.");
				}
			}
		}
		catch (Exception arg)
		{
			if (!_loggedFailure)
			{
				_loggedFailure = true;
				Plugin.Log.LogError((object)$"Could not restore sign glow: {arg}");
			}
		}
	}

	internal static void DisposeMaterials()
	{
		foreach (Material value in MaterialsByFontMaterial.Values)
		{
			if ((Object)(object)value != (Object)null)
			{
				Object.Destroy((Object)(object)value);
			}
		}
		MaterialsByFontMaterial.Clear();
		_legacyShader = null;
	}

	private static Material GetOrCreateLegacyMaterial(Material source, Shader legacyShader)
	{
		//IL_0022: Unknown result type (might be due to invalid IL or missing references)
		//IL_0027: Unknown result type (might be due to invalid IL or missing references)
		//IL_003d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0045: Unknown result type (might be due to invalid IL or missing references)
		//IL_004d: Expected Obj, but got Unknown
		//IL_0060: Unknown result type (might be due to invalid IL or missing references)
		int instanceID = ((Object)source).GetInstanceID();
		if (MaterialsByFontMaterial.TryGetValue(instanceID, out Material value) && (Object)(object)value != (Object)null)
		{
			return value;
		}
		value = new Material(source)
		{
			name = ((Object)source).name + " (Glowing Signs)",
			hideFlags = (HideFlags)61,
			shader = legacyShader
		};
		if (value.HasProperty(FaceColorId))
		{
			value.SetColor(FaceColorId, Color.white);
		}
		MaterialsByFontMaterial[instanceID] = value;
		return value;
	}

	private static Shader? FindLegacyShader()
	{
		if ((Object)(object)_legacyShader != (Object)null)
		{
			return _legacyShader;
		}
		_legacyShader = Shader.Find("TextMeshPro/Distance Field");
		if ((Object)(object)_legacyShader == (Object)null && !_loggedMissingShader)
		{
			_loggedMissingShader = true;
			Plugin.Log.LogError((object)"Required shader 'TextMeshPro/Distance Field' was not found. Sign glow cannot be restored.");
		}
		return _legacyShader;
	}
}
