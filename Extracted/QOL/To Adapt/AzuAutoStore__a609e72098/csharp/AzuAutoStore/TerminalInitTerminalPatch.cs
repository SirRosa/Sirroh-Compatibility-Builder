using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using AzuAutoStore.APIs;
using AzuAutoStore.Interfaces;
using AzuAutoStore.Util;
using HarmonyLib;
using UnityEngine;

namespace AzuAutoStore;

[HarmonyPatch(typeof(Terminal), "InitTerminal")]
[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
internal static class TerminalInitTerminalPatch
{
	[Serializable]
	[CompilerGenerated]
	private sealed class _003C_003Ec
	{
		[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
		public static readonly _003C_003Ec _003C_003E9 = new _003C_003Ec();

		[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
		public static Func<Piece, bool> _003C_003E9__2_8;

		[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
		public static Func<Piece, VanillaContainers> _003C_003E9__2_10;

		[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
		public static Func<ItemData, int> _003C_003E9__2_12;

		[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
		public static ConsoleEvent _003C_003E9__2_0;

		[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
		public static ConsoleOptionsFetcher _003C_003E9__2_1;

		[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(0)]
		internal void _003CPostfix_003Eb__2_0(ConsoleEventArgs args)
		{
			_003C_003Ec__DisplayClass2_0 obj = new _003C_003Ec__DisplayClass2_0();
			if (args.Length > 1 && Object.op_Implicit((Object)(object)ZNetScene.instance))
			{
				obj.itemCount = 0;
				bool flag = obj._003CPostfix_003Eg__SearchNearbyContainersFor_007C2(args[1]);
				((Character)Player.m_localPlayer).Message((MessageType)2, flag ? $"Found {obj.itemCount} items matching '{args[1]}' in nearby containers." : ("<color=red>No items matching '" + args[1] + "' found in nearby containers.</color>"), 0, (Sprite)null, false);
			}
		}

		[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(0)]
		internal bool _003CPostfix_003Eb__2_8(Piece p)
		{
			return Object.op_Implicit((Object)(object)((Component)p).GetComponent<Container>());
		}

		[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(0)]
		internal VanillaContainers _003CPostfix_003Eb__2_10(Piece p)
		{
			return VanillaContainers.Create(((Component)p).GetComponent<Container>());
		}

		[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(0)]
		internal int _003CPostfix_003Eb__2_12(ItemData item)
		{
			return item.m_stack;
		}

		[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(0)]
		internal List<string> _003CPostfix_003Eb__2_1()
		{
			if (Object.op_Implicit((Object)(object)ZNetScene.instance))
			{
				return ZNetScene.instance.GetPrefabNames();
			}
			return new List<string>();
		}
	}

	[CompilerGenerated]
	private sealed class _003C_003Ec__DisplayClass2_0
	{
		public int itemCount;
	}

	private const float SearchRadius = 50f;

	public static void GetAllPiecesInRadius(Vector3 p, float radius, List<Piece> pieces)
	{
		//IL_003d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0044: Unknown result type (might be due to invalid IL or missing references)
		if (Piece.s_ghostLayer == 0)
		{
			Piece.s_ghostLayer = LayerMask.NameToLayer("ghost");
		}
		foreach (Piece s_allPiece in Piece.s_allPieces)
		{
			if (((Component)s_allPiece).gameObject.layer != Piece.s_ghostLayer && (double)Vector3.Distance(p, ((Component)s_allPiece).transform.position) < (double)radius)
			{
				pieces.Add(s_allPiece);
			}
		}
	}

	private static void Postfix(Terminal __instance)
	{
		//IL_001e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0023: Unknown result type (might be due to invalid IL or missing references)
		//IL_0029: Expected Obj, but got Unknown
		//IL_0051: Unknown result type (might be due to invalid IL or missing references)
		//IL_0043: Unknown result type (might be due to invalid IL or missing references)
		//IL_0048: Unknown result type (might be due to invalid IL or missing references)
		//IL_004e: Expected Obj, but got Unknown
		ConsoleEvent val = _003C_003Ec._003C_003E9__2_0;
		if (val == null)
		{
			ConsoleEvent val2 = [_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(0)] (ConsoleEventArgs args) =>
			{
				int itemCount;
				if (args.Length > 1 && Object.op_Implicit((Object)(object)ZNetScene.instance))
				{
					itemCount = 0;
					bool flag = SearchNearbyContainersFor(args[1]);
					((Character)Player.m_localPlayer).Message((MessageType)2, flag ? $"Found {itemCount} items matching '{args[1]}' in nearby containers." : ("<color=red>No items matching '" + args[1] + "' found in nearby containers.</color>"), 0, (Sprite)null, false);
				}
				IEnumerable<IContainer> GetNearbyMatchingPieces(string query)
				{
					//IL_0024: Unknown result type (might be due to invalid IL or missing references)
					List<Piece> list = new List<Piece>();
					GetAllPiecesInRadius(((Component)Player.m_localPlayer).transform.position, 50f, list);
					IEnumerable<IContainer> second = ItemDrawers_API.AllDrawers.Where([_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(0)] (ItemDrawers_API.Drawer x) => string.Equals(x.Prefab, query, StringComparison.CurrentCultureIgnoreCase)).Select(kgDrawer.Create);
					IEnumerable<IContainer> second2 = MkzItemDrawers_API.AllDrawers.Where([_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(0)] (MkzItemDrawers_API.Drawer x) => string.Equals(x.Prefab, query, StringComparison.CurrentCultureIgnoreCase)).Select(mkzDrawer.Create);
					return (from p in list
						where Object.op_Implicit((Object)(object)((Component)p).GetComponent<Container>())
						where ContainerContainsMatchingItem((Component)(object)p, query.ToLower(), ref itemCount)
						select VanillaContainers.Create(((Component)p).GetComponent<Container>())).Concat(second).Concat(second2);
				}
				bool SearchNearbyContainersFor(string query)
				{
					//IL_003b: Unknown result type (might be due to invalid IL or missing references)
					//IL_004a: Unknown result type (might be due to invalid IL or missing references)
					//IL_0083: Unknown result type (might be due to invalid IL or missing references)
					//IL_0088: Unknown result type (might be due to invalid IL or missing references)
					//IL_008f: Unknown result type (might be due to invalid IL or missing references)
					//IL_009b: Unknown result type (might be due to invalid IL or missing references)
					//IL_00a0: Unknown result type (might be due to invalid IL or missing references)
					bool result = false;
					IContainer container = null;
					float num = float.MaxValue;
					foreach (IContainer nearbyMatchingPiece in GetNearbyMatchingPieces(query))
					{
						Functions.PingContainer(nearbyMatchingPiece.gameObject);
						result = true;
						float num2 = Vector3.Distance(nearbyMatchingPiece.gameObject.transform.position, ((Component)Player.m_localPlayer).transform.position);
						if (num2 < num)
						{
							num = num2;
							container = nearbyMatchingPiece;
						}
					}
					if (container != null)
					{
						Vector3 position = container.gameObject.transform.position;
						((Character)Player.m_localPlayer).SetLookDir(position - ((Component)Player.m_localPlayer).transform.position, 3.5f);
					}
					return result;
				}
			};
			_003C_003Ec._003C_003E9__2_0 = val2;
			val = val2;
		}
		ConsoleOptionsFetcher val3 = _003C_003Ec._003C_003E9__2_1;
		if (val3 == null)
		{
			ConsoleOptionsFetcher val4 = [_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(0)] () => Object.op_Implicit((Object)(object)ZNetScene.instance) ? ZNetScene.instance.GetPrefabNames() : new List<string>();
			_003C_003Ec._003C_003E9__2_1 = val4;
			val3 = val4;
		}
		new ConsoleCommand("azuautostoresearch", "[prefab name/query text] - search for items in chests near the player. It uses the prefab name", val, false, false, false, false, false, false, val3, false, false, false);
		static bool ContainerContainsMatchingItem(Component container, string query, ref int count)
		{
			IEnumerable<ItemData> source = (from i in container.GetComponent<Container>().GetInventory().GetAllItems()
				where NormalizedItemName(i).Contains(query) || i.m_shared.m_name.ToLower().Contains(query)
				select i).ToList();
			count += source.Sum([_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(0)] (ItemData item) => item.m_stack);
			return source.Any();
		}
		static string NormalizedItemName(ItemData itemData)
		{
			return Utils.GetPrefabName(itemData.m_dropPrefab).ToLower();
		}
	}
}
