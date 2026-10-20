using System;
using JetBrains.Annotations;

namespace EpicLootAPI;

[Serializable]
[PublicAPI]
internal enum AbilityAction
{
	Custom,
	StatusEffect
}
