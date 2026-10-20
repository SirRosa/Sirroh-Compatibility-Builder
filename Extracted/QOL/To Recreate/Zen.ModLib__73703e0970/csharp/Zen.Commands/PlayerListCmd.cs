using System.Collections.Generic;
using UnityEngine;
using Zen.Lib;

namespace Zen.Commands;

internal sealed class PlayerListCmd : TerminalCtrl.TerminalCommand
{
	public override string Name => "playerlist";

	public override string Description => "List all the players on the server";

	public override string Syntax => "playerlist";

	public override bool IsCheat => true;

	public override void Exec(string[] args)
	{
		//IL_0019: Unknown result type (might be due to invalid IL or missing references)
		//IL_001e: Unknown result type (might be due to invalid IL or missing references)
		//IL_001f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0020: Unknown result type (might be due to invalid IL or missing references)
		//IL_0025: Unknown result type (might be due to invalid IL or missing references)
		//IL_002b: Unknown result type (might be due to invalid IL or missing references)
		//IL_002c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0031: Unknown result type (might be due to invalid IL or missing references)
		//IL_0038: Unknown result type (might be due to invalid IL or missing references)
		//IL_0043: Unknown result type (might be due to invalid IL or missing references)
		//IL_0055: Unknown result type (might be due to invalid IL or missing references)
		//IL_0070: Unknown result type (might be due to invalid IL or missing references)
		//IL_0087: Unknown result type (might be due to invalid IL or missing references)
		//IL_0088: Unknown result type (might be due to invalid IL or missing references)
		//IL_008d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0092: Unknown result type (might be due to invalid IL or missing references)
		//IL_009c: Unknown result type (might be due to invalid IL or missing references)
		//IL_009d: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a2: Unknown result type (might be due to invalid IL or missing references)
		//IL_00b3: Unknown result type (might be due to invalid IL or missing references)
		//IL_00be: Unknown result type (might be due to invalid IL or missing references)
		//IL_00bf: Unknown result type (might be due to invalid IL or missing references)
		List<PlayerInfo> playerList = ZNet.instance.GetPlayerList();
		foreach (PlayerInfo item in playerList)
		{
			Vector3 position = item.m_position;
			Biome biome = WorldGenerator.instance.GetBiome(position);
			string arg = $"{position.x:F}, {position.z:F}";
			string arg2 = (Character.InInterior(position) ? " (Dungeon)" : string.Empty);
			string text = $"{biome} ({arg}){arg2}";
			string text2 = $"{item.m_userInfo.m_id.m_platform}:{item.m_userInfo.m_id.m_userID}";
			string text3 = item.m_name + " / " + item.m_userInfo.m_serverAssignedDisplayName;
			string text4 = text3 + " [" + text2 + "] @ " + text;
			Console.instance.Print(text4);
		}
		Console.instance.Print($"Total players online: {playerList.Count}");
	}
}
