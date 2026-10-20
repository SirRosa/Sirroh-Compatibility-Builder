using System;
using System.IO;
using System.Reflection;
using UnityEngine;

namespace neobotics.ModSdk;

public class ImageHelper
{
	private readonly string externalFolder;

	private readonly Logging logger;

	private bool isEmbedded;

	public ImageHelper(string externalFolder)
		: this(externalFolder, embedded: false)
	{
	}

	public ImageHelper(string externalFolder, bool embedded = true)
	{
		this.externalFolder = externalFolder;
		logger = Logging.GetLogger();
		isEmbedded = embedded;
	}

	public Sprite LoadSprite(string name, int width, int height, bool linear = false, float pixelsPerUnit = 100f)
	{
		logger.Debug("Reading image and creating sprite " + name);
		if (TryLoadImage(name, width, height, linear, out var image))
		{
			return LoadSprite(image, pixelsPerUnit);
		}
		return null;
	}

	public Sprite LoadSprite(Texture2D texture, float pixelsPerUnit = 100f)
	{
		return LoadSprite(texture, ((Object)texture).name, ((Texture)texture).width, ((Texture)texture).height, pixelsPerUnit);
	}

	public Sprite LoadSprite(Texture2D texture, string name, float width, float height, float pixelsPerUnit = 100f)
	{
		//IL_0044: Unknown result type (might be due to invalid IL or missing references)
		//IL_0049: Unknown result type (might be due to invalid IL or missing references)
		if ((Object)(object)texture == (Object)null)
		{
			return null;
		}
		if (string.IsNullOrWhiteSpace(name))
		{
			name = ((Object)texture).name;
		}
		logger.Debug("Creating sprite " + name + " from existing texture");
		Sprite val = Sprite.Create(texture, new Rect(0f, 0f, width, height), Vector2.zero, pixelsPerUnit);
		if ((Object)(object)val == (Object)null)
		{
			throw new ApplicationException("Can't create sprite " + name);
		}
		((Object)val).name = name;
		return val;
	}

	public bool TryLoadImage(string name, int width, int height, bool linear, out Texture2D image)
	{
		//IL_00b1: Unknown result type (might be due to invalid IL or missing references)
		//IL_00b7: Expected Obj, but got Unknown
		image = null;
		byte[] array = null;
		if (isEmbedded)
		{
			Stream manifestResourceStream = Assembly.GetExecutingAssembly().GetManifestResourceStream(externalFolder + "." + name);
			if (manifestResourceStream == null)
			{
				throw new FileNotFoundException("Can't find " + name + " in " + externalFolder);
			}
			array = new byte[manifestResourceStream.Length];
			manifestResourceStream.Read(array, 0, (int)manifestResourceStream.Length);
		}
		else
		{
			string text = Path.Combine(externalFolder, name);
			logger.Debug("Reading external file " + text);
			if (!File.Exists(text))
			{
				throw new FileNotFoundException("Cannot find image " + name);
			}
			array = File.ReadAllBytes(text);
		}
		Texture2D val = new Texture2D(width, height, (TextureFormat)4, true, linear);
		if (!ImageConversion.LoadImage(val, array, false))
		{
			throw new FileLoadException("Can't load image " + name);
		}
		image = val;
		return true;
	}
}
