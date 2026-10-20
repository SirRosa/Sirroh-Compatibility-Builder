using System;
using System.Collections.Generic;
using System.ComponentModel;
using JetBrains.Annotations;
using Newtonsoft.Json;

namespace EpicLootAPI;

[Serializable]
[PublicAPI]
internal class MaterialConversion
{
	public string Name = "";

	public string Product = "";

	public int Amount;

	public MaterialConversionType Type;

	public List<MaterialConversionRequirement> Resources = new List<MaterialConversionRequirement>();

	internal static readonly Method API_AddMaterialConversion = new Method("AddMaterialConversion");

	internal static readonly Method API_UpdateMaterialConversion = new Method("UpdateMaterialConversion");

	internal static readonly List<MaterialConversion> MaterialConversions = new List<MaterialConversion>();

	[Description("Creates a new material conversion definition.")]
	public MaterialConversion(MaterialConversionType type, string name, string product, int amount = 1)
	{
		Name = name;
		Product = product;
		Amount = amount;
		Type = type;
		MaterialConversions.Add(this);
	}

	public MaterialConversion()
	{
	}

	public static void RegisterAll()
	{
		foreach (MaterialConversion item in new List<MaterialConversion>(MaterialConversions))
		{
			item.Register();
		}
	}

	[Description("serializes to json and sends to EpicLoot")]
	public bool Register()
	{
		string text = JsonConvert.SerializeObject((object)this);
		if (!(API_AddMaterialConversion.Invoke(text)[0] is string value))
		{
			return false;
		}
		MaterialConversions.Remove(this);
		RunTimeRegistry.Register(this, value);
		EpicLoot.logger.LogDebug("Registered material conversion: " + Name);
		return true;
	}

	public bool Update()
	{
		if (!RunTimeRegistry.TryGetValue(this, out string value))
		{
			return false;
		}
		string text = JsonConvert.SerializeObject((object)this);
		bool flag = (bool)(API_UpdateMaterialConversion.Invoke(value, text)[0] ?? ((object)false));
		EpicLoot.logger.LogDebug($"Updated material conversion: {Name}, {flag}");
		return flag;
	}
}
