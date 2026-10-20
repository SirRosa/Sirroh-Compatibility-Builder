using System;
using JetBrains.Annotations;

namespace EpicLootAPI;

[Serializable]
[PublicAPI]
internal enum MaterialConversionType
{
	Upgrade,
	Convert,
	Junk
}
