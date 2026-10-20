using System;
using System.Collections.Generic;
using System.Linq;
using BepInEx;
using HarmonyLib;
using UnityEngine;
using Zen.Lib;

namespace Zen.Components;

[DisallowMultipleComponent]
internal class QuickOutline : MonoBehaviour
{
	public enum Mode
	{
		OutlineAll,
		OutlineVisible,
		OutlineHidden,
		OutlineAndSilhouette,
		SilhouetteOnly
	}

	private static class SP
	{
		public static readonly int OutlineColor = Shader.PropertyToID("_OutlineColor");

		public static readonly int ZTest = Shader.PropertyToID("_ZTest");

		public static readonly int OutlineWidth = Shader.PropertyToID("_OutlineWidth");
	}

	[HarmonyPatch]
	private static class Patches
	{
		private static void RemoveOutline(GameObject? obj)
		{
			if (Object.op_Implicit((Object)(object)obj))
			{
				QuickOutline componentInParent = obj.GetComponentInParent<QuickOutline>();
				if (Object.op_Implicit((Object)(object)componentInParent))
				{
					componentInParent.RemoveMaterials();
					Object.Destroy((Object)(object)componentInParent);
				}
			}
		}

		[HarmonyPrefix]
		[HarmonyPatch(typeof(Destructible), "CreateFragments")]
		private static void Destructible_CreateFragments(GameObject rootObject)
		{
			RemoveOutline(rootObject);
		}

		[HarmonyPostfix]
		[HarmonyPatch(typeof(Player), "SetupPlacementGhost")]
		private static void Player_SetupPlacementGhost(Player __instance)
		{
			RemoveOutline(__instance.m_placementGhost);
		}
	}

	private static readonly HashSet<Mesh> RegisteredMeshes = new HashSet<Mesh>();

	private const string NameMask = "ZenOutlineMask";

	private const string NameFill = "ZenOutlineFill";

	private const float OutlineWidthDefault = 3f;

	private const float OutlineWidthHidden = 0f;

	private Mode _outlineMode;

	private Color _outlineColor = Color.clear;

	private float _outlineWidth;

	private Renderer[] _renderers = Array.Empty<Renderer>();

	private static Material _outlineMaskMaterialBase = null;

	private static Material _outlineFillMaterialBase = null;

	private Material _outlineMaskMaterial;

	private Material _outlineFillMaterial;

	private bool _needsUpdate;

	private bool _materialsRemoved;

	public Mode OutlineMode
	{
		get
		{
			return _outlineMode;
		}
		set
		{
			_outlineMode = value;
			_needsUpdate = true;
		}
	}

