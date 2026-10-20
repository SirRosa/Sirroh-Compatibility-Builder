using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Serialization;

[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
internal static class LazyComponentRegistrationListExtensions
{
	public static TComponent BuildComponentChain<[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] TComponent>(this LazyComponentRegistrationList<TComponent, TComponent> registrations, TComponent innerComponent)
	{
		return registrations.InReverseOrder.Aggregate(innerComponent, [_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(0)] (TComponent inner, Func<TComponent, TComponent> factory) => factory(inner));
	}

	public static TComponent BuildComponentChain<[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] TArgument, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] TComponent>(this LazyComponentRegistrationList<TArgument, TComponent> registrations, TComponent innerComponent, Func<TComponent, TArgument> argumentBuilder)
	{
		return registrations.InReverseOrder.Aggregate(innerComponent, [_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(0)] (TComponent inner, Func<TArgument, TComponent> factory) => factory(argumentBuilder(inner)));
	}

	public static List<TComponent> BuildComponentList<[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] TComponent>(this LazyComponentRegistrationList<Nothing, TComponent> registrations)
	{
		return registrations.Select([_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(0)] (Func<Nothing, TComponent> factory) => factory(default)).ToList();
	}

	public static List<TComponent> BuildComponentList<[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] TArgument, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] TComponent>(this LazyComponentRegistrationList<TArgument, TComponent> registrations, TArgument argument)
	{
		return registrations.Select([_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(0)] (Func<TArgument, TComponent> factory) => factory(argument)).ToList();
	}
}
