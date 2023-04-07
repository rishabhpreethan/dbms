-- Problem Statement: 
-- Q010university: Write an SQL query to find the name of the department 
-- where 'Latin' is the course title. 
-- [Database: University] university:


select department.dept_name
from department
join course on course.dept_name = department.dept_name
where course.title = 'Latin';