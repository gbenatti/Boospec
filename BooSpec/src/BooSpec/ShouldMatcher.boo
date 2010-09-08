namespace Boospec

class ShouldMatcher:
	[Extension]
	static Should[target as int]:
		get:
			return IntShould(target)

	[Extension]
	static Should[target as long]:
		get:
			return LongShould(target)

	[Extension]
	static Should[target as single]:
		get:
			return SingleShould(target)

	[Extension]
	static Should[target as double]:
		get:
			return DoubleShould(target)

	[Extension]
	static Should[target as bool]:
		get:
			return BooleanShould(target)

	[Extension]
	static Should[target as string]:
		get:
			return StringShould(target)

	[Extension]
	static Should[target as System.Collections.ICollection]:
		get:
			return CollectionShould(target)

	[Extension]
	static Should_[target as object]:
		get:
			return ReferenceShould(target)
