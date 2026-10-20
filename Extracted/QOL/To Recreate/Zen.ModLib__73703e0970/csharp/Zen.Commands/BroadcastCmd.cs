using Zen.Lib;

namespace Zen.Commands;

internal sealed class BroadcastCmd : TerminalCtrl.TerminalCommand
{
	public override string Name => "broadcast";

	public override string Description => "Send a message to all players on the server";

	public override string Syntax => SyntaxName + " <message>";

	public override bool IsCheat => true;

	public override void Exec(string[] args)
	{
		if (args.Length < 2)
		{
			Console.instance.Print("Syntax: " + Syntax);
			return;
		}
		string text = args[1];
		MessageHud.instance.MessageAll((MessageType)2, text);
	}
}
