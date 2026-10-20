using System;
using System.Collections.Generic;

namespace Zen.Lib;

public class TerminalCtrl
{
	public abstract class TerminalCommand
	{
		public abstract string Name { get; }

		public abstract string Description { get; }

		public string SyntaxName
		{
			get
			{
				if (!UsePrefix)
				{
					return Name;
				}
				return "zen_" + Name;
			}
		}

		public abstract string Syntax { get; }

		public abstract bool IsCheat { get; }

		public virtual bool UsePrefix => true;

		public abstract void Exec(string[] args);
	}

	public const string Prefix = "zen_";

	private readonly string _modName;

	private readonly List<ConsoleCommand> _commands = new List<ConsoleCommand>();

	internal TerminalCtrl(string modName)
	{
		_modName = modName;
	}

	public ConsoleCommand CreateCommand(TerminalCommand cmd)
	{
		return CreateCommand(cmd.Name, cmd.Description, cmd.IsCheat, cmd.UsePrefix, cmd.Exec);
	}

	public ConsoleCommand CreateCommand(string name, string description, bool isCheat, bool usePrefix, Action<string[]> action)
	{
		//IL_003f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0053: Expected Obj, but got Unknown
		//IL_004e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0054: Expected Obj, but got Unknown
		string text = (usePrefix ? ("zen_" + name) : name);
		ConsoleCommand val = new ConsoleCommand(text, "(" + _modName + ") " + description, (ConsoleEvent)((ConsoleEventArgs args) =>
		{
			action(args.Args);
		}), isCheat, false, false, false, false, false, (ConsoleOptionsFetcher)null, false, false, false);
		Logging<ModLib>.InterpolatedString msg = new Logging<ModLib>.InterpolatedString(24, 1, out var shouldAppend);
		if (shouldAppend)
		{
			msg.AppendLiteral("Terminal command added: ");
			msg.AppendFormatted(text);
		}
		Logging<ModLib>.Info(msg);
		_commands.Add(val);
		return val;
	}

	public ConsoleCommand CreateCommand(string name, string description, bool isCheat, Action<string[]> action)
	{
		return CreateCommand(name, description, isCheat, usePrefix: true, action);
	}

	internal void Shutdown()
	{
		foreach (ConsoleCommand command in _commands)
		{
			Terminal.commands.Remove(command.Command.ToLower());
		}
		_commands.Clear();
	}
}
