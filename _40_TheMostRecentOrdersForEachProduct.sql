
-- LeetCode - 1549. The Most Recent Orders for Each Product
/*
    Write an SQL query to find the most recent order(s) of each product.

    Return the result table sorted by product_name in ascending order and in case of a tie by the product_id in ascending order. 
    If there still a tie, order them by the order_id in ascending order.
*/

create table customers4(
    customer_id int primary key,
    name varchar(100)
);

create table orders6(
    order_id int primary key,
    order_date date,
    customer_id int,
    product_id int
);

create table products2(
    product_id int primary key,
    product_name varchar(100),
    price int
);

insert into customers4(customer_id, name)
values
    (1, 'Winston'  ),
    (2, 'Jonathan' ),
    (3, 'Annabelle'),
    (4, 'Marwan'   ),
    (5, 'Khaled'   );

insert into orders6(order_id, order_date, customer_id, product_id)
values
    (1    , '2020-07-31', 1, 1),
    (2    , '2020-07-30', 2, 2),
    (3    , '2020-08-29', 3, 3),
    (4    , '2020-07-29', 4, 1),
    (5    , '2020-06-10', 1, 2),
    (6    , '2020-08-01', 2, 1),
    (7    , '2020-08-01', 3, 1),
    (8    , '2020-08-03', 1, 2),
    (9    , '2020-08-07', 2, 3),
    (10   , '2020-07-15', 1, 2);

insert into products2(product_id, product_name, price)
values
    (1, 'keyboard' , 120  ),
    (2, 'mouse'    , 80   ),
    (3, 'screen'   , 600  ),
    (4, 'hard disk', 450  );

-- Solution:

with resent_orders as (
    select 
        t.product_name,
        t.product_id,
        t.order_id,
        t.order_date,
        dense_rank() over(partition by t.product_id order by t.order_date desc) as `rank`
    from (
        select o.*, p.product_name 
        from orders6 o
        left join products2 p
        on o.product_id = p.product_id
    ) t
)
select 
    product_name,
    product_id,
    order_id,
    order_date
from resent_orders
where `rank` = 1
order by product_name, product_id, order_id;
