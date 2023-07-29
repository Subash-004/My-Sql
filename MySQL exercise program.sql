CREATE DATABASE food;
use food;
create table countries (country_id INT PRIMARY KEY,country_name VARCHAR (255)not null,region_id INT,UNIQUE KEY (country_id));
select * from food.countries;
create table jobs (job_id INT PRIMARY KEY,job_tittle VARCHAR (255) not null,min_salary INT DEFAULT 8000,max_salary INT);
select * from food.jobs;
create table employee(employee_id INT PRIMARY KEY,first_name varchar(50),last_name VARCHAR(50),email VARCHAR(50),phone_number VARCHAR(20),hire_date DATE,job_id INT,salary decimal(10,2),commission decimal(10,2),manager_id INT,department_id INT); 
select * from food.employee;
INSERT INTO countries (country_id,country_name,region_id)
VALUES (9920016001, 'INDIA', 123456);
INSERT INTO jobs (job_id,job_tittle,min_salary,max_salary)
VALUES (10001, 'MANAGER',10000,20000);
drop tables countries;
create table countries (country_id INT PRIMARY KEY,country_name VARCHAR (255)not null,region_id INT,UNIQUE KEY (country_id));
SELECT *FROM food.jobs;
alter table countries rename to country_new;
select country_id as counrty_ID,country_name as country_NAME FROM country_new;
SELECT * FROM country_new
order by country_name Desc;