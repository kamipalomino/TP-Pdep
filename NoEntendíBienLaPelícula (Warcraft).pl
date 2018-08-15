:- encoding(utf8).

%Base de conocimientos

protagonista(mago(khadgar, piedra, azul)).
protagonista(mago(medivh, báculo, mixto)).
protagonista(mago(guldan, báculo, verde)).
protagonista(orco(durotan, rosita)).
protagonista(orco(garona, verde)).
protagonista(humano(lothar)).
protagonista(humano(llane)).
protagonista(murloc(pepe)).

actoHeroico(mago(medivh, báculo, mixto), abrePortalAzulHastaMorir).
actoHeroico(orco(garona, verde), mataASerQueridoParaGenerarPaz).
actoHeroico(humano(lothar), leGanaAlMaloVerde).
actoHeroico(humano(llane), daSuVida).

seLaMandó(mago(medivh, báculo, mixto), mató).
seLaMandó(mago(medivh, báculo, mixto), dejóQueMueranSolados).
seLaMandó(mago(medivh, báculo, mixto), creóGiganteAsesino).
seLaMandó(mago(guldan, báculo, verde), mató).
seLaMandó(mago(guldan, báculo, verde), hizoTrampaEnPelea).
seLaMandó(mago(guldan, báculo, verde), causóGuerra).
seLaMandó(mago(guldan, báculo, verde), deforestó).
seLaMandó(orco(garona, verde), losLlevóAUnaEmboscada).
seLaMandó(humano(lothar), dejóQuePeleeSuHijo).
seLaMandó(humano(llane), leHizoCasoAmedivh).
seLaMandó(murloc(pepe), mató).

tieneAltoBicho(humano(llane), pajarito).
tieneAltoBicho(orco(durotan, rosita), perrito).

%amigo(Amigo, OtroAmigo).
amigo(humano(lothar), humano(llane)).
amigo(Mago1, Mago2):-
  magoDistintoAGulan(Mago1),
  magoDistintoAGulan(Mago2),
  Mago1 \= Mago2.

magoDistintoAGulan(mago(Nombre, Objeto, ColorDeMagia)):-
  protagonista(mago(Nombre, Objeto, ColorDeMagia)),
  Nombre \= guldan.

esBueno(Protagonista):- seLaMandóUnaVez(Protagonista).
esBueno(Protagonista):- nuncaSeLaMandó(Protagonista).
esBueno(murloc(Nombre)):- seLaMandóUnaVez(murloc(Nombre)).
esBueno(mago(Nombre, Objeto, ColorDeMagia)):-
  actoHeroico(mago(Nombre, Objeto, mixto), _).

nuncaSeLaMandó(Protagonista):- not(seLaMandó(Protagonista, Lio)).

seLaMandóUnaVez(Protagonista):-
    seLaMandó(Protagonista, Lío1),
    not((seLaMandó(Protagonista, Lío2), Lío1 \= Lío2)).


nivelNecesarioPara(Macana, Nivel):-


nivelesDeMagos(mago(Nombre,Objeto,ColorDeMagia), Nivel):-
  protagonista(mago(Nombre, Objeto, ColorDeMagia)),
  nivelesPorColorDeMagia(ColorDeMagia, NivelBase),
  plusPorObjeto(Objeto, NivelBase, Nivel).

plusPorObjeto(báculo, NivelBase, Nivel):-
  Nivel is NivelBase * 2.

plusPorObjeto(Objeto, NivelBase, Nivel):-
  protagonista(mago(_, Objeto,_)),
  Objeto \= báculo,
  Nivel is NivelBase * 1.

nivelesPorColorDeMagia(azul, 1).
nivelesPorColorDeMagia(verde, 2).
nivelesPorColorDeMagia(mixto, 3).


relaciona una macana que alguien se mandó con el nivel necesario para mandársela.
El nivel necesario es el más bajo entre los protagonistas que se mandaron esa macana.
Si usan báculo, se duplica.
    Los murlocs siempre tienen nivel 1.
    El resto, no tienen poderes mágicos, así que será 0.
    ?- nivelNecesarioPara(mató,Nivel).
    Nivel = 1  % Porque medivh tiene nivel 6, guldan 4 y pepe 1.
