namespace Boospec

import NUnit.Framework

class BooleanShould(GenericShould[of bool]):
	Be:
		get:
			return self
	
	def constructor(actual as bool):
		super(actual)

	def True():
		Assert.IsTrue(Actual, "${Actual} should be true")
		return Actual
			
	def False():
		returning test = (Actual == false):
			Assert.IsTrue(test, "${Actual} should be false")
