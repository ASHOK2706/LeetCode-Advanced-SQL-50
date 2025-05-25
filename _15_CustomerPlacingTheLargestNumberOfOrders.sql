
-- LeetCode 586. Customer Placing the Largest Number of Orders
/*
    Write a solution to find the customer_number for the customer who has placed the largest number of orders.
    The test cases are generated so that exactly one customer will have placed more orders than any other customer.
*/

create table orders4(
    order_number int primary key,
    customer_number int
);

insert into orders4(order_number, customer_number)
values
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 3);

-- Solution:



select customer_number
from orders4
group by customer_number
order by count(order_number) desc
limit 1;

