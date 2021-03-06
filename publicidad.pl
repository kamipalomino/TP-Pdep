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
marca(youtube).
publicidad(Publicidad):- tipoDePublicidad(_, Publicidad).


%Punto 2
%tipoDePublicidad(bmw,_)
%tipoDePublicidad(Marca, sexy(70)).

:- begin_tests(tipoDePublicidad).
  test(bmwNoSePublicita):-
   not(tipoDePublicidad(bmw,_)).
  test(marcaSexy70Es212):-
    tipoDePublicidad(Marca, sexy(70)), Marca == 212.
:- end_tests(tipoDePublicidad).

%Punto
seCopian(Marca1, Marca2):-
  tipoDePublicidad(Marca1, Publicidad),
  tipoDePublicidad(Marca2, Publicidad),
  Marca1 \= Marca2.

%Punto 4

esLlegadora(disruptiva(T)):-
   publicidad(disruptiva(T)).

esLlegadora(sexy(PorcentajePielDescubierta)):-
  publicidad(sexy(PorcentajePielDescubierta)),
  PorcentajePielDescubierta > 60.

  %Punto 5
campaniaLlegadora(Marca):-
  forall(tipoDePublicidad(Marca, Publicidad), esLlegadora(Publicidad)).

%Punto 6
tieneExitarantizado(Marca):-
  campaniaLlegadora(Marca),
  not(seCopian(Marca,_)).

%Punto 7
podemosAsesorar(Empresa):-
   forall(marca(Empresa), not(esLlegadora(Empresa))),
   marca(Empresa).


%Punto 8
%valen(Precio, Publicidad).
valen(200, sexy(PorcentajePielDescubierta)):-
  PorcentajePielDescubierta > 30,
  PorcentajePielDescubierta < 70.
valen(100, sexy(PorcentajePielDescubierta)).

valen(500, disruptiva(_)).
valen(Precio, tranqui(Personas, Escenario)):-
  Escenario \= guerra,
  Precio is 30*Personas.

valen(Precio, tranqui(Personas, guerra)):-
  Precio is 45*Personas.
%Punto 8
%valen(Precio, Publicidad).
valen(200, sexy(PorcentajePielDescubierta)):-
  PorcentajePielDescubierta > 30,
  PorcentajePielDescubierta < 70.
valen(100, sexy(PorcentajePielDescubierta)).

valen(500, disruptiva(_)).
valen(Precio, tranqui(Personas, Escenario)):-
  Escenario \= guerra,
  Precio is 30*Personas.

valen(Precio, tranqui(Personas, guerra)):-
  Precio is 45*Personas.

elMejor(Marcas, MayorGasto):-
  tipoDePublicidad(Marcas, Publicidad),
  maplist(valen, Precio, Publicidad),
  sumlist(Precio, Gastos),
  Gastos > 0.

elMejor(Marcas, Gastos):-
  elMejor(Marcas, Gastos).
