qsort([],[]).
qsort([X],[X]).
qsort([H|T],L):-
			partition(T,Lt,H,Gt),
			qsort(Gt,GtsL),
			qsort(Lt,LtsL),
			our_append(LtsL,[H|GtsL],L).





partition([],[],_,[]).
partition([H|T],[H|TLt],X,Gt):-
			H=<X,
			!,
			partition(T,TLt,X,Gt).
partition([H|T],Lt,X,[H|TGt]):-
			H>X,
			!,
			partition(T,Lt,X,TGt).




our_append([],L,L).
our_append([X|L1],L2,[X|L3]):-our_append(L1,L2,L3).
