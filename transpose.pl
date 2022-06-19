transpose([],[],[]).
transpose([],[H|T],[(H)|T1]):-
					transpose([],T,T1).
transpose([H|T],[],[(H)|T1]):-
					transpose(T,[],T1).
transpose([A|T1],[B|T2],[(A,B)|T]):-
					transpose(T1,T2,T).
