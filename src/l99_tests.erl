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

p3_test_() -> [
	 ?_assertEqual(c,l99:p3([a,b,c,d,e],3))
	,?_assertError(function_clause,l99:p3(a,b))
	,?_assertError(function_clause,l99:p3([a],2))
	,?_assertError(function_clause,l99:p3([a],-1))
	,?_assertError(function_clause,l99:p3([],0))
].

p4_test_() -> [
	 ?_assertEqual(0,l99:p4a([]))
	,?_assertEqual(3,l99:p4a([a,b,c]))
	,?_assertError(function_clause,l99:p4a(a))
	,?_assertEqual(0,l99:p4b([]))
	,?_assertEqual(3,l99:p4b([a,b,c]))
	,?_assertError(function_clause,l99:p4b(a))
].

p5_test_() -> [
	 ?_assertEqual([],l99:p5a([]))
	,?_assertEqual([c,b,a],l99:p5a([a,b,c]))
	,?_assertError(function_clause,l99:p5a(a))
	,?_assertEqual([],l99:p5b([]))
	,?_assertEqual([c,b,a],l99:p5b([a,b,c]))
	,?_assertError(function_clause,l99:p5b(a))
].

p6_test_() -> [
	 ?_assertEqual(true,l99:p6a([x,a,m,a,x]))
	,?_assertEqual(false,l99:p6a([x,a,m,a]))
	,?_assertEqual(true,l99:p6a([]))
	,?_assertError(function_clause,l99:p6a(a))
	,?_assertEqual(true,l99:p6b([x,a,m,a,x]))
	,?_assertEqual(false,l99:p6b([x,a,m,a]))
	,?_assertEqual(true,l99:p6b([]))
	,?_assertError(function_clause,l99:p6b(a))
].

p7_test_() -> [
	 ?_assertEqual([a,b,c,d,e],l99:p7a([a,[b,[c,d],e]]))
	,?_assertEqual([],l99:p7a([]))
	,?_assertError(function_clause,l99:p7a(a))
	,?_assertEqual([a,b,c,d,e],l99:p7b([a,[b,[c,d],e]]))
	,?_assertEqual([],l99:p7b([]))
	,?_assertError(function_clause,l99:p7b(a))
].

p8_test_() -> [
	 ?_assertError(function_clause,l99:p8(a))
	,?_assertEqual([a,b,c,a,d,e],l99:p8([a,a,a,a,b,c,c,a,a,d,e,e,e,e]))
	,?_assertEqual([],l99:p8([]))
	,?_assertEqual([a],l99:p8([a]))
].

p9_test_() -> [
	 ?_assertError(function_clause,l99:p9(a))
	,?_assertEqual([[a,a,a,a],[b],[c,c],[a,a],[d],[e,e,e,e]],l99:p9([a,a,a,a,b,c,c,a,a,d,e,e,e,e]))
	,?_assertEqual([],l99:p9([]))
	,?_assertEqual([[a]],l99:p9([a]))
].

p10_test_() -> [
	 ?_assertError(function_clause,l99:p10(a))
	,?_assertEqual([[4,a],[1,b],[2,c],[2,a],[1,d],[4,e]],l99:p10([a,a,a,a,b,c,c,a,a,d,e,e,e,e]))
	,?_assertEqual([],l99:p10([]))
	,?_assertEqual([[1,a]],l99:p10([a]))
].

p11_test_() -> [
	 ?_assertError(function_clause,l99:p11(a))
	,?_assertEqual([[4,a],b,[2,c],[2,a],d,[4,e]],l99:p11([a,a,a,a,b,c,c,a,a,d,e,e,e,e]))
	,?_assertEqual([],l99:p11([]))
	,?_assertEqual([a],l99:p11([a]))
].

p12_test_() -> [
	 ?_assertError(function_clause,l99:p12(a))
	,?_assertEqual([a,a,a,a,b,c,c,a,a,d,e,e,e,e],l99:p12(l99:p11([a,a,a,a,b,c,c,a,a,d,e,e,e,e])))
	,?_assertEqual([],l99:p12(l99:p11([])))
	,?_assertEqual([a],l99:p12(l99:p11([a])))
].

p13_test_() -> [
	 ?_assertError(function_clause,l99:p13(a))
	,?_assertEqual([[4,a],b,[2,c],[2,a],d,[4,e]],l99:p13([a,a,a,a,b,c,c,a,a,d,e,e,e,e]))
	,?_assertEqual([],l99:p13([]))
	,?_assertEqual([a],l99:p13([a]))
].

