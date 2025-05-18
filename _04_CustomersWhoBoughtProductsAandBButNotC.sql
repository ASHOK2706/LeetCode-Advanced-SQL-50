
-- LeetCode - 1398 Customers Who Bought products A and B but Not C
/*
    Write a Solution to report the customer_id and customer_name of customers who bought products
    "A", "B" but did not buy the product "C" since we want to recommend then to purchase this product.

    return the result table order by `customer_id`
*/

create table customers2(
    customer_id int,
    customer_name varchar(100)
);

create table orders1(
    order_id int,
    customer_id int,
    product_name varchar(100)
);

insert into customers2(customer_id, customer_name)
values 
    (1, 'Daniel'),
    (2, 'Diana'),
    (3, 'Elizabeth'),
    (4, 'John');

insert into orders1(order_id, customer_id, product_name)
values
    (10, 1, 'A'),
    (20, 1, 'B'),
    (30, 1, 'D'),
    (40, 1, 'C'),
    (50, 2, 'A'),
    (60, 3, 'A'),
    (70, 3, 'B'),
    (80, 3, 'D'),
    (90, 4, 'C');

-- Solution1:


select 
    c.customer_id, 
    c.customer_name
from customers2 c
left join orders1 o 
on c.customer_id = o.customer_id
group by c.customer_id
having 
    group_concat(distinct o.product_name order by o.product_name separator "" ) like 'AB%' and
    group_concat(distinct o.product_name order by o.product_name separator "" ) not like '%C%'
order by c.customer_id;


-- Solution2:

select 
    c.customer_id, 
    c.customer_name
from customers2 c
left join (
    select 
    customer_id,
    sum(case when product_name='A' then 1 else 0 end) as product_A,
    sum(case when product_name='B' then 1 else 0 end) as product_B,
    sum(case when product_name='C' then 1 else 0 end) as product_C
from orders1
group by customer_id
) as order_summary 
on c.customer_id = order_summary.customer_id
where 
    order_summary.product_A >= 1 and
    order_summary.product_B >= 1 and
    order_summary.product_C = 0
order by customer_id; 
