namespace Boospec.Tests

import Boospec
import Boospec.ShouldMatcher

fixture "Int Should":
	testing "Should test equality":
		actual = 1
		expected = actual
		actual.Should.Be == expected
		
	exception "Should throw exception in case of equality fail", "NUnit.Framework.AssertionException":
		actual = 1
		expected = 2
		
		actual.Should.Be == expected

	testing "Should test inequality":
		actual = 1
		expected = 2
		
		actual.Should.Be != expected

	exception "Should throw exception in case of inequality fail", "NUnit.Framework.AssertionException":
		actual = 1
		expected = actual
		
		actual.Should.Be != expected

	testing "Should be capable of < comparation":
		actual = 1
		expected = 2
		
		actual.Should.Be < expected

	exception "Should throw exception if < fails", "NUnit.Framework.AssertionException":
		actual = 2
		expected = 1

		actual.Should.Be < expected

	testing "Should be capable of > comparation":
		actual = 2
		expected = 1
		
		actual.Should.Be > expected

	exception "Should throw exception if > fails", "NUnit.Framework.AssertionException":
		actual = 1
		expected = 2

		actual.Should.Be > expected
		
	testing "Should be capable of <= comparation":
		actual = 1
		expected = actual
		
		actual.Should.Be <= expected
		actual.Should.Be <= expected + 1

	exception "Should throw exception if <= fails", "NUnit.Framework.AssertionException":
		actual = 2
		expected = 1
		
		actual.Should.Be <= expected

	testing "Should be capable of >= comparation":
		actual = 1
		expected = actual
		
		actual.Should.Be >= expected
		actual.Should.Be >= expected - 1

	exception "Should throw exception if >= fails", "NUnit.Framework.AssertionException":
		actual = 1
		expected = 2
		
		actual.Should.Be >= expected
		