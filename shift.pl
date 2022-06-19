shift([],[]).
shift([H|T],L):-
			our_append(T,[H],L).



our_append([],L,L).
our_append([X|L1],L2,[X|L3]):-our_append(L1,L2,L3).
