-module(l99).
-compile(export_all).

% P01 (*) Find the last box of a list.
p1(L) when is_list(L), length(L) == 1 -> L;
p1(L=[_|T]) when length(L) > 1 -> p1(T).

% P02 (*) Find the last but one box of a list.
p2(L) when is_list(L), length(L) == 2 -> L;
p2(L=[_|T]) when length(L) > 2 -> p2(T).

% P03 (*) Find the K'th element of a list.
p3(L,N) when is_list(L), is_integer(N), N > 0, length(L) >= N -> p3(L,N,1).
p3([H|_],N,N) -> H;
p3([_|T],N,C) -> p3(T,N,C+1).

% P04 (*) Find the number of elements of a list.
% solution with bif
p4a(L) when is_list(L) -> length(L).
% solution without bif
p4b(L) when is_list(L) -> p4b(L,0).
p4b([],R) -> R;
p4b([_|T],R) -> p4b(T,R+1).

% P05 (*) Reverse a list.
% solution with bif
p5a(L) when is_list(L) -> lists:reverse(L).
% solution without bif
p5b(L) when is_list(L) -> p5b(L,[]).
p5b([],R) -> R;
p5b([H|T],R) -> p5b(T,[H|R]).
% short name
p5(L) -> p5b(L).

% P06 (*) Find out whether a list is a palindrome.
% solution a
p6a(L) when is_list(L) -> L == p5(L).
% solution b
p6b(L) when is_list(L) -> p6b(L,p5(L)).
p6b([],[]) -> true;
p6b([H|T],[H|U]) -> p6b(T,U);
p6b(_,_) -> false.

% P07 (**) Flatten a nested list structure.
% solution with bif
p7a(L) when is_list(L) -> lists:flatten(L).
% solution without bif
p7b(L) when is_list(L) -> p5(p7b(L,[])).
p7b([],R) -> R;
p7b([H|T],R) when is_list(H) -> p7b(T,p7b(H,R));
p7b([H|T],R) -> p7b(T,[H|R]).

% P08 (**) Eliminate consecutive duplicates of list elements.
p8(L) when is_list(L) -> p8(L,[]).
p8([],R) -> p5(R);
p8([H|T],R=[H|_]) -> p8(T,R);
p8([H|T],R) -> p8(T,[H|R]).

% P09 (**) Pack consecutive duplicates of list elements into sublists.
p9(L) when is_list(L) -> p9(L,[]).
p9([],R) -> p5(R);
p9([H|T],[R=[H|_]|U]) -> p9(T,[[H|R]|U]);
p9([H|T],R) -> p9(T,[[H]|R]).

% P10 (*) Run-length encoding of a list.
p10(L) when is_list(L) -> p10(p9(L),[],1,[]).
p10([],[],_,R) -> p5(R);
p10([H|T],[],_,R) -> p10(T,H,1,R);
p10(L,[H|[]],N,R) -> p10(L,[],1,[[N,H]|R]);
p10(L,[_|T],N,R) -> p10(L,T,N+1,R).

% P11 (*) Modified run-length encoding.
p11(L) when is_list(L) -> p11(p10(L),[]).
p11([],R) -> p5(R);
p11([[1,H]|T],R) -> p11(T,[H|R]);
p11([H|T],R) -> p11(T,[H|R]).

% P12 (**) Decode a run-length encoded list.
p12(L) when is_list(L) -> p12(L,[]).
p12([],R) -> p5(R);
p12([[0,_]|T],R) -> p12(T,R);
p12([[N,H]|T],R) when is_integer(N), N>0 -> p12([[N-1,H]|T],[H|R]);
p12([H|T],R) -> p12(T,[H|R]).

% P13 (**) Run-length encoding of a list (direct solution).
p13(L) when is_list(L) -> p13(L,[]).
p13([],R) -> p5(R);
p13([H|T],[H|U]) -> p13(T,[[2,H]|U]);
p13([H|T],[[N,H]|U]) -> p13(T,[[N+1,H]|U]);
p13([H|T],R) -> p13(T,[H|R]).

% P14 (*) Duplicate the elements of a list.
p14(L) when is_list(L) -> p14(L,[]).
p14([],R) -> p5(R);
p14([H|T],R) -> p14(T,[H|[H|R]]).

% P15 (**) Replicate the elements of a list a given number of times.
p15(L,N) when is_list(L), is_integer(N), N>0 -> p15(L,N,0,[]).
p15([],_,_,R) -> p5(R);
p15([_|T],N,N,R) -> p15(T,N,0,R);
p15(L=[H|_],N,C,R) -> p15(L,N,C+1,[H|R]).

% P16 (**) Drop every N'th element from a list.
p16(L,N) when is_list(L), is_integer(N), length(L) >= N, N>0 -> p16(L,N,1,[]).
p16([],_,_,R) -> p5(R);
p16([_|T],N,N,R) -> p16(T,N,1,R);
p16([H|T],N,C,R) -> p16(T,N,C+1,[H|R]).

