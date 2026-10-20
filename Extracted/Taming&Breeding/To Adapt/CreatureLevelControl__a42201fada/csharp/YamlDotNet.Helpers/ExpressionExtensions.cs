using System;
using System.Linq.Expressions;
using System.Reflection;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Helpers;

[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
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

	[return: _003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)]
	private static TMemberInfo TryGetMemberExpression<[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)] TMemberInfo>(LambdaExpression lambdaExpression) where TMemberInfo : MemberInfo
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
