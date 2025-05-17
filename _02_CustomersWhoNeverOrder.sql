
-- LeetCode - 183. Customers Who Never Order
/*
    Write a solution to find all customers who never order anything.
*/

create table customers1(
    id int primary key,
    name varchar(100)
);

create table orders(
    id int primary key,
    customer_id int,
    foreign key (customer_id) references customers1(id)
);

insert into customers1(id, name)
values 
    (1, 'Joe'),
    (2, 'Henry'),
    (3, 'Sam'),
    (4, 'Max');

insert into orders(id, customer_id)
values
    (1, 3),
    (2, 1);

-- Solution:

select c.name as Customers
from customers1 c
left join orders o
on c.id = o.customer_id
where customer_id is null;
