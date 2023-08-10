                            --  MySQL Functions Exercises  --
-- 1.	String Manipulation: Create a function that takes a string as input and returns the string in reverse order. --
 
 DELIMITER //

CREATE FUNCTION ReverseString(input_string VARCHAR(255)) RETURNS VARCHAR(255)
BEGIN
    DECLARE reversed_string VARCHAR(255);
    DECLARE i INT;
    
    SET reversed_string = '';
    SET i = LENGTH(input_string);
    
    WHILE i > 0 DO
        SET reversed_string = CONCAT(reversed_string, SUBSTRING(input_string, i, 1));
        SET i = i - 1;
    END WHILE;
    
    RETURN reversed_string;
END;

//

DELIMITER ;


SELECT ReverseString('Hello, World!') AS reversed_string;

-- DROP FUNCTION IF EXISTS ReverseString;


-- 2.	Date Calculations: Create a function that calculates the age of a person based on their birthdate.--

DELIMITER //

CREATE FUNCTION CalculateAge(birthdate DATE) RETURNS INT
deterministic	
BEGIN
    DECLARE today DATE;
    DECLARE age INT;
    
    SET today = CURDATE();
    SET age = YEAR(today) - YEAR(birthdate);
    
    RETURN age;
END;

//

DELIMITER ;


SELECT CalculateAge('2003-07-06') AS AGE;


-- 3.	Mathematical Operations: Create a function that calculates the factorial of a given number.--

DELIMITER //

CREATE FUNCTION CalculateFactorial(number INT) RETURNS BIGINT
BEGIN
    DECLARE result BIGINT;
    DECLARE i INT;
    
    SET result = 1;
    
    IF number = 0 THEN
        RETURN result;
    END IF;
    
    SET i = number;
    
    WHILE i > 0 DO
        SET result = result * i;
        SET i = i - 1;
    END WHILE;
    
    RETURN result;
END;

//

DELIMITER ;
SELECT CalculateFactorial(5) AS factorial;

-- DROP FUNCTION IF EXISTS CalculateFactorial;--

-- 4.	Conditional Logic: Create a function that takes two numbers as input and returns the larger of the two.--

DELIMITER //

create function getlargerNumber(num1 decimal(10,2),num2 decimal(10,2)) returns decimal(10,2)
BEGIN
  declare larger decimal(10,2);
   if num1 > num2 then
    set larger =num1;
    else
    set larger =num2;
    end if;
    return larger;
    end;
    //
 DELIMITER ;  
 
 select getlargerNumber(10.8,20.7) as larger;
 
 
								-- Stored Procedures Exercises --
                                
-- 1.	Insertion with Validation: Create a stored procedure that inserts a new record into a "Students" table. The procedure should validate that the age is not negative before inserting.--

DELIMITER //
   create procedure getstudents( 
   IN Student_name varchar(50),
   IN student_age int,
   IN email text
   )
   begin
   if student_age >=0 then
   insert into students( name, age,email ) values ( Student_name, student_age,email );
   else
    signal sqlstate'45000' set message_text= ' age is not negative';
    end if;
    end;
    //
    DELIMITER ;
  -- DROP PROCEDURE IF EXISTS getstudents;
CALL GetStudents(1,25,'mano@gmail.com');

-- 2.Update with Logging: Create a stored procedure that updates the email address of a student in the "Students" table. Before updating, the procedure should log the old and new email addresses into an "Audit_Log" table.--

DELIMITER //
CREATE PROCEDURE UpdateStudentEmailWithLogging
    (IN studentId INT, IN newEmail VARCHAR(255))
BEGIN
    DECLARE oldEmail VARCHAR(255);
 
    SELECT email INTO oldEmail
    FROM Students
    WHERE student_id = studentId;

  
    UPDATE Students
    SET email = newEmail
    WHERE student_id = studentId;

     
    INSERT INTO Audit_Log (student_id, old_email, new_email, update_date)
    VALUES (studentId, oldEmail, newEmail, NOW());
END;
//
DELIMITER ;


-- 3.	Bulk Insertion: Create a stored procedure that takes a list of student names and inserts them into the "Students" table in a single transaction.--

DELIMITER //
CREATE PROCEDURE BulkInsertStudents
    (IN studentNames TEXT)
BEGIN
    DECLARE studentName VARCHAR(255);
    DECLARE done INT DEFAULT 0;
    DECLARE nameCursor CURSOR FOR
        SELECT TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(studentNames, ',', n), ',', -1)) AS name
        FROM (
            SELECT 1 + units.i + tens.i * 10 AS n
            FROM
               (SELECT 0 AS i UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3) units
            JOIN 
                (SELECT 0 AS i UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3) tens
        ) indices
        WHERE n <= (LENGTH(studentNames) - LENGTH(REPLACE(studentNames, ',', '')) + 1);

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    START TRANSACTION;

    OPEN nameCursor;

    read_loop: LOOP
        FETCH nameCursor INTO studentName;
        IF done THEN
            LEAVE read_loop;
        END IF;

        INSERT INTO Students (name, email) VALUES (studentName, '');

    END LOOP;

    CLOSE nameCursor;

    COMMIT;
END;
//
DELIMITER ;


-- 4.	Transaction Rollback: Create a stored procedure that transfers funds from one bank account to another. Ensure that the transaction is rolled back if the balance in the source account is insufficient.--


DELIMITER //
CREATE PROCEDURE TransferFunds
    (IN sourceAccountId INT, IN targetAccountId INT, IN amount DECIMAL(10, 2))
BEGIN
    DECLARE sourceBalance DECIMAL(10, 2);
    
    START TRANSACTION;

 
    SELECT balance INTO sourceBalance
    FROM BankAccounts
    WHERE account_id = sourceAccountId;


    IF sourceBalance >= amount THEN
  
        UPDATE BankAccounts
        SET balance = balance - amount
        WHERE account_id = sourceAccountId;

      
        UPDATE BankAccounts
        SET balance = balance + amount
        WHERE account_id = targetAccountId;

        COMMIT;
    ELSE
        ROLLBACK;
    END IF;
END;
//
DELIMITER ;

