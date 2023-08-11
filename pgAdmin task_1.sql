-- Database: task_1

-- DROP DATABASE IF EXISTS task_1;


	-- 1 .Creating a Table: Create a table named "Students" with columns: "student_id" (integer), "first_name" (text), "last_name" (text), and "age" (integer).--
	
	create table Students(
	student_id int,
		first_name text,
		last_name text,
		age int
	);
	
	-- 2. Inserting Data: Insert a few rows of sample data into the "Students" table you created in the previous exercise.--
	
	
	insert into students (student_id,first_name,last_name,age) values (1,'kamlesh','kumar',20);
	
	insert into students (student_id,first_name,last_name,age) values (2,'manoj','kumar',19);
	
	insert into students (student_id,first_name,last_name,age) values (3,'karthi','keyan',21);
	
	insert into students (student_id,first_name,last_name,age) values (4,'sai','ram',22);
	
	insert into students (student_id,first_name,last_name,age) values (5,'prem','kumar',18);
	
	insert into students (student_id,first_name,last_name,age) values (6,'priya','dharshini',19);
	
	insert into students (student_id,first_name,last_name,age) values (7,'siva','kumar',23);
	
	insert into students (student_id,first_name,last_name,age) values (8,'vetri','vel',17);
	
	insert into students (student_id,first_name,last_name,age) values (9,'anand','mani',26);
	
	insert into students (student_id,first_name,last_name,age) values (10,'naveen','kumar',24);
	
	insert into students (student_id,first_name,last_name,age) values (11,'haris','kumar',24);
	
	insert into students (student_id,first_name,last_name,age) values (12,'sathees','kumar',24);
	
	insert into students (student_id,first_name,last_name,age) values (13,'pandi','sinthu',24);
	
	insert into students (student_id,first_name,last_name,age) values (14,'mani','subash',24);
	
	select * from students;
	
	-- 3.Basic Queries: a. Retrieve all the records from the "Students" table. b. Retrieve the first and last names of students whose age is greater than 20. c. Count the number of students in the table. d. Retrieve the names of students in alphabetical order by their last names.--
	
	-- a. Retrieve all the records from the "Students" table. --
	
	select * from students
	where age >20;
	
	-- b. Retrieve the first and last names of students whose age is greater than 20.--
	
	select count (*) from students;
	
	--c. Count the number of students in the table. d. Retrieve the names of students in alphabetical order by their last names.--
	
	select first_name,last_name
	from students
	order by last_name;
	
	-- 4.dating and Deleting Data: a. Update the age of a specific student in the "Students" table. b. Delete a student's record from the table based on their ID.
	
	--a. Update the age of a specific student in the "Students" table.--
	
	update students
	set age = 19
	where student_id =2;
	
	--b. Delete a student's record from the table based on their ID.--
	
	delete from students
	where student_id=3;
	
	-- 5.tering and Ordering: a. Retrieve the first name, last name, and age of students aged between 18 and 25. b. Retrieve the names of students in descending order of their ages.
	
	--a. Retrieve the first name, last name, and age of students aged between 18 and 25. --
	
	select first_name,last_name,age
	from students
	where age between 18 and 25;
	
	-- b. Retrieve the names of students in descending order of their ages.--
	
	select first_name,last_name
	from students
	order by age DESC;
	
	-- 6.gation: a. Calculate the average age of all students. b. Find the maximum age among all students. c. Calculate the total age of all students.
	
	--a. Calculate the average age of all students. --
	
	SELECT AVG(age)
	from students
	
	--b. Find the maximum age among all students.--
	
	select max(age)
	from students;
	
	--c. Calculate the total age of all students.--
	
	select sum(age)
	from students;
	
	--7.uping and Aggregates: Retrieve the count of students for each age group (e.g., 18-20, 21-25, etc.).--
	
	select 
	   case 
		when age between 18 and 20 then '18-20'
		when age between 21 and 25 then '21-25'
		else 'others'  
		end as age_group,
	 count(*) student_id
	from students
	group by age_group;
	
	
--8. Joins: a. Create another table named "Courses" with columns: "course_id" (integer) and "course_name" (text). b. Insert some sample course data into the "Courses" table. c. Create a new table "StudentCourses" with columns: "student_id" and "course_id" to represent a many-to-many relationship between students and courses. d. Insert sample data into the "StudentCourses" table. e. Write a query to retrieve the courses taken by a specific student.--
	
	--a. Create another table named "Courses" with columns: "course_id" (integer) and "course_name" (text).--
	
	create table Courses(
	course_id int,
	course_name text
	);
	
	-- b. Insert some sample course data into the "Courses" table. --
	
	insert into courses (course_id,course_name) values (1,'Biotechnology');
	insert into courses (course_id,course_name) values (2,'Computer Science');
	insert into courses (course_id,course_name) values (3,'Civil Engineering');
	insert into courses (course_id,course_name) values (4,'Visual communication');
	insert into courses (course_id,course_name) values (5,'Microbiology');
	insert into courses (course_id,course_name) values (6,'Bachelor of Architecture');
	insert into courses (course_id,course_name) values (7,'Automobile Engineering ');
	insert into courses (course_id,course_name) values (8,'Fashion design');
	insert into courses (course_id,course_name) values (9,'Psychology');
	insert into courses (course_id,course_name) values (10,'Architecture');
	insert into courses (course_id,course_name) values (11,'Mathematics');
	
	select * from courses;
	
	--c. Create a new table "StudentCourses" with columns: "student_id" and "course_id" to represent a many-to-many relationship between students and courses.--
	
	create table StudentCourses(
	student_id int,
	course_id int,
		primary key (student_id,course_id)
	);
	--d. Insert sample data into the "StudentCourses" table.--
	
	insert into StudentCourses (student_id,course_id) values (1,1);
	insert into StudentCourses (student_id,course_id) values (1,2);
	insert into StudentCourses (student_id,course_id) values (2,2);
	insert into StudentCourses (student_id,course_id) values (3,3);
	insert into StudentCourses (student_id,course_id) values (4,5);
	insert into StudentCourses (student_id,course_id) values (5,4);
	insert into StudentCourses (student_id,course_id) values (6,5);
	insert into StudentCourses (student_id,course_id) values (7,6);
	insert into StudentCourses (student_id,course_id) values (8,7);
	insert into StudentCourses (student_id,course_id) values (8,9);
	insert into StudentCourses (student_id,course_id) values (9,9);
	
	select * from studentcourses;
	
	--e. Write a query to retrieve the courses taken by a specific student.--
	select courses.course_id
	from courses
	join StudentCourses
	on courses.course_id=StudentCourses.course_id
	where StudentCourses.student_id=1;
	
	--9.Subqueries: Retrieve the names of students who are enrolled in a course named "Mathematics."--
	
	SELECT first_name,last_name
FROM students
WHERE student_id IN (SELECT student_id from studentCourses WHERE course_id IN 
	 (SELECT course_id FROM courses WHERE course_name IN 
	 (SELECT course_name FROM courses WHERE course_name='Mathematics')));

	
	--10.Using LIKE and ILIKE: Retrieve the names of students whose last name contains the letter "s."--
	
	select last_name
	from students
	where last_name ILIKE's%';
	
	select last_name
	from students
	where last_name like's%'
	


	 
	
	 

