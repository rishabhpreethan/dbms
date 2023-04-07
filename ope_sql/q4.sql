-- Problem Statement: 
-- Q002flisdb:Write an SQL query to find the names of the guest team 
-- of the match which was played on '2020-05-21'.
-- [Database: FLIS] flisdb:


select teams.name from matches join teams on matches.guest_team_id = teams.team_id WHERE match_date = '2020-05-21';