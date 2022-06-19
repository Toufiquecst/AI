ndelete(L,N,L1):-
			nth_delete(L,N,L1,[]).



nth_delete([],_,L,L).
nth_delete([H|T],N,T1,T2):-
				N=1,
				!,
				our_append(T2,T,T1).
nth_delete([H|T],N,T1,T2):-
				N=\=1,
				!,
				our_append(T2,[H],T3),
				N1 is N-1,
				nth_delete(T,N1,T1,T3).



our_append([],L,L).
our_append([X|L1],L2,[X|L3]):-our_append(L1,L2,L3).





cutlast([],[]).
cutlast([X],[]).
cutlast(L,L1):-
		len(L,Y),
		ndelete(L,Y,L1).







len([],0).
len([X|Rest],N1):-
			len(Rest,N),
			N1 is N+1.


