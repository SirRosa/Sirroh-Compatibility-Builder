using System;
using UnityEngine;

namespace RunicBuildCamera.Integration;

internal static class PlayerUpdateInputIsolation
{
	[ThreadStatic]
	private static int _depth;

	[ThreadStatic]
	private static Player _player;

	[ThreadStatic]
	private static bool _captured;

	[ThreadStatic]
	private static bool _originalTakeInput;

	internal static bool Enter(Player player)
	{
		if (!BuildCameraRuntime.ShouldFreezePlayer(player))
		{
			return false;
		}
		if (_depth == 0)
		{
			_player = player;
			_captured = false;
			_originalTakeInput = false;
		}
		_depth++;
		return true;
	}

	internal static void CaptureTakeInput(Player player, bool original)
	{
		if (_depth > 0 && !((Object)(object)player == (Object)null) && !((Object)(object)player != (Object)(object)_player))
		{
			_captured = true;
			_originalTakeInput = original;
		}
	}

	internal static bool ShouldSuppress(Player player)
	{
		if (_depth > 0 && (Object)(object)player != (Object)null && (Object)(object)player == (Object)(object)_player)
		{
			return BuildCameraRuntime.ShouldFreezePlayer(player);
		}
		return false;
	}

	internal static bool PlacementInput(Player player, bool current)
	{
		if (!ShouldSuppress(player) || !_captured)
		{
			return current;
		}
		return _originalTakeInput;
	}

	internal static void Exit()
	{
		if (_depth > 0)
		{
			_depth--;
			if (_depth == 0)
			{
				_player = null;
				_captured = false;
				_originalTakeInput = false;
			}
		}
	}
}
