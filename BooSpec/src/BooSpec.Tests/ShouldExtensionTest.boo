namespace Boospec.Tests

import Boospec
import Boospec.ShouldMatcher

class Dummy:
	pass

fixture "ShouldExtension":
	testing "Should return the right should matcher for the type":
		d as double = 0
		
		Assert.IsInstanceOfType(IntShould, 			0.Should)
		Assert.IsInstanceOfType(LongShould, 		0L.Should)
		Assert.IsInstanceOfType(SingleShould, 		0f.Should)
		Assert.IsInstanceOfType(DoubleShould, 		d.Should)
		Assert.IsInstanceOfType(BooleanShould, 		true.Should)
		Assert.IsInstanceOfType(StringShould, 		"string".Should)
		Assert.IsInstanceOfType(ReferenceShould, 	Dummy().Should_)
		
