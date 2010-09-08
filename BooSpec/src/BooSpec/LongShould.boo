namespace Boospec

import NUnit.Framework

class LongShould(GenericShould[of long]):
	Be:
		get:
			return self

	def constructor(actual as long):
		super(actual)

	static def op_LessThan(lhs as LongShould, rhs as long):
		returning test = (lhs.Actual < rhs):
			Assert.IsTrue(test, "${lhs.Actual} should be less than ${rhs}")		
	
	static def op_LessThanOrEqual(lhs as LongShould, rhs as long):
		returning test = (lhs.Actual <= rhs):
			Assert.IsTrue(test, "${lhs.Actual} should be less than or equal to ${rhs}")		
		
	static def op_GreaterThan(lhs as LongShould, rhs as long):
		returning test = (lhs.Actual > rhs):
			Assert.IsTrue(test, "${lhs.Actual} should be greater than ${rhs}")		
	
	static def op_GreaterThanOrEqual(lhs as LongShould, rhs as long):
		returning test = (lhs.Actual >= rhs):
			Assert.IsTrue(test, "${lhs.Actual} should be greater than or equal to ${rhs}")		
