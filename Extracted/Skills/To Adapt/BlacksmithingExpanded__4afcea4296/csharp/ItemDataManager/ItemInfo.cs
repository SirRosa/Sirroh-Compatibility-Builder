using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Reflection.Emit;
using BepInEx;
using BepInEx.Bootstrap;
using HarmonyLib;
using JetBrains.Annotations;
using UnityEngine;

namespace ItemDataManager;

[PublicAPI]
public class ItemInfo : IEnumerable<ItemData>, IEnumerable
{
	public static HashSet<Type> ForceLoadTypes;

	internal static string? _modGuid;

	private static Dictionary<Type, HashSet<Type>> typeInheritorsCache;

	private static HashSet<string> knownTypes;

	private Dictionary<string, ItemData> data = new Dictionary<string, ItemData>();

	private WeakReference<ItemInfo>? selfReference = null;

	internal HashSet<string> isCloned = new HashSet<string>();

	private static ItemData? awakeningItem;

	private static Assembly primaryAssembly;

	private static Dictionary<Assembly, string> assemblyNameCache;

	private static Dictionary<Type, string> classKeyCache;

	private HashSet<string> fetchedClassKeys = new HashSet<string>();

	private static MethodInfo removeMethod;

	private static ItemData? checkingForStackableItemData;

	private static Dictionary<string, string>? newValuesOnStackable;

	private static ItemData? currentlyUpgradingItem;

	internal static string modGuid => _modGuid ?? (_modGuid = ((Func<string>)(() =>
	{
		//IL_0098: Unknown result type (might be due to invalid IL or missing references)
		//IL_009e: Expected Obj, but got Unknown
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
		BaseUnityPlugin val = (BaseUnityPlugin)Chainloader.ManagerObject.GetComponent((Type)source.First((TypeInfo t) => t.IsClass && typeof(BaseUnityPlugin).IsAssignableFrom(t)));
		return val.Info.Metadata.GUID;
	}))());

	public string Mod => modGuid;

	public ItemData ItemData { get; private set; }

