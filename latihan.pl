katabenda([N],nomina(N)):-
    member(N,[bola,ayam]).
katapengganti([PN],pronomina(PN)):-
    member(PN,[aku,dia,kamu]).
katakerja([V],verba(V)):-
    member(V,[makan,tendang]).
katasifat([A],adjektiva(A)):-
    member(A,[cantik,jelek,ganteng]).
katapenghubung([K],konjungsi(K)):-
    member(K,[ini,itu]).
    
frasakatakerja(FV,fkk(VERBA,NOMINA)):-
    katakerja(V,VERBA),katabenda(N,NOMINA),append(V,N,FV).
frasakatasifat(FA,fks(KONJUNGSI,ADJEKTIVA)):-
    katapenghubung(K,KONJUNGSI),katasifat(A,ADJEKTIVA),append(K,A,FA).
    
sentence(S,kalimat(PRONOMINA,FKK)):-
    katapengganti(PN,PRONOMINA),
    frasakatakerja(FV,FKK),
    append(PN,FV,S).
sentence(S,kalimat(PRONOMINA,FKS)):-
    katapengganti(PN,PRONOMINA),
    frasakatasifat(FA,FKS),
    append(PN,FA,S).