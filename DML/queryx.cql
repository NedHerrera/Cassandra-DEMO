use Cassandra_LaLiga;

 CREATE TABLE match_local (
	match_date text,
	season text,
	game_date_number int,
	local_team text,
	visiting_team text,
	PRIMARY KEY (local_team, season)
 ) WITH CLUSTERING ORDER BY(season asc);

  CREATE TABLE match_visiting (
	match_date text,
	season text,
	game_date_number int,
	local_team text,
	visiting_team text,
	PRIMARY KEY (visiting_team , season)
 ) WITH CLUSTERING ORDER BY(season asc);


 CREATE TABLE score (
        season text,
        game_date_number int,
        local_team text,
        visiting_team text,
        local_team_score int,
        visiting_team_score int,
        PRIMARY KEY ((local_team,visiting_team) , season)
 ) WITH CLUSTERING ORDER BY(season asc);


  CREATE TABLE big_victory (
        match_date text,
        season text,
        game_date_number int,
        local_team text,
        visiting_team text,
        local_team_score int,
        visiting_team_score int,
        PRIMARY KEY ((local_team_score, visiting_team_score) , season)
 ) WITH CLUSTERING ORDER BY(season asc);


-- 1
-- Partidos de X Temporada donde Y equipo ha jugado como local
-- Respuesta:
-- select * from match_local where season = 'XXXX-YYYY' and local_team = 'ZZZZ';

select *
from match_local 
where season = '1979-1980'
and local_team = 'Betis'
;

-- 2
--  Partidos de X Temporada donde Y equipo ha jugado como visitante
-- Respuesta:
-- select * from match_local where season = 'XXXX-YYYY' and local_team = 'ZZZZ';

select *
from match_visiting
where season = '1981-1982'
and visiting_team = 'Osasuna';