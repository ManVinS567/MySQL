---- create database
create database Books_2;


---- create table

CREATE TABLE Student_2
(
Roll_No Int,
First_Name Varchar (5),
Last_Name Varchar (5),
Age Int,
Marks Int
);

select * from Student_22;

insert into Student_2 values(1,'Sumit','Singh',24,90);

----- Alter
--- add a new column by altering table
ALTER TABLE Student_2 ADD Fathers_Name Varchar(60);

-- drop a column
alter table Student_2 drop column Fathers_Name;

--- modify the datatypes of column
alter table Student_2 alter column First_Name Varchar(6);

---- insert values into the table after modifying the column
insert into Student_2 values(2,'Sowmya','pandu',28,50);


---- Rename a column
EXEC sp_rename 'Student_2.Roll_No','rollnumber';

---- Rename a table
EXEC sp_rename 'student_2', 'student_22';

---- Drop
drop table student_22;
drop database Books_2;

--- Truncate (will delete only rows)
truncate table student_22;

select * from student_22;