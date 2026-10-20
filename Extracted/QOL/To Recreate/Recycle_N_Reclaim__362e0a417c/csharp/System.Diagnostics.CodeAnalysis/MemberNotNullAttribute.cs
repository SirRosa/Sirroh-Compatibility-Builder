using System.Runtime.CompilerServices;

namespace System.Diagnostics.CodeAnalysis;

[AttributeUsage(AttributeTargets.Method | AttributeTargets.Property, Inherited = false, AllowMultiple = true)]
[DebuggerNonUserCode]
[ExcludeFromCodeCoverage]
[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
internal sealed class MemberNotNullAttribute : Attribute
{
	public string[] Members { get; }

	public MemberNotNullAttribute(string member)
	{
		Members = new string[1] { member };
	}

	public MemberNotNullAttribute(params string[] members)
	{
		Members = members;
	}
}
