using System;

namespace RunicBuildCamera.Core;

internal static class PickupPolicy
{
	internal const int CandidateCapacity = 128;

	internal const int MaximumAttemptsPerScan = 16;

	internal const int MaximumCooldownEntries = 256;

	internal const float MinimumOwnershipRetrySeconds = 0.2f;

	internal const float FailedPickupRetrySeconds = 0.5f;

	internal const float CompletedPickupDedupeSeconds = 5f;

	internal static bool IsScanDue(float now, float nextScanAt)
	{
		if (IsFinite(now) && IsFinite(nextScanAt))
		{
			return now >= nextScanAt;
		}
		return false;
	}

	internal static float NextScanAt(float now, float configuredIntervalSeconds)
	{
		float right = (IsFinite(configuredIntervalSeconds) ? Math.Max(0.02f, configuredIntervalSeconds) : 0.2f);
		return SaturatingAdd(now, right);
	}

	internal static bool IsWithinRange(float squaredDistance, float rangeMeters)
	{
		if (!IsFinite(squaredDistance) || squaredDistance < 0f || !IsFinite(rangeMeters) || rangeMeters <= 0f)
		{
			return false;
		}
		double num = rangeMeters;
		return (double)squaredDistance <= num * num;
	}

	internal static PickupRejectionReason Evaluate(in PickupCandidateFacts facts)
	{
		if (!facts.HasValidNetworkIdentity)
		{
			return PickupRejectionReason.InvalidNetworkIdentity;
		}
		if (!facts.IsWithinRange)
		{
			return PickupRejectionReason.OutsideRange;
		}
		if (facts.IsFish)
		{
			return PickupRejectionReason.Fish;
		}
		if (!facts.AutoPickupEnabled)
		{
			return PickupRejectionReason.AutoPickupDisabled;
		}
		if (facts.IsPiece)
		{
			return PickupRejectionReason.Piece;
		}
		if (facts.IsInTar)
		{
			return PickupRejectionReason.InTar;
		}
		if (facts.IsUniqueOrQuestItem)
		{
			return PickupRejectionReason.UniqueOrQuestItem;
		}
		if (!facts.InventoryCanAdd)
		{
			return PickupRejectionReason.InventoryFull;
		}
		if (facts.WouldExceedCarryWeight)
		{
			return PickupRejectionReason.TooHeavy;
		}
		if (facts.IsCoolingDown)
		{
			return PickupRejectionReason.CoolingDown;
		}
		return PickupRejectionReason.None;
	}

	internal static float OwnershipRetryAt(float now, float configuredIntervalSeconds)
	{
		return SaturatingAdd(now, Math.Max(0.2f, IsFinite(configuredIntervalSeconds) ? configuredIntervalSeconds : 0f));
	}

	internal static float FailedPickupRetryAt(float now)
	{
		return SaturatingAdd(now, 0.5f);
	}

	internal static float CompletedPickupRetryAt(float now)
	{
		return SaturatingAdd(now, 5f);
	}

	private static float SaturatingAdd(float left, float right)
	{
		if (!IsFinite(left) || !IsFinite(right))
		{
			return float.MaxValue;
		}
		double num = (double)left + (double)right;
		if (!(num >= 3.4028234663852886E+38))
		{
			return (float)num;
		}
		return float.MaxValue;
	}

	private static bool IsFinite(float value)
	{
		if (!float.IsNaN(value))
		{
			return !float.IsInfinity(value);
		}
		return false;
	}
}
