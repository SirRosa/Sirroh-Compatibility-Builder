using System;
using System.IO;
using System.Reflection;
using BepInEx;
using Jotunn.Utils;
using UnityEngine;

namespace Zen.Lib;

public static class AssetIO
{
	public static T LoadAssetFromPlatformResource<T>(this BaseUnityPlugin plugin, string resourceName, string assetName) where T : Object
	{
		try
		{
			AssetBundle val = plugin.LoadAssetBundleFromPlatformResource(resourceName);
			T result = val.LoadAsset<T>(assetName);
			val.Unload(false);
			return result;
		}
		catch (Exception arg)
		{
			throw new Exception($"Assets failed to load: {arg}");
		}
	}

	public static AssetBundle LoadAssetBundleFromPlatformResource(this BaseUnityPlugin plugin, string resourceName)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_0005: Unknown result type (might be due to invalid IL or missing references)
		//IL_0007: Unknown result type (might be due to invalid IL or missing references)
		//IL_000a: Invalid comparison between Unknown and I4
		//IL_000c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0010: Invalid comparison between Unknown and I4
		RuntimePlatform platform = Application.platform;
		string text;
		if ((int)platform == 1)
		{
			text = "osx";
		}
		else
		{
			text = (((int)platform != 13) ? "windows" : "linux");
		}
		string text2 = text;
		Assembly assembly = ((object)plugin).GetType().Assembly;
		string text3 = "Resources." + resourceName + "_" + text2;
		AssetBundle val = AssetUtils.LoadAssetBundleFromResources(text3, assembly);
		if (Object.op_Implicit((Object)(object)val))
		{
			return val;
		}
		throw new Exception("Unable to load asset bundle from " + text3 + " (platform: " + text2 + ")");
	}

	public static Sprite LoadSpriteFromResource(this BaseUnityPlugin plugin, string resourceName)
	{
		Texture2D val = AssetUtils.LoadImage(LoadResourceToMemory(plugin, resourceName));
		if (!Object.op_Implicit((Object)(object)val))
		{
			throw new Exception("Unable to load as texture: " + resourceName);
		}
		return val.CreateSprite();
	}

	public static Sprite CreateSprite(this Texture2D texture)
	{
		//IL_001a: Unknown result type (might be due to invalid IL or missing references)
		//IL_002b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0031: Unknown result type (might be due to invalid IL or missing references)
		//IL_0032: Unknown result type (might be due to invalid IL or missing references)
		Rect val = new Rect(0f, 0f, (float)((Texture)texture).width, (float)((Texture)texture).height);
		Vector2 val2 = new Vector2(0.5f, 0.5f);
		return Sprite.Create(texture, val, val2);
	}

	private static byte[] LoadResourceToMemory(BaseUnityPlugin plugin, string resourceName)
	{
		Type type = ((object)plugin).GetType();
		Assembly assembly = type.Assembly;
		string text = type.Namespace + ".Resources." + resourceName;
		Logging<ModLib>.Info(text);
		using Stream stream = assembly.GetManifestResourceStream(text);
		using MemoryStream memoryStream = new MemoryStream();
		stream.CopyTo(memoryStream);
		return memoryStream.ToArray();
	}
}
