using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Serialization;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal sealed class _003C2cd31a20_002D83ff_002D4e8e_002D9b5c_002D5f71fde1499d_003ELazyComponentRegistrationList<[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] TArgument, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] TComponent> : IEnumerable<Func<TArgument, TComponent>>, IEnumerable
{
	[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
	public sealed class LazyComponentRegistration
	{
		public readonly Type ComponentType;

		public readonly Func<TArgument, TComponent> Factory;

		public LazyComponentRegistration(Type componentType, Func<TArgument, TComponent> factory)
		{
			ComponentType = componentType;
			Factory = factory;
		}
	}

	[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
	public sealed class TrackingLazyComponentRegistration
	{
		public readonly Type ComponentType;

		public readonly Func<TComponent, TArgument, TComponent> Factory;

		public TrackingLazyComponentRegistration(Type componentType, Func<TComponent, TArgument, TComponent> factory)
		{
			ComponentType = componentType;
			Factory = factory;
		}
	}

	[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(0)]
	private class RegistrationLocationSelector : _003Ce90b0d63_002D97fe_002D48e5_002D8aba_002D6bd8b2703b95_003EIRegistrationLocationSelectionSyntax<TComponent>
	{
		[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(1)]
		private readonly _003C2cd31a20_002D83ff_002D4e8e_002D9b5c_002D5f71fde1499d_003ELazyComponentRegistrationList<TArgument, TComponent> registrations;

		[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(new byte[] { 1, 0, 0 })]
		private readonly LazyComponentRegistration newRegistration;

		[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
		public RegistrationLocationSelector(_003C2cd31a20_002D83ff_002D4e8e_002D9b5c_002D5f71fde1499d_003ELazyComponentRegistrationList<TArgument, TComponent> registrations, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(new byte[] { 1, 0, 0 })] LazyComponentRegistration newRegistration)
		{
			this.registrations = registrations;
			this.newRegistration = newRegistration;
		}

		void _003Ce90b0d63_002D97fe_002D48e5_002D8aba_002D6bd8b2703b95_003EIRegistrationLocationSelectionSyntax<TComponent>.InsteadOf<TRegistrationType>()
		{
			if (newRegistration.ComponentType != typeof(TRegistrationType))
			{
				registrations.EnsureNoDuplicateRegistrationType(newRegistration.ComponentType);
			}
			int index = registrations.EnsureRegistrationExists<TRegistrationType>();
			registrations.entries[index] = newRegistration;
		}

		void _003Ce90b0d63_002D97fe_002D48e5_002D8aba_002D6bd8b2703b95_003EIRegistrationLocationSelectionSyntax<TComponent>.After<TRegistrationType>()
		{
			registrations.EnsureNoDuplicateRegistrationType(newRegistration.ComponentType);
			int num = registrations.EnsureRegistrationExists<TRegistrationType>();
			registrations.entries.Insert(num + 1, newRegistration);
		}

		void _003Ce90b0d63_002D97fe_002D48e5_002D8aba_002D6bd8b2703b95_003EIRegistrationLocationSelectionSyntax<TComponent>.Before<TRegistrationType>()
		{
			registrations.EnsureNoDuplicateRegistrationType(newRegistration.ComponentType);
			int index = registrations.EnsureRegistrationExists<TRegistrationType>();
			registrations.entries.Insert(index, newRegistration);
		}

		void _003Ce90b0d63_002D97fe_002D48e5_002D8aba_002D6bd8b2703b95_003EIRegistrationLocationSelectionSyntax<TComponent>.OnBottom()
		{
			registrations.EnsureNoDuplicateRegistrationType(newRegistration.ComponentType);
			registrations.entries.Add(newRegistration);
		}

		void _003Ce90b0d63_002D97fe_002D48e5_002D8aba_002D6bd8b2703b95_003EIRegistrationLocationSelectionSyntax<TComponent>.OnTop()
		{
			registrations.EnsureNoDuplicateRegistrationType(newRegistration.ComponentType);
			registrations.entries.Insert(0, newRegistration);
		}
	}

	[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(0)]
	private class TrackingRegistrationLocationSelector : _003C7b4f1b17_002D7cba_002D4703_002D871c_002Da756aba66c35_003EITrackingRegistrationLocationSelectionSyntax<TComponent>
	{
		[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(1)]
		private readonly _003C2cd31a20_002D83ff_002D4e8e_002D9b5c_002D5f71fde1499d_003ELazyComponentRegistrationList<TArgument, TComponent> registrations;

		[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(new byte[] { 1, 0, 0 })]
		private readonly TrackingLazyComponentRegistration newRegistration;

		[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
		public TrackingRegistrationLocationSelector(_003C2cd31a20_002D83ff_002D4e8e_002D9b5c_002D5f71fde1499d_003ELazyComponentRegistrationList<TArgument, TComponent> registrations, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(new byte[] { 1, 0, 0 })] TrackingLazyComponentRegistration newRegistration)
		{
			this.registrations = registrations;
			this.newRegistration = newRegistration;
		}

		void _003C7b4f1b17_002D7cba_002D4703_002D871c_002Da756aba66c35_003EITrackingRegistrationLocationSelectionSyntax<TComponent>.InsteadOf<TRegistrationType>()
		{
			if (newRegistration.ComponentType != typeof(TRegistrationType))
			{
				registrations.EnsureNoDuplicateRegistrationType(newRegistration.ComponentType);
			}
			int index = registrations.EnsureRegistrationExists<TRegistrationType>();
			Func<TArgument, TComponent> innerComponentFactory = registrations.entries[index].Factory;
			registrations.entries[index] = new LazyComponentRegistration(newRegistration.ComponentType, [_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)] (TArgument arg) => newRegistration.Factory(innerComponentFactory(arg), arg));
		}
	}

	[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(new byte[] { 1, 1, 0, 0 })]
	private readonly List<LazyComponentRegistration> entries = new List<LazyComponentRegistration>();

	public int Count => entries.Count;

	public IEnumerable<Func<TArgument, TComponent>> InReverseOrder
	{
		get
		{
			int i = entries.Count - 1;
			while (i >= 0)
			{
				yield return entries[i].Factory;
				int num = i - 1;
				i = num;
			}
		}
	}

	public _003C2cd31a20_002D83ff_002D4e8e_002D9b5c_002D5f71fde1499d_003ELazyComponentRegistrationList<TArgument, TComponent> Clone()
	{
		_003C2cd31a20_002D83ff_002D4e8e_002D9b5c_002D5f71fde1499d_003ELazyComponentRegistrationList<TArgument, TComponent> obj = new _003C2cd31a20_002D83ff_002D4e8e_002D9b5c_002D5f71fde1499d_003ELazyComponentRegistrationList<TArgument, TComponent>();
		foreach (LazyComponentRegistration entry in entries)
		{
			obj.entries.Add(entry);
		}
		return obj;
	}

	public void Clear()
	{
		entries.Clear();
	}

	public void Add(Type componentType, Func<TArgument, TComponent> factory)
	{
		entries.Add(new LazyComponentRegistration(componentType, factory));
	}

	public void Remove(Type componentType)
	{
		for (int i = 0; i < entries.Count; i++)
		{
			if (entries[i].ComponentType == componentType)
			{
				entries.RemoveAt(i);
				return;
			}
		}
		throw new KeyNotFoundException("A component registration of type '" + componentType.FullName + "' was not found.");
	}

	public _003Ce90b0d63_002D97fe_002D48e5_002D8aba_002D6bd8b2703b95_003EIRegistrationLocationSelectionSyntax<TComponent> CreateRegistrationLocationSelector(Type componentType, Func<TArgument, TComponent> factory)
	{
		return new RegistrationLocationSelector(this, new LazyComponentRegistration(componentType, factory));
	}

	public _003C7b4f1b17_002D7cba_002D4703_002D871c_002Da756aba66c35_003EITrackingRegistrationLocationSelectionSyntax<TComponent> CreateTrackingRegistrationLocationSelector(Type componentType, Func<TComponent, TArgument, TComponent> factory)
	{
		return new TrackingRegistrationLocationSelector(this, new TrackingLazyComponentRegistration(componentType, factory));
	}

	public IEnumerator<Func<TArgument, TComponent>> GetEnumerator()
	{
		return entries.Select([_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(0)] (LazyComponentRegistration e) => e.Factory).GetEnumerator();
	}

	IEnumerator IEnumerable.GetEnumerator()
	{
		return GetEnumerator();
	}

	private int IndexOfRegistration(Type registrationType)
	{
		for (int i = 0; i < entries.Count; i++)
		{
			if (registrationType == entries[i].ComponentType)
			{
				return i;
			}
		}
		return -1;
	}

	private void EnsureNoDuplicateRegistrationType(Type componentType)
	{
		if (IndexOfRegistration(componentType) != -1)
		{
			throw new InvalidOperationException("A component of type '" + componentType.FullName + "' has already been registered.");
		}
	}

	[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)]
	private int EnsureRegistrationExists<TRegistrationType>()
	{
		int num = IndexOfRegistration(typeof(TRegistrationType));
		if (num == -1)
		{
			throw new InvalidOperationException("A component of type '" + typeof(TRegistrationType).FullName + "' has not been registered.");
		}
		return num;
	}
}
