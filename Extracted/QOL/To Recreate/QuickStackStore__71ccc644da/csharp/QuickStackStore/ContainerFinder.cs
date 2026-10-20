using System.Collections.Generic;
using System.Diagnostics;
using UnityEngine;

namespace QuickStackStore;

internal class ContainerFinder
{
	public static List<Container> AllContainers = new List<Container>();

	public static List<Container> FindContainersInRange(Vector3 point, float range)
	{
		//IL_0071: Unknown result type (might be due to invalid IL or missing references)
		//IL_0078: Unknown result type (might be due to invalid IL or missing references)
		List<Container> list = new List<Container>();
		Stopwatch stopwatch = new Stopwatch();
		stopwatch.Start();
		foreach (Container allContainer in AllContainers)
		{
			if (Object.op_Implicit((Object)(object)allContainer) && Object.op_Implicit((Object)(object)((Component)allContainer).transform) && Object.op_Implicit((Object)(object)allContainer.m_nview) && allContainer.m_nview.HasOwner() && Vector3.Distance(point, ((Component)allContainer).transform.position) < range)
			{
				list.Add(allContainer);
			}
		}
		stopwatch.Stop();
		Helper.Log($"Found {list.Count} container/s out of {AllContainers.Count} in range in {stopwatch.Elapsed}", QSSConfig.DebugSeverity.AlsoSpeedTests);
		return list;
	}
}
