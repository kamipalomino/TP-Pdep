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

mago(Mago, Objeto, Color):- protagonista(mago(Mago, Objeto, Color)).

%amigo(Amigo, OtroAmigo).
amigo(humano(lothar), humano(llane)).
amigo(Mago1, Mago2):-
  mago(Mago1,_,_), mago(Mago2,_,_),
  Mago1 \= Mago2,
  Mago1 \= guldan, Mago2 \= guldan.

%esBueno(Alguien)
