
-- LeetCode - Sellers With No Sales
/*
    Write a solution to report the names of all sellers who did not make any sales in 2020.
    return the result table ordered by seller_name in ascending order.
*/

create table customers3(
    customer_id int primary key,
    customer_name varchar(100)
);

create table orders2(
    order_id int primary key,
    sale_date date,
    order_cost int,
    customer_id int,
    seller_id int
);

create table seller(
    seller_id int primary key,
    seller_name varchar(100)
);


insert into customers3(customer_id, customer_name)
values
    (101, 'Alice'),
    (102, 'Bob'),
    (103, 'Charlie');

insert into orders2(order_id, sale_date, order_cost, customer_id, seller_id) 
values  
    (1, '2020-03-01', 1500, 101, 1),
    (2, '2020-05-25', 2400, 102, 2),
    (3, '2019-05-25', 800, 101, 3),
    (4, '2020-09-13', 1000, 103, 2),
    (5, '2019-02-11', 700, 101, 2);

insert into seller(seller_id, seller_name)
values
    (1, 'Daniel'),
    (2, 'Elizabeth'),
    (3, 'Frank');

-- Solution 1:

select seller_name
from seller
where seller_name not in (
    select distinct s.seller_name
    from seller s
    left join orders2 o
    on s.seller_id = o.seller_id
    where year(o.sale_date) = '2020'
)
order by seller_name;


-- Solution 2:

select s.seller_name
from seller s 
left join (select * from orders2 where year(sale_date) = 2020) o
on s.seller_id = o.seller_id
where o.order_id is null
order by s.seller_name;

