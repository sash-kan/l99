-module(l99_tests).
-include_lib("eunit/include/eunit.hrl").

p1_test_() -> [
	 ?_assertError(function_clause,l99:p1([]))
	,?_assertEqual([a],l99:p1([a]))
	,?_assertEqual([b],l99:p1([a,b]))
	,?_assertEqual([d],l99:p1([a,b,c,d]))
	,?_assertError(function_clause,l99:p1(a))
].

p2_test_() -> [
	 ?_assertEqual([c,d],l99:p2([a,b,c,d]))
	,?_assertError(function_clause,l99:p2(a))
	,?_assertError(function_clause,l99:p2([]))
	,?_assertError(function_clause,l99:p2([a]))
	,?_assertEqual([a,b],l99:p2([a,b]))
].
