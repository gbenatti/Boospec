namespace Boospec.Tests

import Boospec
import Boospec.ShouldMatcher

fixture "Single Should":
	testing "Should test equality":
		actual = 1f
		expected = actual
		actual.Should.Be.Within(single.Epsilon).Of(expected)
		
	exception "Should throw exception if outside tolerance boundary", "NUnit.Framework.AssertionException":
		actual = 1f
		tolerance = 0.1f
		expected = actual + tolerance * 2
		actual.Should.Be.Within(tolerance).Of(expected)

	exception "Should throw exception in case of equality fail", "NUnit.Framework.AssertionException":
		actual = 1f
		expected = 2f
		
		actual.Should.Be == expected

	testing "Should test inequality":
		actual = 1f
		expected = 2f
		
		actual.Should.Be != expected

	exception "Should throw exception in case of inequality fail", "NUnit.Framework.AssertionException":
		actual = 1f
		expected = actual
		
		actual.Should.Be != expected

	testing "Should be capable of < comparation":
		actual = 1f
		expected = 2f
		
		actual.Should.Be < expected

	exception "Should throw exception if < fails", "NUnit.Framework.AssertionException":
		actual = 2f
		expected = 1f

		actual.Should.Be < expected

	testing "Should be capable of > comparation":
		actual = 2f
		expected = 1f
		
		actual.Should.Be > expected

	exception "Should throw exception if > fails", "NUnit.Framework.AssertionException":
		actual = 1f
		expected = 2f

		actual.Should.Be > expected
		
	testing "Should be capable of <= comparation":
		actual = 1f
		expected = actual
		
		actual.Should.Be <= expected
		actual.Should.Be <= expected + 1

	exception "Should throw exception if <= fails", "NUnit.Framework.AssertionException":
		actual = 2f
		expected = 1f
		
		actual.Should.Be <= expected

	testing "Should be capable of >= comparation":
		actual = 1f
		expected = actual
		
		actual.Should.Be >= expected
		actual.Should.Be >= expected - 1

	exception "Should throw exception if >= fails", "NUnit.Framework.AssertionException":
		actual = 1f
		expected = 2f
		
		actual.Should.Be >= expected
		