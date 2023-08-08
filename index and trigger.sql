create database task_five;
use task_five;
                                     -- INDEX --
                                     
-- 1.	Create a table called "books" with columns for "id" (primary key), "title," "author," and "publication_year." Insert some 

create table books(
id int primary key,
title varchar(50),
author varchar(50),
publication_year int
);

insert into books values (1,"The History of Tom Jones, a Foundling","Henry Fielding",1749);
insert into books values (2,"Pride and Prejudice","Jane Austen",1775);
insert into books values (3,"The Red and the Black","Stendhal",1783);
insert into books values (4, "To Kill a Mockingbird", "Harper Lee", 1960);
insert into books values (5,"The Great Gatsby", "F. Scott Fitzgerald", 1925);
insert into books values (6,"Pride and Prejudice", "Jane Austen", 1813);
insert into books values (7,"The Lord of the Rings","J.R.R. Tolkien", 1954);
insert into books values (8,"David Copperfield","	Charles Dickens", 1849);
insert into books values (10,"Moby-Dick","	Herman Melville", 1851);

select * from books;

create index idx_title  on books(title,author,publication_year);

-- 2.	Write a SQL query to retrieve all books written by a specific author, e.g., "J.K. Rowling," and explain how an index could improve the query's performance.

select * from books
where author = "J.R.R. Tolkien";

create index idx_author on books (author);

-- 3.	Add an index to the "publication_year" column in the "books" table and compare the query performance before and after adding the index.

 explain select * from books
 where publication_year ="1925";

  create index idx_year on books (publication_year);

 -- 4.	Create a table called "students" with columns for "id" (primary key), "name," "age," and "grade." Insert some sample data into the table.
 
 create table students (
 id int primary key,
 students_name varchar (10),
 age int,
 grade varchar(10)
 );

insert into students values (1,"ram",23,"A");
insert into students values (2,"sri",22,"B");
insert into students values (3,"mano",21,"C");
insert into students values (4,"karthi",20,"A");
insert into students values (5,"venu",24,"B");


-- 5.	Design an index strategy to optimize queries for finding all students with a specific grade, e.g., Grade 10.

select * from students
where grade ="A";

create index idx_grade on students (grade); 

                                -- Triggers --
                                
-- 1.	Create a trigger that automatically updates the "last_updated" column in a table called "employees" whenever a row is updated.            


create table employees (
employee_id int primary key,
employee_name varchar(10),
department_id int,
job_tittle varchar(10),
salary int
);

insert into employees (employee_id,employee_name,department_id,job_tittle,salary) values (101,'chandran',1,'manager',80000);
insert into employees (employee_id,employee_name,department_id,job_tittle,salary) values (102,'karthi',3,'engineer',60000);
select * from employees;


ALTER TABLE employees ADD COLUMN last_updated TIMESTAMP;

DELIMITER //

CREATE TRIGGER update_last_updated
BEFORE UPDATE ON employees
FOR EACH ROW
BEGIN
    SET NEW.last_updated = CURRENT_TIMESTAMP;
END// 
DELIMITER;  
select * from employees;


-- 2.	Write a trigger that inserts a new row into a "log" table whenever a record is deleted from the "orders" table.

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_total DECIMAL(10, 2),
    order_status VARCHAR(50)
);


DELIMITER //
create trigger log_order_deletion
after delete on orders
for each row
begin
  insert into orders ( order_id ,total_amount) values (1,20000);
  insert into orders ( order_id ,total_amount) values (2,25000);
end//
DELIMITER ; 


-- 3. Create a table called "transactions" with columns for "id" (primary key), "amount," and "timestamp." Create a trigger that updates the "balance" column in a "bank_accounts" table whenever a new transaction is inserted, considering the transaction amount (debit or credit).

CREATE TABLE transactions (
    id INT PRIMARY KEY,
    amount DECIMAL(10, 2),
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    account_id INT
);


DELIMITER //

CREATE TRIGGER update_balance_after_transaction
AFTER INSERT ON transactions
FOR EACH ROW
BEGIN
    
    UPDATE bank_accounts
    SET balance = balance + NEW.amount
    WHERE account_id = NEW.account_id;
END//
DELIMITER ;

insert into transactions(id,amount,timestamp) values (1,5000,CURRENT_TIMESTAMP);

-- 4.	Write a trigger that prevents inserting a new record into the "employees" table if the employee's age is less than 18.


DELIMITER //

CREATE TRIGGER before_insert 
BEFORE INSERT ON employee
FOR EACH ROW
BEGIN
    IF NEW.age < 18 THEN
    signal sqlstate '45000'
     set message_text='employee must be at least 18 years old';
     END IF;
END//
DELIMITER ;
insert into empolyee (empolyee_id,empolyee_name,depARTMENY_ID,JOB_tittle,salary,age) values (1,'mari''sales',10000,19);


-- 5.	Create a trigger that sends an email notification to a specified email address whenever a new order is placed in the "orders" table.

DELIMITER //

CREATE TRIGGER send_email_on_order_placed
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    DECLARE email VARCHAR(255);
    DECLARE customer_id int;
    declare order_id int;
    declare order_name varchar(20);
    declare amount int;
    
   SET @email = New.email;
    SET @customer_id = new.customer;
    set@order_id =new.order_id;
    set @order_name =new.order_name;
    set @amount=new.amount;
    
    CALL email_notification( email,customer_id,order_id);
END//
DELIMITER ;
    insert into orders(email, customer_id,order_id,order_name ,amount) values ('mano@gmail.com',1001,1,'manoj',200);

    
    
