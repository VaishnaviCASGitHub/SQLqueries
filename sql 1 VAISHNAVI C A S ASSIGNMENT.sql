/*Name: VAISHNAVI C A S
Batch ID: 17/07/2023 DS&DA
Topic: Introduction to sql and sql commands*/

/*
1.	What is SQL, and what are some common uses for it in database management?
•	SQL stands for Structured Query Language.
•	It is a type of relational database management system.
•	In SQL, we pass the queries as a request to access the data from the database.
•	SQL allows data redundancy and data integrity in database management system.
•	With the help of SQL, large data can be vertically scalable.
*/
/*
2.	What is a foreign key in SQL, and how is it used to establish relationships between tables?
•	A primary key of one table is referred as a foreign key to another table.
•	It is a constraint like that of a primary key to access or to relate similar columns of different tables allowing ‘normalization’. 
•	By the help of the keyword ‘foreign_key’ we can establish relationship between tables.
*/
/*DATABASE CREATE:-*/
/*1.	Create a database ‘classroom’*/

create database classrooms;

/*2.	Create a table named ‘science_class’ with the following properties
columns(enrollment_no int, name varchar, science_marks int)*/

use classrooms;
create table science_class(
enrollment_no int, 
name varchar(30), 
science_marks int);

/*INSERTING & IMPORTING:-
1.	Insert the following data into science_class using insert into command
1	popeye	33
2	olive	54
3	brutus	98
*/

insert into science_class values(1, "popeye", 33);
insert into science_class values(2,"olive", 54);
insert into science_class values(3,"brutus", 98);
select * from science_class;

/*2.	Import data from CSV file ‘student.csv’ attached in resources to science_class to insert data of next 8 students
SELECT & WHERE:-
1.	Retrieve all data from the table ‘Science_Class’*/

select * from Science_Class;

/*2.	Retrieve the name of students who have scored more than 60 marks*/

select name from science_class where science_marks > 60;

/*3.	Retrieve all data of students who have scored more than 35 but less than 60 marks*/

select * from science_class where science_marks between 35 and 60;

/*4.	Retrieve all other students i.e. who have scored less than or equal to 35 or more than or equal to 60.*/

 select name from science_class where science_marks <= 35 or science_marks >= 60;

/*UPDATING TABLES:-
1.	Update the marks of popeye to 45*/

update science_class set science_marks = 45 where name = "popeye";
select * from science_class;

/*2.	Delete the row containing details of the student named ‘robb’*/

delete from science_class where name="robb";
select * from science_class;

/*3.	Rename column ‘name’ to ‘student_name’*/

alter table science_class rename column name to student_name;
select * from science_class;
