inner_product([],[],[]).
inner_product([],[H|T],[X|T1]):-
					X is H*0,
					inner_product([],T,T1).
inner_product([H|T],[],[X|T1]):-
					X is H*0,
					inner_product(T,[],T1).
inner_product([A|T1],[B|T2],[X|T]):-
					X is A*B,
					inner_product(T1,T2,T).

