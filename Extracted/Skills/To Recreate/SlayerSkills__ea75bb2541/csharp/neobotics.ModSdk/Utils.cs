using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using BepInEx;
using UnityEngine;

namespace neobotics.ModSdk;

public class Utils
{
	public static TEnum Guardrails<TEnum>(string value, TEnum enumDefault) where TEnum : struct
	{
		if (Enum.TryParse<TEnum>(value, ignoreCase: true, out var result))
		{
			return result;
		}
		return enumDefault;
	}

	public static int Guardrails(int value, int lbound, int ubound)
	{
		if (value < lbound)
		{
			return lbound;
		}
		if (value > ubound)
		{
			return ubound;
		}
		return value;
	}

	public static string Truncate(string value, int maxChars)
	{
		if (value == null)
		{
			return null;
		}
		if (value.Length <= maxChars)
		{
			return value;
		}
		return value.Substring(0, maxChars);
	}

	public static void GetCharactersInRangeXZ(Vector3 point, float radius, List<Character> characters)
	{
		//IL_001f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0024: Unknown result type (might be due to invalid IL or missing references)
		float num = radius * radius;
		foreach (Character s_character in Character.s_characters)
		{
			if (DistanceSqrXZ(((Component)s_character).transform.position, point) < num)
			{
				characters.Add(s_character);
			}
		}
	}

	public static PinData GetClosestPin(Vector3 pos, float radius, PinType pType)
	{
		//IL_004b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0050: Unknown result type (might be due to invalid IL or missing references)
		//IL_0053: Unknown result type (might be due to invalid IL or missing references)
		//IL_0056: Unknown result type (might be due to invalid IL or missing references)
		//IL_007b: Unknown result type (might be due to invalid IL or missing references)
		//IL_008b: Unknown result type (might be due to invalid IL or missing references)
		PinData result = null;
		float num = float.MaxValue;
		float num2 = radius * radius;
		if ((Object)(object)Minimap.instance != (Object)null)
		{
			foreach (PinData pin in Minimap.instance.m_pins)
			{
				if ((Object)(object)pin.m_uiElement != (Object)null && pin.m_type == pType)
				{
					float num3 = DistanceSqrXZ(pos, pin.m_pos);
					if (Logging.Instance.LogLevel >= Logging.LogLevels.Debug)
					{
						Logging.Instance.Debug($"Testing for pin at {pin.m_pos} within radius {radius} from {pos}");
					}
					if (num3 < num2 && num3 < num)
					{
						Logging.Instance.Debug("Pin is within radius");
						num = num3;
						result = pin;
					}
				}
			}
		}
		return result;
	}

