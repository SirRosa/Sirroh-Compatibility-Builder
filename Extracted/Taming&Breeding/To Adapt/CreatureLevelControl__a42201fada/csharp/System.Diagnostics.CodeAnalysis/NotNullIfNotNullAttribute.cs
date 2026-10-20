using System.Runtime.CompilerServices;

namespace System.Diagnostics.CodeAnalysis;

[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
[AttributeUsage(AttributeTargets.Property | AttributeTargets.Parameter | AttributeTargets.ReturnValue, AllowMultiple = true, Inherited = false)]
internal sealed class NotNullIfNotNullAttribute : Attribute
{
	public string ParameterName { get; }

	public NotNullIfNotNullAttribute(string parameterName)
	{
		ParameterName = parameterName;
	}
}
