using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using HarmonyLib;
using UnityEngine;
using Zen.Components;

namespace Zen.Lib;

[HarmonyPatch]
public static class Highlight
{
	private sealed class FxOperation
	{
		public Coroutine? Coroutine;

		public bool IsCancelled;
	}

	private static readonly Dictionary<Piece, FxOperation> FxOperations = new Dictionary<Piece, FxOperation>();

	private static readonly WaitForSeconds BlinkDelay = new WaitForSeconds(0.5f);

	public static Color DefaultColor
	{
		get
		{
			//IL_0005: Unknown result type (might be due to invalid IL or missing references)
			return ModLib.Configs.DefaultHighlightColor.Value;
		}
	}

	public static int Count => FxOperations.Count;

	private static QuickOutline GetOutline(this Piece piece)
	{
		QuickOutline quickOutline = default;
		if (!((Component)piece).gameObject.TryGetComponent<QuickOutline>(ref quickOutline))
		{
			quickOutline = ((Component)piece).gameObject.AddComponent<QuickOutline>();
			quickOutline.OutlineMode = QuickOutline.Mode.OutlineAll;
			quickOutline.SetVisible(isVisible: false);
		}
		return quickOutline;
	}

	public static void Unselect(Piece? piece)
	{
		//IL_003e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0044: Unknown result type (might be due to invalid IL or missing references)
		Logging<ModLib>.InterpolatedString msg = new Logging<ModLib>.InterpolatedString(13, 1, out var shouldAppend);
		if (shouldAppend)
		{
			msg.AppendLiteral("Unhighlight: ");
			msg.AppendFormatted(piece?.m_name);
		}
		Logging<ModLib>.Info(msg);
		Select(piece, isActive: false, 0f, blink: false, default, null);
	}

	public static void Select(Piece piece, bool blink, Color color = default(Color))
	{
		//IL_0007: Unknown result type (might be due to invalid IL or missing references)
		Select(piece, -1f, blink, color);
	}

	public static void Select(Piece? piece, float duration, bool blink, Color color = default(Color), Action? onFinish = null)
	{
		//IL_0038: Unknown result type (might be due to invalid IL or missing references)
		Logging<ModLib>.InterpolatedString msg = new Logging<ModLib>.InterpolatedString(11, 1, out var shouldAppend);
		if (shouldAppend)
		{
			msg.AppendLiteral("Highlight: ");
			msg.AppendFormatted(piece?.m_name);
		}
		Logging<ModLib>.Info(msg);
		Select(piece, isActive: true, duration, blink, color, onFinish);
	}

	private static void Select(Piece? piece, bool isActive, float duration, bool blink, Color color, Action? onFinish)
	{
		//IL_002e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0032: Unknown result type (might be due to invalid IL or missing references)
		//IL_0038: Unknown result type (might be due to invalid IL or missing references)
		//IL_0044: Unknown result type (might be due to invalid IL or missing references)
		//IL_0040: Unknown result type (might be due to invalid IL or missing references)
		if (!ModLib.Configs.EnableHighlightOutline.Value)
		{
			Logging<ModLib>.Info("Highlights are disabled via configs");
		}
		else if (Object.op_Implicit((Object)(object)piece))
		{
			StopFX(piece);
			QuickOutline outline = piece.GetOutline();
			outline.OutlineColor = ((color == default(Color)) ? DefaultColor : color);
			outline.SetVisible(isActive);
			if (isActive)
			{
				StartFX(piece, duration, blink, onFinish);
			}
		}
	}

	private static void StartFX(Piece piece, float duration, bool blink, Action? onFinish)
	{
		if (!(duration < 0f) || blink)
		{
			FxOperation fxOperation = (FxOperations[piece] = new FxOperation());
			FxOperation fxOperation3 = fxOperation;
			fxOperation3.Coroutine = ((MonoBehaviour)piece).StartCoroutine(ApplyFx(piece, duration, blink, onFinish, fxOperation3));
		}
	}

	private static IEnumerator ApplyFx(Piece piece, float duration, bool blink, Action? onFinish, FxOperation operation)
	{
		if (duration < 0f && !blink)
		{
			yield break;
		}
		Logging<ModLib>.InterpolatedString msg = new Logging<ModLib>.InterpolatedString(18, 2, out var shouldAppend);
		if (shouldAppend)
		{
			msg.AppendLiteral("Applying FX to ");
			msg.AppendFormatted(piece.m_name);
			msg.AppendLiteral(" @ ");
			msg.AppendFormatted<Vector3>(((Component)piece).transform.position.XZY());
		}
		Logging<ModLib>.Info(msg);
		QuickOutline outline = piece.GetOutline();
		if (!blink)
		{
			yield return (object)new WaitForSeconds(duration);
			if (!operation.IsCancelled)
			{
				Finished();
			}
			yield break;
		}
		bool toggle = false;
		double startTime = Time.timeAsDouble;
		while (duration < 0f || Time.timeAsDouble < startTime + (double)duration)
		{
			QuickOutline quickOutline = outline;
			toggle = (shouldAppend = !toggle);
			quickOutline.SetVisible(shouldAppend);
			yield return BlinkDelay;
			if (operation.IsCancelled)
			{
				yield break;
			}
		}
		Finished();
		void Finished()
		{
			if (FxOperations.TryGetValue(piece, out FxOperation value) && value == operation)
			{
				FxOperations.Remove(piece);
				outline.SetVisible(isVisible: false);
				onFinish?.Invoke();
			}
		}
	}

	private static void StopFX(Piece piece)
	{
		//IL_004b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0050: Unknown result type (might be due to invalid IL or missing references)
		if (FxOperations.TryGetValue(piece, out FxOperation value))
		{
			Logging<ModLib>.InterpolatedString msg = new Logging<ModLib>.InterpolatedString(19, 2, out var shouldAppend);
			if (shouldAppend)
			{
				msg.AppendLiteral("Stopping FX for ");
				msg.AppendFormatted(piece.m_name);
				msg.AppendLiteral(" @ ");
				msg.AppendFormatted<Vector3>(((Component)piece).transform.position.XZY());
			}
			Logging<ModLib>.Info(msg);
			value.IsCancelled = true;
			if (value.Coroutine != null)
			{
				((MonoBehaviour)piece).StopCoroutine(value.Coroutine);
			}
			FxOperations.Remove(piece);
		}
	}

	public static void None()
	{
		Logging<ModLib>.Info("Stop all FX coroutines", 1);
		Piece[] array = FxOperations.Keys.ToArray();
		for (int i = 0; i < array.Length; i++)
		{
			Unselect(array[i]);
		}
	}

	[HarmonyPrefix]
	[HarmonyPatch(typeof(Piece), "OnDestroy")]
	private static void Piece_OnDestroy(Piece __instance)
	{
		StopFX(__instance);
	}

	static Highlight()
	{
		//IL_000f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0019: Expected Obj, but got Unknown
	}
}
