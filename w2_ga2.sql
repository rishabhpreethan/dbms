-- Problem Statement: 
-- Q002flisdb: Write an SQL statement to find the team id and name 
-- of the team whose home-jersey color(jersey_home_color) is 'Black'..[Database: FLIS] flisdb: 

select team_id,name from teams where jersey_home_color='Black';