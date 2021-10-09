use Cassandra_LaLiga;

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
-- select * from score where local_team in ('Y','Z') and visiting_team in ('Y','Z') and season = 'XXX1-XXX2';

select *
from score
where 
local_team in ('Zaragoza','Betis') and visiting_team in ('Zaragoza','Betis')
and season = '1979-1980'
;


-- 4
-- Partido donde se registre la victoria más abultada de X temporada
-- Respuesta
-- 

-- :(



-- 5
-- Rival de X equipo para Y jornada de Z temporada 

  CREATE TABLE rival (
        match_date text,
        season text,
        game_date_number int,
        local_team text,
        visiting_team text,
        local_team_score int,
        visiting_team_score int,
        PRIMARY KEY ((local_team, visiting_team, season, game_date_number) , match_date)
 ) WITH CLUSTERING ORDER BY(match_date asc);
 

select *
from rival
where 
local_team in ('Zaragoza') and visiting_team in ('Zaragoza')
and season = '1979-1980'
and game_date_number = 4
;