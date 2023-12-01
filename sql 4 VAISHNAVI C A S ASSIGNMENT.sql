/*Name: VAISHNAVI C A S
Batch ID: 17/07/2023 DS&DA
Topic: Joins*/

/*1.	Run the below query to create the datasets.*/
/*a.	retrieve sales table from the supermart_db (sales dataset contains multiple years data)*/

create database supermart_db;
use supermart_db;
select * from sales;

/*b.	Counting the number of distinct customer_id values in sales table*/ 

select count(distinct 'customer_id') from sales; 

/*c.	Customers with ages between 20 and 60*/

select * from customer;
select 'customer_name', age from customer where age between 20 and 60;

/*●	create table customer_20_60 as select * from customers where ages between 20 and 60;*/

create table customer_20_60 as select * from customer where age between 20 and 60;
select * from customer_20_60;

/*●	select count (*) from customer_20_60;*/

select count(*) from customer_20_60;

/*2.	Find the total sales that are done in every state for customer and the sales table
Hint: Use Joins and Group By command*/
select * from customer;
select * from sales;
select state, sum(salesz) from customer full join sales
on Customer_ID = Customer_ID group by state;

/*3.	Get data containing Product_id, Product name, category, total sales value of that product, and total quantity sold. (Use sales and product tables)*/
 
select * from product; 
select Producttid, Product_Name, category, sum(salesz),sum(quantity) from product 
full join sales on Producttid = sales.Product_ID group by Producttid,
Product_Name, category; 
