using System;
using JetBrains.Annotations;

namespace EpicLootAPI;

[Serializable]
[PublicAPI]
internal class TextureReplacement
{
	public string ItemID = "";

	public string MainTexture = "";

	public string ChestTex = "";

	public string LegsTex = "";

	public TextureReplacement(string itemID, string mainTex = "", string chestTex = "", string legsTex = "")
	{
		ItemID = itemID;
		MainTexture = mainTex;
		ChestTex = chestTex;
		LegsTex = legsTex;
	}

	public TextureReplacement()
	{
	}
}
