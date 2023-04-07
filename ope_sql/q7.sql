-- Problem Statement: 
-- Q003flisdb: Write an SQL query to find player name, team name, team ID, manager name and date of birth of manager 
-- of each player whose jersey number is 49.
-- [Database: FLIS] flisdb:


select players.name, teams.name, teams.team_id, managers.name, managers.dob
from teams
join players on players.team_id = teams.team_id
join managers on managers.team_id = teams.team_id
where players.jersey_no=49;