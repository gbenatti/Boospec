namespace Boospec

import NUnit.Framework

class GenericShould[of T]:
	
	[getter(Actual)]
	_actual as T
		
	def constructor(actual as T):
		_actual = actual
		
	def Realize(predicate as System.Predicate of T):
		returning test = predicate(Actual):
			Assert.IsTrue(test, "${Actual} should realize predicate")		
		
	static def op_Equality(lhs as GenericShould[of T], rhs as T):
		returning test = (lhs.Actual == rhs):
			Assert.IsTrue(test, "${lhs.Actual} should be equal to ${rhs}")		

	static def op_Inequality(lhs as GenericShould[of T], rhs as T):
		returning test = (lhs.Actual != rhs):
			Assert.IsTrue(test, "${lhs.Actual} should be diferent of ${rhs}")
			
