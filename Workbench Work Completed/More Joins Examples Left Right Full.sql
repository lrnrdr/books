CREATE DATABASE teachers;
USE teachers;
CREATE TABLE subject(SubjectID INT PRIMARY KEY NOT NULL, SubjectName VARCHAR(20));
CREATE TABLE teacher(LastName VARCHAR(20), SubjectID INT REFERENCES department(DepartmentID));
INSERT INTO subject
VALUES (1, 'Science'), (2, 'Math'), (3, 'English'), (4, 'SocialStudies');
INSERT INTO teacher
VALUES ('Smith', 2), ('Ramirez', 2), ('Taylor', 3), ('Brigman', 4), ('Rutland', NULL), ('Jackson', 2);

SELECT * FROM subject;

SELECT * FROM teacher;

-- INNER JOIN PRACTICE
-- Try an inner join that selects the last name of the teacher and the name of their subject. Note that we have used aliasing for the table names

SELECT t.LastName, s.SubjectName 
FROM teacher AS t
INNER JOIN subject as s
ON t.SubjectID = s.subjectID;

-- Notice that the above results do not include the teacher named Rutland because they have a NULL value for SubjectID.
-- This may not be the result you wanted. What if you wanted to include all the names of the teachers and their subject, 
-- but also want to include the names of teachers who are not associated with a subject?

-- LEFT OUTTER JOIN/ 1st table (can see NULLS too)
--  a LEFT JOIN allows us to list all of the teachers and show their subject, as well as include the teachers who do not have a subject.

SELECT t.LastName, s.SubjectName 
FROM teacher AS t
LEFT JOIN subject as s
ON t.SubjectID = s.subjectID;

-- RIGHT OUTER JOIN / 2nd table (SHOWS NULLS OF THE 2ND TABLE (TEACHER) TOO)
--  SELECT t.LastName, s.SubjectName 

SELECT t.LastName, s.SubjectName 
FROM teacher AS t
RIGHT JOIN subject as s
ON t.SubjectID = s.subjectID;

-- Full Outer Joins using UNION with a Left and Right Join

SELECT teacher.LastName, subject.SubjectName
FROM teacher 
LEFT JOIN subject
ON teacher.SubjectID = subject.SubjectID
UNION 
SELECT teacher.LastName, subject.SubjectName
FROM teacher
RIGHT JOIN subject ON teacher.SubjectID = subject.SubjectID;

-- Notice that you have all of the teachers and all of the subjects despite NULL values appearing in each column.


