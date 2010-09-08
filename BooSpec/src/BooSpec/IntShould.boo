namespace Boospec

import NUnit.Framework

class IntShould(GenericShould[of int]):
	Be:
		get:
			return self

	def constructor(actual as int):
		super(actual)

	static def op_LessThan(lhs as IntShould, rhs as int):
		returning test = (lhs.Actual < rhs):
			Assert.IsTrue(test, "${lhs.Actual} should be less than ${rhs}")		
	
	static def op_LessThanOrEqual(lhs as IntShould, rhs as int):
		returning test = (lhs.Actual <= rhs):
			Assert.IsTrue(test, "${lhs.Actual} should be less than or equal to ${rhs}")		
		
	static def op_GreaterThan(lhs as IntShould, rhs as int):
		returning test = (lhs.Actual > rhs):
			Assert.IsTrue(test, "${lhs.Actual} should be greater than ${rhs}")		
	
	static def op_GreaterThanOrEqual(lhs as IntShould, rhs as int):
		returning test = (lhs.Actual >= rhs):
			Assert.IsTrue(test, "${lhs.Actual} should be greater than or equal to ${rhs}")		
