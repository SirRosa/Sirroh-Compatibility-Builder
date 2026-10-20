using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization;

[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
internal sealed class EmissionPhaseObjectGraphVisitorArgs
{
	private readonly IEnumerable<IObjectGraphVisitor<Nothing>> preProcessingPhaseVisitors;

	public IObjectGraphVisitor<IEmitter> InnerVisitor { get; private set; }

	public IEventEmitter EventEmitter { get; private set; }

	public ObjectSerializer NestedObjectSerializer { get; private set; }

	public IEnumerable<IYamlTypeConverter> TypeConverters { get; private set; }

	public EmissionPhaseObjectGraphVisitorArgs(IObjectGraphVisitor<IEmitter> innerVisitor, IEventEmitter eventEmitter, IEnumerable<IObjectGraphVisitor<Nothing>> preProcessingPhaseVisitors, IEnumerable<IYamlTypeConverter> typeConverters, ObjectSerializer nestedObjectSerializer)
	{
		InnerVisitor = innerVisitor ?? throw new ArgumentNullException("innerVisitor");
		EventEmitter = eventEmitter ?? throw new ArgumentNullException("eventEmitter");
		this.preProcessingPhaseVisitors = preProcessingPhaseVisitors ?? throw new ArgumentNullException("preProcessingPhaseVisitors");
		TypeConverters = typeConverters ?? throw new ArgumentNullException("typeConverters");
		NestedObjectSerializer = nestedObjectSerializer ?? throw new ArgumentNullException("nestedObjectSerializer");
	}

	public T GetPreProcessingPhaseObjectGraphVisitor<[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)] T>() where T : IObjectGraphVisitor<Nothing>
	{
		return preProcessingPhaseVisitors.OfType<T>().Single();
	}
}
