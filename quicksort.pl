
%check if lists are empty end the quicksort
quicksort([],[]).

quicksort([X|Xs], Ys) :-
        partition(Xs, X, L, B),

        quicksort(L, Ls),
        
        quicksort(B, Bs),

        append(Ls, [X | Bs], Ys).


%check if lists are empty to end the partition
partition([],_,[],[]).


partition([X|Xs], Y, [X|Ls], Bs) :-
        X =< Y,
        partition(Xs, Y, Ls, Bs).

partition([X|Xs], Y, Ls, [X|Bs]) :-
        X > Y,
        partition(Xs, Y, Ls, Bs).

append([],X,X).

append([Head|Tail], X, [Head|Tail2]) :- append(Tail,X,Tail2).