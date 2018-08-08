
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
