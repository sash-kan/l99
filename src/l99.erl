-module(l99).
-compile(export_all).

% P01 (*) Find the last box of a list.
p1(L) when is_list(L), length(L) == 1 -> L;
p1(L=[_|T]) when length(L) > 1 -> p1(T).

% P02 (*) Find the last but one box of a list.
p2(L) when is_list(L), length(L) == 2 -> L;
p2(L=[_|T]) when length(L) > 2 -> p2(T).

