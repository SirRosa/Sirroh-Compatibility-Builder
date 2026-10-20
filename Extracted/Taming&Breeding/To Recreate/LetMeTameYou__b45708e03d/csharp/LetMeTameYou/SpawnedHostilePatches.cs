using HarmonyLib;
using UnityEngine;

namespace LetMeTameYou;

internal class SpawnedHostilePatches
{
	private static void SetTamedAttacks(Character character)
	{
		Humanoid val = (Humanoid)(object)((character is Humanoid) ? character : null);
		if (!Object.op_Implicit((Object)(object)val))
		{
			return;
		}
		Inventory inventory = val.m_inventory;
		if (inventory == null)
		{
			return;
		}
		if (inventory.NrOfItems() > 0)
		{
			for (int num = inventory.m_inventory.Count - 1; num >= 0; num--)
			{
				if (!((Object)(object)inventory.m_inventory[num].m_dropPrefab == (Object)null) && TameManager.TamedAttackVariants.TryGetValue(((Object)inventory.m_inventory[num].m_dropPrefab).name, out var value))
				{
					inventory.RemoveItem(num);
					inventory.AddItem(value, 1);
					DBG.blogWarning("Changed to tamed attack in inv " + ((Object)value).name);
				}
			}
			return;
		}
		for (int i = 0; i < val.m_defaultItems.Length; i++)
		{
			if (TameManager.TamedAttackVariants.TryGetValue(((Object)val.m_defaultItems[i]).name, out var value2))
			{
				val.m_defaultItems[i] = value2;
				DBG.blogWarning("Changed to tamed attack as default " + ((Object)value2).name);
			}
		}
	}

	public static void findTamedAttackVariants(Humanoid humanoid)
	{
		//IL_005f: Unknown result type (might be due to invalid IL or missing references)
		if (humanoid.m_defaultItems == null)
		{
			return;
		}
		int num = humanoid.m_defaultItems.Length;
		Projectile val = default;
		SpawnAbility spawnAbility = default;
		SpawnAbility spawnAbility2 = default;
		for (int i = 0; i < num; i++)
		{
			if (TameManager.TamedAttackVariants.ContainsKey(((Object)humanoid.m_defaultItems[i]).name))
			{
				continue;
			}
			Transform transform = new GameObject(((Object)humanoid.m_defaultItems[i]).name + "_base").transform;
			((Component)transform).gameObject.SetActive(false);
			bool flag = false;
			bool flag2 = false;
			ItemDrop component = humanoid.m_defaultItems[i].GetComponent<ItemDrop>();
			string text = "0";
			GameObject copy = null;
			if (Object.op_Implicit((Object)(object)component))
			{
				text += "1";
				GameObject attackProjectile = component.m_itemData.m_shared.m_attack.m_attackProjectile;
				if (Object.op_Implicit((Object)(object)attackProjectile))
				{
					text += "2";
					GameObject copy2 = null;
					if (attackProjectile.TryGetComponent<Projectile>(ref val))
					{
						text += "3";
						GameObject spawnOnHit = val.m_spawnOnHit;
						if (Object.op_Implicit((Object)(object)spawnOnHit))
						{
							text += "4";
							GameObject[] newSpawnPref = null;
							if (spawnOnHit.TryGetComponent<SpawnAbility>(ref spawnAbility))
							{
								flag |= findTamedAttackinSpawnAbility(spawnAbility, ref newSpawnPref, transform);
							}
							if (flag && SaveAttackPart(spawnOnHit, ref copy2, transform))
							{
								copy2.GetComponent<SpawnAbility>().m_spawnPrefab = newSpawnPref;
							}
						}
						if (flag && (SaveAttackPart(attackProjectile, ref copy, transform) | flag2))
						{
							copy.GetComponent<Projectile>().m_spawnOnHit = copy2;
						}
					}
					GameObject[] newSpawnPref2 = null;
					if (attackProjectile.TryGetComponent<SpawnAbility>(ref spawnAbility2))
					{
						flag2 |= findTamedAttackinSpawnAbility(spawnAbility2, ref newSpawnPref2, transform);
					}
					if (flag2 && (SaveAttackPart(attackProjectile, ref copy, transform) | flag))
					{
						copy.GetComponent<SpawnAbility>().m_spawnPrefab = newSpawnPref2;
					}
				}
			}
			if (flag | flag2)
			{
				GameObject val2 = Object.Instantiate<GameObject>(humanoid.m_defaultItems[i], transform);
				((Object)val2).name = ((Object)val2).name.Replace("(Clone)", "_tamed");
				ItemDrop component2 = val2.GetComponent<ItemDrop>();
				component2.m_itemData.m_shared.m_attack.m_attackProjectile = copy;
				component2.m_itemData.m_dropPrefab = val2;
				component2.Save();
				Utils.addItemToODB(val2, ObjectDB.instance);
				int stableHashCode = StringExtensionMethods.GetStableHashCode(((Object)val2).name);
				if (!ObjectDB.instance.m_itemByHash.ContainsKey(stableHashCode))
				{
					ObjectDB.instance.m_items.Add(val2);
					ObjectDB.instance.m_itemByHash.Add(stableHashCode, val2);
				}
				TameManager.TamedAttackVariants.Add(((Object)humanoid.m_defaultItems[i]).name, val2);
				((Component)transform).transform.parent = TameManager.Root.transform;
				DBG.blogDebug("New Attack made: " + ((Object)val2).name);
			}
		}
	}

