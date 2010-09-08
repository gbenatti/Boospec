namespace Boospec.Tests

import Boospec

class Foo:
	[getter(Value)]
	_value as object
	
	def constructor(value as object):
		_value = value

fixture "Generic Should":
	testing "Should apply equality for value type":
		gs = GenericShould[of int](10)
		gs == 10
		
	testing "Should apply equality for reference type":
		reference = Foo(10)
		gs = GenericShould[of Foo](reference)
		gs == reference
		
	exception "Should fail equality if values are different, for value type", "NUnit.Framework.AssertionException":
		gs = GenericShould[of int](10)
		gs == 20
		
	exception "Should fail equality if values are different, for reference type", "NUnit.Framework.AssertionException":
		gs = GenericShould[of Foo](Foo(10))
		gs == Foo(10)

	testing "Should realize predicate for value types":
		gs = GenericShould[of long](10L)
		gs.Realize({item | item == 10L})
		
	testing "Should realize predicate for reference types":
		gs = GenericShould[of Foo](Foo(10L))
		gs.Realize({item | item.Value == 10L})
		
	exception "Should fail if realize not holds true, for value type", "NUnit.Framework.AssertionException":
		gs = GenericShould[of int](10)
		gs.Realize({item | item != 10})

	exception "Should fail if realize not holds true, for reference type", "NUnit.Framework.AssertionException":
		gs = GenericShould[of Foo](Foo(10L))
		gs.Realize({item | item.Value != 10L})
	