% P17 (*) Split a list into two parts; the length of the first part is given.
p17(L,N) when is_list(L), is_integer(N), length(L) >= N, N>0 ->
	p17(L,N,0,[],[]).
p17([],_,_,L,M) -> [p5(L)]++[p5(M)];
p17([H|T],N,C,L,[]) when N>C -> p17(T,N,C+1,[H|L],[]);
p17([H|T],N,C,L,M) -> p17(T,N,C+1,L,[H|M]).

% P18 (**) Extract a slice from a list.
p18(L,I,K)
	when is_list(L), is_integer(I), is_integer(K), I>0, I=<K, length(L)>=K ->
	p18(L,I,K,1,[]).
p18([],_,_,_,R) -> p5(R);
p18(_,_,K,C,R) when C>K -> p18([],0,0,0,R);
p18([_|T],I,K,C,R) when C<I -> p18(T,I,K,C+1,R);
p18([H|T],I,K,C,R) -> p18(T,I,K,C+1,[H|R]).

% P19 (**) Rotate a list N places to the left.
p19(L,N) when N>0 -> [A,B]=p17(L,N), B++A;
p19(L,N) when N<0 -> [A,B]=p17(L,length(L)+N), B++A.

% P20 (*) Remove the K'th element from a list.
p20(L,K) when is_list(L), is_integer(K), K>0, length(L)>=K -> p20(L,K,1,[]).
p20([],_,_,R) -> p5(R);
p20([_|T],K,K,R) -> p20(T,K,K+1,R);
p20([H|T],K,C,R) -> p20(T,K,C+1,[H|R]).

% P21 (*) Insert an element at a given position into a list.
p21(E,L,N) when is_list(L), is_integer(N), N>0, length(L)>=N-1 ->
	p21(E,L,N,1,[]).
p21(E,L,N,N,R) -> p21(E,L,N,N+1,[E|R]);
p21(_,[],_,_,R) -> p5(R);
p21(E,[H|T],N,C,R) -> p21(E,T,N,C+1,[H|R]).

% P22 (*) Create a list containing all integers within a given range.
p22(I,K) when is_integer(I), is_integer(K), I=<K -> p22(I,K,[]).
p22(N,N,R) -> p5([N|R]);
p22(I,K,R) -> p22(I+1,K,[I|R]).

% P23 (**) Extract a given number of randomly selected elements from a list.
p23(L,N) when is_list(L), is_integer(N), N>=0, length(L)>=N -> 
	random:seed(now()), p23(L,N,[]).
p23(_,0,R) -> R;
p23(L,N,R) -> K=random:uniform(length(L)), p23(p20(L,K),N-1,[p3(L,K)|R]).

% P24 (*) Lotto: Draw N different random numbers from the set 1..M.
p24(N,M) when is_integer(N), is_integer(M), N>0, M>=N -> p23(p22(1,M),N).

% P25 (*) Generate a random permutation of the elements of a list.
p25(L) when is_list(L) -> p23(L,length(L)).

% P26 (**) Generate the combinations of K distinct objects chosen from the N elements of a list
p26(1,L) when is_list(L) -> [[X]||X <- L];
p26(N,L) when is_list(L), is_integer(N), N>1 ->
	[ [X|Y] || X <- L, Y <- p26(N-1,p26(p5(L),[X],[])) ].
p26([],_,R) -> R;
p26([X|_],[X],R) -> R;
p26([H|T],[X],R) -> p26(T,[X],[H|R]).

% P27 (**) Group the elements of a set into disjoint subsets.
p27(P,[]) when is_list(P) -> [[]];
p27(P,[H|T]) when is_list(P) -> [[X|Y]||X<-p26(H,P), Y<-p27(P--X,T)].

% P28 (**) Sorting a list of lists according to length of sublists
p28a(L) when is_list(L) -> p28_d(p28_s(p28_l(L))).
p28b(L) when is_list(L) -> p28_d(p28_s(p28_f(p28_s(p28_l(L))))).
%add lengths to list
p28_l(L) -> p28_l(L,[]).
p28_l([],R) -> R;
p28_l([H|T],R) -> p28_l(T,[[length(H)|H]|R]).
%delete lengths from list
p28_d(L) -> p28_d(L,[]).
p28_d([],R) -> R;
p28_d([[_|H]|T],R) -> p28_d(T,[H|R]).
%sort list on first (numeric) element
p28_s([]) -> [];
p28_s([[LH|H]|T]) -> p28_s([[LX|X]||[LX|X]<-T,LX>LH]) ++
	[[LH|H]] ++ p28_s([[LX|X]||[LX|X]<-T,LX=<LH]).
