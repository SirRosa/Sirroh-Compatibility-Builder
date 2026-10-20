using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Serialization;

[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
internal static class LazyComponentRegistrationListExtensions
{
	public static TComponent BuildComponentChain<[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)] TComponent>(this LazyComponentRegistrationList<TComponent, TComponent> registrations, TComponent innerComponent)
	{
		return registrations.InReverseOrder.Aggregate(innerComponent, [_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(0)] (TComponent inner, Func<TComponent, TComponent> factory) => factory(inner));
	}

	public static TComponent BuildComponentChain<[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)] TArgument, [_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)] TComponent>(this LazyComponentRegistrationList<TArgument, TComponent> registrations, TComponent innerComponent, Func<TComponent, TArgument> argumentBuilder)
	{
		return registrations.InReverseOrder.Aggregate(innerComponent, [_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(0)] (TComponent inner, Func<TArgument, TComponent> factory) => factory(argumentBuilder(inner)));
	}

	public static List<TComponent> BuildComponentList<[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)] TComponent>(this LazyComponentRegistrationList<Nothing, TComponent> registrations)
	{
		return registrations.Select([_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(0)] (Func<Nothing, TComponent> factory) => factory(default)).ToList();
	}

	public static List<TComponent> BuildComponentList<[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)] TArgument, [_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)] TComponent>(this LazyComponentRegistrationList<TArgument, TComponent> registrations, TArgument argument)
	{
		return registrations.Select([_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(0)] (Func<TArgument, TComponent> factory) => factory(argument)).ToList();
	}
}
