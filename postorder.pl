postorder(nil,[]).
postorder(t(Left,Root,Right),L):-
					postorder(Left,L1),
					postorder(Right,L2),
					our_append(L1,L2,L3),
					our_append(L3,[Root],L).




our_append([],L,L).
our_append([X|L1],L2,[X|L3]):-our_append(L1,L2,L3).


