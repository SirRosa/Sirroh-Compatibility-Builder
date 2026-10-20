using System;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Serialization;

[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
internal abstract class EventInfo
{
	public IObjectDescriptor Source { get; }

	protected EventInfo(IObjectDescriptor source)
	{
		Source = source ?? throw new ArgumentNullException("source");
	}
}
