using System;
using System.Collections.Generic;
using UnityEngine;

namespace LetMeTameYou;

public class LMTY_Interactable : MonoBehaviour, Hoverable, Interactable
{
	public Character m_character;

	public ZNetView m_nview;

	public Dictionary<string, int> tradelist = new Dictionary<string, int>();

	public void Awake()
	{
		m_nview = ((Component)this).GetComponent<ZNetView>();
		m_character = ((Component)this).GetComponent<Character>();
	}

	public void initTradeList(string all_trades)
	{
		tradelist.Clear();
		string[] array = all_trades.Split(new char[1] { ',' });
		string o = ((Object)this).name + " trades:";
		string[] array2 = array;
		foreach (string text in array2)
		{
			string[] array3 = text.Split(new char[1] { ':' });
			GameObject itemPrefab = ObjectDB.instance.GetItemPrefab(array3[0]);
			if ((Object)(object)itemPrefab == (Object)null)
			{
				DBG.blogWarning("Wrong item name " + array3[0] + ", skipping as a trade");
			}
			int result = 1;
			if (array3.Length != 0)
			{
				int.TryParse(array3[1], out result);
			}
			tradelist.Add(array3[0], result);
		}
		DBG.blogDebug(o);
	}

	public virtual string GetHoverText()
	{
		Tameable component = ((Component)this).GetComponent<Tameable>();
		if (Object.op_Implicit((Object)(object)component))
		{
			return component.GetHoverText();
		}
		return "";
	}

	public virtual string GetHoverName()
	{
		Tameable component = ((Component)this).GetComponent<Tameable>();
		if (Object.op_Implicit((Object)(object)component))
		{
			return component.GetHoverName();
		}
		return Localization.instance.Localize(m_character.m_name);
	}

	public float GetHoverOffset()
	{
		if ((Object)(object)m_character != (Object)null)
		{
			return m_character.m_hoverOffset;
		}
		return 0f;
	}

	public bool Interact(Humanoid user, bool hold, bool alt)
	{
		return true;
	}

	public bool UseItem(Humanoid user, ItemData item)
	{
		//IL_012e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0135: Expected Obj, but got Unknown
		if (!m_nview.IsValid())
		{
			return false;
		}
		try
		{
			foreach (KeyValuePair<string, int> item2 in tradelist)
			{
				DBG.blogDebug("Allowed Trades: " + item2.Key + " with amount " + item2.Value);
			}
			DBG.blogDebug("Tradelist size=" + tradelist.Count);
			DBG.blogDebug("item.m_dropPrefab.name=" + ((Object)item.m_dropPrefab).name);
			if (!tradelist.TryGetValue(((Object)item.m_dropPrefab).name, out var value))
			{
				DBG.blogDebug(((Object)item.m_dropPrefab).name + " is not in trade list");
				return false;
			}
			Inventory inventory = user.GetInventory();
			int num = inventory.CountItems(item.m_shared.m_name, -1, true);
			if (num >= value)
			{
				DBG.blogDebug("Attempting Trade");
				if (m_character.IsTamed())
				{
					return false;
				}
				Tameable val = new Tameable();
				val = ((Component)m_character).gameObject.GetComponent<Tameable>();
				if (!((Object)(object)val != (Object)null))
				{
					DBG.blogDebug("Not tameable");
					return false;
				}
				val.Tame();
				bool flag = inventory.RemoveItem(item, value);
				DBG.blogDebug("Recruited " + m_character.m_name);
			}
			else
			{
				DBG.blogDebug("Not enough " + item.m_shared.m_name + ", need " + value);
				string text = Localization.instance.Localize("$lmty_need_more_trade");
				if (text.Contains("{0}"))
				{
					if (text.Contains("{1}"))
					{
						((Character)user).Message((MessageType)2, string.Format(text, item.m_shared.m_name, value), 0, (Sprite)null, false);
					}
					else
					{
						((Character)user).Message((MessageType)2, string.Format(text, item.m_shared.m_name), 0, (Sprite)null, false);
					}
				}
				else
				{
					((Character)user).Message((MessageType)2, text, 0, (Sprite)null, false);
				}
			}
		}
		catch (Exception)
		{
		}
		return true;
	}
}
