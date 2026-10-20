using Jotunn.Managers;
using UnityEngine;
using Zen.Lib;

namespace Zen.Commands;

internal sealed class RepairAllCmd : TerminalCtrl.TerminalCommand
{
	public override string Name => "repairall";

	public override string Description => "Repair all pieces within a short radius (default: 20)";

	public override string Syntax => SyntaxName + " [range]";

	public override bool IsCheat => true;

	public override void Exec(string[] args)
	{
		if (ZNet.instance.IsDedicated())
		{
			Console.instance.Print("Must be logged in as a client player");
			return;
		}
		if (!Object.op_Implicit((Object)(object)Player.m_localPlayer))
		{
			Console.instance.Print("No active local player");
			return;
		}
		int result;
		if (args.Length == 1)
		{
			result = 20;
		}
		else if (args.Length > 2 || !int.TryParse(args[1], out result))
		{
			Console.instance.Print("Snytax: " + Syntax);
			return;
		}
		int num = 0;
		WearNTear val = default;
		foreach (Piece s_allPiece in Piece.s_allPieces)
		{
			if (((MonoBehaviour)(object)Player.m_localPlayer).InRange((MonoBehaviour)(object)s_allPiece, result) && ((Component)s_allPiece).TryGetComponent<WearNTear>(ref val) && val.Repair())
			{
				num++;
			}
		}
		Sprite sprite = GUIManager.Instance.GetSprite("hammer");
		((Character)Player.m_localPlayer).Message((MessageType)1, num switch
		{
			0 => "Repaired Pieces: 0", 
			1 => "Repaired Pieces: x1", 
			_ => "Repaired Pieces:", 
		}, num, sprite, false);
	}
}
