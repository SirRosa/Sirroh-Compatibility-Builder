using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using Husbandry.Config;
using Husbandry.Herd;
using Husbandry.Idle;
using Husbandry.Offline;
using Husbandry.Patches;

namespace Husbandry.Commands;

internal static class HusbandryCommand
{
	[Serializable]
	[CompilerGenerated]
	private sealed class _003C_003Ec
	{
		public static readonly _003C_003Ec _003C_003E9 = new _003C_003Ec();

		public static ConsoleEvent _003C_003E9__0_0;

		internal void _003CRegister_003Eb__0_0(ConsoleEventArgs args)
		{
			foreach (string item in Report())
			{
				args.Context.AddString(item);
			}
		}
	}

	internal static void Register()
	{
		//IL_0033: Unknown result type (might be due to invalid IL or missing references)
		//IL_001e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0023: Unknown result type (might be due to invalid IL or missing references)
		//IL_0029: Expected Obj, but got Unknown
		ConsoleEvent val = _003C_003Ec._003C_003E9__0_0;
		if (val == null)
		{
			ConsoleEvent val2 = (ConsoleEventArgs args) =>
			{
				foreach (string item in Report())
				{
					args.Context.AddString(item);
				}
			};
			_003C_003Ec._003C_003E9__0_0 = val2;
			val = val2;
		}
		new ConsoleCommand("husbandry", "what Husbandry is doing", val, false, false, false, false, false, false, (ConsoleOptionsFetcher)null, false, false, false);
	}

	internal static List<string> Report()
	{
		List<string> list = new List<string> { "--- husbandry 1.1.0 ---" };
		if (HusbandryConfig.ThrottleIdle.Value)
		{
			list.Add("  throttle   on: nothing inside " + HusbandryConfig.NearRange.Value + "m, one tick in " + HusbandryConfig.MidSkip.Value + " out to " + HusbandryConfig.FarRange.Value + "m, one in " + HusbandryConfig.FarSkip.Value + " beyond");
			list.Add("  ticks      " + Drowse.Thought + " thought, " + Drowse.Skipped + " skipped, " + Drowse.Dozing + " idle-tame frame(s) seen");
		}
		else
		{
			list.Add("  throttle   off");
		}
		list.Add("  census     " + Muster.Counted + " tame(s) across " + Muster.Species + " species, taken " + Muster.Takings + " time(s)");
		list.Add("  breeding   " + BreedPatch.Skipped + " round(s) skipped at the cap");
		list.AddRange(Steward.Report());
		return list;
	}
}
