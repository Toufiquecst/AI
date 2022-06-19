avl_insert(nil,X,t(nil,X,nil)).
avl_insert(t(Left,Root,Right),X,T):-
						addleaf(t(Left,Root,Right),X,T1),
						rotation(T1,X,T).




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






rotation(t(nil,X,nil),_,t(nil,X,nil)):-!.
rotation(t(Left,Root,Right),X,T):-
					X=<Root,
					not(balanced(t(Left,Root,Right))),
					balanced(Left),
					!,
					left_rotation(t(Left,Root,Right),X,T).
rotation(t(Left,Root,Right),X,t(Left1,Root,Right)):-
					X=<Root,
					rotation(Left,X,Left1).
rotation(t(Left,Root,Right),X,T):-
					X>Root,
					not(balanced(t(Left,Root,Right))),
					balanced(Right),
					!,
					right_rotation(t(Left,Root,Right),X,T).
rotation(t(Left,Root,Right),X,t(Left,Root,Right1)):-
					X>Root,
					rotation(Right,X,Right1).




left_rotation(t(Left,Root,Right),X,T):-
					root(Left,Y),
					X=<Y,
					!,
					left_to_left(t(Left,Root,Right),X,T).
left_rotation(t(Left,Root,Right),X,T):-
					root(Left,Y),
					X>Y,
					!,
					left_to_right(t(Left,Root,Right),X,T).



right_rotation(t(Left,Root,Right),X,T):-
					root(Right,Y),
					X>Y,
					!,
					right_to_right(t(Left,Root,Right),X,T).
right_rotation(t(Left,Root,Right),X,T):-
					root(Right,Y),
					X=<Y,
					!,
					right_to_left(t(Left,Root,Right),X,T).






left_to_left(t(Left,Root,Right),X,t(Lleft,Y,t(Rleft,Root,Right))):-
											right_tree(Left,Rleft),
											left_tree(Left,Lleft),
											root(Left,Y).


right_to_right(t(Left,Root,Right),X,t(t(Left,Root,Lright),Y,Rright)):-
											right_tree(Right,Rright),
											left_tree(Right,Rleft),
											root(Right,Y).




left_to_right(t(Left,Root,Right),X,T):-
							right_to_right(Left,X,T1),
							left_to_left(t(T1,Root,Right),X,T).

right_to_left(t(Left,Root,Right),X,T):-
							left_to_left(Right,X,T1),
							right_to_right(t(Left,Root,T1),X,T).






balanced(t(Left,Root,Right)):-
					our_height(Left,Hl),
					our_height(Right,Hr),
					near(Hl,Hr).


our_height(nil,0).
our_height(t(Left,Root,Right),H):-
			our_height(Left,LH),
			our_height(Right,RH),
			max(LH,RH,MH),
			H is MH+1.

max(X,Y,X):-	Y<X.
max(X,Y,Y):-	X=<Y.


near(X,Y):-	
		X>=Y,
		!,
		(X-Y)=<1.
near(X,Y):-	
		Y>X,
		(Y-X)=<1.




root(nil,nil).
root(t(_,R,_),R).

left_tree(t(L,_,_),L).

right_tree(t(_,_,R),R).






















