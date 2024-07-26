shuffle([], [], []).
shuffle([H1|T1], [H2|T2], [H1,H2|T3]) :-
    shuffle(T1, T2, T3).


double([], []).
double([H|T1], [H,H|T2]) :-
    double(T1, T2).


no_duplicates([], []).
no_duplicates([H|T], L2) :-
    member(H, T),
    no_duplicates(T, L2).
no_duplicates([H|T], [H|T1]) :-
    \+ member(H, T),
    no_duplicates(T, T1).

same_elements(L1, L2) :-
    msort(L1, Sorted),
    msort(L2, Sorted).
