namespace Boospec

import NUnit.Framework

class ReferenceBeWrapper:
	_target as object
	
	def constructor(target as object):
		_target = target
		
	def Null():
		returning test = (_target is null):
			Assert.IsTrue(test, "${_target} should be null")

	def SameAs(expected as object):
		returning test = (_target is expected):
			Assert.IsTrue(test, "${_target} should be same reference as ${expected}")
			
	def InstanceOf(expectedType as System.Type):
		returning test = (_target.GetType() == expectedType):
			Assert.IsTrue(test, "${_target} should be of exact type ${expectedType}")
		
	def KindOf(expectedType as System.Type):
		returning test = (expectedType.IsAssignableFrom(_target.GetType())):
			Assert.IsTrue(test, "${_target} should be of exact type ${expectedType}")
	
	static def op_Equality(lhs as ReferenceBeWrapper, rhs as object):
		returning test = (lhs._target == rhs):
			Assert.IsTrue(test, "${lhs._target} should be equal to ${rhs}")		

	static def op_Inequality(lhs as ReferenceBeWrapper, rhs as object):
		returning test = (lhs._target != rhs):
			Assert.IsTrue(test, "${lhs._target} should be diferent of ${rhs}")
