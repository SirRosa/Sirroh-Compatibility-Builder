using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;
using UnityEngine.Networking;

namespace neobotics.ModSdk;

public class AudioHelper : MonoBehaviour
{
	private readonly Dictionary<string, AudioClip> audioClips = new Dictionary<string, AudioClip>();

	private Logging logger;

	public void Awake()
	{
		logger = Logging.GetLogger();
		logger.Debug("AudidHelper.Awake");
	}

	public void Start()
	{
		logger.Debug("AudioHelper.Start");
		ZRoutedRpc.instance.Register<Vector3, string>("NeoPlayClip", (Action<long, Vector3, string>)RPC_NeoPlayClip);
	}

	public void RPC_NeoPlayClip(long sender, Vector3 sourcePoint, string clipName)
	{
		//IL_000f: Unknown result type (might be due to invalid IL or missing references)
		if (ZNet.instance.IsDedicated())
		{
			return;
		}
		try
		{
			NeoPlayClip(sourcePoint, clipName);
		}
		catch (Exception e)
		{
			logger.Error(e, stackTrace: false);
		}
	}

	public void Play(Vector3 sourcePoint, string clipName)
	{
		//IL_0014: Unknown result type (might be due to invalid IL or missing references)
		ZRoutedRpc.instance.InvokeRoutedRPC(0L, "NeoPlayClip", new object[2] { sourcePoint, clipName });
	}

	public void NeoPlayClip(Vector3 sourcePoint, string clipName)
	{
		//IL_000a: Unknown result type (might be due to invalid IL or missing references)
		//IL_000f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0011: Unknown result type (might be due to invalid IL or missing references)
		//IL_0012: Unknown result type (might be due to invalid IL or missing references)
		Vector3 position = ((Component)Player.m_localPlayer).transform.position;
		NeoPlayClip(sourcePoint, position, clipName);
	}

	public void NeoPlayClip(Vector3 sourcePoint, Vector3 targetPoint, string clipName)
	{
		//IL_002c: Unknown result type (might be due to invalid IL or missing references)
		//IL_002d: Unknown result type (might be due to invalid IL or missing references)
		//IL_002e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0033: Unknown result type (might be due to invalid IL or missing references)
		//IL_0036: Unknown result type (might be due to invalid IL or missing references)
		//IL_003b: Unknown result type (might be due to invalid IL or missing references)
		//IL_003c: Unknown result type (might be due to invalid IL or missing references)
		//IL_003d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0051: Unknown result type (might be due to invalid IL or missing references)
		//IL_0052: Unknown result type (might be due to invalid IL or missing references)
		//IL_0054: Unknown result type (might be due to invalid IL or missing references)
		//IL_0059: Unknown result type (might be due to invalid IL or missing references)
		if (!audioClips.TryGetValue(clipName.ToLower(), out var value))
		{
			logger.Warning("Couldn't find audio clip for " + clipName);
			return;
		}
		Vector3 val = sourcePoint - targetPoint;
		Vector3 normalized = val.normalized;
		float num = (Vector3.Distance(sourcePoint, targetPoint) + 1f) / 10f;
		AudioSource.PlayClipAtPoint(value, targetPoint + normalized * num, 1f);
	}

	public float GetClipDuration(string clipName)
	{
		if (!audioClips.TryGetValue(clipName.ToLower(), out var value))
		{
			return -1f;
		}
		return value.length;
	}

	internal void LoadAudioResources(string resourceFolder)
	{
		//IL_003d: Unknown result type (might be due to invalid IL or missing references)
		//IL_005d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0065: Unknown result type (might be due to invalid IL or missing references)
		//IL_0063: Unknown result type (might be due to invalid IL or missing references)
		//IL_006c: Unknown result type (might be due to invalid IL or missing references)
		audioClips.Clear();
		logger.Debug("LoadAudioResources");
		string[] files = Directory.GetFiles(resourceFolder, "*.*", SearchOption.TopDirectoryOnly);
		foreach (string text in files)
		{
			string text2 = Path.GetExtension(text).ToLowerInvariant();
			AudioType val = (AudioType)0;
			if (!(text2 == ".wav"))
			{
				if (text2 == ".mp3")
				{
					val = (AudioType)13;
				}
			}
			else
			{
				val = (AudioType)20;
			}
			if ((int)val != 0)
			{
				((MonoBehaviour)this).StartCoroutine(LoadExternalClip(text, val));
			}
		}
	}

	private IEnumerator LoadExternalClip(string filePath, AudioType type)
	{
		//IL_0015: Unknown result type (might be due to invalid IL or missing references)
		//IL_0016: Unknown result type (might be due to invalid IL or missing references)
		string uri = new Uri(filePath).AbsoluteUri;
		string clipName = Path.GetFileName(filePath).ToLowerInvariant();
		UnityWebRequest req = UnityWebRequestMultimedia.GetAudioClip(uri, type);
		yield return req.SendWebRequest();
		if ((int)req.result == 1)
		{
			AudioClip content = DownloadHandlerAudioClip.GetContent(req);
			audioClips[clipName] = content;
			logger.Debug("Loaded external audio: " + clipName);
		}
		else
		{
			logger.Warning("Failed to load external audio: " + uri);
		}
	}
}
