/*Name: VAISHNAVI C A S
Batch ID: 17/07/2023 DS&DA
Topic: Operators*/

/*1.	Create a Supermart_DB with the tables created from the datasets shared (Customer.csv, Sales.csv and Product.csv files)*/
/*a.	Create a new database in your database management system, and name it Supermart_DB.*/

create database supermart_db;
use supermart_db;

/*b.	Create a new table called "customers" in the Supermart_DB database*/ 
/*c.	Load the data from the Customer.csv file into the customers table */

select * from customer;

/*d.	Create a new table called "products" in the Supermart_DB database */
/*e.	Load the data from the Product.csv file into the products table */

select * from product;

/*f.	Create a new table called "sales" in the Supermart_DB database*/
/*g.	Load the data from the Sales.csv file into the sales table */

select * from sales;


/*SELECTION OPERATORS:- (FILTERING):- in, like, between
Note:  use products, customers and sales table*/
/*1.	Define the relationship between the tables using constraints/keys.*/
/*2.	In the database Supermart _DB, find the following:
/*a.	Get the list of all the cities where the region is north or east without any duplicates using the IN statement.*/

select distinct city from customer where region = 'central' or 'east' order by city;

/*b.	Get the list of all orders where the ‘sales’ value is between 100 and 500 using the BETWEEN operator.*/

select * from sales where sales between 100 and 500; 

/*c.	Get the list of customers whose last name contains only 4 characters using LIKE.*/

select CustomerName, LENGTH(CustomerName) from customer where CustomerName 
like '%____' group by CustomerName;

/*SELECTION OPERATORS:- ordering*/
/*1.	Retrieve all orders where the ‘discount’ value is greater than zero ordered
 in descending order basis ‘discount’ value*/
 
 select * from sales where discount > 0 in (select sales from sales where discount > 0 order by discount desc);
 
/*2.	Limit the number of results in the above query to the top 10.*/

create table top10 as 
select * from sales where discount > 0 in (select sales from sales where discount > 0 order by discount desc)
limit 10;
select * from top10;

/*Aggregate operators:-
/*1.	Find the sum of all ‘sales’ values.*/

select sum(sales) from sales;

/*2.	Find count of the number of customers in the east region with ages between 20 and 30*/

select count(*) from customer where region = "east" in (select age between 20 and 30);

/*3.	Find the average age of east region customers*/

select avg(age) from customer where region = "east";

/*4.	Find the minimum and maximum aged customers from Philadelphia*/

select min(age) from customer where city = "Philadelphia";
select max(age) from customer where city = "Philadelphia";

/*GROUP BY OPERATORS:-*/
/*1.	Create a display with the information below for each product ID.
/*a.	Total sales (in $) order by this column in descending */
select * from sales;
select sales from sales order by sales desc;

/*b.	Total sales quantity*/

select sum(quantity) from sales;

/*c.	The number of orders*/

select * from sales;
select count(*) from sales; /*TOTAL NUMBER OF ORDERS*/

/*d.	Max Sales value*/

select * from sales;
select max(sales) from sales;

/*e.	Min Sales value*/

select * from sales;
select min(sales) from sales;

/*f.	Average sales value*/

select * from sales;
select avg(sales) from sales;

/*2.	Get the list of product ID’s where the quantity of product sold is greater than 10*/

select * from product;
select Product_ID from product where sales.quantity > 10;