	public static bool findTamedAttackinSpawnAbility(SpawnAbility spawnAbility, ref GameObject[] newSpawnPref, Transform base_go)
	{
		bool result = false;
		GameObject[] spawnPrefab = spawnAbility.m_spawnPrefab;
		newSpawnPref = new GameObject[spawnPrefab.Length];
		Tameable val = default;
		for (int i = 0; i < spawnPrefab.Length; i++)
		{
			if (!Object.op_Implicit((Object)(object)spawnPrefab[i].GetComponent<Character>()))
			{
				newSpawnPref[i] = spawnPrefab[i];
				continue;
			}
			if (SaveAttackPart(spawnPrefab[i], ref newSpawnPref[i], base_go))
			{
				ZDOChanger zDOChanger = newSpawnPref[i].AddComponent<ZDOChanger>();
				zDOChanger.newName = ((Object)newSpawnPref[i]).name.Replace("_tamed", "");
				if (!newSpawnPref[i].TryGetComponent<Tameable>(ref val))
				{
					val = newSpawnPref[i].AddComponent<Tameable>();
				}
				val.m_startsTamed = true;
			}
			result = true;
		}
		return result;
	}

	public static bool SaveAttackPart(GameObject go, ref GameObject copy, Transform base_go)
	{
		string text = ((Object)go).name.Replace("(Clone)", "") + "_tamed";
		int stableHashCode = StringExtensionMethods.GetStableHashCode(text);
		if (ZNetScene.instance.m_namedPrefabs.ContainsKey(stableHashCode))
		{
			copy = ZNetScene.instance.GetPrefab(stableHashCode);
			return false;
		}
		copy = Object.Instantiate<GameObject>(go, base_go);
		((Object)copy).name = text;
		Utils.addToZNS(copy);
		DBG.blogDebug(((Object)copy).name + " registered to ZNetScene");
		return true;
	}

	[HarmonyPatch(typeof(Character), "Awake")]
	[HarmonyPostfix]
	private static void CharacterSetTamedPostfix(Character __instance)
	{
		if (__instance.m_tamed)
		{
			SetTamedAttacks(__instance);
		}
	}

	[HarmonyPatch(typeof(Character), "SetTamed")]
	[HarmonyPostfix]
	private static void CharacterSetTamedPostfix(Character __instance, bool tamed)
	{
		if (tamed)
		{
			SetTamedAttacks(__instance);
		}
	}

	[HarmonyPatch(typeof(CharacterDrop), "GenerateDropList")]
	[HarmonyPrefix]
	private static void PrefixGenerateDropList(CharacterDrop __instance)
	{
		if (!Object.op_Implicit((Object)(object)__instance.m_character))
		{
			DBG.blogWarning("No Valid Character");
		}
		else
		{
			if (!__instance.m_character.m_tamed)
			{
				return;
			}
			foreach (Drop drop in __instance.m_drops)
			{
				if (!Object.op_Implicit((Object)(object)drop.m_prefab))
				{
					DBG.blogDebug("Drop Does not Have Prefab");
				}
				else if (Object.op_Implicit((Object)(object)drop.m_prefab.GetComponent<Tameable>()))
				{
					drop.m_prefab = Object.Instantiate<GameObject>(drop.m_prefab);
					drop.m_prefab.GetComponent<Tameable>().m_startsTamed = true;
					DBG.blogDebug("Set OnDeath Creature to Tamed");
				}
				else if (Object.op_Implicit((Object)(object)drop.m_prefab.GetComponent<Character>()))
				{
					drop.m_prefab = Object.Instantiate<GameObject>(drop.m_prefab);
					drop.m_prefab.GetComponent<Character>().SetTamed(true);
					drop.m_prefab.GetComponent<Character>().m_tamed = true;
					DBG.blogDebug("Set OnDeath Character to Tamed");
				}
			}
		}
	}
}
