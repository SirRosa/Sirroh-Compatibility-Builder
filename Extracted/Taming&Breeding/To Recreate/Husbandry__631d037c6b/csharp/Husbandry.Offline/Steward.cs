using System.Collections.Generic;
using Husbandry.Config;
using Husbandry.Herd;
using Husbandry.Util;
using UnityEngine;

namespace Husbandry.Offline;

internal static class Steward
{
	internal const float Interval = 1f;

	private static float _next;

	private static Pasture.Cursor _cursor;

	private static List<string> _tameables;

	private static readonly Kinds Species = new Kinds();

	private static readonly Courtship Courting = new Courtship();

	private static readonly Census Settled = new Census();

	private static readonly List<Census.Head> Building = new List<Census.Head>();

	private static readonly HashSet<long> Present = new HashSet<long>();

	private static readonly List<ZDO> Batch = new List<ZDO>();

	internal static bool Running { get; private set; }

	internal static int Considered { get; private set; }

	internal static int Attended { get; private set; }

	internal static int Healed { get; private set; }

	internal static int Courted { get; private set; }

	internal static int Conceived { get; private set; }

	internal static int Capped { get; private set; }

	internal static void ResetForTests()
	{
		Running = false;
		Considered = (Attended = (Healed = (Courted = (Conceived = (Capped = 0)))));
		_next = 0f;
		_cursor = default;
		_tameables = null;
		Species.Clear();
		Courting.Clear();
		Settled.Clear();
		Building.Clear();
		Present.Clear();
	}

	internal static bool ShouldRun(bool isServer, bool enabled)
	{
		return isServer & enabled;
	}

	internal static void Begin()
	{
		Running = true;
		Log.Info("Husbandry is looking after unattended tames on this machine.");
	}

	internal static void Tick()
	{
		if (!Running || Time.time < _next)
		{
			return;
		}
		_next = Time.time + 1f;
		ZDOMan instance = ZDOMan.instance;
		ZNet instance2 = ZNet.instance;
		if (instance != null && !((Object)(object)instance2 == (Object)null))
		{
			Gather(instance2);
			if (Prefabs())
			{
				Slice(instance);
				Courting.Forget(Time.time, HusbandryConfig.ForgetAfter.Value);
			}
		}
	}

	private static void Gather(ZNet net)
	{
		Present.Clear();
		Present.Add(ZDOMan.GetSessionID());
		List<ZNetPeer> peers = net.GetPeers();
		if (peers == null)
		{
			return;
		}
		foreach (ZNetPeer item in peers)
		{
			if (item != null)
			{
				Present.Add(item.m_uid);
			}
		}
	}

	private static bool Prefabs()
	{
		if (_tameables != null)
		{
			return _tameables.Count > 0;
		}
		ZNetScene instance = ZNetScene.instance;
		if ((Object)(object)instance == (Object)null || instance.m_prefabs == null)
		{
			return false;
		}
		_tameables = Pasture.Tameables(instance.m_prefabs);
		Species.Load(Kinds.Read(instance.m_prefabs));
		Log.Info("Husbandry found " + _tameables.Count + " tameable prefab(s), " + Species.Count + " with numbers read off the prefab.");
		return _tameables.Count > 0;
	}

	private static void Slice(ZDOMan zdoMan)
	{
		if (!Pasture.Valid(_cursor, _tameables.Count))
		{
			_cursor = default;
		}
		string text = _tameables[_cursor.Prefab];
		Batch.Clear();
		int index = _cursor.Index;
		bool allZDOsWithPrefabIterative = zdoMan.GetAllZDOsWithPrefabIterative(text, Batch, ref index);
		Species.Find(StringExtensionMethods.GetStableHashCode(text), out var kind);
		foreach (ZDO item in Batch)
		{
			Consider(item, kind);
		}
		Pasture.Cursor cursor = (allZDOsWithPrefabIterative ? Pasture.Next(_cursor, _tameables.Count) : Pasture.Continued(_cursor, index));
		if (Pasture.Wrapped(_cursor, cursor))
		{
			Settled.Take(Building, Time.time);
			Building.Clear();
		}
		_cursor = cursor;
	}

