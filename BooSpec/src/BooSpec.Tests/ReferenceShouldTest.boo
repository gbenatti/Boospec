namespace Boospec.Tests

import Boospec
import Boospec.ShouldMatcher

class Bar:
	pass
	
class Baz(Bar):
	pass

fixture "Reference Should":
	testing "Should test reference equality":
		actual = Bar()
		expected = actual
		
		actual.Should_.Be == expected
		
	exception "Should throw if test reference equality fails", "NUnit.Framework.AssertionException":
		actual = Bar()
		expected = Bar()
		
		actual.Should_.Be == expected

	testing "Should be null":
		actual = null
		
		actual.Should_.Be.Null()
		
	exception "Should throw if not null", "NUnit.Framework.AssertionException":
		actual = Bar()
		
		actual.Should_.Be.Null()

	testing "Should test reference equality using SameAs":
		actual = Bar()
		expected = actual
		
		actual.Should_.Be.SameAs(expected)
		
	exception "Should throw if test reference equality using SameAs fails", "NUnit.Framework.AssertionException":
		actual = Bar()
		expected = Bar()
		
		actual.Should_.Be.SameAs(expected)

	testing "Should test if reference is a instance of a type":
		actual = Bar()
		
		actual.Should_.Be.InstanceOf(Bar)

	exception "Should throw if reference is not a exact instance of a type", "NUnit.Framework.AssertionException":
		actual = Baz()
		
		actual.Should_.Be.InstanceOf(Bar)

	testing "Should test if reference is a kind of a type":
		actual = Baz()
		
		actual.Should_.Be.KindOf(Baz)
		actual.Should_.Be.KindOf(Bar)
		actual.Should_.Be.KindOf(object)

	exception "Should throw if reference is not a kind of a type", "NUnit.Framework.AssertionException":
		actual = Baz()
		
		actual.Should_.Be.KindOf(System.Exception)
