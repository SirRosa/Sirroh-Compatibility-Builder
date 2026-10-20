using System.Collections.Generic;
using System.Linq;

namespace neobotics.ModSdk;

internal class CustomDataWrapper
{
	private Dictionary<string, string> playerData;

	private Dictionary<string, string> Data { get; set; }

	public CustomDataWrapper(Dictionary<string, string> sourceData, string keyPrefix)
	{
		CustomDataWrapper customDataWrapper = this;
		playerData = sourceData;
		Data = new Dictionary<string, string>();
		sourceData.Keys.ToList().ForEach((string key) =>
		{
			if (key.StartsWith(keyPrefix))
			{
				customDataWrapper.Data.Add(key, sourceData[key]);
			}
		});
	}

	public void Add(string key, string value)
	{
		Data.Add(key, value);
		playerData.Add(key, value);
	}

	public bool Remove(string key)
	{
		return Data.Remove(key) & playerData.Remove(key);
	}

	public void Set(string key, string value)
	{
		if (Data.ContainsKey(key))
		{
			Data[key] = value;
		}
		else
		{
			Data.Add(key, value);
		}
		if (playerData.ContainsKey(key))
		{
			playerData[key] = value;
		}
		else
		{
			playerData.Add(key, value);
		}
	}

	public string Get(string key)
	{
		if (Data.ContainsKey(key))
		{
			return Data[key];
		}
		return null;
	}

	public bool ContainsKey(string key)
	{
		return Data.ContainsKey(key);
	}

	public void PreSaveSync()
	{
		foreach (KeyValuePair<string, string> datum in Data)
		{
			if (!playerData.ContainsKey(datum.Key))
			{
				playerData.Add(datum.Key, datum.Value);
			}
		}
	}
}
