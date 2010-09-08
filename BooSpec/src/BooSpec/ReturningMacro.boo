namespace Boospec

import System
import Boo.Lang.Compiler
import Boo.Lang.Compiler.Ast
import Boo.Lang.PatternMatching
 
macro returning:
	if returning.Arguments.Count != 1:
		raise "returning <expression>: [block]"
		
	expansion = returning.Body
	
	match returning.Arguments[0]:
		case reference=ReferenceExpression():
			return [| 
				$expansion
				return $reference
			|]
			
		case BinaryExpression(Left: left):
			expression = returning.Arguments[0]
			
			return [|
				$expression
				$expansion
				return $left
			|]
		
		otherwise:
			raise "returning can only be used with ReferenceExpressions or BinaryExpressions"
