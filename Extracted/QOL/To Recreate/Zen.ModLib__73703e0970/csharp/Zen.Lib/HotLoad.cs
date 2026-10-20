using System;
using System.Collections.Generic;
using UnityEngine;

namespace Zen.Lib;

public class HotLoad
{
	private readonly HashSet<Object> _hotloadObjects = new HashSet<Object>();

	internal bool IsPrefabInitInvoked { get; private set; }

	public event Func<IEnumerable<Object>>? PrefabInit;

	internal HotLoad()
	{
	}

	public void Track(Object obj)
	{
		Logging<ModLib>.InterpolatedString msg = new Logging<ModLib>.InterpolatedString(11, 2, out var shouldAppend);
		if (shouldAppend)
		{
			msg.AppendLiteral("Track: ");
			msg.AppendFormatted(obj.name);
			msg.AppendLiteral(" << ");
			msg.AppendFormatted(((object)obj).GetType());
		}
		Logging<ModLib>.Info(msg);
		_hotloadObjects.Add(obj);
	}

	public void Untrack(Object obj)
	{
		if (_hotloadObjects.Contains(obj))
		{
			Logging<ModLib>.InterpolatedString msg = new Logging<ModLib>.InterpolatedString(12, 2, out var shouldAppend);
			if (shouldAppend)
			{
				msg.AppendLiteral("Untrack: ");
				msg.AppendFormatted(obj.name);
				msg.AppendLiteral(" @ ");
				msg.AppendFormatted(((object)obj).GetType());
			}
			Logging<ModLib>.Debug(msg);
			_hotloadObjects.Remove(obj);
		}
	}

	internal void RestoreAll()
	{
		Logging<ModLib>.Info("Restoring all hot-tracked modded objects to their original state");
		foreach (Object hotloadObject in _hotloadObjects)
		{
			Logging<ModLib>.InterpolatedString msg = new Logging<ModLib>.InterpolatedString(12, 2, out var shouldAppend);
			if (shouldAppend)
			{
				msg.AppendLiteral("Remove: ");
				msg.AppendFormatted(hotloadObject.name);
				msg.AppendLiteral(" >> ");
				msg.AppendFormatted(((object)hotloadObject).GetType());
			}
			Logging<ModLib>.Info(msg);
			Object.Destroy(hotloadObject);
		}
	}

	internal void PrefabInitInvoke()
	{
		if (IsPrefabInitInvoked)
		{
			throw new Exception("PrefabInitInvoke already invoked");
		}
		Logging<ModLib>.Info("Prefab Init");
		foreach (Object item in PrefabInit?.Invoke() ?? Array.Empty<Object>())
		{
			Track(item);
		}
		IsPrefabInitInvoked = true;
	}
}
