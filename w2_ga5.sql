--  Problem Statement: 
-- Q001lisdb: Write an SQL statement to find the first names of faculty (faculty_fname) 
-- who belong to the department: 'Mechanical Engineering'.[Database: LIS] lisdb: 

select faculty_fname from faculty where department_code='ME';