-module(l99).
-compile(export_all).

% P01 (*) Find the last box of a list.
p1(L) when is_list(L), length(L) == 1 -> L;
p1(L=[_|T]) when length(L) > 1 -> p1(T).

% P02 (*) Find the last but one box of a list.
p2(L) when is_list(L), length(L) == 2 -> L;
p2(L=[_|T]) when length(L) > 2 -> p2(T).

% P03 (*) Find the K'th element of a list.
p3(L,N) when is_list(L), is_number(N), N > 0, length(L) >= N -> p3(L,N,1).
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
p12([[N,H]|T],R) when is_number(N), N>0 -> p12([[N-1,H]|T],[H|R]);
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
p15(L,N) when is_list(L), is_number(N), N>0 -> p15(L,N,0,[]).
p15([],_,_,R) -> p5(R);
p15([_|T],N,N,R) -> p15(T,N,0,R);
p15(L=[H|_],N,C,R) -> p15(L,N,C+1,[H|R]).

% P16 (**) Drop every N'th element from a list.
p16(L,N) when is_list(L), is_number(N), length(L) >= N, N>0 -> p16(L,N,1,[]).
p16([],_,_,R) -> p5(R);
p16([_|T],N,N,R) -> p16(T,N,1,R);
p16([H|T],N,C,R) -> p16(T,N,C+1,[H|R]).

% P17 (*) Split a list into two parts; the length of the first part is given.
p17(L,N) when is_list(L), is_number(N), length(L) >= N, N>0 ->
	p17(L,N,0,[],[]).
p17([],_,_,L,M) -> [p5(L)]++[p5(M)];
p17([H|T],N,C,L,[]) when N>C -> p17(T,N,C+1,[H|L],[]);
p17([H|T],N,C,L,M) -> p17(T,N,C+1,L,[H|M]).

% P18 (**) Extract a slice from a list.
p18(L,I,K)
	when is_list(L), is_number(I), is_number(K), I>0, I=<K, length(L)>=K ->
	p18(L,I,K,1,[]).
p18([],_,_,_,R) -> p5(R);
p18(_,_,K,C,R) when C>K -> p18([],0,0,0,R);
p18([_|T],I,K,C,R) when C<I -> p18(T,I,K,C+1,R);
p18([H|T],I,K,C,R) -> p18(T,I,K,C+1,[H|R]).

% P19 (**) Rotate a list N places to the left.
p19(L,N) when N>0 -> [A,B]=p17(L,N), B++A;
p19(L,N) when N<0 -> [A,B]=p17(L,length(L)+N), B++A.

% P20 (*) Remove the K'th element from a list.
p20(L,K) when is_list(L), is_number(K), K>0, length(L)>=K -> p20(L,K,1,[]).
p20([],_,_,R) -> p5(R);
p20([_|T],K,K,R) -> p20(T,K,K+1,R);
p20([H|T],K,C,R) -> p20(T,K,C+1,[H|R]).

% P21 (*) Insert an element at a given position into a list.
p21(E,L,N) when is_list(L), is_number(N), N>0, length(L)>=N-1 ->
	p21(E,L,N,1,[]).
p21(E,L,N,N,R) -> p21(E,L,N,N+1,[E|R]);
p21(_,[],_,_,R) -> p5(R);
p21(E,[H|T],N,C,R) -> p21(E,T,N,C+1,[H|R]).

% P22 (*) Create a list containing all integers within a given range.
p22(I,K) when is_number(I), is_number(K), I=<K -> p22(I,K,[]).
p22(N,N,R) -> p5([N|R]);
p22(I,K,R) -> p22(I+1,K,[I|R]).

% P23 (**) Extract a given number of randomly selected elements from a list.
p23(L,N) when is_list(L), is_number(N), N>=0, length(L)>=N -> 
	random:seed(now()), p23(L,N,[]).
p23(_,0,R) -> R;
p23(L,N,R) -> K=random:uniform(length(L)), p23(p20(L,K),N-1,[p3(L,K)|R]).

% P24 (*) Lotto: Draw N different random numbers from the set 1..M.
p24(N,M) when is_number(N), is_number(M), N>0, M>=N -> p23(p22(1,M),N).

% P25 (*) Generate a random permutation of the elements of a list.
p25(L) when is_list(L) -> p23(L,length(L)).

