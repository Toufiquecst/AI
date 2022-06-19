inorder(nil,[]).
inorder(t(Left,Root,Right),L):-
					inorder(Left,L1),
					our_append(L1,[Root],L2),
					inorder(Right,L3),
					our_append(L2,L3,L).




our_append([],L,L).
our_append([X|L1],L2,[X|L3]):-our_append(L1,L2,L3).

