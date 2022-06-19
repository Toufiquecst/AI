bsort([],[]):-	!.
bsort([X],[X]):-	!.
bsort(L,L1):-
		bubble_sort(L,L2),
		cut_last(L2,L3,X),
		bsort(L3,L4),
		append(L4,[X],L1).





bubble_sort([],[]):-	!.
bubble_sort([X],[X]):-	!.
bubble_sort([X|[Y|Rest]],[Y|Rest1]):-
						X>=Y,
						!,
						bubble_sort([X|Rest],Rest1).
bubble_sort([X|Rest],[X|Rest1]):-
						bubble_sort(Rest,Rest1).



cut_last([],[],_):-	!.
cut_last([X],[],X):-	!.
cut_last([X|Rest],[X|Rest1],Y):-
					cut_last(Rest,Rest1,Y).




append([],L,L).
append([X|L1],L2,[X|L3]):-append(L1,L2,L3).

