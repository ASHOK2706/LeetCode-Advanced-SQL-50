
-- LeetCode - 1532. The Most Recent Three Orders
/*
    Write an SQL query to find the most recent 3 orders of each user. If a user ordered less than 3 orders return all of their orders.

    Return the result table sorted by customer_name in ascending order and in case of a tie by the customer_id in ascending order. 
    If there still a tie, order them by the order_date in descending order.
*/

create table customers5(
    customer_id int primary key,
    name varchar(100)
);

create table orders7(
    order_id int primary key,
    order_date date,
    customer_id int,
    cost int
);

insert into customers5(customer_id, name) 
values
    (1, 'Winston'),
    (2, 'Jonathan'),
    (3, 'Annabelle'),
    (4, 'Marwan'),
    (5, 'Khaled');

insert into orders7(order_id, order_date, customer_id, cost)
values
    (1 , '2020-07-31', 1, 30  ),
    (2 , '2020-07-30', 2, 40  ),
    (3 , '2020-07-31', 3, 70  ),
    (4 , '2020-07-29', 4, 100 ),
    (5 , '2020-06-10', 1, 1010),
    (6 , '2020-08-01', 2, 102 ),
    (7 , '2020-08-01', 3, 111 ),
    (8 , '2020-08-03', 1, 99  ),
    (9 , '2020-08-07', 2, 32  ),
    (10, '2020-07-15', 1, 2   );


-- Solution:

select 
    c.name as customer_name, 
    o.customer_id,
    o.order_id,
    o.order_date
from (
    select *,
        row_number() over(partition by customer_id order by order_date desc) as row_num
    from orders7
) o
left join customers5 c
on o.customer_id = c.customer_id
where row_num in (1, 2, 3)
order by customer_name asc, o.customer_id asc, order_date desc;


