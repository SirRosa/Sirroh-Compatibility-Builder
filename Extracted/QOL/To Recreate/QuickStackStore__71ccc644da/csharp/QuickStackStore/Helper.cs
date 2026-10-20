using System;
using System.IO;
using System.Reflection;
using BepInEx.Configuration;
using UnityEngine;

namespace QuickStackStore;

public static class Helper
{
	private static MethodInfo LoadImage;

	internal static void Log(object s, QSSConfig.DebugSeverity debugSeverity = QSSConfig.DebugSeverity.Normal)
	{
		if (debugSeverity > (QSSConfig.DebugConfig.DebugSeverity?.Value ?? QSSConfig.DebugSeverity.Normal))
		{
			return;
		}
		string text = "Quick Stack - Store - Sort - Trash - Restock 1.4.16: " + ((s != null) ? s.ToString() : "null");
		ConfigEntry<QSSConfig.DebugLevel> showDebugLogs = QSSConfig.DebugConfig.ShowDebugLogs;
		if (showDebugLogs != null && showDebugLogs.Value == QSSConfig.DebugLevel.Log)
		{
			Debug.Log((object)text);
			return;
		}
		ConfigEntry<QSSConfig.DebugLevel> showDebugLogs2 = QSSConfig.DebugConfig.ShowDebugLogs;
		if (showDebugLogs2 != null && showDebugLogs2.Value == QSSConfig.DebugLevel.Warning)
		{
			Debug.LogWarning((object)text);
		}
	}

	internal static void LogO(object s, QSSConfig.DebugLevel OverrideLevel = QSSConfig.DebugLevel.Warning)
	{
		string text = "Quick Stack - Store - Sort - Trash - Restock 1.4.16: " + ((s != null) ? s.ToString() : "null");
		switch (OverrideLevel)
		{
		case QSSConfig.DebugLevel.Log:
			Debug.Log((object)text);
			break;
		case QSSConfig.DebugLevel.Warning:
			Debug.LogWarning((object)text);
			break;
		}
	}

	internal static int CompareSlotOrder(Vector2i a, Vector2i b)
	{
		//IL_0008: Unknown result type (might be due to invalid IL or missing references)
		//IL_0033: Unknown result type (might be due to invalid IL or missing references)
		int num = -a.y.CompareTo(b.y);
		if (QSSConfig.GeneralConfig.UseTopDownLogicForEverything.Value)
		{
			num *= -1;
		}
		return (num != 0) ? num : a.x.CompareTo(b.x);
	}

	public static Sprite LoadSprite(string path, Rect size, Vector2? pivot = null, int units = 100)
	{
		//IL_0048: Unknown result type (might be due to invalid IL or missing references)
		//IL_004e: Expected Obj, but got Unknown
		//IL_001c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0102: Unknown result type (might be due to invalid IL or missing references)
		//IL_0105: Unknown result type (might be due to invalid IL or missing references)
		if (!pivot.HasValue)
		{
			pivot = new Vector2(0.5f, 0.5f);
		}
		Assembly executingAssembly = Assembly.GetExecutingAssembly();
		Stream manifestResourceStream = executingAssembly.GetManifestResourceStream(path);
		Texture2D val = new Texture2D((int)size.width, (int)size.height, (TextureFormat)4, false, true);
		using MemoryStream memoryStream = new MemoryStream();
		manifestResourceStream.CopyTo(memoryStream);
		if (LoadImage == null)
		{
			Assembly assembly = Assembly.Load("UnityEngine.ImageConversionModule");
			Type type = assembly.GetType("UnityEngine.ImageConversion");
			LoadImage = type.GetMethod("LoadImage", new Type[2]
			{
				typeof(Texture2D),
				typeof(byte[])
			});
			if (LoadImage == null)
			{
				throw new MissingMethodException("Could not find UnityEngine.ImageConversion.LoadImage(Texture2D, byte[])");
			}
		}
		LoadImage.Invoke(null, new object[2]
		{
			val,
			memoryStream.ToArray()
		});
		val.Apply();
		return Sprite.Create(val, size, pivot.Value, (float)units);
	}
}
