/*Name: VAISHNAVI C A S
Batch ID: 17/07/2023 DS&DA
Topic: Triggers

/*1)	Write an SQL query to accomplish the following tasks:*/
/*a)	Create a database named student_db.*/

create database student_db;

/*b)	Create a table named students_details with columns id (integer), 
name (varchar), age (integer), and grade (float). id should be set as the primary key.*/

use student_db;

create table student_details (  
  id int,
  name varchar(20),  
  age int,  
  grade float
  );

insert into student_details values(1,"Vaish",22,9.4);
insert into student_details values(2,"Chand",21,9.6);
insert into student_details values(3,"Adi",23,9.2);
insert into student_details values(4,"Bhagya",22,9.1);
select * from student_details;

create table student_details_copy (  
id int,
name varchar(20),  
age int,  
grade float
);  
insert into student_details_copy values(1,"Vaish",22,9.4);
insert into student_details_copy values(2,"Chand",21,9.6);
insert into student_details_copy values(3,"Adi",23,9.2);
insert into student_details_copy values(4,"Bhagya",22,9.1);
select * from student_details_copy;

DELIMITER $$
create trigger after_insert_details  
after insert on student_details 
for each row  
begin  
    insert into student_details_copy 
    values (new.id, new.name, new.age, new.grade);
end $$
DELIMITER ;

/*f)	Insert a new record into students_details.*/

insert into student_details values(5,"Harshini",20,8.8);
insert into student_details values(6,"Siri",21,9.1);

/*g)	check whether a record is filling in students_details_copy as you insert value in students_details.*/

select * from student_details;
select * from student_details_copy;

/*2)	Write an SQL question that accomplishes the following tasks:*/
/*a)	use student_db , */

use student_db;

/*b)	Create a trigger named update_grade that automatically updates the grade column every 
time a record in students_details  is updated based on the following criteria:*/
/*d)	If the updated record has an age value between 18 and 20 (inclusive), multiply the grade by 1.1.*/
/*e)	If the updated record has an age value greater than 20, multiply the grade by 1.05.*/

use student_db;
create table student_details (  
  id int,
  name varchar(20),  
  age int,  
  grade float
  );

insert into student_details values(1,"Vaish",18,9.4);
insert into student_details values(2,"Chand",19,9.6);
insert into student_details values(3,"Adi",20,9.2);
insert into student_details values(4,"Bhagya",21,9.1);
insert into student_details values(5,"Harshini",20,8.8);
insert into student_details values(6,"Siri",17,9.1);
select * from student_details;

DELIMITER $$
CREATE TRIGGER update_grade  
BEFORE INSERT ON student_details 
FOR EACH ROW  
BEGIN
    IF NEW.age < 18 THEN
        -- If age is less than 18, multiply the grade by 0.9
        SET NEW.grade = NEW.grade * 0.9;
    ELSEIF NEW.age BETWEEN 18 AND 20 THEN
        -- If age is between 18 and 20 (inclusive), multiply the grade by 1.1
        SET NEW.grade = NEW.grade * 1.1;
    ELSE
        -- If age is greater than 20, multiply the grade by 1.05
        SET NEW.grade = NEW.grade * 1.05;
    END IF;
END $$
DELIMITER ;

INSERT INTO student_details (id, name, age, grade) VALUES (7, 'Ahalya', 17, 9.0);
select * from student_Details

/*3)	Explain the difference between the AFTER and INSTEAD OF trigger operators in SQL.
•	AFTER TRIGGER- Without the usage of data manipulation keywords like insert, delete, data in the table will be affected.
•	INSTEAD OF TRIGGER- Without the usage of data manipulation keywords like insert, delete, data in the table will not be affected.*/

/*4)	What is the purpose of the INSTEAD OF DELETE trigger operator in SQL?
INSTEAD OF DELETE TRIGGER operator in SQL is used to delete records from the view which we have created.*/

