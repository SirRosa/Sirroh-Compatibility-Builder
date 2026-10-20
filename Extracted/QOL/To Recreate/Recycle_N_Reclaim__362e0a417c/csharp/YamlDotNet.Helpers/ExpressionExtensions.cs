using System;
using System.Diagnostics.CodeAnalysis;
using System.Linq.Expressions;
using System.Reflection;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Helpers;

[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
internal static class ExpressionExtensions
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

	[return: MaybeNull]
	private static TMemberInfo TryGetMemberExpression<[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)] TMemberInfo>(LambdaExpression lambdaExpression) where TMemberInfo : MemberInfo
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
