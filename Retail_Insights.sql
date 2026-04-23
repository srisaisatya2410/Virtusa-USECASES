create database FreshMartData;
use FreshMartData;

-- Categories Table
create table Categories
(category_id int primary key, 
category_name varchar(50));
insert into Categories values
(1,'Snacks'),
(2,'Dairy'),
(3,'Beverages');
select * from Categories;

-- Products Table
create table Products
(product_id int primary key, product_name varchar(50),
category_id int,expiry_date date,stock_count int,
price decimal(10,2),foreign key(category_id) references Categories(category_id));
insert into Products values
(101,'Chips',1,curdate()+interval 5 day, 120, 20.00),
(102,'Biscuits',1,curdate()+interval 15 day,80,25.00),
(103,'Milk',2,curdate()+interval 3 day, 60, 50.00),
(104,'Curd',2,curdate()+interval 2 day,60,30.00),
(105,'Juice',3,curdate()+interval 1 day, 70, 60.00),
(106,'Sprite',3,curdate()+interval 60 day, 200, 40.00);
select * from Products;

-- SalesTransactions Table
create table SalesTransactions(transaction_id int primary key,product_id int,quantity int,
transaction_date date,foreign key(product_id) references Products(product_id));
insert into SalesTransactions values
(1,101,10,curdate()-interval 5 day),(2,103,20,curdate()-interval 2 day),
(3,106,15,curdate()-interval 10 day),(4,101,5,curdate()-interval 1 day),
(5,105,7,curdate()-interval 20 day);
select * from SalesTransactions;

-- Expiring Soon Query
select * from Products 
where expiry_date<=curdate()+interval 7 day and stock_count>50;

-- Dead Stock Analysis
select p.product_id,p.product_name from Products p 
left join SalesTransactions s on p.product_id=s.product_id 
and s.transaction_date>=curdate()-interval 60 day 
where s.product_id is null;

-- Revenue Contribution
select c.category_name, sum(s.quantity*p.price) as Revenue 
from SalesTransactions s join Products p on
s.product_id=p.product_id join Categories c 
on p.category_id=c.category_id group by c.category_name order by revenue desc; 
