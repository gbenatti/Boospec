namespace Boospec.Tests

import Boospec

fixture "Single should be within":
	testing "Should be within tolerance":
		actual = 1.0f
		tolerance = 0.1f
		expected = actual + tolerance
		
		SingleShouldBeWithin(actual, tolerance).Of(expected)
		
	exception "Should throw exception if outside tolerance boundary", "NUnit.Framework.AssertionException":
		actual = 1.0f
		tolerance = 0.1f
		expected = actual + tolerance * 2
		
		SingleShouldBeWithin(actual, tolerance).Of(expected)
	
fixture "Double should be witin":
	testing "Should be within tolerance":
		actual = 1.0
		tolerance = 0.1
		expected = actual + tolerance
		
		DoubleShouldBeWithin(actual, tolerance).Of(expected)
		
	exception "Should throw exception if outside tolerance boundary", "NUnit.Framework.AssertionException":
		actual = 1.0
		tolerance = 0.1
		expected = actual + tolerance * 2
		
		DoubleShouldBeWithin(actual, tolerance).Of(expected)
