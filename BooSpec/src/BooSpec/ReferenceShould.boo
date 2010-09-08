namespace Boospec

class ReferenceShould(GenericShould[of object]):
	Be:
		get:
			return ReferenceBeWrapper(Actual)

	def constructor(actual as object):
		super(actual)

