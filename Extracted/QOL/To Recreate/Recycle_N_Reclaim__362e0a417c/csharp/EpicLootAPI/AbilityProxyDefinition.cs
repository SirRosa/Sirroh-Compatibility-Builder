using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using JetBrains.Annotations;
using Newtonsoft.Json;

namespace EpicLootAPI;

[PublicAPI]
internal class AbilityProxyDefinition
{
	public readonly AbilityDefinition Ability;

	public readonly Dictionary<string, Delegate> Callbacks = new Dictionary<string, Delegate>();

	internal static readonly List<AbilityProxyDefinition> ProxyAbilities = new List<AbilityProxyDefinition>();

	internal static readonly Method API_RegisterProxyAbility = new Method("RegisterProxyAbility");

	internal static readonly Method API_UpdateProxyAbility = new Method("UpdateProxyAbility");

	[Description("Register a complex ability behavior using Proxy class")]
	public AbilityProxyDefinition(string ID, AbilityActivationMode mode, Proxy definition)
	{
		Ability = new AbilityDefinition(ID, mode);
		RegisterCallbacks(definition);
		ProxyAbilities.Add(this);
	}

	[Description("Register a complex ability behavior using Proxy class")]
	public AbilityProxyDefinition(string ID, AbilityActivationMode mode, Type type)
	{
		Ability = new AbilityDefinition(ID, mode);
		if (!typeof(Proxy).IsAssignableFrom(type))
		{
			EpicLoot.logger.LogError("Ability Proxy " + ID + " Type " + type.Name + " does not implement Proxy class");
			return;
		}
		try
		{
			object obj = Activator.CreateInstance(type);
			RegisterCallbacks((Proxy)obj);
			ProxyAbilities.Add(this);
		}
		catch (Exception ex)
		{
			EpicLoot.logger.LogError("Failed to create instance of " + type.Name + ": " + ex.Message);
		}
	}

	private void RegisterCallbacks(Proxy implementation)
	{
		Type type = implementation.GetType();
		MethodInfo[] methods = typeof(Proxy).GetMethods();
		foreach (MethodInfo methodInfo in methods)
		{
			try
			{
				Type[] array = (from p in methodInfo.GetParameters()
					select p.ParameterType).ToArray();
				MethodInfo method = type.GetMethod(methodInfo.Name, array);
				if (method == null)
				{
					EpicLoot.logger.LogWarning("Method " + methodInfo.Name + " not found in implementation");
					continue;
				}
				Type type2;
				if (methodInfo.ReturnType == typeof(void))
				{
					type2 = ((array.Length != 0) ? Expression.GetActionType(array) : typeof(Action));
				}
				else
				{
					type2 = Expression.GetFuncType(array.Concat(new Type[1] { methodInfo.ReturnType }).ToArray());
				}
				Delegate value = Delegate.CreateDelegate(type2, implementation, method);
				Callbacks[methodInfo.Name] = value;
			}
			catch (Exception ex)
			{
				EpicLoot.logger.LogError("Failed to register callback for method " + methodInfo.Name + ": " + ex.Message);
			}
		}
	}

	public static void RegisterAll()
	{
		foreach (AbilityProxyDefinition item in new List<AbilityProxyDefinition>(ProxyAbilities))
		{
			item.Register();
		}
	}

	public bool Register()
	{
		string text = JsonConvert.SerializeObject((object)Ability);
		if (!(API_RegisterProxyAbility.Invoke(text, Callbacks)[0] is string value))
		{
			return false;
		}
		RunTimeRegistry.Register(this, value);
		ProxyAbilities.Remove(this);
		EpicLoot.logger.LogDebug("Registered proxy ability: " + Ability.ID);
		return true;
	}

	public bool Update()
	{
		if (!RunTimeRegistry.TryGetValue(this, out string value))
		{
			return false;
		}
		string text = JsonConvert.SerializeObject((object)Ability);
		bool flag = (bool)(API_UpdateProxyAbility.Invoke(value, text, Callbacks)[0] ?? ((object)false));
		EpicLoot.logger.LogDebug($"Updated proxy ability: {Ability.ID}, {flag}");
		return flag;
	}
}
