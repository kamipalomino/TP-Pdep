:- encoding(utf8).
%sexy(PorcentajePielDescubierta).
%disruptiva(Tema).
%tranqui(Personas, Escenario).

%tipoDePublicidad(Marca, Publicidad).

%Punto 1
tipoDePublicidad(212, sexy(70)).
tipoDePublicidad(netflix, disruptiva(política)).
tipoDePublicidad(netflix, tranqui(4, habitación)).

marca(Marca):- tipoDePublicidad(Marca, _).
publicidad(Publicidad):- tipoDePublicidad(_, Publicidad).


%Punto 2
%tipoDePublicidad(bmw,_)
%tipoDePublicidad(Marca, sexy(70)).

:- begin_tests(tipoDePublicidad, nondet).
  test(bmwNoSePublicita):-
   not(tipoDePublicidad(bmw,_)).
  test(marcaSexy70Es212):-
    tipoDePublicidad(Marca, sexy(70)), Marca == 212.
:- end_tests(tipoDePublicidad).

%Punto 3
seCopian(Marca1, Marca2):-
  tipoDePublicidad(Marca1, Publicidad),
  tipoDePublicidad(Marca2, Publicidad),
  Marca1 \= Marca2.
