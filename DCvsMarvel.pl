habilidad(superman,bardero([correForestCorre,soyGrosoYQue,rayitosVisuales, alientoAquafresh, vuelaVuela, miraCorpinios])).
habilidad(flash,velocista(300)).
habilidad(batman,porArtefacto([artefacto(batarang,20),
  artefacto(batarangExplosivo,50), artefacto(baticinturon,250),
  artefacto(capa,80), artefacto(batidora,30),
  artefacto(batigancho,50), artefacto(alfred,800),
  artefacto(robin,10), artefacto(batimovil,700)])).
  % (A la cátedra le gusta Batman)
habilidad(laMujerMaravilla,bardero([superFuerza, ligerona, brazaletesAntiBalas,lazoDeLaVerdad])).
habilidad(linternaVerde,porArtefacto([artefacto(anillo,600)])).
habilidad(ironMan,porArtefacto([artefacto(casco,50), artefacto(armadura,400)])).
habilidad(spiderman,bichoDeLaboratorio).
habilidad(hulk,bichoDeLaboratorio).
habilidad(capitanAmerica,bichoDeLaboratorio).
habilidad(punisher,bardero([seLaBanca])).
%Donde las habilidades son individuos de esta forma:
% bardero(poderes)
% velocista(velocidaMaxima) ­> velocidad medida en km/s
% porArtefacto(artefactos)
% bichoDeLaboratorio
%También sabemos a qué equipo pertenece cada superhéroe a través de los siguientes hechos:
equipo(superman,ligaJusticia).
equipo(batman,ligaJusticia).
equipo(flash,ligaJusticia).
equipo(linternaVerde,ligaJusticia).
equipo(laMujerMaravilla,ligaJusticia).
equipo(ironMan,losVengadores).
equipo(spiderman,losVengadores).
equipo(hulk,losVengadores).
equipo(capitanAmerica,losVengadores).


%1
superhéroe(Superhéroe):-
  habilidad(Superhéroe,_).

trabajaSolo(superhéroe(spiderman)).
trabajaSolo(Superhéroe):-
  superhéroe(Superhéroe),
  not(equipo(Superhéroe, Equipo)).
%2
potencia(Superhéroe, PotenciaBardera):-
  habilidad(Superhéroe, bardero(SuperPoder)),
  length(SuperPoder, Potencia),
  PotenciaBardera is Potencia * 20.
potencia(Superhéroe, PotenciaVelocista):-
  habilidad(Superhéroe, velocista(PotenciaVelocista)).
potencia(Superhéroe, PotenciaArtefactos):-
  habilidad(Superhéroe, porArtefacto(member([artefacto(_, Artefactos)]))),
  sumlist(Artefactos, PotenciaArtefactos).
%  PotenciaArtefactos is Artefactos.

potenciaMedia(Equipo, Potencia):-
  promedio()
promedio(Conjunto, Promedio):-
  length(Conjunto, Cantidad),
  sumlist(Conjunto, Suma),
  Promedio is Suma/Cantidad.

% artefactos la determina la suma de valores que le aporta cada artefacto.
%  La potencia de los bichosDeLaboratorio es 200 para todos.
