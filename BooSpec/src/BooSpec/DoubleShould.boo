namespace Boospec

import NUnit.Framework

class DoubleShould(GenericShould[of double]):
	Be:
		get:
			return self

	def constructor(actual as double):
		super(actual)
		
	def Within(tolerance as double):
		return DoubleShouldBeWithin(Actual, tolerance)

	static def op_LessThan(lhs as DoubleShould, rhs as double):
		returning test = (lhs.Actual < rhs):
			Assert.IsTrue(test, "${lhs.Actual} should be less than ${rhs}")		
	
	static def op_LessThanOrEqual(lhs as DoubleShould, rhs as T):
		returning test = (lhs.Actual <= rhs):
			Assert.IsTrue(test, "${lhs.Actual} should be less than or equal to ${rhs}")		
		
	static def op_GreaterThan(lhs as DoubleShould, rhs as T):
		returning test = (lhs.Actual > rhs):
			Assert.IsTrue(test, "${lhs.Actual} should be greater than ${rhs}")		
	
	static def op_GreaterThanOrEqual(lhs as DoubleShould, rhs as T):
		returning test = (lhs.Actual >= rhs):
			Assert.IsTrue(test, "${lhs.Actual} should be greater than or equal to ${rhs}")		
