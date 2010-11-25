namespace Boospec

class NotBeWrapper:
	Be:
		get:
			return ReferenceNotBeWrapper(_target)

	_target as object
	
	def constructor(target as object):
		_target = target
	