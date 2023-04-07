-- Problem Statement: 
-- Q008university: Write an SQL query to find the names of instructors 
-- whose department is in the building 'Taylor', 'Main' or 'Lambeau'. 
-- [Database: University] university:



select instructor.name 
from instructor join department on department.dept_name = instructor.dept_name 
where department.building in ('Taylor','Main','Lambeau')