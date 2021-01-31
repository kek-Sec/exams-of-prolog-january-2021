
%push element in list
push(Q,X,[X|Q]).

%pop element in list
pop([_|T],T).

%top element of list
top([H|_],H).

%check if stack is empty
empty_stack([]).

decimal(N,S) :- 
             % convert decimal to binary
             dec2bin(N,L1),
             
             %reverse list to print correct the covertion
             reverse(L1,S).


dec2bin(0,[0]).

dec2bin(1,[1]).

%to convert decimal to binary we need divide the N with 2
dec2bin(N,L):- 
    N > 1,
    X is N mod 2,
    Y is N // 2, 
    push(L1,X,L), 
    dec2bin(Y,L1).

%reverse list 
%structure in head clause of reverse
reverse(S,S1) :-
                reverse1(S,[],S1,S1).

%we need this to end the reverse
reverse1([],S,S,[]).

%It is tail-recursive, thus can be optimized into a loop by the compiler. 
%heap: [X|Rs] to be unified with the result variable Ys in the base case.

reverse1([H|T],L1,L2,[_|Tail2]) :-
                                reverse1(T,[H|L1],L2,Tail2).