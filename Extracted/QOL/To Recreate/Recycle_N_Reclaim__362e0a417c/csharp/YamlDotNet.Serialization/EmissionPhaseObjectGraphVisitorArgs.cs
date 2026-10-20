using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization;

[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
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

	public T GetPreProcessingPhaseObjectGraphVisitor<[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)] T>() where T : IObjectGraphVisitor<Nothing>
	{
		return preProcessingPhaseVisitors.OfType<T>().Single();
	}
}
