using System;
using UnityEngine;

namespace Zen.Lib;

public class MissingItemException(string itemName, Vector3 position) : Exception($"Item not found in ObjectDB. Did you remove a mod? {position.XZY()} {itemName}")
{
	public string ItemName => itemName;

	public Vector3 Position
	{
		get
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			return position;
		}
	}
}
