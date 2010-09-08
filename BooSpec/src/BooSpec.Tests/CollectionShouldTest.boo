namespace Boospec.Tests

import Boospec
import Boospec.ShouldMatcher

fixture "Collection Should":

	testing "Should implement reference equality":
		first = [1,2]
		second = [1,2]
		
		first.Should.Be.SameAs(first)
		
		expect "NUnit.Framework.AssertionException":
			first.Should.Be.SameAs(second)

	testing "Should implement deep equality":
		first = [1,2]
		second = [1,2]
		third = [2,1]
		
		first.Should.Be == second
		first.Should.Be != third
		
		expect "NUnit.Framework.AssertionException":
			first.Should.Be != first
		
		expect "NUnit.Framework.AssertionException":
			first.Should.Be == third

	testing "Should test length/size/count property for Boo.List":
		l = List[of string]()
		
		l.Should.Have.Length == 0
		l.Should.Have.Size == 0
		l.Should.Have.Count == 0
		
		l.Add("a string")

		l.Should.Have.Length == 1
		l.Should.Have.Size == 1
		l.Should.Have.Count == 1

	testing "Should test length/size/count property for typed that implement Generic Type ICollection":
		l = System.Collections.Generic.LinkedList[of string]()
		
		l.Should.Have.Length == 0
		l.Should.Have.Size == 0
		l.Should.Have.Count == 0
		
		l.AddLast("a string")

		l.Should.Have.Length == 1
		l.Should.Have.Size == 1
		l.Should.Have.Count == 1

	testing "Should support comparision operators":
		l = ["One"]
		
		l.Should.Have.Size == 1
		l.Should.Have.Length > 0
		l.Should.Have.Count < 2
		l.Should.Have.Length >= 1
		l.Should.Have.Size <= 1
		l.Should.Have.Size != 2

	testing "Should fail for comparasions that evaluate false":
		l = ["One", "Two"]
		
		expect "NUnit.Framework.AssertionException":
			l.Should.Have.Size > 2

		expect "NUnit.Framework.AssertionException":
			l.Should.Have.Size < 2
	
		expect "NUnit.Framework.AssertionException":
			l.Should.Have.Size >= 3

		expect "NUnit.Framework.AssertionException":
			l.Should.Have.Size <= 1
	
		expect "NUnit.Framework.AssertionException":
			l.Should.Have.Size != 2

	exception "Should throw if size/length/count is not equals", "NUnit.Framework.AssertionException":
		l = List[of string]()
		
		l.Should.Have.Length == 1