	public Color OutlineColor
	{
		get
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			return _outlineColor;
		}
		set
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_0006: Unknown result type (might be due to invalid IL or missing references)
			//IL_0010: Unknown result type (might be due to invalid IL or missing references)
			//IL_0011: Unknown result type (might be due to invalid IL or missing references)
			if (!(_outlineColor == value))
			{
				_outlineColor = value;
				_needsUpdate = true;
			}
		}
	}

	private float OutlineWidth
	{
		get
		{
			return _outlineWidth;
		}
		set
		{
			if (!Mathf.Approximately(value, _outlineWidth))
			{
				_outlineWidth = value;
				_needsUpdate = true;
			}
		}
	}

	private static void InitMaterials()
	{
		//IL_007b: Unknown result type (might be due to invalid IL or missing references)
		if (!Object.op_Implicit((Object)(object)_outlineMaskMaterialBase) || !Object.op_Implicit((Object)(object)_outlineFillMaterialBase))
		{
			Logging<ModLib>.Info("Init material assets");
			AssetBundle val = ((BaseUnityPlugin)(object)ZenMod<ModLib>.Instance).LoadAssetBundleFromPlatformResource("quickoutline");
			_outlineMaskMaterialBase = val.LoadAsset<Material>("OutlineMask");
			_outlineFillMaterialBase = val.LoadAsset<Material>("OutlineFill");
			((Object)_outlineMaskMaterialBase).name = "ZenOutlineMask (Base)";
			((Object)_outlineFillMaterialBase).name = "ZenOutlineFill (Base)";
			_outlineFillMaterialBase.SetColor(SP.OutlineColor, Color.clear);
			val.Unload(false);
		}
	}

	public static void Shutdown()
	{
		QuickOutline[] array = Object.FindObjectsByType<QuickOutline>((FindObjectsSortMode)0);
		for (int i = 0; i < array.Length; i++)
		{
			Object.Destroy((Object)(object)array[i]);
		}
		if (Object.op_Implicit((Object)(object)_outlineFillMaterialBase))
		{
			Object.Destroy((Object)(object)_outlineFillMaterialBase);
		}
		if (Object.op_Implicit((Object)(object)_outlineMaskMaterialBase))
		{
			Object.Destroy((Object)(object)_outlineMaskMaterialBase);
		}
		_outlineMaskMaterialBase = null;
		_outlineFillMaterialBase = null;
	}

	public void ComputeRenderers()
	{
		_renderers = (from r in ((Component)this).GetComponentsInChildren<Renderer>()
			where (r is MeshRenderer || r is SkinnedMeshRenderer) ? true : false
			select r).ToArray();
		LoadSmoothNormals();
		_needsUpdate = true;
	}

	private void Awake()
	{
		InitMaterials();
		_outlineMaskMaterial = Object.Instantiate<Material>(_outlineMaskMaterialBase);
		((Object)_outlineMaskMaterial).name = "ZenOutlineMask (Instance)";
		_outlineFillMaterial = Object.Instantiate<Material>(_outlineFillMaterialBase);
		((Object)_outlineFillMaterial).name = "ZenOutlineFill (Instance)";
		ComputeRenderers();
		if (_renderers.Length == 0)
		{
			((Behaviour)this).enabled = false;
			return;
		}
		Renderer[] renderers = _renderers;
		foreach (Renderer obj in renderers)
		{
			List<Material> list = obj.sharedMaterials.ToList();
			if (!list.Contains(_outlineMaskMaterial))
			{
				list.Add(_outlineMaskMaterial);
			}
			if (!list.Contains(_outlineFillMaterial))
			{
				list.Add(_outlineFillMaterial);
			}
			obj.sharedMaterials = list.ToArray();
		}
	}

	public void SetVisible(bool isVisible)
	{
		OutlineWidth = (isVisible ? 3f : 0f);
	}

	private void OnDisable()
	{
		SetVisible(isVisible: false);
		UpdateMaterialProperties();
		_needsUpdate = false;
	}

	private void Update()
	{
		if (_needsUpdate)
		{
			UpdateMaterialProperties();
			_needsUpdate = false;
		}
	}

	private void RemoveMaterials()
	{
		if (_materialsRemoved)
		{
			return;
		}
		Renderer[] renderers = _renderers;
		foreach (Renderer val in renderers)
		{
			if (Object.op_Implicit((Object)(object)val))
			{
				List<Material> list = val.sharedMaterials.ToList();
				list.RemoveAll(IsOutlineMaterial);
				val.sharedMaterials = list.ToArray();
			}
		}
		_materialsRemoved = true;
	}

	private bool IsOutlineMaterial(Material mat)
	{
		if (!Object.op_Implicit((Object)(object)mat))
		{
			return false;
		}
		if (!((Object)(object)mat == (Object)(object)_outlineFillMaterial) && !((Object)(object)mat == (Object)(object)_outlineMaskMaterial) && !((Object)mat).name.StartsWith("ZenOutlineFill"))
		{
			return ((Object)mat).name.StartsWith("ZenOutlineMask");
		}
		return true;
	}

	private void OnDestroy()
	{
		Cleanup();
	}

	private void Cleanup()
	{
		RemoveMaterials();
		if (Object.op_Implicit((Object)(object)_outlineMaskMaterial))
		{
			Object.Destroy((Object)(object)_outlineMaskMaterial);
		}
		if (Object.op_Implicit((Object)(object)_outlineFillMaterial))
		{
			Object.Destroy((Object)(object)_outlineFillMaterial);
		}
	}

	private void LoadSmoothNormals()
	{
		MeshFilter[] componentsInChildren = ((Component)this).GetComponentsInChildren<MeshFilter>();
		foreach (MeshFilter val in componentsInChildren)
		{
			Mesh sharedMesh = val.sharedMesh;
			if (Object.op_Implicit((Object)(object)sharedMesh) && sharedMesh.isReadable && RegisteredMeshes.Add(sharedMesh))
			{
				List<Vector3> list = SmoothNormals(sharedMesh);
				sharedMesh.SetUVs(3, list);
				Renderer component = ((Component)val).GetComponent<Renderer>();
				if ((Object)(object)component != (Object)null)
				{
					CombineSubmeshes(sharedMesh, component.sharedMaterials);
				}
			}
		}
		SkinnedMeshRenderer[] componentsInChildren2 = ((Component)this).GetComponentsInChildren<SkinnedMeshRenderer>();
		foreach (SkinnedMeshRenderer val2 in componentsInChildren2)
		{
			Mesh sharedMesh2 = val2.sharedMesh;
			if (Object.op_Implicit((Object)(object)sharedMesh2) && sharedMesh2.isReadable && RegisteredMeshes.Add(sharedMesh2))
			{
				sharedMesh2.uv4 = new Vector2[sharedMesh2.vertexCount];
				CombineSubmeshes(sharedMesh2, ((Renderer)val2).sharedMaterials);
			}
		}
	}

	private static List<Vector3> SmoothNormals(Mesh mesh)
	{
		//IL_0078: Unknown result type (might be due to invalid IL or missing references)
		//IL_007d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0091: Unknown result type (might be due to invalid IL or missing references)
		//IL_009a: Unknown result type (might be due to invalid IL or missing references)
		//IL_009f: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a4: Unknown result type (might be due to invalid IL or missing references)
		//IL_00de: Unknown result type (might be due to invalid IL or missing references)
		IEnumerable<IGrouping<Vector3, (Vector3 Vertex, int Index)>> enumerable = mesh.vertices.Select((Vector3 vertex, int index) =>
		{
			//IL_0000: Unknown result type (might be due to invalid IL or missing references)
			return (Vertex: vertex, Index: index);
		}).GroupBy(((Vector3 Vertex, int Index) pair) =>
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			return pair.Vertex;
		});
		List<Vector3> list = new List<Vector3>(mesh.normals);
		foreach (IGrouping<Vector3, (Vector3, int)> item in enumerable)
		{
			if (item.Count() == 1)
			{
				continue;
			}
			Vector3 val = Vector3.zero;
			foreach (var item2 in item)
			{
				val += list[item2.Item2];
			}
			val.Normalize();
			foreach (var item3 in item)
			{
				list[item3.Item2] = val;
			}
		}
		return list;
	}

	private static void CombineSubmeshes(Mesh mesh, Material[] materials)
	{
		if (mesh.subMeshCount != 1 && mesh.subMeshCount <= materials.Length)
		{
			int subMeshCount = mesh.subMeshCount;
			mesh.subMeshCount = subMeshCount + 1;
			mesh.SetTriangles(mesh.triangles, mesh.subMeshCount - 1);
		}
	}

	private void UpdateMaterialProperties()
	{
		//IL_000c: Unknown result type (might be due to invalid IL or missing references)
		_outlineFillMaterial.SetColor(SP.OutlineColor, _outlineColor);
		switch (_outlineMode)
		{
		case Mode.OutlineAll:
			_outlineMaskMaterial.SetFloat(SP.ZTest, 8f);
			_outlineFillMaterial.SetFloat(SP.ZTest, 8f);
			_outlineFillMaterial.SetFloat(SP.OutlineWidth, _outlineWidth);
			break;
		case Mode.OutlineVisible:
			_outlineMaskMaterial.SetFloat(SP.ZTest, 8f);
			_outlineFillMaterial.SetFloat(SP.ZTest, 4f);
			_outlineFillMaterial.SetFloat(SP.OutlineWidth, _outlineWidth);
			break;
		case Mode.OutlineHidden:
			_outlineMaskMaterial.SetFloat(SP.ZTest, 8f);
			_outlineFillMaterial.SetFloat(SP.ZTest, 5f);
			_outlineFillMaterial.SetFloat(SP.OutlineWidth, _outlineWidth);
			break;
		case Mode.OutlineAndSilhouette:
			_outlineMaskMaterial.SetFloat(SP.ZTest, 4f);
			_outlineFillMaterial.SetFloat(SP.ZTest, 8f);
			_outlineFillMaterial.SetFloat(SP.OutlineWidth, _outlineWidth);
			break;
		case Mode.SilhouetteOnly:
			_outlineMaskMaterial.SetFloat(SP.ZTest, 4f);
			_outlineFillMaterial.SetFloat(SP.ZTest, 5f);
			_outlineFillMaterial.SetFloat(SP.OutlineWidth, 0f);
			break;
		}
	}

	public QuickOutline()
	{
		//IL_0001: Unknown result type (might be due to invalid IL or missing references)
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
	}
}
