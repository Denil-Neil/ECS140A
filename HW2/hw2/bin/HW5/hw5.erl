-module(hw5).
-export([myremoveduplicates/1, myintersection/2, mylast/1, myreverse/1, myreplaceall/3]).

% 1) myremoveduplicates
myremoveduplicates(List) -> myremoveduplicates(List, []).

myremoveduplicates([], Result) -> lists:reverse(Result);
myremoveduplicates([H|T], Result) ->
    case lists:member(H, T) of
        true -> myremoveduplicates(T, Result);
        false -> myremoveduplicates(T, [H|Result])
    end.

% 2) myintersection
myintersection(List1, List2) -> myintersection(List1, List2, []).

myintersection([], _, Result) -> lists:reverse(Result);
myintersection(_, [], Result) -> lists:reverse(Result);
myintersection([H|T], List2, Result) ->
    case lists:member(H, List2) of
        true -> myintersection(T, List2, [H|Result]);
        false -> myintersection(T, List2, Result)
    end.

% 3) mylast
mylast([]) -> [];
mylast([H]) -> [H];
mylast([_|T]) -> mylast(T).

% 4) myreverse
myreverse(List) -> myreverse(List, []).

myreverse([], Result) -> Result;
myreverse([H|T], Result) -> myreverse(T, [H|Result]).

% 5) myreplaceall
myreplaceall(_, _, []) -> [];
myreplaceall(X, Y, [Y|T]) -> [X|myreplaceall(X, Y, T)];
myreplaceall(X, Y, [H|T]) -> [H|myreplaceall(X, Y, T)].
