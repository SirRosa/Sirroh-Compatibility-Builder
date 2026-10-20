using System.Collections.Generic;
using System.Reflection;
using UnityEngine;

namespace LetMeTameYou;

public class PrefabManager : MonoBehaviour
{
	public GameObject Root;

	private static AssetBundle Assets;

	public const string assetBundleName = "lmty_assets";

	public const string assetPath = "assets/lmty/";

	public static GameObject TameStickPrefab;

	public static Sprite chickenEggSprite;

	public static Sprite drakeEggSprite;

	public static Sprite rockyEggSprite;

	public static Dictionary<string, Shader> ShaderDict = new Dictionary<string, Shader>();

	private void Awake()
	{
		//IL_0007: Unknown result type (might be due to invalid IL or missing references)
		//IL_0011: Expected Obj, but got Unknown
		Root = new GameObject("PrefabList");
		Root.transform.SetParent(LetMeTameYou.Root.transform);
		Root.SetActive(false);
		Assets = Utils.LoadAssetBundle("lmty_assets", Assembly.GetExecutingAssembly());
		TameStickPrefab = Assets.LoadAsset<GameObject>("assets/lmty/lmty_tamingtool.prefab");
	}

	public static AssetBundle getAssetBundle()
	{
		return Assets;
	}

	public static void setAssetBundle(AssetBundle assetBundle)
	{
		Assets = assetBundle;
	}

	public static void ItemReg()
	{
		DBG.blogDebug("ItemReg");
		if (LetMeTameYou.useTamingTool.Value)
		{
			addItem(TameStickPrefab, LetMeTameYou.TamingTool_Recipe.Value, LetMeTameYou.TamingTool_Station.Value);
		}
		else
		{
			removeItem("LMTY_TamingTool");
		}
	}

	private static void removeItem(string prefabName)
	{
		GameObject itemPrefab = ObjectDB.instance.GetItemPrefab(prefabName);
		if (!Object.op_Implicit((Object)(object)itemPrefab))
		{
			DBG.blogWarning("cannot remove: " + prefabName + " as not in OBjectDB");
		}
		else
		{
			ObjectDB.instance.m_items.Remove(itemPrefab);
		}
	}

	public static void addItem(GameObject go, string recipe, string station)
	{
		if (Object.op_Implicit((Object)(object)ObjectDB.instance.GetItemPrefab(((Object)go).name)))
		{
			if (Object.op_Implicit((Object)(object)ZNetScene.instance))
			{
				DBG.blogWarning("addItem resetting: " + ((Object)go).name + " recipe");
				ResetRecipe(recipe, station, ((Object)go).name);
			}
			DBG.blogDebug("already in oDB: " + ((Object)go).name);
			return;
		}
		DBG.blogDebug("addItem adding: " + ((Object)go).name + " to ObjectDB: " + ((Object)ObjectDB.instance).name);
		Utils.addItemToODB(TameStickPrefab, ObjectDB.instance);
		DBG.blogDebug("Amount in objectDB=" + ObjectDB.instance.m_itemByHash.Count);
		if (Object.op_Implicit((Object)(object)ZNetScene.instance))
		{
			ResetRecipe(recipe, station, ((Object)go).name);
		}
	}

	private static Recipe ResetRecipe(string recipeConfig, string craftingStation, string item)
	{
		if (recipeConfig == "" || craftingStation == "")
		{
			return null;
		}
		GameObject itemPrefab = ObjectDB.instance.GetItemPrefab(item);
		DBG.blogDebug("resetting: " + item + " recipe");
		if ((Object)(object)itemPrefab == (Object)null)
		{
			DBG.blogWarning(item + " is null");
			return null;
		}
		ItemDrop item2 = default;
		if (!itemPrefab.TryGetComponent<ItemDrop>(ref item2))
		{
			DBG.blogWarning(item + " does not have itemDrop");
			return null;
		}
		Recipe val = ScriptableObject.CreateInstance<Recipe>();
		((Object)val).name = "Recipe_" + item;
		val.m_item = item2;
		string[] array = craftingStation.Split(new char[1] { ':' });
		GameObject prefab = ZNetScene.instance.GetPrefab(array[0]);
		CraftingStation val2 = default;
		if ((Object)(object)prefab == (Object)null || !prefab.TryGetComponent<CraftingStation>(ref val2))
		{
			DBG.blogWarning("invalid crafting station: " + array[0]);
			return null;
		}
		val.m_craftingStation = val2;
		val.m_repairStation = val2;
		if (array.Length > 1 && int.TryParse(array[1], out var result))
		{
			val.m_minStationLevel = result;
		}
		else
		{
			val.m_minStationLevel = 5;
		}
		string[] array2 = recipeConfig.Split(new char[1] { ',' });
		int amt = 1;
		int upgrade_amt = 1;
		List<Requirement> list = new List<Requirement>();
		for (int i = 0; i < array2.Length; i++)
		{
			string[] array3 = array2[i].Split(new char[1] { ':' });
			if (array3.Length > 1 && int.TryParse(array3[1], out var result2))
			{
				if (array3.Length > 2 && int.TryParse(array3[2], out var result3))
				{
					amt = result2;
					upgrade_amt = result3;
				}
				else
				{
					amt = result2;
					upgrade_amt = Mathf.RoundToInt((float)result2 * 0.75f);
				}
			}
			Requirement val3 = makeRequirment(array3[0], amt, upgrade_amt);
			if (val3 == null)
			{
				return null;
			}
			list.Add(val3);
		}
		val.m_resources = list.ToArray();
		ObjectDB.instance.m_recipes.Add(val);
		return val;
	}

