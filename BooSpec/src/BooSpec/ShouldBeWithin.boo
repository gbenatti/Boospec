namespace Boospec

import NUnit.Framework

class ShouldBeWithin[of T]:
	_actual as T
	_tolerance as T
	
	def constructor(actual as T, tolerance as T):
		_actual = actual
		_tolerance = tolerance

class SingleShouldBeWithin(ShouldBeWithin[of single]):
	def constructor(actual as single, tolerance as single):
		super(actual, tolerance)
		
	def Of(expected as single):
		min = _actual - _tolerance
		max = _actual + _tolerance
		test = (min <= expected) and (max >= expected)
		Assert.IsTrue(test, "${_actual} should be within ${_tolerance} of ${expected}")

class DoubleShouldBeWithin(ShouldBeWithin[of double]):
	def constructor(actual as double, tolerance as double):
		super(actual, tolerance)
		
	def Of(expected as double):
		min = _actual - _tolerance
		max = _actual + _tolerance
		test = (min <= expected) and (max >= expected)
		Assert.IsTrue(test, "${_actual} should be within ${_tolerance} of ${expected}")
