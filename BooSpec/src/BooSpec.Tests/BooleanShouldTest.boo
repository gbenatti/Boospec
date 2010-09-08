namespace Boospec.Tests

import Boospec
import Boospec.ShouldMatcher

fixture "Boolean Should":
	testing "Should test equality":
		true.Should.Be == true
		false.Should.Be == false

	testing "Should test inequality":
		true.Should.Be != false
		false.Should.Be != true

	exception "Should throw exception in case of equality fail", "NUnit.Framework.AssertionException":
		true.Should.Be == false

	exception "Should throw exception in case of inequality fail", "NUnit.Framework.AssertionException":
		true.Should.Be != true
		
	testing "Should assert if True method is used in a true value":
		true.Should.Be.True()
		
	testing "Should assert if False method is used in a false value":
		false.Should.Be.False()
		
	exception "Should throw exception if True method is used in a false value", "NUnit.Framework.AssertionException":
		false.Should.Be.True()
		
	exception "Should throw exception if False method is used in a true value", "NUnit.Framework.AssertionException":
		true.Should.Be.False()

		