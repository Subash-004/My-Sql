create database task_two;
use task_two;
create table students (
student_id int,
student_name varchar(10),
age int,
subjects varchar(10),
score int 
);

insert into students (student_id ,student_name,age,subjects,score) values (1,'siva',21,'math',80);
insert into students (student_id ,student_name,age,subjects,score) values (2,'arun',18,'physics',95);
insert into students (student_id ,student_name,age,subjects,score) values (3,'moorthi',25,'chemistry',90);
insert into students (student_id ,student_name,age,subjects,score) values (4,'priya',22,'math',92);
insert into students (student_id ,student_name,age,subjects,score) values (5,'venu',20,'physics',99);
insert into students (student_id ,student_name,age,subjects,score) values (6,'mano',26,'chemistrey',85);
insert into students (student_id ,student_name,age,subjects,score) values (7,'kumar',19,'math',98);
insert into students (student_id ,student_name,age,subjects,score) values (8,'prem',24,'physice',94);
insert into students (student_id ,student_name,age,subjects,score) values (9,'mathu',27,'chemistrey',83);
select * from students;

-- 1. Find the names of students who have scored higher than the average score in the subject 'Math'.

select student_name
from students
where score > (select avg(score) from students
 having students.subjects='math');
 
 -- 2.Retrieve the names of students who are older than the average age of all students in the same subject.

select student_name
from students
where age > (select avg(age) from students order by subjects);

-- 3. Get the order IDs and total amounts of orders with a total amount greater than the average total amount of all orders.

SHOW TABLES LIKE 'orders';

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    total_amount DECIMAL(10, 2)
);

USE task_two;


insert into orders (order_id,total_amount) value (1,200);
insert into orders (order_id,total_amount) value (2,500);
insert into orders (order_id,total_amount) value (3,400);
insert into orders (order_id,total_amount) value (4,300);
insert into orders (order_id,total_amount) value (5,100);

select * from orders;

SELECT order_id, total_amount
FROM orders
WHERE total_amount > (SELECT AVG(total_amount) FROM orders);

-- 4. list the names of employees who have a salary greater than the average salary of their department.

create table employees (
employee_id int primary key,
employee_name varchar(10),
department_id int,
job_tittle varchar(10),
salary int
);
drop table employees;
insert into employees (employee_id,employee_name,department_id,job_tittle,salary) values (101,'chandran',1,'manager',80000);
insert into employees (employee_id,employee_name,department_id,job_tittle,salary) values (102,'karthi',3,'engineer',60000);
insert into employees (employee_id,employee_name,department_id,job_tittle,salary) values (103,'arun',1,'engineer',55000);

SELECT employee_name
FROM employees
WHERE salary > ALL (SELECT AVG(salary) FROM employees GROUP BY department_id);

-- 5. Retrieve the course names that have at least one student enrolled.

create table courses(
course_id int,
course_name varchar(10)
);

insert into courses (course_id,course_name) value (1,'math');
insert into courses (course_id,course_name) value (2,'physics');
insert into courses (course_id,course_name) value (3,'chemistry');

create table enrollments(
student_id int,
course_id int
);

insert into enrollments (student_id,course_id) values (1,1);
insert into enrollments (student_id,course_id) values (1,2);
insert into enrollments (student_id,course_id) values (2,2);
insert into enrollments (student_id,course_id) values (3,3);

select course_name
from courses
join enrollments on courses.course_id=enrollments.course_id AND enrollments.student_id >0;

-- 6. Find the names of products whose price is higher than the average price of products in their category.

create table products(
product_id int,
product_name varchar(10),
category_id int,
price int
);

insert into products (product_id,product_name,category_id,price) values (1,'laptop',1,800);
insert into products (product_id,product_name,category_id,price) values (2,'smartphone',1,500);
insert into products (product_id,product_name,category_id,price) values (3,'printer',2,200);

select product_name
from  products
where price > ALL (select avg(price) from products  GROUP BY category_id);

-- 7.Retrieve the names of employees who work in the same department as Clara.

create table departments(
department_id int,
department_name varchar(20)
);

insert into departments (department_id,department_name) values (1,'engineering');
insert into departments (department_id,department_name) values (2,'sales');
insert into departments (department_id,department_name) values (3,'marketing');

select employee_name
from employees
where department_id=(select department_id from employees where employee_name='clara');
