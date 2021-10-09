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

select *
from big_victory
where season = '1979-1980'
order by local_team_score DESC
limit 1
;


-- 5
-- Rival de X equipo para Y jornada de Z temporada 

select local_team as "Equipo seleccionado", visiting_team as "Rival de jornada", game_date_number as "Jornada", match_date as "Dia de partido", season
from rival
where 
local_team in ('Zaragoza')
and season = '1979-1980'
and game_date_number = 3
;