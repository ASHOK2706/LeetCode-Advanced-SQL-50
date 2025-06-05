
-- LeetCode - 1596. The Most Frequently Ordered Products for Each Customer
/*
    Write a solution to find the most frequently ordered product(s) for each customer.
    The result table should have the product_id and product_name for each customer_id who ordered at least one order.
*/

create table customers6(
    customer_id int primary key,
    name varchar(100)
);

create table orders8(
    order_id int primary key,
    order_date date,
    customer_id int,
    product_id int
);

create table products3(
    product_id int primary key,
    product_name varchar(100),
    price int
);

insert into customers6(customer_id, name)
values
    (1 , 'Alice' ),
    (2 , 'Bob'   ),
    (3 , 'Tom'   ),
    (4 , 'Jerry' ),
    (5 , 'John'  );

insert into orders8(order_id, order_date, customer_id, product_id)
values
    (1 , '2020-07-31', 1 , 1),
    (2 , '2020-07-30', 2 , 2),
    (3 , '2020-08-29', 3 , 3),
    (4 , '2020-07-29', 4 , 1),
    (5 , '2020-06-10', 1 , 2),
    (6 , '2020-08-01', 2 , 1),
    (7 , '2020-08-01', 3 , 3),
    (8 , '2020-08-03', 1 , 2),
    (9 , '2020-08-07', 2 , 3),
    (10, '2020-07-15', 1 , 2);

insert into products3(product_id, product_name, price)
values
    (1, 'keyboard', 120),
    (2, 'mouse', 80),
    (3, 'screen', 600),
    (4, 'hard disk', 450);

-- Solution:

with cte1 as (
    select o.*, 
        p.product_name,
        count(o.order_id) over(partition by customer_id, product_id) as frequency
    from orders8 o
    left join products3 p
    on o.product_id = p.product_id
),
cte2 as (
    select *,
        dense_rank() over(partition by customer_id order by frequency desc) as `rank`
    from cte1
)
select 
    distinct customer_id, 
    product_id,
    product_name
from cte2
where `rank` = 1;



