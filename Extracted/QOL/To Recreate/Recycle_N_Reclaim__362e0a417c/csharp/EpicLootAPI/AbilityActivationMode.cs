using System;
using JetBrains.Annotations;

namespace EpicLootAPI;

[Serializable]
[PublicAPI]
internal enum AbilityActivationMode
{
	Passive,
	Triggerable,
	Activated
}
