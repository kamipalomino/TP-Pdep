
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

:- begin_test(tipoDePublicidad).
  test(bmwNoSePublicita):-
   not(tipoDePublicidad(bmw,_)).
  test(marcaSexy70Es212):-
    tipoDePublicidad(Marca, sexy(70)).
    Marca is 212.
:-end_test(tipoDePublicidad).