%change length to frequency
p28_f(L) -> p28_m(p28_f(L,-1,0,[])).
p28_f([],_,_,R) -> R;
p28_f([[LH|H]|T],LH,C,R) -> p28_f(T,LH,C+1,[[C+1|H]|R]);
p28_f([[LH|H]|T],_,_,R) -> p28_f(T,LH,1,[[1|H]|R]).
%multply frequency
p28_m(L) -> p28_m(L,1,[]).
p28_m([],_,R) -> R;
p28_m([[FH|H]|T],F,R) when FH==1 -> p28_m(T,FH,[[F|H]|R]);
p28_m([[FH|H]|T],F,R) when F>=FH -> p28_m(T,F,[[F|H]|R]);
p28_m([[FH|H]|T],_,R) -> p28_m(T,FH,[[FH|H]|R]).

% P31 (**) Determine whether a given integer number is prime.
p31(N) when is_integer(N), N>1 -> p31(N,2).
p31(N,K) when K*K>N -> true;
p31(N,K) when N==trunc(N/K)*K -> false;
p31(N,K) -> p31(N,K+1).

% P32 (**) Determine the greatest common divisor of two positive integer numbers.
p32(X,Y) when is_integer(X), is_integer(Y), X>0, Y>0 -> p32_(X,Y).
p32_(X,X) -> X;
p32_(X,Y) when X>Y -> p32_(X-Y,Y);
p32_(X,Y) -> p32_(X,Y-X).

% P33 (*) Determine whether two positive integer numbers are coprime.
p33(X,Y) when is_integer(X), is_integer(Y), X>0, Y>0 -> p32(X,Y)==1.

% P34 (**) Calculate Euler's totient function phi(m).
p34(X) when is_integer(X), X>0 -> p34(X,1,0).
p34(X,X,C) -> C;
p34(X,N,C) -> case p33(X,N) of
	true -> p34(X,N+1,C+1);
	false -> p34(X,N+1,C) end.

% P35 (**) Determine the prime factors of a given positive integer.
p35(X) when is_integer(X), X>1 -> p35(X,2,[]).
p35(X,X,R) -> p5([X|R]);
p35(X,C,R) when X==trunc(X/C)*C -> p35(trunc(X/C),C,[C|R]);
p35(X,C,R) -> p35(X,C+1,R).

% P36 (**) Determine the prime factors of a given positive integer (2).
p36(X) when is_integer(X), X>1 -> p36(p35(X),[]).
p36([],R) -> p5(R);
p36([H|T],[[H,N]|R]) -> p36(T,[[H,N+1]|R]);
p36([H|T],R) -> p36(T,[[H,1]|R]).

% P37 (**) Calculate Euler's totient function phi(m) (improved).
p37(X) when is_integer(X), X>0 -> p37(p36(X),1).
p37([],R) -> R;
p37([[P,M]|T],R) -> p37(T,R*(P-1)*p37_power(P,M-1)).
p37_power(X,Y) when is_integer(X), is_integer(Y), X>0, Y>=0 ->
	p37_power(X,Y,1).
p37_power(_,0,R) -> R;
p37_power(X,Y,R) -> p37_power(X,Y-1,X*R).

% P38 (*) Compare the two methods of calculating Euler's totient function.
p38(X) when is_integer(X), X>0 ->
	{P34,R}=timer:tc(?MODULE,p34,[X]),
	{P37,R}=timer:tc(?MODULE,p37,[X]),
	{P34,P37}.

% P39 (*) A list of prime numbers.
p39(X,Y) when is_integer(X), is_integer(Y), X>1, X=<Y -> p39_(p22(X,Y),[]).
p39_([],R) -> p5(R);
p39_([H|T],R) -> case p31(H) of
	true -> p39_(T,[H|R]);
	false -> p39_(T,R) end.

% P40 (**) Goldbach's conjecture.
p40(X) when is_integer(X), X>2, X==trunc(X/2)*2 -> p40(X,p22(2,trunc(X/2))).
p40(X,[H|T]) -> case p31(H) andalso p31(X-H) of
	true -> [H,X-H]; false -> p40(X,T) end.

% P41 (**) A list of Goldbach compositions.
p41a(X,Y) when is_integer(X), is_integer(Y), X>2, X=<Y -> p41a_(p22(X,Y),[]).
p41a_([],R) -> p5(R);
p41a_([H|T],R) when H==trunc(H/2)*2 -> p41a_(T,[[H|p40(H)]|R]);
p41a_([_|T],R) -> p41a_(T,R).
p41b(X,Y,Z) when is_integer(X), is_integer(Y), X>2, X=<Y, Z>2 ->
	p41b_(Z,p41a(X,Y),[]).
p41b_(_,[],R) -> p5(R);
p41b_(Z,[[A,B,C]|T],R) when B>=Z -> p41b_(Z,T,[[A,B,C]|R]);
p41b_(Z,[_|T],R) -> p41b_(Z,T,R).

