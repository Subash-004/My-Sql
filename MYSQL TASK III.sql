create database mysql_task;
use mysql_task;

create table students(id int auto_increment,first_name varchar(10),last_name varchar(10),age int,email text,primary key(id));


insert into students (first_name, last_name, age,email) values ('manoj','kumar',21,'kumar@gmail.com');
insert into students (first_name, last_name, age,email) values ('sri','ram',18,'sri@gmail.com');
insert into students (first_name, last_name, age,email) values ('pandi','muthu',20,'pandi@gmail.com');
insert into students (first_name, last_name, age,email) values ('naveen','kumar',26,'naveen@gmail.com');
insert into students (first_name, last_name, age,email) values ('prem','kumar',21,'prem@gmail.com');
insert into students (first_name, last_name, age,email) values ('prem','SAN',21,'san@gmail.com');
insert into students (first_name, last_name, age,email) values ('arun','kumar',29,'san@gmail.com');
select * from mysql_task.students;

select * from mysql_task.students;


select * from students where students.age>20;

select * from students where email like '%gmail.com';

select id,first_name,last_name,age from students where age in (select min(age) from students);

select avg(age) as average_age
from students
where age;

create table courses(id int auto_increment,course_name text,instructor text,primary key(id));

INSERT INTO courses (course_name, instructor)
VALUES ('Mathematics', 'manojkumar');
INSERT INTO courses (instructor)
VALUES('sureshkumar');
INSERT INTO courses (course_name,instructor)
VALUES('History', 'naveenkumar');
INSERT INTO courses (course_name,instructor)
VALUES('evs', 'chandran');
INSERT INTO courses (course_name,instructor)
VALUES('evs','karthi');



select * from mysql_task.courses;

select course_name,instructor
from courses;

select id,course_name,instructor
from courses where course_name is not null;

select course_name,count(*) from courses where course_name is not null group by course_name;


SET sql_safe_updates = 0;
UPDATE students SET age = 18 WHERE email = 'sri@gmail.com';

select * from mysql_task.students;

delete from students where students.age<18;
select * from mysql_task.students;

select students.first_name,students.last_name
from students,courses
where students.id=courses.id and courses.course_name is null;

update courses set course_name='not enrollmend'
where course_name is null;
select * from students 
natural join courses;

create table enrollments(
enrollment_id int primary key,
enrollment_course varchar(50)
);

insert into enrollments (enrollment_id,enrollment_course) values (1,'data Science');
insert into enrollments (enrollment_id,enrollment_course) values (2,' Big Data');
insert into enrollments(enrollment_id,enrollment_course) values (3,' Business Intelligence');
insert into enrollments (enrollment_id,enrollment_course) values (4,' data science');
insert into enrollments (enrollment_id,enrollment_course) values (5,' Project Management');



SELECT first_name
FROM students
GROUP BY first_name
HAVING COUNT('students first_name') > 1;

SELECT student_id
FROM enrollments
GROUP BY student_id
HAVING COUNT(DISTINCT course_id) > 1; 


