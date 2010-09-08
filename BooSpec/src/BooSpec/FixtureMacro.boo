namespace Boospec

import Boo.Lang.Compiler
import Boo.Lang.Compiler.Ast
import Boo.Lang.PatternMatching

macro fixture(description as string):
	yield [| import NUnit.Framework |]

	fixtureName = GenerateFixtureName(description)
	
	yield [|
		[TestFixture, Description($description)]
		class $fixtureName(AssertionHelper):
			def constructor():
				$(fixture.Body)
	|]
    
macro fixture.testing(description as string):
	testName = GenerateTestName(description)
	yield [|
		[Test, Description($description)]
		def $testName():
			$(testing.Body)
	|]
	
macro fixture.testing.expect(exceptionTypeName as string):
	yield [|
		try:
			$(expect.Body)
		except x:
			raise x unless x.GetType().ToString() == $exceptionTypeName
	|]

macro fixture.declare:
	for stmt as DeclarationStatement in declare.Body.Statements:
		yield Field(Name: stmt.Declaration.Name, Type: stmt.Declaration.Type)

macro fixture.setup:
	yield [|
		[SetUp]
		def Init():
			$(setup.Body)
	|]
	
macro fixture.teardown:
	yield [|
		[TearDown]
		def End():
			$(teardown.Body)
	|]

macro fixture.exception(description as string, exceptionType as string):
	testName = GenerateTestName(description)
	yield [|
		[Test, ExpectedException($exceptionType), Description($description)]
		def $testName():
			$(exception.Body)
	|]

def GenerateFixtureName(description as string):
	return DescriptionToName(description, "Fixture")
	
def GenerateTestName(description as string):
	return DescriptionToName(description, "Test")

def DescriptionToName(description as string, suffix as string):
	raise "Description should be an string greater then 0" if (description is null or description.Length == 0)
	raise "Suffix should be an string greater then 0" if (suffix is null or suffix.Length == 0)

	return join(Capitalize(s) for s in description.Split(char(' ')), "") + suffix	

def Capitalize([required] text as string):
	return text[:1].ToUpper() + text[1:].ToLower()
