insert_bst_sort(List,SortedList):-
				insert_bst(List,nil,T),
				tsort(T,[],SortedList).




insert_bst([],X,X).
insert_bst([H|T],Tree,NewTree):-
					addleaf(Tree,H,T1),
					insert_bst(T,T1,NewTree).




addleaf(nil,X,t(nil,X,nil)):-
				!.
addleaf(t(Left,Root,Right),X,t(Left1,Root,Right)):-
							X=<Root,
							!,
							addleaf(Left,X,Left1).
addleaf(t(Left,Root,Right),X,t(Left,Root,Right1)):-
							X>Root,
							!,
							addleaf(Right,X,Right1).





tsort(nil,L,L).
tsort(T,L,L1):-
			deletemin(T,Y,T1),
			our_append(L,[Y],L2),
			tsort(T1,L2,L1).



deletemin(t(nil,Y,Right),Y,Right):-
					!.
deletemin(t(Left,Root,Right),Y,t(Left1,Root,Right)):-
						deletemin(Left,Y,Left1).





our_append([],L,L).
our_append([X|L1],L2,[X|L3]):-our_append(L1,L2,L3).

