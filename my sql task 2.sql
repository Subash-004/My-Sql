create database mysql_task;
use mysql_task;
CREATE TABLE students (
    student_id INTEGER PRIMARY KEY,
    first_name varchar(50),
    last_name varchar(50),
    age INTEGER,
    email varchar(50)  
    );
    SELECT * FROM students;
	SELECT student_id, first_name, last_name, age, email FROM students;
     insert into students (student_id ,first_name, last_name, age,email) values (1,'manoj','kumar',21,'kumar@gmail.com');
insert into students (student_id ,first_name, last_name, age,email) values (2,'mari','muthu',21,'mari@gmail.com');
insert into students (student_id ,first_name, last_name, age,email) values (3,'pandi','muthu',21,'pandi@gmail.com');
insert into students (student_id ,first_name, last_name, age,email) values (4,'prem','kumar',21,'prem@gmail.com');
insert into students (student_id ,first_name, last_name, age,email) values (5,'naveen','kumar',26,'naveen@gmail.com');
insert into students (student_id ,first_name, last_name, age,email) values (4,'prem','kumar',21,'prem@gmail.com');
SELECT * FROM students WHERE age >= 20;
 SELECT AVG(age) AS average_age FROM students;
 CREATE TABLE courses (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    course_name varchar(50),
    instructor varchar(50)
);
INSERT INTO courses (course_name, instructor)
VALUES
('Mathematics', 'manojkumar'),
('Physics', 'sureshkumar'),
('History', 'naveenkumar');
select * from mysql_task.courses;
SELECT course_name, instructor FROM courses;
SELECT student_id, first_name, last_name
FROM students 
JOIN courses  ON student_id = student_id;
SELECT course_name, COUNT(1) AS student_count
FROM courses
GROUP BY course_name;
SET sql_safe_updates = 0;
UPDATE students SET age = 22 WHERE email = 'mari@gmail.com';
DELETE FROM students WHERE age < 21;
SELECT first_name, last_name
FROM students 
LEFT JOIN courses  ON student_id = student_id
WHERE student_id IS NULL;
SELECT first_name, last_name, COALESCE(course_name, 'Not Enrolled') AS course_name
FROM students 
LEFT JOIN courses  ON student_id = student_id;
SELECT course_name, instructor
FROM courses 
LEFT JOIN enrollments e ON course_name = course_name
WHERE course_name IS NULL;
SHOW TABLES FROM mysql_task;
CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    enrollment_course VARCHAR(255) 
);
select * from mysql_task.enrollments;
insert into enrollments (enrollment_id,enrollment_course) values (1,'Data Science');
insert into enrollments (enrollment_id,enrollment_course) values (2,' Big Data');
insert into enrollments (enrollment_id,enrollment_course) values (3,' Business Intelligence');
insert into enrollments (enrollment_id,enrollment_course) values (4,' Cloud Computing');
insert into enrollments (enrollment_id,enrollment_course) values (5,' Project Management');
SELECT first_name
FROM students
GROUP BY first_name
HAVING COUNT('students first_name') > 1;