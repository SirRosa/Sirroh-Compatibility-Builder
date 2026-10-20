using System;
using UnityEngine;

namespace neobotics.ModSdk;

public static class JsonHelper
{
	[Serializable]
	private class JsonWrapper<T>
	{
		public T[] Items;
	}

	public static T[] FromJson<T>(string json)
	{
		return JsonUtility.FromJson<JsonWrapper<T>>(json).Items;
	}

	public static string ToJson<T>(T[] array)
	{
		return JsonUtility.ToJson((object)new JsonWrapper<T>
		{
			Items = array
		});
	}

	public static string ToJson<T>(T[] array, bool prettyPrint)
	{
		return JsonUtility.ToJson((object)new JsonWrapper<T>
		{
			Items = array
		}, prettyPrint);
	}
}
