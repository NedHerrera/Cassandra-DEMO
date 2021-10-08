-- CREATE KEYSPACE Cassandra_LaLiga WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : '1'};
use Cassandra_LaLiga;

 CREATE TABLE match_local (
	match_date text,
	season text,
	game_date_number int,
	local_team text,
	visiting_team text,
	PRIMARY KEY ((season, local_team), match_date )
 ) WITH CLUSTERING ORDER BY(match_date asc);

  CREATE TABLE match_visiting (
	match_date text,
	season text,
	game_date_number int,
	local_team text,
	visiting_team text,
	PRIMARY KEY ((season, visiting_team) , match_date)
 ) WITH CLUSTERING ORDER BY(match_date asc);


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
        PRIMARY KEY ((season, local_team_score) , match_date)
 ) WITH CLUSTERING ORDER BY(match_date asc);


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