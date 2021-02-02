%Structure construction (Accumulation) in the proposal head.
elemL([],_,[]).

elemL([H1|T1],L2,[H1|T3]) :-
                    member(H1, L2),
	                elemL(T1,L2,T3).

elemL([H|T],L2,L3) :-
                     \+member(H,L2),
                     elemL(T,L2,L3).
		     
%Construction of structure (Accumulation) in the proposition body.
elemLB(L1,L2,L3) :-
                elemLB1(L1,L2,[],L3).

elemLB1(L1,_,Acc,L3) :-
                L1=[] ,
                L3= Acc.

elemLB1([H1|T1],L2,Acc,L3) :-
                member(H1,L2),
                append(Acc,[H1],NAcc),
                elemLB1(T1,L2,NAcc,L3).

elemLB1([H1|T1],L2,Acc,L3) :-
                \+member(H1,L2),
                NAcc = Acc,
                elemLB1(T1,L2,NAcc,L3).
