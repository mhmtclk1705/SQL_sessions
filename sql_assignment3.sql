--Write a query to find the maximum duration among the tracks. Your query should include TrackId, Name, Milliseconds.

SELECT TrackId, name, max(Milliseconds) as max_duration
from tracks;




--Write a query to find the minimum duration among the tracks. Your query should include TrackId, Name, Milliseconds.

SELECT TrackId, name, min(Milliseconds) as min_duration
from tracks;


--Write a query to find the tracks whose bytes are higher than the average of the bytes of all tracks. 
--Your query should include TrackId, Name, Bytes, general average and should be ordered by Bytes from 
--highest to lowest. General average is the average of all tracks. General average should repeat in every row. 
--(Hint: You need to use two subqueries) --   Multiple-Row Subqueries:

SELECT TrackId, name, Bytes
FROM tracks
where Bytes > 
( SELECT avg(bytes)
FROM tracks)
ORDER by Bytes DESC;

--Write a query that returns the customers whose sales representatives 
--are Jane Peacock and Margaret Park. Your query should include CustomerID, First Name 
--and Last Name of the customers.


--Rewrite the subquery above using the JOIN.

--   DDL (CREATE, ALTER, DELETE) and DML (SELECT, INSERT, UPDATE, DELETE) Statements

--Create a table inside the chinook database. This table tracks the employees’ courses inside the organization. Your table should have the followings features:

--               Name of the table: courses
--               Columns:
--                    CourseId (Primary Key)
 --                   CourseName (Cannot be null)
 --                   EmployeeId (Foreign Key - Refers to EmployeeId of employees table ) 
 --                   CoursePrice

 --     2. Insert at least 5 rows into the courses table. Your EmployeeId should contain the values of the EmployeeId column on the employees table. You’re free to choose any values for other columns (CourseId, CourseName, CoursePrice)
--Delete the last row of your courses table.

--Add a new column to your courses table named StartDate. The new column cannot be null.

--Delete the CoursePrice column.

--Delete the courses table.