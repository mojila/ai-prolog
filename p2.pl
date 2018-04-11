noun([N], katabenda(N)) :-
	member(N,[saya, aku, kamu, dia, kami, mereka, kalian, kita]).


verb([V], katakerja(V)) :-
	member(V,[makan, minum]).

sentence(S, kalimat(NPTree,VPTree) ) :-
	append(N,V,S),
	noun(N, NPTree),
	verb(V, VPTree).
	


