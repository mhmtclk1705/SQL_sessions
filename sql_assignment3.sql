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

SELECT CustomerId,FirstName,LastName
FROM customers
WHERE SupportRepId IN ( SELECT EmployeeId
                        FROM employees
                        WHERE FirstName IN ('Jane','Margaret') and LastName IN('Peacock','Park'));


--Rewrite the subquery above using the JOIN.

SELECT c.CustomerId,c.FirstName,c.LastName
FROM customers c
JOIN employees e
ON c.SupportRepId = e.EmployeeId
WHERE e.FirstName IN ('Jane','Margaret') and e.LastName IN('Peacock','Park');

--   DDL (CREATE, ALTER, DELETE) and DML (SELECT, INSERT, UPDATE, DELETE) Statements

--Create a table inside the chinook database. This table tracks the employees’ courses inside the organization. Your table should have the followings features:

--               Name of the table: courses
--               Columns:
--                    CourseId (Primary Key)
 --                   CourseName (Cannot be null)
 --                   EmployeeId (Foreign Key - Refers to EmployeeId of employees table ) 
 --                   CoursePrice

CREATE TABLE courses 
(   CourseId INT,
    CourseName TEXT DEFAULT 'NONAME',
    EmployeeId INT,
    CoursePrice REAL,
    PRIMARY KEY(CourseId),
    FOREIGN KEY(EmployeeId) REFERENCES employees(EmployeeId));

 --     2. Insert at least 5 rows into the courses table. Your EmployeeId should contain the values of the EmployeeId column on the employees table. You’re free to choose any values for other columns (CourseId, CourseName, CoursePrice)

INSERT INTO courses
VALUES      (1,'FullStack',1,1200),
            (2,'DataScience',2,1300),
            (3,'AWS',3,1400),
            (4,'DevOps',4,1500),
            (5,'CyberSecurity',5,1600);

--Delete the last row of your courses table.

DELETE 
FROM courses 
WHERE CourseId = (  SELECT max(CourseId) 
                    FROM courses);

--Add a new column to your courses table named StartDate. The new column cannot be null.

ALTER TABLE courses
ADD COLUMN StartDate DATE NOT NULL DEFAULT 0;

--Delete the CoursePrice column.

ALTER TABLE courses
DROP COLUMN CoursePrice;

--Delete the courses table.

DROP TABLE courses;