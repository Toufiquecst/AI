trim([],_,[]).
trim(L,0,L).
trim([H|T],N,L1):-
		N1 is N-1,
		trim(T,N1,L1).




