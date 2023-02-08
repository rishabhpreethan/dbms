--  Problem Statement: 

-- Q002lisdb: Write an SQL statement to find the first names and the roll number (student_fname, roll_no) 
-- of students who belong to the department
-- with department code as 'CS' and who were born after '2002-06-15'.[Database: LIS] lisdb: 

select student_fname,roll_no from students where department_code='CS' and dob>'2002-06-15';