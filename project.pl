%%  kata-kata                                           :

kataketeranganwaktu([KW], keteranganwaktu(KW))          :-
    member(KW, [sedang,akan,baru]).

katakerja([V], verba(V))                                :-
    member(V, [tidur,muncul,datang,makan]).

kataketerangan([AV], adverbia(AV))                      :-
    member(AV, [tidak,sangat,cukup,sekali]).

katabenda([N], nomina(N))                               :-
    member(N, [rumah,kayu,sepatu,kaca,
    lemari,besi,buku,gambar,mahal,pasar,kaki]).

katasifat([AJ], adjektiva(AJ))                          :-
    member(AJ, [baik,hebat,cepat,lumayan,dekat]).

katadepan([PP], preposisi(PP))                          :-
    member(PP, [dari,ke,dengan,di]).

kataganti([PN], pronomina(PN))                          :-
    member(PN, [sana,saya]).

katasambung([KJ], konjungsi(KJ))                      :-
    member(KJ, [oleh]).

%%  frasa verbal                                        :

%%  frasa nominal                                       :

%%  frasa adjektiva                                     :

%%  sentence frasa verbal                               :

sentence(S, frasa_verbal(KETERANGANWAKTU, VERBA))       :-
    append(KW, V, S),
    kataketeranganwaktu(KW, KETERANGANWAKTU),
    katakerja(V, VERBA).

sentence(S, frasa_verbal(ADVERBIA, VERBA))              :-
    append(AV, V, S),
    kataketerangan(AV, ADVERBIA),
    katakerja(V, VERBA).

%% sentence frasa nominal                               :
    
    sentence(S, frasa_nominal(NOMINA1, NOMINA2))        :-
    append(N1,N2,S),
    katabenda(N1,NOMINA1),
    katabenda(N2,NOMINA2).

%% sentence frasa adjektiva                             :

    sentence(S, frasa_adjektiva(ADVERBIA, ADJEKTIVA))   :-
    append(AV, AJ, S),
    kataketerangan(AV, ADVERBIA),
    katasifat(AJ, ADJEKTIVA).

    sentence(S, frasa_adjektiva(NOMINA, ADVERBIA))      :-
    append(N, AV, S),
    katabenda(N, NOMINA),
    kataketerangan(AV, ADVERBIA).

    sentence(S, frasa_adjektiva(ADJEKTIVA1, ADJEKTIVA2)):-
    append(AJ1, AJ2, S),
    katasifat(AJ1, ADJEKTIVA1),
    katasifat(AJ2, ADJEKTIVA2).

%% sentence frasa preposisional                         :

    sentence(S, frasa_preposisional(PREPOSISI, PRONOMINA)):-
    append(PP, PN, S),
    katadepan(PP, PREPOSISI),
    kataganti(PN, PRONOMINA).

    sentence(S, frasa_preposisional(PREPOSISI, NOMINA)):-
    append(PP, N, S),
    katadepan(PP, PREPOSISI),
    katabenda(N, NOMINA).

    sentence(S, frasa_preposisional(KONJUNGSI, PRONOMINA)):-
    append(KJ, PN, S),
    katasambung(KJ, KONJUNGSI),
    kataganti(PN, PRONOMINA).
