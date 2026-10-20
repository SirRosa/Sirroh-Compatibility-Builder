using System;
using System.Collections.Generic;
using JetBrains.Annotations;
using Newtonsoft.Json;

namespace EpicLootAPI;

[Serializable]
[PublicAPI]
internal class SecretStashItem
{
	public string Item = "";

	public int CoinsCost;

	public int ForestTokenCost;

	public int IronBountyTokenCost;

	public int GoldBountyTokenCost;

	private SecretStashType type;

	internal static readonly List<SecretStashItem> SecretStashes = new List<SecretStashItem>();

	internal static readonly Method API_AddSecretStashItem = new Method("AddSecretStashItem");

	internal static readonly Method API_UpdateSecretStashItem = new Method("UpdateSecretStashItem");

	public SecretStashItem(SecretStashType type, string item)
	{
		Item = item;
		this.type = type;
		SecretStashes.Add(this);
	}

	public SecretStashItem()
	{
	}

	public static void RegisterAll()
	{
		foreach (SecretStashItem item in new List<SecretStashItem>(SecretStashes))
		{
			item.Register();
		}
	}

	public bool Register()
	{
		string text = JsonConvert.SerializeObject((object)this);
		if (!(API_AddSecretStashItem.Invoke(type.ToString(), text)[0] is string value))
		{
			return false;
		}
		SecretStashes.Remove(this);
		RunTimeRegistry.Register(this, value);
		EpicLoot.logger.LogDebug("Registered secret stash " + Item);
		return true;
	}

	public bool Update()
	{
		if (!RunTimeRegistry.TryGetValue(this, out string value))
		{
			return false;
		}
		string text = JsonConvert.SerializeObject((object)this);
		bool flag = (bool)(API_UpdateSecretStashItem.Invoke(value, text)[0] ?? ((object)false));
		EpicLoot.logger.LogDebug($"Updated secret stash {Item}, {flag}");
		return flag;
	}
}
