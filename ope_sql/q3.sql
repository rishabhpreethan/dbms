-- Problem Statement: 
-- Q003flisdb: Write an SQL query to find the match number where the 
-- host team ID is 'T0004' and the guest team ID is 'T0002'.
-- [Database: FLIS] flisdb:


select match_num from matches where host_team_id='T0004' and guest_team_id='T0002';