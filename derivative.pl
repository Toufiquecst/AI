derivative(Poly,Derivation,X):-
					polynomial(Poly,X),
					ddx(Poly,Derivation,X).





polynomial(X,X):-	!.
polynomial(Term,X):-
			number(Term),
			!.
polynomial(Term1+Term2,X):-
				polynomial(Term1,X),
				polynomial(Term2,X),
				!.
polynomial(Term1-Term2,X):-
				polynomial(Term1,X),
				polynomial(Term2,X),
				!.
polynomial(Term1*Term2,X):-
				polynomial(Term1,X),
				polynomial(Term2,X),
				!.
polynomial(Term1/Term2,X):-
				polynomial(Term1,X),
				polynomial(Term2,X),
				!.
polynomial(Term1^N,X):-
				polynomial(Term1,X),
				number(N),
				!.




ddx(N,0,X):-
			number(N),
			!.
ddx(X,1,X):-	!.
ddx(N*X,N,X):-
			number(N),
			!.
ddx(X*N,N,X):-
			number(N),
			!.
ddx(Term^N,N*Term,X):-
				N=2,
				!.
ddx(Term^N,N*Term^N1,X):-
				N1 is N-1,
				!.
ddx(N*Term^M,N1*Term,X):-
				M=2,
				N1 is N*M,
				!.
ddx(N*Term^M,N1*Term^M1,X):-
				M1 is M-1,
				N1 is N*M,
				!.
ddx(Term1+Term2,Dt1,X):-
				number(Term2),
				derivative(Term1,Dt1,X),
				!.
ddx(Term1+Term2,Dt1+Dt2,X):-
				derivative(Term1,Dt1,X),
				derivative(Term2,Dt2,X),
				!.
ddx(Term1-Term2,Dt1,X):-
				number(Term2),
				derivative(Term1,Dt1,X),
				!.
ddx(Term1-Term2,Dt1-Dt2,X):-
				derivative(Term1,Dt1,X),
				derivative(Term2,Dt2,X),
				!.
				
