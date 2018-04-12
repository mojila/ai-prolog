%%  kata-kata                                           :

kataketeranganwaktu([KW], keteranganwaktu(KW))          :-
    member(KW, [sedang,akan,baru]).

katakerja([V], verba(V))                                :-
    member(V, [tidur,muncul,datang,makan,selesai,beli,
    renang,main]).

kataketerangan([AV], adverbia(AV))                      :-
    member(AV, [tidak,sangat,cukup,sekali,sudah]).

katabenda([N], nomina(N))                               :-
    member(N, [rumah,kayu,sepatu,kaca,
    lemari,besi,buku,gambar,mahal,pasar,kaki,kuda,ibu,
    sayur,bayam,orang]).

katasifat([AJ], adjektiva(AJ))                          :-
    member(AJ, [baik,hebat,cepat,lumayan,dekat,hitam,
    tua]).

katadepan([PP], preposisi(PP))                          :-
    member(PP, [dari,ke,dengan,di]).

kataganti([PN], pronomina(PN))                          :-
    member(PN, [sana,saya,aku]).

katasambung([KJ], konjungsi(KJ))                        :-
    member(KJ, [oleh,dan]).

%% frasa biasa                                          :

frasa_nominal(FN, frasanominal(NOMINA1, NOMINA2))       :-
    append(N1, N2, FN),
    katabenda(N1, NOMINA1),
    katabenda(N2, NOMINA2).

frasa_biasa_sederhana(FBS, frasabiasasederhana(VERBA, FRASANOMINAL)):-
    append(V, FN, FBS),
    katakerja(V, VERBA),
    frasa_nominal(FN, FRASANOMINAL).

%%  frasa verbal                                        :

frasa_verbal(FV, frasaverbal(KETERANGANWAKTU, VERBA)):-
    append(KW, V, FV),
    kataketeranganwaktu(KW, KETERANGANWAKTU),
    katakerja(V, VERBA).

%%  frasa nominal                                       :

%%  frasa adjektiva                                     :

%%  frasa idiomatik                                     :

%%  frasa endosentris   :

%%  frasa kata kerja majemuk    :

frasa_majemuk(FM, frasamajemuk(KONJUNGSI, VERBA)):-
    append(KJ, V, FM),
    katasambung(KJ, KONJUNGSI),
    katakerja(V, VERBA).

frasa_kata_kerja_rumit(FKKR, frasakatakerjarumit(FRASAVERBAL, FRASAMAJEMUK)):-
    append(FV, FM, FKKR),
    frasa_verbal(FV, FRASAVERBAL),
    frasa_majemuk(FM, FRASAMAJEMUK).

%% sentence kata kerja majemuk  :

    sentence(S, frasa_kata_kerja_majemuk(PRONOMINA, FRASAKATAKERJARUMIT)):-
    append(PN, FKKR, S),
    kataganti(PN, PRONOMINA),
    frasa_kata_kerja_rumit(FKKR, FRASAKATAKERJARUMIT).

%% sentence frasa biasa :

    sentence(S, frasa_biasa(NOMINA, FRASABIASASEDERHANA))   :-
    append(N, FBS, S),
    katabenda(N, NOMINA),
    frasa_biasa_sederhana(FBS, FRASABIASASEDERHANA).

%%  sentence frasa verbal                               :

    sentence(S, frasa_verbal(KETERANGANWAKTU, VERBA))       :-
    append(KW, V, S),
    kataketeranganwaktu(KW, KETERANGANWAKTU),
    katakerja(V, VERBA).

    sentence(S, frasa_verbal(ADVERBIA, VERBA))              :-
    append(AV, V, S),
    kataketerangan(AV, ADVERBIA),
    katakerja(V, VERBA).

    sentence(S, frasa_verbal(PRONOMINA, VERBA))             :-
    append(PN, V, S),
    kataganti(PN, PRONOMINA),
    katakerja(V, VERBA).

%% sentence frasa nominal                               :
    
    sentence(S, frasa_nominal(NOMINA1, NOMINA2)):-
    append(N1, N2, S),
    katabenda(N1, NOMINA1),
    katabenda(N2, NOMINA2).

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

%% sentence frasa endosentris   :

    sentence(S, frasa_endosentris(NOMINA, ADJEKTIVA)):-
    append(N,AJ,S),
    katabenda(N, NOMINA),
    katasifat(AJ, ADJEKTIVA).

    sentence(S, frasa_endosentris(ADVERBIA, VERBA)):-
    append(AV,V,S),
    kataketerangan(AV, ADVERBIA),
    katakerja(V, VERBA).

