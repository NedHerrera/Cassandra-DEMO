-- CREATE KEYSPACE Cassandra_LaLiga WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : '1'};
use Cassandra_LaLiga;

 CREATE TABLE match (
	match_date date,
	season text,
	game_date_number int,
	local_team text,
	visiting_team text,
	PRIMARY KEY ((local_team,visiting_team) , season)
 ) WITH CLUSTERING ORDER BY(game_date_number asc);


 CREATE TABLE score (
        season text,
        game_date_number int,
        local_team text,
        visiting_team text,
        local_team_score int,
        visiting_team_score int,
        PRIMARY KEY ((local_team,visiting_team) , season)
 ) WITH CLUSTERING ORDER BY(game_date_number asc);


  CREATE TABLE big_victory (
        match_date date,
        season text,
        game_date_number int,
        local_team text,
        visiting_team text,
        local_team_score int,
        visiting_team_score int,
        PRIMARY KEY ((local_team_score, visiting_team_score) , season)
 ) WITH CLUSTERING;