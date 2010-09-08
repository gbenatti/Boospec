namespace Boospec

import NUnit.Framework

class CollectionShould(GenericShould[of System.Collections.ICollection]):
	class CollectionHaveWrapper:
		_target as System.Collections.ICollection

		Size:
			get:
				return IntShould(len(_target))
				
		Length:
			get:
				return IntShould(len(_target))
				
		Count:
			get:
				return IntShould(len(_target))
						
		def constructor(target as System.Collections.ICollection):
			_target = target
			
	Have:
		get:
			return CollectionHaveWrapper(Actual)

	Be:
		get:
			return ReferenceBeWrapper(Actual)

	def constructor(actual as System.Collections.ICollection):
		super(actual)
		
	static def op_Equality(lhs as CollectionShould, rhs as System.Collections.ICollection):
		returning test = (lhs.Actual == rhs):
			Assert.IsTrue(test, "${lhs.Actual} should be equal to ${rhs}")		

	static def op_Inequality(lhs as CollectionShould, rhs as System.Collections.ICollection):
		returning test = (lhs.Actual != rhs):
			Assert.IsTrue(test, "${lhs.Actual} should be diferent of ${rhs}")
