-- Problem Statement: 
-- Q002flisdb: Write an SQL query to find the player IDs of the 
-- players whose name ends with 'a'.
-- [Database: FLIS] flisdb:


select player_id from players where name like '%a'