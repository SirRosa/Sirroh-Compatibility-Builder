using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Reflection.Emit;
using System.Runtime.CompilerServices;
using BepInEx;
using BepInEx.Bootstrap;
using HarmonyLib;
using JetBrains.Annotations;
using UnityEngine;

namespace ItemDataManager;

[PublicAPI]
[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
public class _003C27135a16_002D41db_002D418a_002Dafd2_002D7267dbe18137_003EItemInfo : IEnumerable<ItemData>, IEnumerable
{
	public static HashSet<Type> ForceLoadTypes;

	[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(2)]
	internal static string _modGuid;

	private static Dictionary<Type, HashSet<Type>> typeInheritorsCache;

	private static HashSet<string> knownTypes;

	private Dictionary<string, ItemData> data = new Dictionary<string, ItemData>();

	[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(new byte[] { 2, 1 })]
	private WeakReference<_003C27135a16_002D41db_002D418a_002Dafd2_002D7267dbe18137_003EItemInfo> selfReference;

	internal HashSet<string> isCloned = new HashSet<string>();

	[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(2)]
	private static ItemData awakeningItem;

	private static Assembly primaryAssembly;

	private static Dictionary<Assembly, string> assemblyNameCache;

	private static Dictionary<Type, string> classKeyCache;

	private HashSet<string> fetchedClassKeys = new HashSet<string>();

	private static MethodInfo removeMethod;

	[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(2)]
	private static ItemData checkingForStackableItemData;

	[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(new byte[] { 2, 1, 1 })]
	private static Dictionary<string, string> newValuesOnStackable;

	[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(2)]
	private static ItemData currentlyUpgradingItem;

	internal static string modGuid => _modGuid ?? (_modGuid = ((Func<string>)(() =>
	{
		//IL_0091: Unknown result type (might be due to invalid IL or missing references)
		IEnumerable<TypeInfo> source;
		try
		{
			source = Assembly.GetExecutingAssembly().DefinedTypes.ToList();
		}
		catch (ReflectionTypeLoadException ex)
		{
			source = from t in ex.Types
				where t != null
				select t.GetTypeInfo();
		}
		return ((BaseUnityPlugin)Chainloader.ManagerObject.GetComponent((Type)source.First([_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(0)] (TypeInfo t) => t.IsClass && typeof(BaseUnityPlugin).IsAssignableFrom(t)))).Info.Metadata.GUID;
	}))());

	public string Mod => modGuid;

	public ItemData ItemData { get; private set; }

	[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(2)]
	public string this[string key]
	{
		[return: _003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(2)]
		get
		{
			return Get<_003Ceb0313fd_002Dcaea_002D4e6f_002Db583_002D2e689a3d665d_003EStringItemData>(key)?.Value;
		}
		[param: _003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(2)]
		set
		{
			GetOrCreate<_003Ceb0313fd_002Dcaea_002D4e6f_002Db583_002D2e689a3d665d_003EStringItemData>(key).Value = value ?? "";
		}
	}

	internal static void addTypeToInheritorsCache(Type type, string typeKey)
	{
		if (!knownTypes.Contains(typeKey))
		{
			knownTypes.Add(typeKey);
			Type type2 = type;
			while ((object)type2 != null)
			{
				AddInterfaces(type2);
				type2 = type2.BaseType;
			}
		}
		void AddInterfaces(Type baseType)
		{
			if (!typeInheritorsCache.TryGetValue(baseType, out var value))
			{
				HashSet<Type> hashSet = (typeInheritorsCache[baseType] = new HashSet<Type>());
				value = hashSet;
			}
			value.Add(type);
			Type[] interfaces = baseType.GetInterfaces();
			for (int i = 0; i < interfaces.Length; i++)
			{
				AddInterfaces(interfaces[i]);
			}
		}
	}

	private static string cachedAssemblyName(Assembly assembly)
	{
		if (assemblyNameCache.TryGetValue(assembly, out var value))
		{
			return value;
		}
		return assemblyNameCache[assembly] = assembly.GetName().Name;
	}

	internal static string classKey(Type type, string key)
	{
		if (!classKeyCache.TryGetValue(type, out var value))
		{
			value = type.FullName + ((type.Assembly != primaryAssembly) ? ("," + cachedAssemblyName(type.Assembly)) : "");
			addTypeToInheritorsCache(type, value);
		}
		if (key == "")
		{
			return value;
		}
		return value + "#" + key;
	}

	internal static string dataKey(string key)
	{
		return modGuid + "#" + key;
	}

	internal _003C27135a16_002D41db_002D418a_002Dafd2_002D7267dbe18137_003EItemInfo(ItemData itemData)
	{
		ItemData = itemData;
		string text = dataKey("");
		foreach (string item in ItemData.m_customData.Keys.ToList())
		{
			if (!item.StartsWith(text))
			{
				continue;
			}
			string[] array = item.Substring(text.Length).Split(new char[1] { '#' }, 2);
			if (!knownTypes.Contains(array[0]))
			{
				Type type = Type.GetType(array[0]);
				if ((object)type != null && typeof(ItemData).IsAssignableFrom(type))
				{
					addTypeToInheritorsCache(type, array[0]);
				}
			}
		}
	}

	public T GetOrCreate<[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)] T>(string key = "") where T : ItemData, new()
	{
		return Add<T>(key) ?? Get<T>(key);
	}

	[return: _003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(2)]
	public T Add<[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)] T>(string key = "") where T : ItemData, new()
	{
		string text = classKey(typeof(T), key);
		if (fetchedClassKeys.Contains(text) && data.ContainsKey(text))
		{
			return null;
		}
		string text2 = dataKey(text);
		if (ItemData.m_customData.ContainsKey(text2) || (awakeningItem != ItemData && data.ContainsKey(text)))
		{
			return null;
		}
		ItemData.m_customData[text2] = "";
		ItemDataManager.ItemData.constructingInfo = selfReference ?? (selfReference = new WeakReference<_003C27135a16_002D41db_002D418a_002Dafd2_002D7267dbe18137_003EItemInfo>(this));
		T val = new T
		{
			info = selfReference,
			Key = key,
			CustomDataKey = text2
		};
		data[text] = val;
		val.Value = "";
		val.FirstLoad();
		return val;
	}

	[return: _003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(2)]
	public T Get<T>(string key = "") where T : class
	{
		if (!typeInheritorsCache.TryGetValue(typeof(T), out var value))
		{
			if (!typeof(ItemData).IsAssignableFrom(typeof(T)) || typeof(T) == typeof(ItemData))
			{
				throw new Exception("Trying to get value from ItemDataManager for class not inheriting from ItemData");
			}
			return null;
		}
		foreach (Type item in value)
		{
			string text = classKey(item, key);
			if (data.TryGetValue(text, out var value2))
			{
				return (T)(object)value2;
			}
			if (!fetchedClassKeys.Contains(text) && awakeningItem != ItemData)
			{
				string text2 = dataKey(text);
				fetchedClassKeys.Add(text);
				if (ItemData.m_customData.ContainsKey(text2))
				{
					return (T)(object)constructDataObj(text2, text);
				}
			}
		}
		return null;
	}

	public Dictionary<string, T> GetAll<[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)] T>() where T : ItemData
	{
		LoadAll();
		return data.Values.Where([_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(0)] (ItemData o) => o is T).ToDictionary([_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(0)] (ItemData o) => o.Key, [_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(0)] (ItemData o) => (T)o);
	}

	public bool Remove(string key = "")
	{
		return Remove<_003Ceb0313fd_002Dcaea_002D4e6f_002Db583_002D2e689a3d665d_003EStringItemData>(key);
	}

	public bool Remove<[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)] T>(string key = "") where T : ItemData
	{
		string key2 = classKey(typeof(T), key);
		string key3 = dataKey(key2);
		if (ItemData.m_customData.Remove(key3))
		{
			if (data.TryGetValue(key2, out var value))
			{
				value.Unload();
				data.Remove(key2);
			}
			return true;
		}
		return false;
	}

	public bool Remove<[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)] T>(T itemData) where T : ItemData
	{
		if (typeof(T) == itemData.GetType())
		{
			return Remove<T>(itemData.Key);
		}
		return (bool)removeMethod.MakeGenericMethod(itemData.GetType()).Invoke(this, new object[1] { itemData.Key });
	}

	[return: _003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(2)]
	private ItemData constructDataObj(string fullkey, string key)
	{
		string[] array = key.Split(new char[1] { '#' }, 2);
		Type type = Type.GetType(array[0]);
		if ((object)type == null || !typeof(ItemData).IsAssignableFrom(type))
		{
			return null;
		}
		ItemDataManager.ItemData.constructingInfo = selfReference ?? (selfReference = new WeakReference<_003C27135a16_002D41db_002D418a_002Dafd2_002D7267dbe18137_003EItemInfo>(this));
		ItemData itemData = (ItemData)Activator.CreateInstance(type);
		data[key] = itemData;
		itemData.info = selfReference;
		itemData.Key = ((array.Length > 1) ? array[1] : "");
		itemData.CustomDataKey = fullkey;
		itemData.Load();
		return itemData;
	}

	public void Save()
	{
		foreach (ItemData value in data.Values)
		{
			value.Save();
		}
	}

	public void LoadAll()
	{
		if (awakeningItem == ItemData)
		{
			return;
		}
		string text = dataKey("");
		foreach (string item in ItemData.m_customData.Keys.ToList())
		{
			if (item.StartsWith(text))
			{
				string key = item.Substring(text.Length);
				if (!data.ContainsKey(key))
				{
					constructDataObj(item, key);
				}
			}
		}
	}

	public IEnumerator<ItemData> GetEnumerator()
	{
		LoadAll();
		return data.Values.GetEnumerator();
	}

	IEnumerator IEnumerable.GetEnumerator()
	{
		return GetEnumerator();
	}

	private static void SavePrefix(ItemData __instance)
	{
		SaveItem(__instance);
	}

	private static void SaveInventoryPrefix(Inventory __instance)
	{
		foreach (ItemData item in __instance.m_inventory)
		{
			SaveItem(item);
		}
	}

	private static void SaveItem(ItemData item)
	{
		if (_003C35e5ab3c_002D7099_002D45c6_002Dac00_002Db53ba5a87838_003EItemExtensions.itemInfo.TryGetValue(item, out var value))
		{
			value.Save();
		}
	}

	[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(2)]
	[return: _003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(new byte[] { 2, 1, 1 })]
	public Dictionary<string, string> IsStackableWithOtherInfo(_003C27135a16_002D41db_002D418a_002Dafd2_002D7267dbe18137_003EItemInfo info)
	{
		LoadAll();
		Dictionary<string, string> dictionary = new Dictionary<string, string>();
		if (info != null)
		{
			info.LoadAll();
			foreach (string item in new HashSet<string>(info.data.Keys.Intersect(data.Keys)))
			{
				string text = data[item].TryStack(info.data[item]);
				if (text == null)
				{
					return null;
				}
				dictionary[item] = text;
			}
			foreach (KeyValuePair<string, ItemData> datum in info.data)
			{
				if (!dictionary.ContainsKey(datum.Key))
				{
					string text2 = info.data[datum.Key].TryStack(null);
					if (text2 == null)
					{
						return null;
					}
					dictionary[datum.Key] = text2;
				}
			}
		}
		foreach (KeyValuePair<string, ItemData> datum2 in data)
		{
			if (!dictionary.ContainsKey(datum2.Key))
			{
				string text3 = data[datum2.Key].TryStack(null);
				if (text3 == null)
				{
					return null;
				}
				dictionary[datum2.Key] = text3;
			}
		}
		return dictionary.ToDictionary([_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(0)] (KeyValuePair<string, string> kv) => dataKey(kv.Key), [_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(0)] (KeyValuePair<string, string> kv) => kv.Value);
	}

	[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(2)]
	private static void RegisterForceLoadedTypesAddItem(ItemData __result)
	{
		awakeningItem = null;
		if (__result != null)
		{
			RegisterForceLoadedTypes(__result);
		}
	}

	private static void RegisterForceLoadedTypes(ItemData itemData)
	{
		foreach (Type forceLoadType in ForceLoadTypes)
		{
			string key = classKey(forceLoadType, "");
			string text = dataKey(key);
			if (itemData.m_customData.ContainsKey(text))
			{
				_003C27135a16_002D41db_002D418a_002Dafd2_002D7267dbe18137_003EItemInfo obj = _003C35e5ab3c_002D7099_002D45c6_002Dac00_002Db53ba5a87838_003EItemExtensions.Data(itemData);
				if (!obj.data.ContainsKey(key))
				{
					obj.constructDataObj(text, key);
				}
			}
		}
	}

	private static void ItemDropAwake(ItemDrop __instance)
	{
		GameObject dropPrefab = __instance.m_itemData.m_dropPrefab;
		if (dropPrefab != null && _003C35e5ab3c_002D7099_002D45c6_002Dac00_002Db53ba5a87838_003EItemExtensions.itemInfo.TryGetValue(dropPrefab.GetComponent<ItemDrop>().m_itemData, out var value))
		{
			_003C35e5ab3c_002D7099_002D45c6_002Dac00_002Db53ba5a87838_003EItemExtensions.Data(__instance.m_itemData).isCloned = new HashSet<string>(value.data.Values.Select([_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(0)] (ItemData i) => i.CustomDataKey));
		}
	}

	private static void ItemDropAwakeDelayed(ItemDrop __instance)
	{
		if (!ZNetView.m_forceDisableInit)
		{
			RegisterForceLoadedTypes(__instance.m_itemData);
		}
	}

	private static void ItemDataClonePrefix(ItemData __instance, ItemData __result)
	{
		SaveItem(__instance);
	}

	private static void ItemDataClonePostfix(ItemData __instance, ItemData __result)
	{
		if (_003C35e5ab3c_002D7099_002D45c6_002Dac00_002Db53ba5a87838_003EItemExtensions.itemInfo.TryGetValue(__instance, out var value))
		{
			_003C35e5ab3c_002D7099_002D45c6_002Dac00_002Db53ba5a87838_003EItemExtensions.Data(__result).isCloned = new HashSet<string>(value.data.Values.Select([_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(0)] (ItemData i) => i.CustomDataKey));
		}
	}

	private static void ItemDataClonePostfixDelayed(ItemData __result)
	{
		RegisterForceLoadedTypes(__result);
	}

	private static void RegisterForceLoadedTypesOnPlayerLoaded(Player __instance)
	{
		foreach (Food food in __instance.m_foods)
		{
			GameObject itemPrefab = ObjectDB.instance.GetItemPrefab(food.m_name);
			if (itemPrefab.GetComponent<ItemDrop>().m_itemData == food.m_item)
			{
				food.m_item = food.m_item.Clone();
				food.m_item.m_dropPrefab = itemPrefab;
			}
			RegisterForceLoadedTypes(food.m_item);
		}
	}

	private static void SaveCheckingForStackableItemData(ItemData item)
	{
		if (item == awakeningItem)
		{
			awakeningItem = null;
		}
		checkingForStackableItemData = item;
	}

	private static void ResetCheckingForStackableItemData()
	{
		checkingForStackableItemData = null;
	}

	private static IEnumerable<CodeInstruction> CheckStackableInFindFreeStackMethods(IEnumerable<CodeInstruction> instructionsEnumerable)
	{
		CodeInstruction[] instructions = instructionsEnumerable.ToArray();
		Label target = (Label)instructions.First([_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(0)] (CodeInstruction val) => val.opcode == OpCodes.Br || val.opcode == OpCodes.Br_S).operand;
		CodeInstruction targetedInstr = instructions.First([_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(0)] (CodeInstruction val) => val.labels.Contains(target));
		CodeInstruction lastBranch = ((IEnumerable<CodeInstruction>)instructions).Reverse().First([_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(0)] (CodeInstruction val) =>
		{
			Label? label = default;
			return CodeInstructionExtensions.Branches(val, ref label) && targetedInstr.labels.Contains(label.Value);
		});
		CodeInstruction loadingInstruction = null;
		int i = 0;
		while (i < instructions.Length)
		{
			yield return instructions[i];
			if (loadingInstruction == null && instructions[i].opcode == OpCodes.Call && ((MethodInfo)instructions[i].operand).Name == "get_Current")
			{
				loadingInstruction = instructions[i + 1].Clone();
				loadingInstruction.opcode = new Dictionary<OpCode, OpCode>
				{
					{
						OpCodes.Stloc_0,
						OpCodes.Ldloc_0
					},
					{
						OpCodes.Stloc_1,
						OpCodes.Ldloc_1
					},
					{
						OpCodes.Stloc_2,
						OpCodes.Ldloc_2
					},
					{
						OpCodes.Stloc_3,
						OpCodes.Ldloc_3
					},
					{
						OpCodes.Stloc_S,
						OpCodes.Ldloc_S
					}
				}[loadingInstruction.opcode];
			}
			if (instructions[i] == lastBranch)
			{
				yield return loadingInstruction;
				yield return new CodeInstruction(OpCodes.Ldsfld, (object)AccessTools.DeclaredField(typeof(_003C27135a16_002D41db_002D418a_002Dafd2_002D7267dbe18137_003EItemInfo), "checkingForStackableItemData"));
				yield return new CodeInstruction(OpCodes.Call, (object)AccessTools.DeclaredMethod(typeof(_003C27135a16_002D41db_002D418a_002Dafd2_002D7267dbe18137_003EItemInfo), "CheckItemDataIsStackableFindFree", (Type[])null, (Type[])null));
				yield return new CodeInstruction(OpCodes.Brfalse, (object)target);
			}
			int num = i + 1;
			i = num;
		}
	}

	private static bool CheckItemDataIsStackableFindFree(ItemData item, [_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(2)] ItemData target)
	{
		if (target == null)
		{
			return true;
		}
		Dictionary<string, string> dictionary = IsStackable(item, target);
		if (dictionary != null)
		{
			newValuesOnStackable = dictionary;
			return true;
		}
		return false;
	}

	private static void ResetNewValuesOnStackable()
	{
		newValuesOnStackable = null;
	}

	[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(2)]
	private static void ApplyNewValuesOnStackable(ItemData __result)
	{
		if (__result == null || newValuesOnStackable == null)
		{
			return;
		}
		foreach (KeyValuePair<string, string> item in newValuesOnStackable)
		{
			__result.m_customData[item.Key] = item.Value;
		}
	}

	[return: _003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(new byte[] { 2, 1, 1 })]
	private static Dictionary<string, string> IsStackable(ItemData a, ItemData b)
	{
		_003C27135a16_002D41db_002D418a_002Dafd2_002D7267dbe18137_003EItemInfo obj = _003C35e5ab3c_002D7099_002D45c6_002Dac00_002Db53ba5a87838_003EItemExtensions.Data(a);
		if (obj != null)
		{
			return obj.IsStackableWithOtherInfo(_003C35e5ab3c_002D7099_002D45c6_002Dac00_002Db53ba5a87838_003EItemExtensions.Data(b));
		}
		_003C27135a16_002D41db_002D418a_002Dafd2_002D7267dbe18137_003EItemInfo obj2 = _003C35e5ab3c_002D7099_002D45c6_002Dac00_002Db53ba5a87838_003EItemExtensions.Data(b);
		if (obj2 != null)
		{
			return obj2.IsStackableWithOtherInfo(null);
		}
		return new Dictionary<string, string>();
	}

	private static bool CheckItemDataStackableAddItem(Inventory __instance, ItemData item, int x, int y, [_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(new byte[] { 2, 1, 1 })] ref Dictionary<string, string> __state, ref bool __result)
	{
		ItemData itemAt = __instance.GetItemAt(x, y);
		if (itemAt != null)
		{
			Dictionary<string, string> dictionary = IsStackable(item, itemAt);
			if (dictionary == null)
			{
				__result = false;
				return false;
			}
			__state = dictionary;
		}
		return true;
	}

	private static void ApplyCustomItemDataStackableAddItem(Inventory __instance, int x, int y, [_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(new byte[] { 2, 1, 1 })] Dictionary<string, string> __state, bool __result)
	{
		if (!__result || __state == null)
		{
			return;
		}
		foreach (KeyValuePair<string, string> item in __state)
		{
			__instance.GetItemAt(x, y).m_customData[item.Key] = item.Value;
		}
	}

	private static void ApplyCustomItemDataStackableAutoStack(ItemDrop item, Dictionary<string, string> customData)
	{
		item.m_itemData.m_customData = customData;
	}

	[return: _003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(new byte[] { 2, 1, 1 })]
	private static Dictionary<string, string> IsStackableItemDrop(ItemDrop drop, ItemData item)
	{
		return IsStackable(drop.m_itemData, item);
	}

	private static IEnumerable<CodeInstruction> HandleAutostackableItems(IEnumerable<CodeInstruction> instructionList, ILGenerator ilg)
	{
		//IL_00c6: Unknown result type (might be due to invalid IL or missing references)
		//IL_00d0: Expected Obj, but got Unknown
		//IL_00e5: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ef: Expected Obj, but got Unknown
		//IL_00f9: Unknown result type (might be due to invalid IL or missing references)
		//IL_0103: Expected Obj, but got Unknown
		//IL_0114: Unknown result type (might be due to invalid IL or missing references)
		//IL_011e: Expected Obj, but got Unknown
		//IL_0134: Unknown result type (might be due to invalid IL or missing references)
		//IL_013e: Expected Obj, but got Unknown
		//IL_0154: Unknown result type (might be due to invalid IL or missing references)
		//IL_015e: Expected Obj, but got Unknown
		//IL_017e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0188: Expected Obj, but got Unknown
		//IL_019e: Unknown result type (might be due to invalid IL or missing references)
		//IL_01a8: Expected Obj, but got Unknown
		//IL_01b3: Unknown result type (might be due to invalid IL or missing references)
		//IL_01bd: Expected Obj, but got Unknown
		//IL_01d3: Unknown result type (might be due to invalid IL or missing references)
		//IL_01dd: Expected Obj, but got Unknown
		//IL_01e8: Unknown result type (might be due to invalid IL or missing references)
		//IL_01f2: Expected Obj, but got Unknown
		List<CodeInstruction> list = instructionList.ToList();
		FieldInfo fieldInfo = AccessTools.DeclaredField(typeof(ItemData), "m_stack");
		FieldInfo fieldInfo2 = AccessTools.DeclaredField(typeof(ItemDrop), "m_itemData");
		Label? label = default;
		for (int i = 0; i < list.Count; i++)
		{
			if (!CodeInstructionExtensions.StoresField(list[i], fieldInfo))
			{
				continue;
			}
			for (int num = i; num > 0; num--)
			{
				if (CodeInstructionExtensions.Branches(list[num], ref label))
				{
					for (int num2 = num; num2 > 0; num2--)
					{
						if (CodeInstructionExtensions.LoadsField(list[num2], fieldInfo2, false))
						{
							LocalBuilder localBuilder = ilg.DeclareLocal(typeof(Dictionary<string, string>));
							LocalBuilder localBuilder2 = ilg.DeclareLocal(typeof(ItemData));
							list.Insert(i + 1, new CodeInstruction(OpCodes.Call, (object)AccessTools.DeclaredMethod(typeof(_003C27135a16_002D41db_002D418a_002Dafd2_002D7267dbe18137_003EItemInfo), "ApplyCustomItemDataStackableAutoStack", (Type[])null, (Type[])null)));
							list.Insert(i + 1, new CodeInstruction(OpCodes.Ldloc, (object)localBuilder.LocalIndex));
							list.Insert(i + 1, new CodeInstruction(OpCodes.Ldarg_0, (object)null));
							list.Insert(num + 1, new CodeInstruction(OpCodes.Brfalse, (object)label));
							list.Insert(num + 1, new CodeInstruction(OpCodes.Stloc, (object)localBuilder.LocalIndex));
							list.Insert(num + 1, new CodeInstruction(OpCodes.Dup, (object)localBuilder.LocalIndex));
							list.Insert(num + 1, new CodeInstruction(OpCodes.Call, (object)AccessTools.DeclaredMethod(typeof(_003C27135a16_002D41db_002D418a_002Dafd2_002D7267dbe18137_003EItemInfo), "IsStackableItemDrop", (Type[])null, (Type[])null)));
							list.Insert(num + 1, new CodeInstruction(OpCodes.Ldloc, (object)localBuilder2.LocalIndex));
							list.Insert(num + 1, new CodeInstruction(OpCodes.Ldarg_0, (object)null));
							list.Insert(num2 + 1, new CodeInstruction(OpCodes.Stloc, (object)localBuilder2.LocalIndex));
							list.Insert(num2 + 1, new CodeInstruction(OpCodes.Dup, (object)null));
							return list;
						}
					}
				}
			}
		}
		throw new Exception("Found no stack store in a branch");
	}

	private static IEnumerable<CodeInstruction> TransferCustomItemDataOnUpgrade(IEnumerable<CodeInstruction> instructions, ILGenerator ilg)
	{
		MethodInfo itemDeleter = AccessTools.DeclaredMethod(typeof(Inventory), "RemoveItem", new Type[1] { typeof(ItemData) }, (Type[])null);
		foreach (CodeInstruction instruction in instructions)
		{
			if (instruction.opcode == OpCodes.Callvirt && CodeInstructionExtensions.OperandIs(instruction, (MemberInfo)itemDeleter))
			{
				yield return new CodeInstruction(OpCodes.Dup, (object)null);
				yield return new CodeInstruction(OpCodes.Stsfld, (object)AccessTools.DeclaredField(typeof(_003C27135a16_002D41db_002D418a_002Dafd2_002D7267dbe18137_003EItemInfo), "currentlyUpgradingItem"));
			}
			yield return instruction;
		}
	}

	private static void ResetCurrentlyUpgradingItem()
	{
		currentlyUpgradingItem = null;
	}

	private static void CopyCustomDataFromUpgradedItem(ItemDrop item)
	{
		if (currentlyUpgradingItem != null)
		{
			item.m_itemData.m_customData = currentlyUpgradingItem.m_customData;
			_003C27135a16_002D41db_002D418a_002Dafd2_002D7267dbe18137_003EItemInfo obj = _003C35e5ab3c_002D7099_002D45c6_002Dac00_002Db53ba5a87838_003EItemExtensions.Data(currentlyUpgradingItem);
			_003C35e5ab3c_002D7099_002D45c6_002Dac00_002Db53ba5a87838_003EItemExtensions.itemInfo.Remove(currentlyUpgradingItem);
			_003C35e5ab3c_002D7099_002D45c6_002Dac00_002Db53ba5a87838_003EItemExtensions.itemInfo.Add(item.m_itemData, obj);
			item.m_itemData.m_quality = currentlyUpgradingItem.m_quality + 1;
			item.m_itemData.m_variant = currentlyUpgradingItem.m_variant;
			obj.ItemData = item.m_itemData;
			obj.LoadAll();
			foreach (ItemData value in obj.data.Values)
			{
				value.Upgraded();
			}
			currentlyUpgradingItem = null;
			awakeningItem = null;
			return;
		}
		GameObject dropPrefab = item.m_itemData.m_dropPrefab;
		if (dropPrefab == null || item.m_itemData.m_customData.Count != 0)
		{
			return;
		}
		ZNetView component = ((Component)item).GetComponent<ZNetView>();
		ZDO val = ((Object.op_Implicit((Object)(object)component) && component.IsValid()) ? component.GetZDO() : null);
		if (val != null && val.GetInt(ZDOVars.s_dataCount, -1) != -1)
		{
			return;
		}
		item.m_itemData.m_customData = new Dictionary<string, string>(dropPrefab.GetComponent<ItemDrop>().m_itemData.m_customData);
		if (val == null)
		{
			return;
		}
		int num = 0;
		val.Set(ZDOVars.s_dataCount, item.m_itemData.m_customData.Count, false);
		foreach (KeyValuePair<string, string> customDatum in item.m_itemData.m_customData)
		{
			val.Set($"data_{num}", customDatum.Key);
			val.Set($"data__{num++}", customDatum.Value);
		}
	}

	private static IEnumerable<CodeInstruction> ImportCustomDataOnUpgrade(IEnumerable<CodeInstruction> instructionList)
	{
		List<CodeInstruction> list = instructionList.ToList();
		foreach (CodeInstruction instruction in list)
		{
			yield return instruction;
			if (instruction.opcode == OpCodes.Stfld && CodeInstructionExtensions.OperandIs(instruction, (MemberInfo)AccessTools.DeclaredField(typeof(ItemData), "m_dropPrefab")))
			{
				yield return new CodeInstruction(OpCodes.Ldarg_0, (object)null);
				yield return new CodeInstruction(OpCodes.Call, (object)AccessTools.DeclaredMethod(typeof(_003C27135a16_002D41db_002D418a_002Dafd2_002D7267dbe18137_003EItemInfo), "CopyCustomDataFromUpgradedItem", (Type[])null, (Type[])null));
			}
		}
	}

	private static void TrackAwakeningItem(ItemDrop __instance)
	{
		if (ZNetView.m_forceDisableInit)
		{
			awakeningItem = __instance.m_itemData;
		}
	}

	static _003C27135a16_002D41db_002D418a_002Dafd2_002D7267dbe18137_003EItemInfo()
	{
		//IL_0070: Unknown result type (might be due to invalid IL or missing references)
		//IL_0076: Expected Obj, but got Unknown
		//IL_00b3: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c1: Expected Obj, but got Unknown
		//IL_011f: Unknown result type (might be due to invalid IL or missing references)
		//IL_012d: Expected Obj, but got Unknown
		//IL_01b5: Unknown result type (might be due to invalid IL or missing references)
		//IL_01d0: Unknown result type (might be due to invalid IL or missing references)
		//IL_01dd: Expected Obj, but got Unknown
		//IL_01dd: Expected Obj, but got Unknown
		//IL_022a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0241: Unknown result type (might be due to invalid IL or missing references)
		//IL_024c: Expected Obj, but got Unknown
		//IL_024c: Expected Obj, but got Unknown
		//IL_028c: Unknown result type (might be due to invalid IL or missing references)
		//IL_02a3: Unknown result type (might be due to invalid IL or missing references)
		//IL_02ae: Expected Obj, but got Unknown
		//IL_02ae: Expected Obj, but got Unknown
		//IL_02fb: Unknown result type (might be due to invalid IL or missing references)
		//IL_0312: Unknown result type (might be due to invalid IL or missing references)
		//IL_031d: Expected Obj, but got Unknown
		//IL_031d: Expected Obj, but got Unknown
		//IL_034d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0359: Expected Obj, but got Unknown
		//IL_0387: Unknown result type (might be due to invalid IL or missing references)
		//IL_038e: Expected Obj, but got Unknown
		//IL_03a4: Unknown result type (might be due to invalid IL or missing references)
		//IL_03bf: Unknown result type (might be due to invalid IL or missing references)
		//IL_03cd: Expected Obj, but got Unknown
		//IL_03cd: Expected Obj, but got Unknown
		//IL_03fd: Unknown result type (might be due to invalid IL or missing references)
		//IL_0409: Expected Obj, but got Unknown
		//IL_0439: Unknown result type (might be due to invalid IL or missing references)
		//IL_0454: Unknown result type (might be due to invalid IL or missing references)
		//IL_045f: Expected Obj, but got Unknown
		//IL_045f: Expected Obj, but got Unknown
		//IL_04b0: Unknown result type (might be due to invalid IL or missing references)
		//IL_04bd: Expected Obj, but got Unknown
		//IL_0510: Unknown result type (might be due to invalid IL or missing references)
		//IL_051d: Expected Obj, but got Unknown
		//IL_05c9: Unknown result type (might be due to invalid IL or missing references)
		//IL_05d6: Expected Obj, but got Unknown
		//IL_0604: Unknown result type (might be due to invalid IL or missing references)
		//IL_062f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0636: Expected Obj, but got Unknown
		//IL_065c: Unknown result type (might be due to invalid IL or missing references)
		//IL_066a: Expected Obj, but got Unknown
		//IL_066a: Expected Obj, but got Unknown
		//IL_06a9: Unknown result type (might be due to invalid IL or missing references)
		//IL_06b6: Expected Obj, but got Unknown
		//IL_06e4: Unknown result type (might be due to invalid IL or missing references)
		//IL_070f: Unknown result type (might be due to invalid IL or missing references)
		//IL_071c: Expected Obj, but got Unknown
		//IL_071c: Expected Obj, but got Unknown
		//IL_075b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0768: Expected Obj, but got Unknown
		ForceLoadTypes = new HashSet<Type>();
		typeInheritorsCache = new Dictionary<Type, HashSet<Type>>();
		knownTypes = new HashSet<string>();
		awakeningItem = null;
		primaryAssembly = Assembly.GetExecutingAssembly();
		assemblyNameCache = new Dictionary<Assembly, string>();
		classKeyCache = new Dictionary<Type, string>();
		removeMethod = typeof(_003C27135a16_002D41db_002D418a_002Dafd2_002D7267dbe18137_003EItemInfo).GetMethods().Single([_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(0)] (MethodInfo m) => m.Name == "Remove" && m.IsGenericMethod && m.GetParameters()[0].ParameterType == typeof(string));
		Harmony val = new Harmony("org.bepinex.helpers.ItemDataManager");
		val.Patch((MethodBase)AccessTools.DeclaredMethod(typeof(Inventory), "Save", (Type[])null, (Type[])null), new HarmonyMethod(AccessTools.DeclaredMethod(typeof(_003C27135a16_002D41db_002D418a_002Dafd2_002D7267dbe18137_003EItemInfo), "SaveInventoryPrefix", (Type[])null, (Type[])null), 800, (string[])null, (string[])null, (bool?)null), (HarmonyMethod)null, (HarmonyMethod)null, (HarmonyMethod)null, (HarmonyMethod)null);
		foreach (MethodInfo item in from m in typeof(ItemData).GetMethods(BindingFlags.Instance | BindingFlags.Static | BindingFlags.Public | BindingFlags.NonPublic)
			where m.Name == "SaveToZDO"
			select m)
		{
			val.Patch((MethodBase)item, new HarmonyMethod(AccessTools.DeclaredMethod(typeof(_003C27135a16_002D41db_002D418a_002Dafd2_002D7267dbe18137_003EItemInfo), "SavePrefix", (Type[])null, (Type[])null), 800, (string[])null, (string[])null, (bool?)null), (HarmonyMethod)null, (HarmonyMethod)null, (HarmonyMethod)null, (HarmonyMethod)null);
		}
		val.Patch((MethodBase)AccessTools.DeclaredMethod(typeof(Inventory), "AddItem", new Type[5]
		{
			typeof(ItemData),
			typeof(int),
			typeof(int),
			typeof(int),
			typeof(bool)
		}, (Type[])null), new HarmonyMethod(AccessTools.DeclaredMethod(typeof(_003C27135a16_002D41db_002D418a_002Dafd2_002D7267dbe18137_003EItemInfo), "CheckItemDataStackableAddItem", (Type[])null, (Type[])null)), new HarmonyMethod(AccessTools.DeclaredMethod(typeof(_003C27135a16_002D41db_002D418a_002Dafd2_002D7267dbe18137_003EItemInfo), "ApplyCustomItemDataStackableAddItem", (Type[])null, (Type[])null)), (HarmonyMethod)null, (HarmonyMethod)null, (HarmonyMethod)null);
		val.Patch((MethodBase)AccessTools.DeclaredMethod(typeof(Inventory), "CanAddItem", new Type[2]
		{
			typeof(ItemData),
			typeof(int)
		}, (Type[])null), new HarmonyMethod(AccessTools.DeclaredMethod(typeof(_003C27135a16_002D41db_002D418a_002Dafd2_002D7267dbe18137_003EItemInfo), "SaveCheckingForStackableItemData", (Type[])null, (Type[])null)), (HarmonyMethod)null, (HarmonyMethod)null, new HarmonyMethod(typeof(_003C27135a16_002D41db_002D418a_002Dafd2_002D7267dbe18137_003EItemInfo), "ResetCheckingForStackableItemData", (Type[])null), (HarmonyMethod)null);
		val.Patch((MethodBase)AccessTools.DeclaredMethod(typeof(Inventory), "AddItem", new Type[1] { typeof(ItemData) }, (Type[])null), new HarmonyMethod(AccessTools.DeclaredMethod(typeof(_003C27135a16_002D41db_002D418a_002Dafd2_002D7267dbe18137_003EItemInfo), "SaveCheckingForStackableItemData", (Type[])null, (Type[])null)), (HarmonyMethod)null, (HarmonyMethod)null, new HarmonyMethod(typeof(_003C27135a16_002D41db_002D418a_002Dafd2_002D7267dbe18137_003EItemInfo), "ResetCheckingForStackableItemData", (Type[])null), (HarmonyMethod)null);
		val.Patch((MethodBase)AccessTools.DeclaredMethod(typeof(Inventory), "AddItem", new Type[2]
		{
			typeof(ItemData),
			typeof(Vector2i)
		}, (Type[])null), new HarmonyMethod(AccessTools.DeclaredMethod(typeof(_003C27135a16_002D41db_002D418a_002Dafd2_002D7267dbe18137_003EItemInfo), "SaveCheckingForStackableItemData", (Type[])null, (Type[])null)), (HarmonyMethod)null, (HarmonyMethod)null, new HarmonyMethod(typeof(_003C27135a16_002D41db_002D418a_002Dafd2_002D7267dbe18137_003EItemInfo), "ResetCheckingForStackableItemData", (Type[])null), (HarmonyMethod)null);
		val.Patch((MethodBase)AccessTools.DeclaredMethod(typeof(Inventory), "FindFreeStackSpace", (Type[])null, (Type[])null), (HarmonyMethod)null, (HarmonyMethod)null, new HarmonyMethod(AccessTools.DeclaredMethod(typeof(_003C27135a16_002D41db_002D418a_002Dafd2_002D7267dbe18137_003EItemInfo), "CheckStackableInFindFreeStackMethods", (Type[])null, (Type[])null)), (HarmonyMethod)null, (HarmonyMethod)null);
		MethodInfo methodInfo = AccessTools.DeclaredMethod(typeof(Inventory), "FindFreeStackItem", (Type[])null, (Type[])null);
		HarmonyMethod val2 = new HarmonyMethod(AccessTools.DeclaredMethod(typeof(_003C27135a16_002D41db_002D418a_002Dafd2_002D7267dbe18137_003EItemInfo), "CheckStackableInFindFreeStackMethods", (Type[])null, (Type[])null));
		val.Patch((MethodBase)methodInfo, new HarmonyMethod(AccessTools.DeclaredMethod(typeof(_003C27135a16_002D41db_002D418a_002Dafd2_002D7267dbe18137_003EItemInfo), "ResetNewValuesOnStackable", (Type[])null, (Type[])null)), new HarmonyMethod(AccessTools.DeclaredMethod(typeof(_003C27135a16_002D41db_002D418a_002Dafd2_002D7267dbe18137_003EItemInfo), "ApplyNewValuesOnStackable", (Type[])null, (Type[])null)), val2, (HarmonyMethod)null, (HarmonyMethod)null);
		val.Patch((MethodBase)AccessTools.DeclaredMethod(typeof(ItemDrop), "AutoStackItems", (Type[])null, (Type[])null), (HarmonyMethod)null, (HarmonyMethod)null, new HarmonyMethod(AccessTools.DeclaredMethod(typeof(_003C27135a16_002D41db_002D418a_002Dafd2_002D7267dbe18137_003EItemInfo), "HandleAutostackableItems", (Type[])null, (Type[])null)), (HarmonyMethod)null, (HarmonyMethod)null);
		val.Patch((MethodBase)AccessTools.DeclaredMethod(typeof(InventoryGui), "DoCrafting", (Type[])null, (Type[])null), (HarmonyMethod)null, (HarmonyMethod)null, new HarmonyMethod(AccessTools.DeclaredMethod(typeof(_003C27135a16_002D41db_002D418a_002Dafd2_002D7267dbe18137_003EItemInfo), "TransferCustomItemDataOnUpgrade", (Type[])null, (Type[])null)), new HarmonyMethod(AccessTools.DeclaredMethod(typeof(_003C27135a16_002D41db_002D418a_002Dafd2_002D7267dbe18137_003EItemInfo), "ResetCurrentlyUpgradingItem", (Type[])null, (Type[])null)), (HarmonyMethod)null);
		foreach (MethodInfo item2 in from m in typeof(ItemData).GetMethods(BindingFlags.Instance | BindingFlags.Static | BindingFlags.Public | BindingFlags.NonPublic)
			where m.Name == "LoadFromZDO"
			select m)
		{
			val.Patch((MethodBase)item2, (HarmonyMethod)null, new HarmonyMethod(AccessTools.DeclaredMethod(typeof(_003C27135a16_002D41db_002D418a_002Dafd2_002D7267dbe18137_003EItemInfo), "RegisterForceLoadedTypes", (Type[])null, (Type[])null)), (HarmonyMethod)null, (HarmonyMethod)null, (HarmonyMethod)null);
		}
		val.Patch((MethodBase)AccessTools.DeclaredMethod(typeof(Player), "Load", (Type[])null, (Type[])null), (HarmonyMethod)null, new HarmonyMethod(AccessTools.DeclaredMethod(typeof(_003C27135a16_002D41db_002D418a_002Dafd2_002D7267dbe18137_003EItemInfo), "RegisterForceLoadedTypesOnPlayerLoaded", (Type[])null, (Type[])null), 700, (string[])null, (string[])null, (bool?)null), (HarmonyMethod)null, (HarmonyMethod)null, (HarmonyMethod)null);
		val.Patch((MethodBase)AccessTools.DeclaredMethod(typeof(Inventory), "AddItem", new Type[8]
		{
			typeof(string),
			typeof(int),
			typeof(int),
			typeof(int),
			typeof(long),
			typeof(string),
			typeof(Vector2i),
			typeof(bool)
		}, (Type[])null), (HarmonyMethod)null, new HarmonyMethod(AccessTools.DeclaredMethod(typeof(_003C27135a16_002D41db_002D418a_002Dafd2_002D7267dbe18137_003EItemInfo), "RegisterForceLoadedTypesAddItem", (Type[])null, (Type[])null), 800, (string[])null, (string[])null, (bool?)null), (HarmonyMethod)null, (HarmonyMethod)null, (HarmonyMethod)null);
		MethodInfo methodInfo2 = AccessTools.DeclaredMethod(typeof(ItemDrop), "Awake", (Type[])null, (Type[])null);
		HarmonyMethod val3 = new HarmonyMethod(AccessTools.DeclaredMethod(typeof(_003C27135a16_002D41db_002D418a_002Dafd2_002D7267dbe18137_003EItemInfo), "TrackAwakeningItem", (Type[])null, (Type[])null));
		val2 = new HarmonyMethod(AccessTools.DeclaredMethod(typeof(_003C27135a16_002D41db_002D418a_002Dafd2_002D7267dbe18137_003EItemInfo), "ImportCustomDataOnUpgrade", (Type[])null, (Type[])null), 800, (string[])null, (string[])null, (bool?)null);
		val.Patch((MethodBase)methodInfo2, val3, new HarmonyMethod(AccessTools.DeclaredMethod(typeof(_003C27135a16_002D41db_002D418a_002Dafd2_002D7267dbe18137_003EItemInfo), "ItemDropAwake", (Type[])null, (Type[])null), 800, (string[])null, (string[])null, (bool?)null), val2, (HarmonyMethod)null, (HarmonyMethod)null);
		val.Patch((MethodBase)AccessTools.DeclaredMethod(typeof(ItemDrop), "Awake", (Type[])null, (Type[])null), (HarmonyMethod)null, new HarmonyMethod(AccessTools.DeclaredMethod(typeof(_003C27135a16_002D41db_002D418a_002Dafd2_002D7267dbe18137_003EItemInfo), "ItemDropAwakeDelayed", (Type[])null, (Type[])null), 799, (string[])null, (string[])null, (bool?)null), (HarmonyMethod)null, (HarmonyMethod)null, (HarmonyMethod)null);
		val.Patch((MethodBase)AccessTools.DeclaredMethod(typeof(ItemData), "Clone", (Type[])null, (Type[])null), new HarmonyMethod(AccessTools.DeclaredMethod(typeof(_003C27135a16_002D41db_002D418a_002Dafd2_002D7267dbe18137_003EItemInfo), "ItemDataClonePrefix", (Type[])null, (Type[])null)), new HarmonyMethod(AccessTools.DeclaredMethod(typeof(_003C27135a16_002D41db_002D418a_002Dafd2_002D7267dbe18137_003EItemInfo), "ItemDataClonePostfix", (Type[])null, (Type[])null), 500, (string[])null, (string[])null, (bool?)null), (HarmonyMethod)null, (HarmonyMethod)null, (HarmonyMethod)null);
		val.Patch((MethodBase)AccessTools.DeclaredMethod(typeof(ItemData), "Clone", (Type[])null, (Type[])null), (HarmonyMethod)null, new HarmonyMethod(AccessTools.DeclaredMethod(typeof(_003C27135a16_002D41db_002D418a_002Dafd2_002D7267dbe18137_003EItemInfo), "ItemDataClonePostfixDelayed", (Type[])null, (Type[])null), 499, (string[])null, (string[])null, (bool?)null), (HarmonyMethod)null, (HarmonyMethod)null, (HarmonyMethod)null);
	}
}
