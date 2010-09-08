namespace Boospec

import NUnit.Framework

class StringShould(GenericShould[of string]):
	Be:
		get:
			return self

	def constructor(actual as string):
		super(actual)
	
	def Null():
		returning  test = (Actual is null):
			Assert.IsTrue(test, "${Actual} should be null")

	def Empty():
		returning test = (Actual == string.Empty):
			Assert.IsTrue(test, "${Actual} should be an empty string")		
	
	def StartWith(expectedStart as string):
		returning test = Actual.StartsWith(expectedStart):
			Assert.IsTrue(test, "${Actual} should start with ${expectedStart}")		
		
	def EndWith(expectedEnd as string):
		returning test = Actual.EndsWith(expectedEnd):
			Assert.IsTrue(test, "${Actual} should end with ${expectedEnd}")		
		
	def Contain(expected as string):
		returning test = Actual.Contains(expected):
			Assert.IsTrue(test, "${Actual} should contains ${expected}")		
		
	def Match(expectedMatch as regex):
		returning test = (Actual =~ expectedMatch):
			Assert.IsTrue(test, "${Actual} should match ${expectedMatch}")		
		
