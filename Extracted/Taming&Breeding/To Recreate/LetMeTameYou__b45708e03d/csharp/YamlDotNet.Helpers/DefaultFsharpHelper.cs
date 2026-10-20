using System;
using System.Runtime.CompilerServices;
using YamlDotNet.Serialization;

namespace YamlDotNet.Helpers;

[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
internal class DefaultFsharpHelper : IFsharpHelper
{
	private static bool IsFsharpCore(Type t)
	{
		return t.Namespace == "Microsoft.FSharp.Core";
	}

	public bool IsOptionType(Type t)
	{
		if (IsFsharpCore(t))
		{
			return t.Name == "FSharpOption`1";
		}
		return false;
	}

	[return: _003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	public Type GetOptionUnderlyingType(Type t)
	{
		if (!t.IsGenericType || !IsOptionType(t))
		{
			return null;
		}
		return t.GenericTypeArguments[0];
	}

	[return: _003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	public object GetValue(_003C7939ce99_002D9715_002D4aac_002D881a_002Dac56bffa0212_003EIObjectDescriptor objectDescriptor)
	{
		if (!IsOptionType(objectDescriptor.Type))
		{
			throw new InvalidOperationException("Should not be called on non-Option<> type");
		}
		if (objectDescriptor.Value == null)
		{
			return null;
		}
		return objectDescriptor.Type.GetProperty("Value").GetValue(objectDescriptor.Value);
	}

	public bool IsFsharpListType(Type t)
	{
		if (t.Namespace == "Microsoft.FSharp.Collections")
		{
			return t.Name == "FSharpList`1";
		}
		return false;
	}

	[return: _003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	public object CreateFsharpListFromArray(Type t, Type itemsType, Array arr)
	{
		if (!IsFsharpListType(t))
		{
			return null;
		}
		return t.Assembly.GetType("Microsoft.FSharp.Collections.ListModule").GetMethod("OfArray").MakeGenericMethod(itemsType)
			.Invoke(null, new object[1] { arr });
	}
}
