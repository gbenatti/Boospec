namespace Boospec

import NUnit.Framework

class ReferenceNotBeWrapper:
	_target as object
	
	def constructor(target as object):
		_target = target
		
	def Null():
		returning test = (_target is not null):
			Assert.IsTrue(test, "${_target} should not be null")

	def SameAs(expected as object):
		returning test = (not (_target is expected)):
			Assert.IsTrue(test, "${_target} should not be same reference as ${expected}")
			
	def InstanceOf(expectedType as System.Type):
		returning test = (not (_target.GetType() == expectedType)):
			Assert.IsTrue(test, "${_target} should not be of exact type ${expectedType}")
		
	def KindOf(expectedType as System.Type):
		returning test = (not (expectedType.IsAssignableFrom(_target.GetType()))):
			Assert.IsTrue(test, "${_target} should not be of exact type ${expectedType}")
	
	static def op_Equality(lhs as ReferenceNotBeWrapper, rhs as object):
		returning test = (lhs._target != rhs):
			Assert.IsTrue(test, "${lhs._target} should not be equal to ${rhs}")		

	static def op_Inequality(lhs as ReferenceNotBeWrapper, rhs as object):
		returning test = (lhs._target == rhs):
			Assert.IsTrue(test, "${lhs._target} should not be diferent of ${rhs}")