	private static void Consider(ZDO zdo, Kinds.Kind kind)
	{
		//IL_0014: Unknown result type (might be due to invalid IL or missing references)
		//IL_0019: Unknown result type (might be due to invalid IL or missing references)
		//IL_0042: Unknown result type (might be due to invalid IL or missing references)
		//IL_0043: Unknown result type (might be due to invalid IL or missing references)
		//IL_00bc: Unknown result type (might be due to invalid IL or missing references)
		if (zdo == null || !zdo.GetBool(ZDOVars.s_tamed, false))
		{
			return;
		}
		Vector3 position = zdo.GetPosition();
		Considered++;
		Building.Add(new Census.Head
		{
			Prefab = kind.Hash,
			Where = position,
			Tamed = true
		});
		if (!Untended.Yes(zdo.HasOwner(), Present.Contains(zdo.GetOwner())))
		{
			Attended++;
			return;
		}
		long ticks = ZNet.instance.GetTime().Ticks;
		if (HusbandryConfig.OfflineHealing.Value)
		{
			Mend(zdo, kind);
		}
		if (HusbandryConfig.OfflineBreeding.Value && kind.Breeds)
		{
			Breed(zdo, kind, position, ticks);
		}
	}

	private static void Mend(ZDO zdo, Kinds.Kind kind)
	{
		float num = zdo.GetFloat(ZDOVars.s_health, -1f);
		if (!(num < 0f))
		{
			float max = zdo.GetFloat(ZDOVars.s_maxHealth, kind.MaxHealth);
			float num2 = Mending.Restored(num, max, HusbandryConfig.HealPerSecond.Value, 1.0);
			if (Mending.Worth(num, num2))
			{
				zdo.Set(ZDOVars.s_health, num2);
				Healed++;
			}
		}
	}

	private static void Breed(ZDO zdo, Kinds.Kind kind, Vector3 where, long now)
	{
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		//IL_006a: Unknown result type (might be due to invalid IL or missing references)
		//IL_00b5: Unknown result type (might be due to invalid IL or missing references)
		//IL_00f4: Unknown result type (might be due to invalid IL or missing references)
		if (!Courting.Ready(zdo.m_uid, Time.time, HusbandryConfig.CourtingInterval.Value))
		{
			return;
		}
		bool pregnant = Quickening.Carrying(zdo.GetLong(ZDOVars.s_pregnant, 0L));
		bool hungry = HusbandryConfig.OfflineHunger.Value && Clocks.Elapsed(zdo.GetLong(ZDOVars.s_tameLastFeeding, 0L), now, kind.FedDuration);
		bool havePartner = Quickening.Company(Settled.Within(kind.Hash, where, kind.PartnerCheckRange));
		int cap = Cap.Effective(kind.MaxCreatures, HusbandryConfig.SoftCap.Value);
		bool underCap = Cap.CertainlyUnder(Settled.Total(kind.Hash), cap) || !Cap.Reached(Settled.Within(kind.Hash, where, kind.TotalCheckRange), cap);
		Verdict verdict = Quickening.Judge(tamed: true, pregnant, havePartner, hungry, underCap, zdo.GetInt(ZDOVars.s_lovePoints, 0), kind.RequiredLovePoints);
		Courting.Courted(zdo.m_uid, Time.time);
		if (Quickening.Courts(verdict))
		{
			zdo.Set(ZDOVars.s_lovePoints, zdo.GetInt(ZDOVars.s_lovePoints, 0) + 1, false);
			Courted++;
		}
		else if (!Quickening.Conceives(verdict))
		{
			if (verdict == Verdict.Capped)
			{
				Capped++;
			}
		}
		else
		{
			zdo.Set(ZDOVars.s_pregnant, now);
			zdo.Set(ZDOVars.s_lovePoints, 0, false);
			Conceived++;
			Log.Debug("husbandry: an unattended " + kind.Name + " is expecting");
		}
	}

	internal static List<string> Report()
	{
		List<string> list = new List<string> { "--- husbandry (offline) ---" };
		if (!Running)
		{
			list.Add("  not running - this machine does not hold the world");
			return list;
		}
		list.Add("  watching   " + ((_tameables != null) ? _tameables.Count : 0) + " tameable prefab(s), cursor " + _cursor.Prefab + "/" + _cursor.Index + ", " + _cursor.Passes + " full pass(es)");
		list.Add("  census     " + Settled.Counted + " tame(s) across " + Settled.Species + " species");
		list.Add("  tames      " + Considered + " considered, " + Attended + " left to the client holding them");
		list.Add("  upkeep     " + Healed + " healed, " + Courted + " courting, " + Conceived + " expecting, " + Capped + " held at the cap");
		list.Add("  clocks     " + Courting.Count + " courting clock(s)");
		return list;
	}
}
