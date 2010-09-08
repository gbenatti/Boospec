namespace Boospec.Tests

import Boospec
import Boospec.ShouldMatcher

fixture "Long Should":
	testing "Should test equality":
		actual = 1L
		expected = actual
		actual.Should.Be == expected
		
	exception "Should throw exception in case of equality fail", "NUnit.Framework.AssertionException":
		actual = 1L
		expected = 2L
		
		actual.Should.Be == expected

	testing "Should test inequality":
		actual = 1L
		expected = 2L
		
		actual.Should.Be != expected

	exception "Should throw exception in case of inequality fail", "NUnit.Framework.AssertionException":
		actual = 1L
		expected = actual
		
		actual.Should.Be != expected

	testing "Should be capable of < comparation":
		actual = 1L
		expected = 2L
		
		actual.Should.Be < expected

	exception "Should throw exception if < fails", "NUnit.Framework.AssertionException":
		actual = 2L
		expected = 1L

		actual.Should.Be < expected

	testing "Should be capable of > comparation":
		actual = 2L
		expected = 1L
		
		actual.Should.Be > expected

	exception "Should throw exception if > fails", "NUnit.Framework.AssertionException":
		actual = 1L
		expected = 2L

		actual.Should.Be > expected
		
	testing "Should be capable of <= comparation":
		actual = 1L
		expected = actual
		
		actual.Should.Be <= expected
		actual.Should.Be <= expected + 1

	exception "Should throw exception if <= fails", "NUnit.Framework.AssertionException":
		actual = 2L
		expected = 1L
		
		actual.Should.Be <= expected

	testing "Should be capable of >= comparation":
		actual = 1L
		expected = actual
		
		actual.Should.Be >= expected
		actual.Should.Be >= expected - 1

	exception "Should throw exception if >= fails", "NUnit.Framework.AssertionException":
		actual = 1L
		expected = 2L
		
		actual.Should.Be >= expected
		