	public static float DistanceSqr(Vector3 v0, Vector3 v1)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_0001: Unknown result type (might be due to invalid IL or missing references)
		//IL_0002: Unknown result type (might be due to invalid IL or missing references)
		//IL_0007: Unknown result type (might be due to invalid IL or missing references)
		Vector3 val = v1 - v0;
		return val.sqrMagnitude;
	}

	public static float DistanceSqrXZ(Vector3 v0, Vector3 v1)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		//IL_000d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0013: Unknown result type (might be due to invalid IL or missing references)
		float num = v1.x - v0.x;
		float num2 = v1.z - v0.z;
		return num * num + num2 * num2;
	}

	public static Vector3 ClosestPoint<T>(Vector3 point, IEnumerable<T> collection, Func<T, Vector3> selector)
	{
		//IL_0002: Unknown result type (might be due to invalid IL or missing references)
		//IL_0020: Unknown result type (might be due to invalid IL or missing references)
		//IL_0025: Unknown result type (might be due to invalid IL or missing references)
		//IL_0027: Unknown result type (might be due to invalid IL or missing references)
		//IL_0029: Unknown result type (might be due to invalid IL or missing references)
		//IL_002a: Unknown result type (might be due to invalid IL or missing references)
		//IL_002f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0042: Unknown result type (might be due to invalid IL or missing references)
		//IL_0044: Unknown result type (might be due to invalid IL or missing references)
		//IL_0059: Unknown result type (might be due to invalid IL or missing references)
		Vector3 result = default;
		float num = float.MaxValue;
		foreach (T item in collection)
		{
			Vector3 val = selector(item);
			Vector3 val2 = val - point;
			float sqrMagnitude = val2.sqrMagnitude;
			if (sqrMagnitude < num)
			{
				num = sqrMagnitude;
				result = val;
			}
		}
		return result;
	}

	public static T ClosestObject<T>(Vector3 point, IEnumerable<T> collection, Func<T, Vector3> selector)
	{
		//IL_0020: Unknown result type (might be due to invalid IL or missing references)
		//IL_0025: Unknown result type (might be due to invalid IL or missing references)
		//IL_0026: Unknown result type (might be due to invalid IL or missing references)
		//IL_002b: Unknown result type (might be due to invalid IL or missing references)
		T result = default;
		float num = float.MaxValue;
		foreach (T item in collection)
		{
			Vector3 val = selector(item) - point;
			float sqrMagnitude = val.sqrMagnitude;
			if (sqrMagnitude < num)
			{
				num = sqrMagnitude;
				result = item;
			}
		}
		return result;
	}

	public static Vector3 ClosestPointXZ<T>(Vector3 point, IEnumerable<T> collection, Func<T, Vector3> selector)
	{
		//IL_0002: Unknown result type (might be due to invalid IL or missing references)
		//IL_0020: Unknown result type (might be due to invalid IL or missing references)
		//IL_0025: Unknown result type (might be due to invalid IL or missing references)
		//IL_0027: Unknown result type (might be due to invalid IL or missing references)
		//IL_0029: Unknown result type (might be due to invalid IL or missing references)
		//IL_0039: Unknown result type (might be due to invalid IL or missing references)
		//IL_003b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0050: Unknown result type (might be due to invalid IL or missing references)
		Vector3 result = default;
		float num = float.MaxValue;
		foreach (T item in collection)
		{
			Vector3 val = selector(item);
			float num2 = DistanceSqrXZ(val, point);
			if (num2 < num)
			{
				num = num2;
				result = val;
			}
		}
		return result;
	}

	public static T ClosestObjectXZ<T>(Vector3 point, IEnumerable<T> collection, Func<T, Vector3> selector)
	{
		//IL_0020: Unknown result type (might be due to invalid IL or missing references)
		//IL_0025: Unknown result type (might be due to invalid IL or missing references)
		T result = default;
		float num = float.MaxValue;
		foreach (T item in collection)
		{
			float num2 = DistanceSqrXZ(selector(item), point);
			if (num2 < num)
			{
				num = num2;
				result = item;
			}
		}
		return result;
	}

	public static float Guardrails(float value, float lbound, float ubound)
	{
		if (value < lbound)
		{
			return lbound;
		}
		if (value > ubound)
		{
			return ubound;
		}
		return value;
	}

	public static string UnClonifiedName(string name)
	{
		if (name == null)
		{
			return null;
		}
		int num = name.IndexOf("(Clone)");
		if (num < 1)
		{
			return name;
		}
		return name.Substring(0, num);
	}

	public static void SetTranslator(int id, string idText)
	{
		Localization.instance.AddWord("skill_" + id, idText);
	}

	public static string GetTranslated(int id)
	{
		Logging.GetLogger().Debug(string.Format("Got translation for id {0} to {1}", id, Localization.instance.Localize("skill_" + id)));
		return Localization.instance.Localize("$skill_" + id);
	}

	public static string GetAssemblyPathedFile(string fileName)
	{
		return new FileInfo(Assembly.GetExecutingAssembly().Location).DirectoryName.Replace('\\', '/') + "/" + fileName;
	}

	public static Sprite GetPrefabIcon(string prefabName)
	{
		Sprite result = null;
		GameObject prefab = GetPrefab(prefabName);
		ItemDrop val = default;
		if (Object.op_Implicit((Object)(object)prefab) && prefab.TryGetComponent<ItemDrop>(ref val))
		{
			result = val.m_itemData.GetIcon();
		}
		return result;
	}

	public static Player GetPlayerByZDOID(ZDOID zid)
	{
		//IL_0016: Unknown result type (might be due to invalid IL or missing references)
		//IL_001b: Unknown result type (might be due to invalid IL or missing references)
		//IL_001e: Unknown result type (might be due to invalid IL or missing references)
		foreach (Player allPlayer in Player.GetAllPlayers())
		{
			ZDOID zDOID = ((Character)allPlayer).GetZDOID();
			if (zDOID.Equals(zid))
			{
				return allPlayer;
			}
		}
		return null;
	}

	public static Character GetCharacterByZDOID(string cid)
	{
		//IL_0016: Unknown result type (might be due to invalid IL or missing references)
		//IL_001b: Unknown result type (might be due to invalid IL or missing references)
		foreach (Character allCharacter in Character.GetAllCharacters())
		{
			if (((object)allCharacter.GetZDOID()/*cast due to constrained. prefix*/).ToString().Equals(cid))
			{
				return allCharacter;
			}
		}
		return null;
	}

	public static Character GetCharacterByZDOID(ZDOID cid)
	{
		//IL_0016: Unknown result type (might be due to invalid IL or missing references)
		//IL_001b: Unknown result type (might be due to invalid IL or missing references)
		//IL_001e: Unknown result type (might be due to invalid IL or missing references)
		foreach (Character allCharacter in Character.GetAllCharacters())
		{
			ZDOID zDOID = allCharacter.GetZDOID();
			if (zDOID.Equals(cid))
			{
				return allCharacter;
			}
		}
		return null;
	}

	public static ZNetPeer GetPeerByRPC(ZRpc rpc)
	{
		foreach (ZNetPeer peer in ZNet.instance.GetPeers())
		{
			if (peer.m_rpc == rpc)
			{
				return peer;
			}
		}
		return null;
	}

	public static List<GameObject> GetGameObjectsOfType(Type t)
	{
		//IL_0018: Unknown result type (might be due to invalid IL or missing references)
		List<GameObject> list = new List<GameObject>();
		Object[] array = Object.FindObjectsByType(t, (FindObjectsSortMode)0);
		foreach (Object val in array)
		{
			list.Add(((Component)val).gameObject);
		}
		return list;
	}

	public static GameObject GetClosestGameObjectOfType(Type t, Vector3 point, float radius)
	{
		//IL_0001: Unknown result type (might be due to invalid IL or missing references)
		return GetGameObjectsOfTypeInRangeByDistance(t, point, radius)?[0];
	}

	public static List<GameObject> GetGameObjectsOfTypeInRangeByDistance(Type t, Vector3 point, float radius)
	{
		//IL_0007: Unknown result type (might be due to invalid IL or missing references)
		//IL_0034: Unknown result type (might be due to invalid IL or missing references)
		//IL_0039: Unknown result type (might be due to invalid IL or missing references)
		List<KeyValuePair<GameObject, float>> list = new List<KeyValuePair<GameObject, float>>();
		List<GameObject> gameObjectsOfTypeInRange = GetGameObjectsOfTypeInRange(t, point, radius);
		if (gameObjectsOfTypeInRange.Count > 0)
		{
			foreach (GameObject item in gameObjectsOfTypeInRange)
			{
				list.Add(new KeyValuePair<GameObject, float>(item, Vector3.Distance(item.transform.position, point)));
			}
			list.Sort((KeyValuePair<GameObject, float> pair1, KeyValuePair<GameObject, float> pair2) => pair1.Value.CompareTo(pair2.Value));
			return list.ConvertAll((KeyValuePair<GameObject, float> x) => x.Key);
		}
		return null;
	}

	public static List<GameObject> GetGameObjectsOfTypeInRange(Type t, Vector3 point, float radius)
	{
		//IL_0007: Unknown result type (might be due to invalid IL or missing references)
		//IL_0008: Unknown result type (might be due to invalid IL or missing references)
		float radiusSq = radius * radius;
		return GetGameObjectsOfType(t).Where((GameObject x) =>
		{
			//IL_0006: Unknown result type (might be due to invalid IL or missing references)
			//IL_000c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0011: Unknown result type (might be due to invalid IL or missing references)
			//IL_0016: Unknown result type (might be due to invalid IL or missing references)
			Vector3 val = x.transform.position - point;
			return val.sqrMagnitude < radiusSq;
		}).ToList();
	}

	public static float GetPointDepth(Vector3 p)
	{
		//IL_000a: Unknown result type (might be due to invalid IL or missing references)
		return ZoneSystem.instance.m_waterLevel - GetSolidHeight(p);
	}

	public static List<string> GetDelimitedStringAsList(string delimitedString, char delimiter)
	{
		List<string> list = new List<string>();
		string[] array = delimitedString.Split(new char[1] { delimiter }, StringSplitOptions.RemoveEmptyEntries);
		foreach (string text in array)
		{
			list.Add(text.Trim());
		}
		return list;
	}

	public static float GetSolidHeight(Vector3 p)
	{
		//IL_0021: Unknown result type (might be due to invalid IL or missing references)
		//IL_0022: Unknown result type (might be due to invalid IL or missing references)
		//IL_004b: Unknown result type (might be due to invalid IL or missing references)
		int solidRayMask = ZoneSystem.instance.m_solidRayMask;
		float result = 0f;
		p.y += 1000f;
		RaycastHit val = default;
		if (Physics.Raycast(p, Vector3.down, ref val, 2000f, solidRayMask) && !Object.op_Implicit((Object)(object)val.collider.attachedRigidbody))
		{
			result = val.point.y;
		}
		return result;
	}

	public static Transform FindChild(Transform aParent, string aName)
	{
		//IL_000f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0015: Expected Obj, but got Unknown
		foreach (Transform item in aParent)
		{
			Transform val = item;
			if (((Object)val).name == aName)
			{
				return val;
			}
			Transform val2 = FindChild(val, aName);
			if ((Object)(object)val2 != (Object)null)
			{
				return val2;
			}
		}
		return null;
	}

	public static Transform FindParent(Transform go)
	{
		while ((Object)(object)go.parent != (Object)null)
		{
			go = go.parent;
		}
		return go;
	}

	public static bool IsPrefabInScene(string prefabName)
	{
		return IsPrefabInScene(StringExtensionMethods.GetStableHashCode(prefabName));
	}

	public static bool IsPrefabInScene(int prefabHash)
	{
		ZNetScene instance = ZNetScene.instance;
		return (Object)(object)((instance != null) ? instance.GetPrefab(prefabHash) : null) != (Object)null;
	}

	public static bool TryGetPrefab(string prefabName, out GameObject prefab)
	{
		return TryGetPrefab(StringExtensionMethods.GetStableHashCode(prefabName), out prefab);
	}

	public static bool TryGetPrefab(int prefabHash, out GameObject prefab)
	{
		prefab = GetPrefabByHash(prefabHash);
		return (Object)(object)prefab != (Object)null;
	}

	public static GameObject GetPrefabByHash(int prefabHash)
	{
		GameObject val = null;
		Logging logger = Logging.GetLogger();
		ZNetScene instance = ZNetScene.instance;
		val = ((instance != null) ? instance.GetPrefab(prefabHash) : null);
		if ((Object)(object)val != (Object)null)
		{
			logger.Debug("Found prefab in Scene");
			return val;
		}
		val = ObjectDB.instance.GetItemPrefab(prefabHash);
		if ((Object)(object)val != (Object)null)
		{
			logger.Debug("Found prefab in ObjectDB");
			return val;
		}
		logger.Debug("No prefab found");
		return val;
	}

	public static GameObject GetPrefab(int prefabHash)
	{
		return GetPrefabByHash(prefabHash);
	}

	public static GameObject GetPrefab(string prefabName)
	{
		return GetPrefabByHash(StringExtensionMethods.GetStableHashCode(prefabName));
	}

	public static void LoadPrefabInScene(GameObject prefab)
	{
		int stableHashCode = StringExtensionMethods.GetStableHashCode(((Object)prefab).name);
		if ((Object)(object)ZNetScene.instance != (Object)null && !ZNetScene.instance.m_namedPrefabs.ContainsKey(stableHashCode))
		{
			ZNetScene.instance.m_prefabs.Add(prefab);
			ZNetScene.instance.m_namedPrefabs[stableHashCode] = prefab;
		}
	}

	public static GameObject SpawnObject(string prefabName, Vector3 position, Quaternion rotation, bool persist = true)
	{
		//IL_000b: Unknown result type (might be due to invalid IL or missing references)
		//IL_000c: Unknown result type (might be due to invalid IL or missing references)
		if (TryGetPrefab(prefabName, out var prefab))
		{
			return SpawnObject(prefab, position, rotation, persist);
		}
		return null;
	}

	public static GameObject SpawnObject(GameObject prefab, Vector3 position, Quaternion rotation, bool persist = true)
	{
		//IL_0007: Unknown result type (might be due to invalid IL or missing references)
		//IL_0008: Unknown result type (might be due to invalid IL or missing references)
		LoadPrefabInScene(prefab);
		GameObject val = Object.Instantiate<GameObject>(prefab, position, rotation);
		ZNetView val2 = default;
		if (persist && val.TryGetComponent<ZNetView>(ref val2))
		{
			val2.GetZDO().Persistent = true;
		}
		return val;
	}

	public static string SerializeFromDictionary<K, V>(string delimp, string delimc, IDictionary<K, V> dict)
	{
		if (dict == null)
		{
			return null;
		}
		IEnumerable<string> values = dict.Select((KeyValuePair<K, V> kvp) =>
		{
			KeyValuePair<K, V> keyValuePair = kvp;
			string? text = keyValuePair.Key?.ToString();
			string text2 = delimc;
			keyValuePair = kvp;
			return text + text2 + keyValuePair.Value;
		});
		return string.Join(delimp, values);
	}

	public static void DeserializeToDictionary<K, V>(string serializedString, string delimp, string delimc, ref IDictionary<K, V> dict)
	{
		if (dict == null)
		{
			return;
		}
		dict.Clear();
		string[] separator = new string[1] { delimp };
		string[] separator2 = new string[1] { delimc };
		string[] array = serializedString.Split(separator, StringSplitOptions.RemoveEmptyEntries);
		for (int i = 0; i < array.Length; i++)
		{
			string[] array2 = array[i].Split(separator2, StringSplitOptions.RemoveEmptyEntries);
			if (array2.Length == 2)
			{
				dict.Add(TypedValue<K>(array2[0]), TypedValue<V>(array2[1]));
			}
		}
	}

	public static FileSystemWatcher CreateFileWatcher(string fullPath, FileSystemEventHandler handler)
	{
		string fileName = Path.GetFileName(fullPath);
		FileSystemWatcher fileSystemWatcher = new FileSystemWatcher(fullPath.Substring(0, fullPath.Length - fileName.Length), fileName);
		fileSystemWatcher.NotifyFilter = NotifyFilters.Attributes | NotifyFilters.Size | NotifyFilters.LastWrite | NotifyFilters.CreationTime;
		fileSystemWatcher.Changed += handler;
		fileSystemWatcher.Created += handler;
		fileSystemWatcher.IncludeSubdirectories = false;
		fileSystemWatcher.SynchronizingObject = ThreadingHelper.SynchronizingObject;
		fileSystemWatcher.EnableRaisingEvents = true;
		return fileSystemWatcher;
	}

	public static T TypedValue<T>(object a)
	{
		return (T)Convert.ChangeType(a, typeof(T));
	}

	public static float TimeAdjustedRamp(float maxValue, float duration, float elapsedTime, float pctFromStartRise, float pctFromEndFall)
	{
		float num = elapsedTime / duration;
		if (num <= pctFromStartRise)
		{
			return maxValue * (num / pctFromStartRise);
		}
		if (num >= 1f - pctFromEndFall)
		{
			return maxValue * ((1f - num) / pctFromEndFall);
		}
		return maxValue;
	}

	public static Color IntToColor(int rgba)
	{
		//IL_0046: Unknown result type (might be due to invalid IL or missing references)
		float num = (float)((rgba >> 16) & 0xFF) / 255f;
		float num2 = (float)((rgba >> 8) & 0xFF) / 255f;
		float num3 = (float)(rgba & 0xFF) / 255f;
		float num4 = (float)((rgba >> 24) & 0xFF) / 255f;
		return new Color(num, num2, num3, num4);
	}

	public static bool CopyComponentToGameObject(Component original, ref GameObject destination)
	{
		//IL_0071: Unknown result type (might be due to invalid IL or missing references)
		//IL_0077: Expected Obj, but got Unknown
		Logging logger = Logging.GetLogger();
		Type type = ((object)original).GetType();
		logger.Debug($"Original Type is {type}");
		GameObject obj = destination;
		logger.Debug("Destination GameObject " + ((obj != null) ? ((Object)obj).name : null));
		Component val = destination.GetComponent(type);
		if (!Object.op_Implicit((Object)(object)val))
		{
			val = destination.AddComponent(type);
		}
		if (!Object.op_Implicit((Object)(object)val))
		{
			logger.Debug("Destination component is null");
			return false;
		}
		Component val2 = (Component)Activator.CreateInstance(type);
		if (!Object.op_Implicit((Object)(object)val2))
		{
			logger.Debug("Destination component is null");
			return false;
		}
		if (!Object.op_Implicit((Object)(object)val2))
		{
			logger.Debug("Boxed component is null");
			return false;
		}
		FieldInfo[] fields = type.GetFields(BindingFlags.Instance | BindingFlags.Static | BindingFlags.Public | BindingFlags.NonPublic);
		foreach (FieldInfo fieldInfo in fields)
		{
			fieldInfo.SetValue(val2, fieldInfo.GetValue(original));
		}
		val = val2;
		return true;
	}

	public static bool CopyObject(object original, object target)
	{
		Logging logger = Logging.GetLogger();
		Type type = original.GetType();
		Type type2 = target.GetType();
		if (type == null)
		{
			logger.Warning("Copy Object: Source object is null");
			return false;
		}
		if (type2 == null)
		{
			logger.Warning("Copy Object: Destination object is null");
			return false;
		}
		if (type2 != type)
		{
			logger.Warning("Copy Object: Source and destination components are different types");
			return false;
		}
		FieldInfo[] fields = type.GetFields(BindingFlags.Instance | BindingFlags.Static | BindingFlags.Public | BindingFlags.NonPublic);
		foreach (FieldInfo fieldInfo in fields)
		{
			fieldInfo.SetValue(target, fieldInfo.GetValue(original));
		}
		return true;
	}
}
