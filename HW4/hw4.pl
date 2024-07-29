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

same_elements([], []).
same_elements([H|T], L2) :-
    select_and_remove(H, L2, L2Rest),
    same_elements(T, L2Rest).

select_and_remove(X, [X|T], T).
select_and_remove(X, [H|T], [H|R]) :-
    select_and_remove(X, T, R).
