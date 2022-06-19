interleaved([],[],[]).
interleaved([],[H|T],[H|T1]):-
					interleaved([],T,T1).
interleaved([H|T],[],[H|T1]):-
					interleaved(T,[],T1).
interleaved([A|T1],[B|T2],[A|[B|T]]):-
					interleaved(T1,T2,T).