namespace Boospec

import NUnit.Framework

class SingleShould(GenericShould[of single]):
	Be:
		get:
			return self

	def constructor(actual as single):
		super(actual)

	def Within(tolerance as single):
		return SingleShouldBeWithin(Actual, tolerance)
	
	static def op_LessThan(lhs as SingleShould, rhs as single):
		returning test = (lhs.Actual < rhs):
			Assert.IsTrue(test, "${lhs.Actual} should be less than ${rhs}")		
	
	static def op_LessThanOrEqual(lhs as SingleShould, rhs as single):
		returning test = (lhs.Actual <= rhs):
			Assert.IsTrue(test, "${lhs.Actual} should be less than or equal to ${rhs}")		
		
	static def op_GreaterThan(lhs as SingleShould, rhs as single):
		returning test = (lhs.Actual > rhs):
			Assert.IsTrue(test, "${lhs.Actual} should be greater than ${rhs}")		
	
	static def op_GreaterThanOrEqual(lhs as SingleShould, rhs as single):
		returning test = (lhs.Actual >= rhs):
			Assert.IsTrue(test, "${lhs.Actual} should be greater than or equal to ${rhs}")		
	