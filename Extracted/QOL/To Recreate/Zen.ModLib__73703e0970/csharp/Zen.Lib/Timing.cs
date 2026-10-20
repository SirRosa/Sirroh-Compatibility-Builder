using System;
using System.Collections;
using UnityEngine;

namespace Zen.Lib;

public static class Timing
{
	public static Coroutine StartCoroutine(IEnumerator coroutine)
	{
		return ((MonoBehaviour)ZenMod<ModLib>.Instance).StartCoroutine(coroutine);
	}

	public static void StopCoroutine(Coroutine? coroutine)
	{
		if (coroutine != null)
		{
			((MonoBehaviour)ZenMod<ModLib>.Instance).StopCoroutine(coroutine);
		}
	}

	public static Coroutine SkipFrames(this MonoBehaviour component, int frames, Action action)
	{
		return component.StartCoroutine(_SkipFrames(frames, action));
	}

	public static Coroutine SkipFrames(int frames, Action action)
	{
		return ((MonoBehaviour)(object)ZenMod<ModLib>.Instance).SkipFrames(frames, action);
	}

	public static Coroutine NextFrame(this MonoBehaviour component, Action action)
	{
		return component.StartCoroutine(_SkipFrames(1, action));
	}

	public static Coroutine NextFrame(Action action)
	{
		return ((MonoBehaviour)(object)ZenMod<ModLib>.Instance).NextFrame(action);
	}

	public static Coroutine EndOfFrame(this MonoBehaviour component, Action action)
	{
		return component.StartCoroutine(_EndOfFrame(action));
	}

	public static Coroutine EndOfFrame(Action action)
	{
		return ((MonoBehaviour)(object)ZenMod<ModLib>.Instance).EndOfFrame(action);
	}

	public static Coroutine Delay(this MonoBehaviour component, float seconds, Action action)
	{
		return component.StartCoroutine(_Delay(seconds, action));
	}

	public static Coroutine Delay(float seconds, Action action)
	{
		return ((MonoBehaviour)(object)ZenMod<ModLib>.Instance).Delay(seconds, action);
	}

	public static Coroutine When(this MonoBehaviour component, Func<bool> condition, Action action)
	{
		return component.StartCoroutine(_When(condition, action));
	}

	public static Coroutine When(Func<bool> condition, Action action)
	{
		return ((MonoBehaviour)(object)ZenMod<ModLib>.Instance).When(condition, action);
	}

	public static Coroutine WhenNot(this MonoBehaviour component, Func<bool> condition, Action action)
	{
		return component.StartCoroutine(_When(() => !condition(), action));
	}

	public static Coroutine WhenNot(Func<bool> condition, Action action)
	{
		return ((MonoBehaviour)(object)ZenMod<ModLib>.Instance).WhenNot(condition, action);
	}

	private static IEnumerator _When(Func<bool> condition, Action action)
	{
		yield return (object)new WaitUntil(condition);
		action();
	}

	private static IEnumerator _Delay(float delay, Action action)
	{
		yield return (object)new WaitForSeconds(delay);
		action();
	}

	private static IEnumerator _SkipFrames(int frames, Action action)
	{
		for (int i = 0; i < frames; i++)
		{
			yield return null;
		}
		action();
	}

	private static IEnumerator _EndOfFrame(Action action)
	{
		yield return (object)new WaitForEndOfFrame();
		action();
	}
}
