namespace Boospec.Tests

import Boospec
import Boospec.ShouldMatcher

fixture "String Should":
	testing "Should test equality":
		"string".Should.Be == "string"

	testing "Should test inequality":
		"other string".Should.Be != "string"

	exception "Should throw exception in case of equality fail", "NUnit.Framework.AssertionException":
		"string".Should.Be == "other string"

	exception "Should throw exception in case of inequality fail", "NUnit.Framework.AssertionException":
		"string".Should.Be != "string"
		
	testing "Should be empty":
		"".Should.Be.Empty()

	exception "Should throw if string is not empty", "NUnit.Framework.AssertionException":
		"Full".Should.Be.Empty()

	testing "Should be null":
		nullString as string = null
		nullString.Should.Be.Null()

	exception "Should throw if string is not null", "NUnit.Framework.AssertionException":
		"NotNull".Should.Be.Null()

	testing "Should see if string start with an value":
		"Extension".Should.StartWith("Ext")
		
	exception "Should throw exception if start with fails", "NUnit.Framework.AssertionException":
		"Extension".Should.StartWith("anything")

	testing "Should see if string end with an value":
		"Extension".Should.EndWith("ion")
		
	exception "Should throw exception if end with fails", "NUnit.Framework.AssertionException":
		"Extension".Should.EndWith("anything")

	testing "Should see if string contain an value":
		"Extension".Should.Contain("Ext")
		"Extension".Should.Contain("ion")
		"Extension".Should.Contain("ens")
		
	exception "Should throw exception if contain fails", "NUnit.Framework.AssertionException":
		"Extension".Should.Contain("any")

	testing "Should see if string match regex value":
		"Extension".Should.Match(/^Ext/)
		
	exception "Should throw exception if match fails", "NUnit.Framework.AssertionException":
		"Extension".Should.Match(/Ext$/)


