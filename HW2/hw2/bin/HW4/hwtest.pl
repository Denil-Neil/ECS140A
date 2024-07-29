
shuffle([],[],[]).
shuffle([H1|T1],[H2|T2],[H1,H2|T3]):- 
    shuffle(T1,T2,T3).


double([],[]).
double([H1|T1],[H1,H1|T2]):- double(T1,T2).

remove_duplicates([], []).
remove_duplicates([Head | Tail], Result) :-
    member(Head, Tail), !,
    remove_duplicates(Tail, Result).
remove_duplicates([Head | Tail], [Head | Result]) :-
    remove_duplicates(Tail, Result).
