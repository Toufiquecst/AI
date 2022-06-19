trimlast(L,N,L1):-
			reverse(L,L2),
			trim(L2,N,L3),
			reverse(L3,L1).



reverse([],[]).
reverse([X],[X]).
reverse([H|T],L):-reverse(T,Z),
		append(Z,[H],L).

our_append([],L,L).
our_append([X|L1],L2,[X|L3]):-our_append(L1,L2,L3).



trim([],_,[]).
trim(L,0,L).
trim([H|T],N,L1):-
		N1 is N-1,
		trim(T,N1,L1).

