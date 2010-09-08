namespace Boospec.Tests

import Boospec
import Boospec.ShouldMatcher

fixture "Returning macro":
	declare:
		FirstName as string
		SecondName as string
				
	setup:
		FirstName = "Georges"
		SecondName = "Benatti"
		
	testing "Should support assign inside returning":
		block = def:
			returning h = {}:
				h["name"] = FirstName
				
		info = block()
		
		FirstName.Should.Be == info["name"]
		
	testing "Should support binding of existing variable inside returning":
		block = def:
			h = {"name" : FirstName}

			returning h:
				h["name"] += SecondName
				
		info = block()
		fullName = "${FirstName}${SecondName}"
		
		fullName.Should.Be == info["name"]
		