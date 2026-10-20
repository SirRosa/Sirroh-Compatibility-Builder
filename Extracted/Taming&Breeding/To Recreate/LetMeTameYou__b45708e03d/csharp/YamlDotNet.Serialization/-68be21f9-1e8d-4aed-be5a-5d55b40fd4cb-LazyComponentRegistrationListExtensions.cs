using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Serialization;

[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
internal static class _003C68be21f9_002D1e8d_002D4aed_002Dbe5a_002D5d55b40fd4cb_003ELazyComponentRegistrationListExtensions
{
	public static TComponent BuildComponentChain<[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] TComponent>(this _003C2cd31a20_002D83ff_002D4e8e_002D9b5c_002D5f71fde1499d_003ELazyComponentRegistrationList<TComponent, TComponent> registrations, TComponent innerComponent)
	{
		return registrations.InReverseOrder.Aggregate(innerComponent, [_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(0)] (TComponent inner, Func<TComponent, TComponent> factory) => factory(inner));
	}

	public static TComponent BuildComponentChain<[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] TArgument, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] TComponent>(this _003C2cd31a20_002D83ff_002D4e8e_002D9b5c_002D5f71fde1499d_003ELazyComponentRegistrationList<TArgument, TComponent> registrations, TComponent innerComponent, Func<TComponent, TArgument> argumentBuilder)
	{
		return registrations.InReverseOrder.Aggregate(innerComponent, [_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(0)] (TComponent inner, Func<TArgument, TComponent> factory) => factory(argumentBuilder(inner)));
	}

	public static List<TComponent> BuildComponentList<[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] TComponent>(this _003C2cd31a20_002D83ff_002D4e8e_002D9b5c_002D5f71fde1499d_003ELazyComponentRegistrationList<_003C86c82a35_002D8d4c_002D48eb_002D9248_002D54b686e6174f_003ENothing, TComponent> registrations)
	{
		return registrations.Select([_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(0)] (Func<_003C86c82a35_002D8d4c_002D48eb_002D9248_002D54b686e6174f_003ENothing, TComponent> factory) => factory(default)).ToList();
	}

	public static List<TComponent> BuildComponentList<[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] TArgument, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] TComponent>(this _003C2cd31a20_002D83ff_002D4e8e_002D9b5c_002D5f71fde1499d_003ELazyComponentRegistrationList<TArgument, TComponent> registrations, TArgument argument)
	{
		return registrations.Select([_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(0)] (Func<TArgument, TComponent> factory) => factory(argument)).ToList();
	}
}