	public string? this[string key]
	{
		get
		{
			return Get<StringItemData>(key)?.Value;
		}
		set
		{
			GetOrCreate<StringItemData>(key).Value = value ?? "";
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
			foreach (Type baseType2 in interfaces)
			{
				AddInterfaces(baseType2);
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

	internal ItemInfo(ItemData itemData)
	{
		ItemData = itemData;
		string text = dataKey("");
		List<string> list = ItemData.m_customData.Keys.ToList();
		foreach (string item in list)
		{
			if (!item.StartsWith(text))
			{
				continue;
			}
			string text2 = item.Substring(text.Length);
			string[] array = text2.Split(new char[1] { '#' }, 2);
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

	public T GetOrCreate<T>(string key = "") where T : ItemData, new()
	{
		return Add<T>(key) ?? Get<T>(key);
	}

	public T? Add<T>(string key = "") where T : ItemData, new()
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
		ItemDataManager.ItemData.constructingInfo = selfReference ?? (selfReference = new WeakReference<ItemInfo>(this));
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

	public T? Get<T>(string key = "") where T : class
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

	public Dictionary<string, T> GetAll<T>() where T : ItemData
	{
		LoadAll();
		return data.Values.Where((ItemData o) => o is T).ToDictionary((ItemData o) => o.Key, (ItemData o) => (T)o);
	}

	public bool Remove(string key = "")
	{
		return Remove<StringItemData>(key);
	}

	public bool Remove<T>(string key = "") where T : ItemData
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

	public bool Remove<T>(T itemData) where T : ItemData
	{
		if (typeof(T) == itemData.GetType())
		{
			return Remove<T>(itemData.Key);
		}
		return (bool)removeMethod.MakeGenericMethod(itemData.GetType()).Invoke(this, new object[1] { itemData.Key });
	}

	private ItemData? constructDataObj(string fullkey, string key)
	{
		string[] array = key.Split(new char[1] { '#' }, 2);
		Type type = Type.GetType(array[0]);
		if ((object)type == null || !typeof(ItemData).IsAssignableFrom(type))
		{
			return null;
		}
		ItemDataManager.ItemData.constructingInfo = selfReference ?? (selfReference = new WeakReference<ItemInfo>(this));
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
		List<string> list = ItemData.m_customData.Keys.ToList();
		foreach (string item in list)
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
		if (ItemExtensions.itemInfo.TryGetValue(item, out var value))
		{
			value.Save();
		}
	}

	public Dictionary<string, string>? IsStackableWithOtherInfo(ItemInfo? info)
	{
		LoadAll();
		Dictionary<string, string> dictionary = new Dictionary<string, string>();
		if (info != null)
		{
			info.LoadAll();
			HashSet<string> hashSet = new HashSet<string>(info.data.Keys.Intersect(data.Keys));
			foreach (string item in hashSet)
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
		return dictionary.ToDictionary((KeyValuePair<string, string> kv) => dataKey(kv.Key), (KeyValuePair<string, string> kv) => kv.Value);
	}

	private static void RegisterForceLoadedTypesAddItem(ItemData? __result)
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
				itemData.Data().constructDataObj(text, key);
			}
		}
	}

	private static void ItemDropAwake(ItemDrop __instance)
	{
		GameObject dropPrefab = __instance.m_itemData.m_dropPrefab;
		if (dropPrefab != null && ItemExtensions.itemInfo.TryGetValue(dropPrefab.GetComponent<ItemDrop>().m_itemData, out var value))
		{
			__instance.m_itemData.Data().isCloned = new HashSet<string>(value.data.Values.Select((ItemData i) => i.CustomDataKey));
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
		if (ItemExtensions.itemInfo.TryGetValue(__instance, out var value))
		{
			__result.Data().isCloned = new HashSet<string>(value.data.Values.Select((ItemData i) => i.CustomDataKey));
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
		checkingForStackableItemData = item;
	}

	private static void ResetCheckingForStackableItemData()
	{
		checkingForStackableItemData = null;
	}

	private static IEnumerable<CodeInstruction> CheckStackableInFindFreeStackMethods(IEnumerable<CodeInstruction> instructionsEnumerable)
	{
		CodeInstruction[] instructions = instructionsEnumerable.ToArray();
		Label target = (Label)instructions.First((CodeInstruction val) => val.opcode == OpCodes.Br || val.opcode == OpCodes.Br_S).operand;
		CodeInstruction targetedInstr = instructions.First((CodeInstruction val) => val.labels.Contains(target));
		CodeInstruction lastBranch = ((IEnumerable<CodeInstruction>)instructions).Reverse().First((CodeInstruction val) =>
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
				yield return new CodeInstruction(OpCodes.Ldsfld, (object)AccessTools.DeclaredField(typeof(ItemInfo), "checkingForStackableItemData"));
				yield return new CodeInstruction(OpCodes.Call, (object)AccessTools.DeclaredMethod(typeof(ItemInfo), "CheckItemDataIsStackableFindFree", (Type[])null, (Type[])null));
				yield return new CodeInstruction(OpCodes.Brfalse, (object)target);
			}
			int num = i + 1;
			i = num;
		}
	}

	private static bool CheckItemDataIsStackableFindFree(ItemData item, ItemData? target)
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

	private static void ApplyNewValuesOnStackable(ItemData? __result)
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

	private static Dictionary<string, string>? IsStackable(ItemData a, ItemData b)
	{
		ItemInfo itemInfo = a.Data();
		if (itemInfo != null)
		{
			return itemInfo.IsStackableWithOtherInfo(b.Data());
		}
		ItemInfo itemInfo2 = b.Data();
		if (itemInfo2 != null)
		{
			return itemInfo2.IsStackableWithOtherInfo(null);
		}
		return new Dictionary<string, string>();
	}

	private static bool CheckItemDataStackableAddItem(Inventory __instance, ItemData item, int x, int y, ref Dictionary<string, string>? __state, ref bool __result)
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

	private static void ApplyCustomItemDataStackableAddItem(Inventory __instance, int x, int y, Dictionary<string, string>? __state, bool __result)
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

	private static Dictionary<string, string>? IsStackableItemDrop(ItemDrop drop, ItemData item)
	{
		return IsStackable(drop.m_itemData, item);
	}

	private static IEnumerable<CodeInstruction> HandleAutostackableItems(IEnumerable<CodeInstruction> instructionList, ILGenerator ilg)
	{
		//IL_00d9: Unknown result type (might be due to invalid IL or missing references)
		//IL_00e3: Expected Obj, but got Unknown
		//IL_00f9: Unknown result type (might be due to invalid IL or missing references)
		//IL_0103: Expected Obj, but got Unknown
		//IL_010e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0118: Expected Obj, but got Unknown
		//IL_012a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0134: Expected Obj, but got Unknown
		//IL_014b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0155: Expected Obj, but got Unknown
		//IL_016c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0176: Expected Obj, but got Unknown
		//IL_0197: Unknown result type (might be due to invalid IL or missing references)
		//IL_01a1: Expected Obj, but got Unknown
		//IL_01b8: Unknown result type (might be due to invalid IL or missing references)
		//IL_01c2: Expected Obj, but got Unknown
		//IL_01ce: Unknown result type (might be due to invalid IL or missing references)
		//IL_01d8: Expected Obj, but got Unknown
		//IL_01ef: Unknown result type (might be due to invalid IL or missing references)
		//IL_01f9: Expected Obj, but got Unknown
		//IL_0205: Unknown result type (might be due to invalid IL or missing references)
		//IL_020f: Expected Obj, but got Unknown
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
							list.Insert(i + 1, new CodeInstruction(OpCodes.Call, (object)AccessTools.DeclaredMethod(typeof(ItemInfo), "ApplyCustomItemDataStackableAutoStack", (Type[])null, (Type[])null)));
							list.Insert(i + 1, new CodeInstruction(OpCodes.Ldloc, (object)localBuilder.LocalIndex));
							list.Insert(i + 1, new CodeInstruction(OpCodes.Ldarg_0, (object)null));
							list.Insert(num + 1, new CodeInstruction(OpCodes.Brfalse, (object)label));
							list.Insert(num + 1, new CodeInstruction(OpCodes.Stloc, (object)localBuilder.LocalIndex));
							list.Insert(num + 1, new CodeInstruction(OpCodes.Dup, (object)localBuilder.LocalIndex));
							list.Insert(num + 1, new CodeInstruction(OpCodes.Call, (object)AccessTools.DeclaredMethod(typeof(ItemInfo), "IsStackableItemDrop", (Type[])null, (Type[])null)));
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
				yield return new CodeInstruction(OpCodes.Stsfld, (object)AccessTools.DeclaredField(typeof(ItemInfo), "currentlyUpgradingItem"));
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
			ItemInfo itemInfo = currentlyUpgradingItem.Data();
			ItemExtensions.itemInfo.Remove(currentlyUpgradingItem);
			ItemExtensions.itemInfo.Add(item.m_itemData, itemInfo);
			item.m_itemData.m_quality = currentlyUpgradingItem.m_quality + 1;
			item.m_itemData.m_variant = currentlyUpgradingItem.m_variant;
			itemInfo.ItemData = item.m_itemData;
			itemInfo.LoadAll();
			foreach (ItemData value in itemInfo.data.Values)
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
		List<CodeInstruction> instructions = instructionList.ToList();
		foreach (CodeInstruction instruction in instructions)
		{
			yield return instruction;
			if (instruction.opcode == OpCodes.Stfld && CodeInstructionExtensions.OperandIs(instruction, (MemberInfo)AccessTools.DeclaredField(typeof(ItemData), "m_dropPrefab")))
			{
				yield return new CodeInstruction(OpCodes.Ldarg_0, (object)null);
				yield return new CodeInstruction(OpCodes.Call, (object)AccessTools.DeclaredMethod(typeof(ItemInfo), "CopyCustomDataFromUpgradedItem", (Type[])null, (Type[])null));
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

	static ItemInfo()
	{
		//IL_0071: Unknown result type (might be due to invalid IL or missing references)
		//IL_0077: Expected Obj, but got Unknown
		//IL_00b4: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c2: Expected Obj, but got Unknown
		//IL_0122: Unknown result type (might be due to invalid IL or missing references)
		//IL_0130: Expected Obj, but got Unknown
		//IL_01ba: Unknown result type (might be due to invalid IL or missing references)
		//IL_01d5: Unknown result type (might be due to invalid IL or missing references)
		//IL_01e2: Expected Obj, but got Unknown
		//IL_01e2: Expected Obj, but got Unknown
		//IL_022f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0246: Unknown result type (might be due to invalid IL or missing references)
		//IL_0251: Expected Obj, but got Unknown
		//IL_0251: Expected Obj, but got Unknown
		//IL_0291: Unknown result type (might be due to invalid IL or missing references)
		//IL_02a8: Unknown result type (might be due to invalid IL or missing references)
		//IL_02b3: Expected Obj, but got Unknown
		//IL_02b3: Expected Obj, but got Unknown
		//IL_02e3: Unknown result type (might be due to invalid IL or missing references)
		//IL_02ef: Expected Obj, but got Unknown
		//IL_031d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0324: Expected Obj, but got Unknown
		//IL_033a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0355: Unknown result type (might be due to invalid IL or missing references)
		//IL_0363: Expected Obj, but got Unknown
		//IL_0363: Expected Obj, but got Unknown
		//IL_0393: Unknown result type (might be due to invalid IL or missing references)
		//IL_039f: Expected Obj, but got Unknown
		//IL_03cf: Unknown result type (might be due to invalid IL or missing references)
		//IL_03ea: Unknown result type (might be due to invalid IL or missing references)
		//IL_03f5: Expected Obj, but got Unknown
		//IL_03f5: Expected Obj, but got Unknown
		//IL_044a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0457: Expected Obj, but got Unknown
		//IL_04af: Unknown result type (might be due to invalid IL or missing references)
		//IL_04bc: Expected Obj, but got Unknown
		//IL_0584: Unknown result type (might be due to invalid IL or missing references)
		//IL_0591: Expected Obj, but got Unknown
		//IL_05bf: Unknown result type (might be due to invalid IL or missing references)
		//IL_05ea: Unknown result type (might be due to invalid IL or missing references)
		//IL_05f1: Expected Obj, but got Unknown
		//IL_0617: Unknown result type (might be due to invalid IL or missing references)
		//IL_0625: Expected Obj, but got Unknown
		//IL_0625: Expected Obj, but got Unknown
		//IL_0664: Unknown result type (might be due to invalid IL or missing references)
		//IL_0671: Expected Obj, but got Unknown
		//IL_069f: Unknown result type (might be due to invalid IL or missing references)
		//IL_06ca: Unknown result type (might be due to invalid IL or missing references)
		//IL_06d7: Expected Obj, but got Unknown
		//IL_06d7: Expected Obj, but got Unknown
		//IL_0716: Unknown result type (might be due to invalid IL or missing references)
		//IL_0723: Expected Obj, but got Unknown
		ForceLoadTypes = new HashSet<Type>();
		typeInheritorsCache = new Dictionary<Type, HashSet<Type>>();
		knownTypes = new HashSet<string>();
		awakeningItem = null;
		primaryAssembly = Assembly.GetExecutingAssembly();
		assemblyNameCache = new Dictionary<Assembly, string>();
		classKeyCache = new Dictionary<Type, string>();
		removeMethod = typeof(ItemInfo).GetMethods().Single((MethodInfo m) => m.Name == "Remove" && m.IsGenericMethod && m.GetParameters()[0].ParameterType == typeof(string));
		Harmony val = new Harmony("org.bepinex.helpers.ItemDataManager");
		val.Patch((MethodBase)AccessTools.DeclaredMethod(typeof(Inventory), "Save", (Type[])null, (Type[])null), new HarmonyMethod(AccessTools.DeclaredMethod(typeof(ItemInfo), "SaveInventoryPrefix", (Type[])null, (Type[])null), 800, (string[])null, (string[])null, (bool?)null), (HarmonyMethod)null, (HarmonyMethod)null, (HarmonyMethod)null, (HarmonyMethod)null);
		foreach (MethodInfo item in from m in typeof(ItemData).GetMethods(BindingFlags.Instance | BindingFlags.Static | BindingFlags.Public | BindingFlags.NonPublic)
			where m.Name == "SaveToZDO"
			select m)
		{
			val.Patch((MethodBase)item, new HarmonyMethod(AccessTools.DeclaredMethod(typeof(ItemInfo), "SavePrefix", (Type[])null, (Type[])null), 800, (string[])null, (string[])null, (bool?)null), (HarmonyMethod)null, (HarmonyMethod)null, (HarmonyMethod)null, (HarmonyMethod)null);
		}
		val.Patch((MethodBase)AccessTools.DeclaredMethod(typeof(Inventory), "AddItem", new Type[5]
		{
			typeof(ItemData),
			typeof(int),
			typeof(int),
			typeof(int),
			typeof(bool)
		}, (Type[])null), new HarmonyMethod(AccessTools.DeclaredMethod(typeof(ItemInfo), "CheckItemDataStackableAddItem", (Type[])null, (Type[])null)), new HarmonyMethod(AccessTools.DeclaredMethod(typeof(ItemInfo), "ApplyCustomItemDataStackableAddItem", (Type[])null, (Type[])null)), (HarmonyMethod)null, (HarmonyMethod)null, (HarmonyMethod)null);
		val.Patch((MethodBase)AccessTools.DeclaredMethod(typeof(Inventory), "CanAddItem", new Type[2]
		{
			typeof(ItemData),
			typeof(int)
		}, (Type[])null), new HarmonyMethod(AccessTools.DeclaredMethod(typeof(ItemInfo), "SaveCheckingForStackableItemData", (Type[])null, (Type[])null)), (HarmonyMethod)null, (HarmonyMethod)null, new HarmonyMethod(typeof(ItemInfo), "ResetCheckingForStackableItemData", (Type[])null), (HarmonyMethod)null);
		val.Patch((MethodBase)AccessTools.DeclaredMethod(typeof(Inventory), "AddItem", new Type[1] { typeof(ItemData) }, (Type[])null), new HarmonyMethod(AccessTools.DeclaredMethod(typeof(ItemInfo), "SaveCheckingForStackableItemData", (Type[])null, (Type[])null)), (HarmonyMethod)null, (HarmonyMethod)null, new HarmonyMethod(typeof(ItemInfo), "ResetCheckingForStackableItemData", (Type[])null), (HarmonyMethod)null);
		val.Patch((MethodBase)AccessTools.DeclaredMethod(typeof(Inventory), "FindFreeStackSpace", (Type[])null, (Type[])null), (HarmonyMethod)null, (HarmonyMethod)null, new HarmonyMethod(AccessTools.DeclaredMethod(typeof(ItemInfo), "CheckStackableInFindFreeStackMethods", (Type[])null, (Type[])null)), (HarmonyMethod)null, (HarmonyMethod)null);
		MethodInfo methodInfo = AccessTools.DeclaredMethod(typeof(Inventory), "FindFreeStackItem", (Type[])null, (Type[])null);
		HarmonyMethod val2 = new HarmonyMethod(AccessTools.DeclaredMethod(typeof(ItemInfo), "CheckStackableInFindFreeStackMethods", (Type[])null, (Type[])null));
		val.Patch((MethodBase)methodInfo, new HarmonyMethod(AccessTools.DeclaredMethod(typeof(ItemInfo), "ResetNewValuesOnStackable", (Type[])null, (Type[])null)), new HarmonyMethod(AccessTools.DeclaredMethod(typeof(ItemInfo), "ApplyNewValuesOnStackable", (Type[])null, (Type[])null)), val2, (HarmonyMethod)null, (HarmonyMethod)null);
		val.Patch((MethodBase)AccessTools.DeclaredMethod(typeof(ItemDrop), "AutoStackItems", (Type[])null, (Type[])null), (HarmonyMethod)null, (HarmonyMethod)null, new HarmonyMethod(AccessTools.DeclaredMethod(typeof(ItemInfo), "HandleAutostackableItems", (Type[])null, (Type[])null)), (HarmonyMethod)null, (HarmonyMethod)null);
		val.Patch((MethodBase)AccessTools.DeclaredMethod(typeof(InventoryGui), "DoCrafting", (Type[])null, (Type[])null), (HarmonyMethod)null, (HarmonyMethod)null, new HarmonyMethod(AccessTools.DeclaredMethod(typeof(ItemInfo), "TransferCustomItemDataOnUpgrade", (Type[])null, (Type[])null)), new HarmonyMethod(AccessTools.DeclaredMethod(typeof(ItemInfo), "ResetCurrentlyUpgradingItem", (Type[])null, (Type[])null)), (HarmonyMethod)null);
		foreach (MethodInfo item2 in from m in typeof(ItemData).GetMethods(BindingFlags.Instance | BindingFlags.Static | BindingFlags.Public | BindingFlags.NonPublic)
			where m.Name == "LoadFromZDO"
			select m)
		{
			val.Patch((MethodBase)item2, (HarmonyMethod)null, new HarmonyMethod(AccessTools.DeclaredMethod(typeof(ItemInfo), "RegisterForceLoadedTypes", (Type[])null, (Type[])null)), (HarmonyMethod)null, (HarmonyMethod)null, (HarmonyMethod)null);
		}
		val.Patch((MethodBase)AccessTools.DeclaredMethod(typeof(Player), "Load", (Type[])null, (Type[])null), (HarmonyMethod)null, new HarmonyMethod(AccessTools.DeclaredMethod(typeof(ItemInfo), "RegisterForceLoadedTypesOnPlayerLoaded", (Type[])null, (Type[])null), 700, (string[])null, (string[])null, (bool?)null), (HarmonyMethod)null, (HarmonyMethod)null, (HarmonyMethod)null);
		val.Patch((MethodBase)AccessTools.DeclaredMethod(typeof(Inventory), "AddItem", new Type[10]
		{
			typeof(string),
			typeof(int),
			typeof(int),
			typeof(int),
			typeof(long),
			typeof(string),
			typeof(Vector2i),
			typeof(bool),
			typeof(bool),
			typeof(bool)
		}, (Type[])null), (HarmonyMethod)null, new HarmonyMethod(AccessTools.DeclaredMethod(typeof(ItemInfo), "RegisterForceLoadedTypesAddItem", (Type[])null, (Type[])null), 800, (string[])null, (string[])null, (bool?)null), (HarmonyMethod)null, (HarmonyMethod)null, (HarmonyMethod)null);
		MethodInfo methodInfo2 = AccessTools.DeclaredMethod(typeof(ItemDrop), "Awake", (Type[])null, (Type[])null);
		HarmonyMethod val3 = new HarmonyMethod(AccessTools.DeclaredMethod(typeof(ItemInfo), "TrackAwakeningItem", (Type[])null, (Type[])null));
		val2 = new HarmonyMethod(AccessTools.DeclaredMethod(typeof(ItemInfo), "ImportCustomDataOnUpgrade", (Type[])null, (Type[])null), 800, (string[])null, (string[])null, (bool?)null);
		val.Patch((MethodBase)methodInfo2, val3, new HarmonyMethod(AccessTools.DeclaredMethod(typeof(ItemInfo), "ItemDropAwake", (Type[])null, (Type[])null), 800, (string[])null, (string[])null, (bool?)null), val2, (HarmonyMethod)null, (HarmonyMethod)null);
		val.Patch((MethodBase)AccessTools.DeclaredMethod(typeof(ItemDrop), "Awake", (Type[])null, (Type[])null), (HarmonyMethod)null, new HarmonyMethod(AccessTools.DeclaredMethod(typeof(ItemInfo), "ItemDropAwakeDelayed", (Type[])null, (Type[])null), 799, (string[])null, (string[])null, (bool?)null), (HarmonyMethod)null, (HarmonyMethod)null, (HarmonyMethod)null);
		val.Patch((MethodBase)AccessTools.DeclaredMethod(typeof(ItemData), "Clone", (Type[])null, (Type[])null), new HarmonyMethod(AccessTools.DeclaredMethod(typeof(ItemInfo), "ItemDataClonePrefix", (Type[])null, (Type[])null)), new HarmonyMethod(AccessTools.DeclaredMethod(typeof(ItemInfo), "ItemDataClonePostfix", (Type[])null, (Type[])null), 500, (string[])null, (string[])null, (bool?)null), (HarmonyMethod)null, (HarmonyMethod)null, (HarmonyMethod)null);
		val.Patch((MethodBase)AccessTools.DeclaredMethod(typeof(ItemData), "Clone", (Type[])null, (Type[])null), (HarmonyMethod)null, new HarmonyMethod(AccessTools.DeclaredMethod(typeof(ItemInfo), "ItemDataClonePostfixDelayed", (Type[])null, (Type[])null), 499, (string[])null, (string[])null, (bool?)null), (HarmonyMethod)null, (HarmonyMethod)null, (HarmonyMethod)null);
	}
}
