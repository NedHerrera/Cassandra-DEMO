use Cassandra_LaLiga;


 CREATE TABLE score (
        match_date text,
        season text,
        game_date_number int,
        local_team text,
        visiting_team text,
        local_team_score int,
        visiting_team_score int,
        PRIMARY KEY ((local_team,visiting_team, season) , match_date)
 ) WITH CLUSTERING ORDER BY(match_date asc);


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
-- select * from match_visiting where season = 'XXXX-YYYY' and visiting_team = 'ZZZZ';

select *
from match_visiting 
where season = '1979-1980'
and visiting_team = 'Betis'
;

-- 3 
--  Marcadores finales para los partidos de X temporada donde han participado los equipos Y y Z
--  Marcadores tanto de la primera vuelta como de la segunda
-- Respuesta:
-- 

select *
from score
where local_team = 'Betis'
and visiting_team = 'Zaragoza'
and season = '1979-1980'
;