---- DML Commands

create table emp_100
(
emp_id INT,
First_name Varchar (50),
Last_name Varchar (50),
email Varchar(50),
phone varchar (15),
hiredate date,
salary int


);

select * from emp_100;

---- Insert
---- Inserting recrods into employee table to specific columns
INSERT INTO emp_100(emp_id, First_name, Last_name, email, phone, salary)
VALUES(100, 'John', 'King', 'john.king@abc.com', '123.123.1000', 33000);


--- Inserting records in all columns

INSERT INTO emp_100
VALUES(101, 'meena', 'kumari', 'meena.kumari@xyz.com', '1234567890', '05-12-2018', 17000);

-- Insert multiple records
INSERT INTO emp_100
VALUES
(102, 'parker', 'street', 'parker.street@gmail.com', '1234567895', '08-10-2019', 18000),
(103, 'nama', 'naam', 'nama.naam@naemail.com', '9876543210', '01-01-2012', 21000),
(104, 'sql', 'naam', 'sql.naam@sql.com', '4567891230', '01-05-2016', 25000);


--- create empty table from another table

---- WHERE 1=2: This condition (1=2) is always false, meaning that no rows will be selected from the emp_100 table. 
---- This condition is used when you want to copy the table structure but not the data.

select * into emp_100_dup from emp_100 where 1=2;

--- now create new table from emp_100 table with data i.e, remove where 1=2

select * into new_table from emp_100;

--- or INSERT INTO new_table SELECT * FROM emp_100;

select * from new_table;

----- UPDATE SINGLE COLUMN
UPDATE emp_100
SET email = 'jking@test.com'
WHERE emp_id = 100;


---- UPDATE MULTIPLE COLUMNS
UPDATE emp_100
SET email = 'mkumari@abc.com', phone = '999999999', salary = 100000
WHERE emp_id = 101;

SELECT * FROM emp_100;

---- DELETE

--- TO DELETE record for emp_id 102 from the table
DELETE FROM emp_100 WHERE emp_id = 102;

---- Delete all rows

DELETE FROM emp_100


--- There is a difference between Truncate and Delete command. Truncate is DDL command and Delete is DML command. 
--- Truncate is faster than Delete command.
---- Delete command deletes the records page by page, whereas Truncate deletes the records at one go.