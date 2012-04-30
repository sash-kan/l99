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

p14_test_() -> [
	 ?_assertError(function_clause,l99:p14(a))
	,?_assertEqual([a,a,b,b,c,c,c,c,d,d],l99:p14([a,b,c,c,d]))
	,?_assertEqual([],l99:p14([]))
	,?_assertEqual([a,a],l99:p14([a]))
].

p15_test_() -> [
	 ?_assertError(function_clause,l99:p15(a,a))
	,?_assertError(function_clause,l99:p15([a],0))
	,?_assertEqual([a,a,a,b,b,b,c,c,c],l99:p15([a,b,c],3))
	,?_assertEqual([],l99:p15([],1))
	,?_assertEqual([a,a],l99:p15([a],2))
].

p16_test_() -> [
	 ?_assertError(function_clause,l99:p16(a,a))
	,?_assertError(function_clause,l99:p16([a],0))
	,?_assertError(function_clause,l99:p16([a],2))
	,?_assertEqual([a,b,d,e,g,h,k],l99:p16([a,b,c,d,e,f,g,h,i,k],3))
	,?_assertEqual([],l99:p16([a],1))
].

p17_test_() -> [
	 ?_assertError(function_clause,l99:p17(a,a))
	,?_assertError(function_clause,l99:p17([a],0))
	,?_assertError(function_clause,l99:p17([a],2))
	,?_assertEqual([[a,b,c],[d,e,f,g,h,i,k]],l99:p17([a,b,c,d,e,f,g,h,i,k],3))
	,?_assertEqual([[a],[]],l99:p17([a],1))
].

p18_test_() -> [
	 ?_assertError(function_clause,l99:p18(a,a,a))
	,?_assertError(function_clause,l99:p18([a],0,2))
	,?_assertError(function_clause,l99:p18([a],1,2))
	,?_assertEqual([c,d,e,f,g],l99:p18([a,b,c,d,e,f,g,h,i,k],3,7))
	,?_assertEqual([a],l99:p18([a],1,1))
].

p19_test_() -> [
	 ?_assertError(function_clause,l99:p19(a,a))
	,?_assertError(function_clause,l99:p19([a],0))
	,?_assertError(function_clause,l99:p19([a],2))
	,?_assertEqual([d,e,f,g,h,a,b,c],l99:p19([a,b,c,d,e,f,g,h],3))
	,?_assertEqual([g,h,a,b,c,d,e,f],l99:p19([a,b,c,d,e,f,g,h],-2))
	,?_assertEqual([a],l99:p19([a],1))
].

p20_test_() -> [
	 ?_assertError(function_clause,l99:p20(a,a))
	,?_assertError(function_clause,l99:p20([a],0))
	,?_assertError(function_clause,l99:p20([a],2))
	,?_assertEqual([a,c,d],l99:p20([a,b,c,d],2))
	,?_assertEqual([],l99:p20([a],1))
].

p21_test_() -> [
	 ?_assertError(function_clause,l99:p21(a,a,a))
	,?_assertError(function_clause,l99:p21(a,[a],0))
	,?_assertError(function_clause,l99:p21(a,[a],3))
	,?_assertEqual([a,alfa,b,c,d],l99:p21(alfa,[a,b,c,d],2))
	,?_assertEqual([alfa,a],l99:p21(alfa,[a],1))
	,?_assertEqual([a,alfa],l99:p21(alfa,[a],2))
].

p22_test_() -> [
	 ?_assertError(function_clause,l99:p22(a,a))
	,?_assertError(function_clause,l99:p22(1,0))
	,?_assertEqual([4,5,6,7,8,9],l99:p22(4,9))
	,?_assertEqual([1],l99:p22(1,1))
].

p23_test_() -> [
	 ?_assertError(function_clause,l99:p23(a,a))
	,?_assertError(function_clause,l99:p23([a],-1))
	,?_assertError(function_clause,l99:p23([a],2))
	,?_assertEqual(true,is_list(l99:p23([a,b,c,d,e,f,g,h],3)))
	,?_assertEqual(3,length(ordsets:from_list(l99:p23([a,b,c,d,e,f,g,h],3))))
	,?_assertEqual([],l99:p23([a],0))
].

p24_test_() -> [
	 ?_assertError(function_clause,l99:p24(a,a))
	,?_assertError(function_clause,l99:p24(0,1))
	,?_assertError(function_clause,l99:p24(1,0))
	,?_assertEqual(true,is_list(l99:p24(6,49)))
	,?_assertEqual(6,length(ordsets:from_list(l99:p24(6,49))))
	,?_assertEqual([1],l99:p24(1,1))
].

p25_test_() -> [
	 ?_assertError(function_clause,l99:p25(a))
	,?_assertEqual(true,is_list(l99:p25([a,b,c,d,e,f])))
	,?_assertEqual(6,length(ordsets:from_list(l99:p25([a,b,c,d,e,f]))))
	,?_assertEqual([],l99:p25([]))
	,?_assertEqual([a],l99:p25([a]))
].

p26_test_() -> [
	 ?_assertError(function_clause,l99:p26(a,a))
	,?_assertError(function_clause,l99:p26(1,a))
	,?_assertEqual([[a,b],[a,c],[b,c]],l99:p26(2,[a,b,c]))
	,?_assertEqual(220,length(l99:p26(3,[a,b,c,d,e,f,g,h,i,j,k,l])))
	,?_assertEqual([[a]],l99:p26(1,[a]))
].

p27_test_() -> [
	 ?_assertError(function_clause,l99:p27(a,a))
	,?_assertEqual([[]],l99:p27([a,b,c,d],[]))
	,?_assertEqual([[[a],[b]],[[a],[c]],[[a],[d]],[[b],[a]],[[b],[c]],[[b],[d]],[[c],[a]],[[c],[b]],[[c],[d]],[[d],[a]],[[d],[b]],[[d],[c]]],l99:p27([a,b,c,d],[1,1]))
	,?_assertEqual([[aldo,beat],[carla,david,evi],[flip,gary,hugo,ida]],hd(l99:p27([aldo,beat,carla,david,evi,flip,gary,hugo,ida],[2,3,4])))
	,?_assertEqual([[aldo,beat],[carla,david],[evi,flip,gary,hugo,ida]],hd(l99:p27([aldo,beat,carla,david,evi,flip,gary,hugo,ida],[2,2,5])))
].

