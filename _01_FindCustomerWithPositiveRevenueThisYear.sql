
-- LeetCode - 1821 Find Customer With Positive Revenue this Year
/*
    Write a solution to report the customers with positive revenue in the year 2021
*/

create table customers(
    customer_id int,
    year int,
    revenue int,
    primary key (customer_id, year)
);

insert into customers(customer_id, year, revenue)
values 
    (1, 2018, 50),
    (1, 2021, 30),
    (1, 2020, 70),
    (2, 2021, -50),
    (3, 2018, 10),
    (3, 2016, 50),
    (4, 2021, 20);

-- Solution:

select customer_id
from customers
where year = 2021 and revenue > 0; 


