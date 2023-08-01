create database mysql_task;
USE mysql_task;
create table students (
id integer primary key auto_increment,
first_name varchar(50),
last_name  varchar(50),
age integer,
email  varchar(50)
);
SELECT first_name, last_name, age, email FROM students;
insert into students (first_name, last_name, age,email) values ('manoj','kumar',21,'kumar@gmail.com');
insert into students (first_name, last_name, age,email) values ('sri','ram',18,'discussion');
insert into students (first_name, last_name, age,email) values ('pandi','muthu',20,'discussion');
insert into students (first_name, last_name, age,email) values ('naveen','kumar',26,'discussion');
insert into students (first_name, last_name, age,email) values ('prem','kumar',21,'discussion');
insert into students (first_name, last_name, age,email) values ('prem','SAN',21,'discussion');
SELECT * FROM students;
SELECT * FROM students WHERE age >= 20;
SELECT * FROM students
WHERE email LIKE 'gmail.com';
SELECT AVG(age) AS average_age FROM students;
SELECT * FROM students
ORDER BY age DESC;
CREATE TABLE courses (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    course_name varchar(50),
    instructor varchar(50)
);
INSERT INTO courses (course_name, instructor)
VALUES
('Mathematics', 'manojkumar'),
('Physics', 'sureshkumar'),
('History', 'naveenkumar'),
('not enrollment','chandran');
SELECT course_name, instructor FROM courses;
SELECT students.id, first_name, last_name FROM students JOIN courses ON students.id = courses.id ;
SELECT course_name, COUNT(1) AS student_count
FROM courses
GROUP BY course_name;
SET sql_safe_updates = 0;
UPDATE students SET age = 21 WHERE email = 'kumar@gmail.com';
DELETE FROM students WHERE id=12345 AND age < 18;
SELECT first_name, last_name, COALESCE(course_name, 'Not Enrolled') AS course_name
FROM students
LEFT JOIN courses ON students.id = courses.id;
SELECT course_name, instructor
FROM courses 
LEFT JOIN enrollments e ON course_name = course_name
WHERE course_name IS NULL;
create table enrollments(
enrollment_id int primary key,
enrollment_course varchar(50)
);
insert into enrollments (enrollment_id,enrollment_course) values (1,'data Science');
insert into enrollments (enrollment_id,enrollment_course) values (2,' Big Data');
insert into enrollments(enrollment_id,enrollment_course) values (3,' Business Intelligence');
insert into enrollments (enrollment_id,enrollment_course) values (4,' data science');
insert into enrollments (enrollment_id,enrollment_course) values (5,' Project Management');
select * from enrollments;
SELECT first_name
FROM students
GROUP BY first_name
HAVING COUNT('students first_name') > 1;
SELECT student_id
FROM enrollments
GROUP BY student_id
HAVING COUNT(DISTINCT course_id) > 1;