shuffle([],[],[]).
shuffle([H1|T1],[H2|T2],[H1,H2|Tail]):- shuffle(T1,T2,Tail).

double([],[]).
double([H|T],[H,H|Tail]):- double(T, Tail).