	private static Requirement makeRequirment(string itemStr, int amt, int upgrade_amt)
	{
		//IL_0001: Unknown result type (might be due to invalid IL or missing references)
		//IL_0007: Expected Obj, but got Unknown
		Requirement val = new Requirement();
		GameObject itemPrefab = ObjectDB.instance.GetItemPrefab(itemStr);
		ItemDrop resItem = default;
		if (!Object.op_Implicit((Object)(object)itemPrefab) || !itemPrefab.TryGetComponent<ItemDrop>(ref resItem))
		{
			DBG.blogDebug("Ingredient: " + itemStr + " is not found");
			return null;
		}
		val.m_amount = amt;
		val.m_amountPerLevel = upgrade_amt;
		val.m_resItem = resItem;
		return val;
	}

	public static void FixShaders(GameObject go)
	{
		DBG.blogDebug("Start Fixing SHaders for " + ((Object)go).name);
		Renderer[] componentsInChildren = go.GetComponentsInChildren<Renderer>();
		Renderer[] array = componentsInChildren;
		foreach (Renderer val in array)
		{
			Material[] materials = val.materials;
			foreach (Material val2 in materials)
			{
				string text = ((Object)val2.shader).name;
				if (text.StartsWith("Mock_"))
				{
					text = text.Substring(5);
				}
				DBG.blogDebug("Shader " + text + " is attempting to be switched");
				if (text == "Standard")
				{
					DBG.blogDebug("Skipping Standard");
					continue;
				}
				Shader fixedShader = getFixedShader(text);
				if ((Object)(object)fixedShader != (Object)null)
				{
					val2.shader = fixedShader;
					DBG.blogDebug("Switched Shader for " + ((Object)go).name);
				}
			}
		}
	}

	private static GameObject FindShaderObject(string name)
	{
		ZNetScene val = ZNetScene.instance;
		if ((Object)(object)val == (Object)null)
		{
			val = TameManager.zns;
		}
		if (val.m_namedPrefabs.Count > 0)
		{
			DBG.blogDebug("znet has init when setting shader: " + name);
			return val.GetPrefab(name);
		}
		DBG.blogDebug("znet is init when setting shader: " + name);
		return val.m_prefabs.Find((GameObject x) => ((Object)x).name.Contains(name));
	}

	private static Shader getFixedShader(string shaderName)
	{
		if (ShaderDict.TryGetValue(shaderName, out var value))
		{
			return value;
		}
		Shader val = null;
		try
		{
			switch (shaderName)
			{
			case "Custom/Vegetation":
			{
				GameObject val2 = FindShaderObject("AshlandsBranch1");
				if ((Object)(object)val2 != (Object)null)
				{
					val = ((Component)val2.transform.GetChild(0)).GetComponent<Renderer>().material.shader;
				}
				break;
			}
			case "Custom/Player":
			{
				GameObject val2 = FindShaderObject("ArmorAshlandsMediumChest");
				if ((Object)(object)val2 != (Object)null)
				{
					val = val2.GetComponent<ItemDrop>().m_itemData.m_shared.m_armorMaterial.shader;
				}
				break;
			}
			case "Standard":
				return null;
			default:
			{
				if (ShaderDict.TryGetValue("Standard", out var value2))
				{
					return value2;
				}
				GameObject val2 = FindShaderObject("AmberPearl");
				if ((Object)(object)val2 != (Object)null)
				{
					val = val2.GetComponentInChildren<Renderer>().material.shader;
					shaderName = "Standard";
					ShaderDict.Add(shaderName, val);
				}
				return val;
			}
			}
		}
		catch
		{
			DBG.blogWarning("Failed shader fix with " + shaderName);
			if (ShaderDict.TryGetValue("Standard", out var value3))
			{
				return value3;
			}
			GameObject val2 = FindShaderObject("AmberPearl");
			if ((Object)(object)val2 != (Object)null)
			{
				val = val2.GetComponentInChildren<Renderer>().material.shader;
				shaderName = "Standard";
				ShaderDict.Add(shaderName, val);
				return val;
			}
			DBG.blogWarning("Failed secondary fix with " + shaderName);
		}
		if (((Object)(object)val != (Object)null) & !ShaderDict.ContainsKey(shaderName))
		{
			ShaderDict.Add(shaderName, val);
		}
		return val;
	}
}
