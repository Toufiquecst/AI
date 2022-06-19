%template([(1,Y1),(2,Y2),(3,Y3),(4,Y4),(5,Y5),(6,Y6),(7,Y7),(8,Y8)]).
template([(1,Y1),(2,Y2),(3,Y3),(4,Y4)]).


solution([(X,Y)|Others]):-
				board([],L),
				qsolution([(X,Y)|Others],L).


qsolution([],_).
qsolution([(X,Y)|Others],L):-
			our_member(Y,[1,2,3,4]),
			no_attack((X,Y),L),
			board([(X,Y)|L],L1),
			qsolution(Others,L1).


no_attack(_,[]).
no_attack((X,Y),[(M,N)|Others]):-
				N=\=Y,
				(N-Y)=\=(M-X),
				(N-Y)=\=(X-M),
				no_attack((X,Y),Others).


our_member(X,[X|_]).
our_member(X,[_|Rest]):-
			our_member(X,Rest).



board(L,L).


select(H,[H|T],T).
select(X,[H|T],[H|T1]):-
			select(X,T,T1).

