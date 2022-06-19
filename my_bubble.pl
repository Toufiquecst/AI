bubble_sort([X],[X]).
bubble_sort(L,L1):-
			greatest(L,X),
			remove(X,L,L2),
			bubble_sort(L2,L4),
			append(L4,[X],L1).


greatest([X],X).
greatest([H|T],Max):-
			greatest(T,MaxRest),
			max(H,MaxRest,Max).

max(X,Y,X):-	X>=Y.
max(X,Y,Y):-	Y>X.


append([],L,L).
append([X|L1],L2,[X|L3]):-append(L1,L2,L3).


remove(H,[H|T],T).
remove(X,[H|T],[H|T1]):-
				remove(X,T,T1).
