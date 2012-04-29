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

