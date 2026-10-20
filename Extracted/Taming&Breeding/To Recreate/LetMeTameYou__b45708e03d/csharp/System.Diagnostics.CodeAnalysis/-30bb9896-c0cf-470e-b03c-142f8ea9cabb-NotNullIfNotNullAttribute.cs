using System.Runtime.CompilerServices;

namespace System.Diagnostics.CodeAnalysis;

[AttributeUsage(AttributeTargets.Property | AttributeTargets.Parameter | AttributeTargets.ReturnValue, AllowMultiple = true, Inherited = false)]
[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[ExcludeFromCodeCoverage]
[DebuggerNonUserCode]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal sealed class _003C30bb9896_002Dc0cf_002D470e_002Db03c_002D142f8ea9cabb_003ENotNullIfNotNullAttribute : Attribute
{
	public string ParameterName { get; }

	public _003C30bb9896_002Dc0cf_002D470e_002Db03c_002D142f8ea9cabb_003ENotNullIfNotNullAttribute(string parameterName)
	{
		ParameterName = parameterName;
	}
}
