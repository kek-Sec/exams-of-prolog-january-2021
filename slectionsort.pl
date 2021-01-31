empty_seq([]).

selectionsort(S,S1) :- 
                      empty_seq(S), 
                      empty_seq(S1).

selectionsort([A],[A]).
selectionsort(In,[Min|Out]):-
  minElement(In,Min),
  removeElement(In,Min,L),
  selectionsort(L,Out).


minElement([Μ],M).
minElement([H|T], Η) :-
                     minElement(T,M), Η < M.
minElement[H|T],M) :-
                     minElement(T,M), H>=M.



removeElement([A],A,[]).
removeElement([H|T],H,T).
removeElement([H|T],X,[H|Z]):-
  X /= H,
  removeElement(T,X,Z).