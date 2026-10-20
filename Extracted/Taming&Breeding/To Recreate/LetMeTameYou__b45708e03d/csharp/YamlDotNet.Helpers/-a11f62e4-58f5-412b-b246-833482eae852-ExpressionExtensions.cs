using System;
using System.Diagnostics.CodeAnalysis;
using System.Linq.Expressions;
using System.Reflection;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Helpers;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal static class _003Ca11f62e4_002D58f5_002D412b_002Db246_002D833482eae852_003EExpressionExtensions
{
	public static PropertyInfo AsProperty(this LambdaExpression propertyAccessor)
	{
		PropertyInfo propertyInfo = TryGetMemberExpression<PropertyInfo>(propertyAccessor);
		if (propertyInfo == null)
		{
			throw new ArgumentException("Expected a lambda expression in the form: x => x.SomeProperty", "propertyAccessor");
		}
		return propertyInfo;
	}

	[return: _003C3d1e7086_002D102b_002D445d_002Da443_002D61677c23c63a_003EMaybeNull]
	private static TMemberInfo TryGetMemberExpression<[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)] TMemberInfo>(LambdaExpression lambdaExpression) where TMemberInfo : MemberInfo
	{
		if (lambdaExpression.Parameters.Count != 1)
		{
			return null;
		}
		Expression expression = lambdaExpression.Body;
		if (expression is UnaryExpression unaryExpression)
		{
			if (unaryExpression.NodeType != ExpressionType.Convert)
			{
				return null;
			}
			expression = unaryExpression.Operand;
		}
		if (expression is MemberExpression memberExpression)
		{
			if (memberExpression.Expression != lambdaExpression.Parameters[0])
			{
				return null;
			}
			return memberExpression.Member as TMemberInfo;
		}
		return null;
	}
}
