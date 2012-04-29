-module(l99).
-compile(export_all).

% P01 (*) Find the last box of a list.
p1(L) when is_list(L) -> p1(L,[]).
p1([],R) -> R;
p1([H|T],_) -> p1(T,[H]).
