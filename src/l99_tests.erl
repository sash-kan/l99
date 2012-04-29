-module(l99_tests).
-include_lib("eunit/include/eunit.hrl").

p1_test_() -> [
	 ?_assertEqual([],l99:p1([]))
	,?_assertEqual([a],l99:p1([a]))
	,?_assertEqual([b],l99:p1([a,b]))
	,?_assertEqual([d],l99:p1([a,b,c,d]))
	,?_assertError(function_clause,l99:p1(a))
].
