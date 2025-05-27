
-- LeetCode - 1511.Customer Order Frequency
/*
 write a solution to report the `customer_id` and `customer_name` of customers
 who have spent at least $100 in each month of June and July 2020.
*/

create table customer4(
    customer_id int primary key,
    name varchar(100),
    country varchar(100)
);

create table product(
    product_id int primary key, 
    description varchar(100),
    price int 
);

create table orders5(
    order_id int primary key,
    customer_id int,
    product_id int,
    order_date date,
    quantity int
);

insert into customer4(customer_id, name, country)
values
    (1, 'Winston', 'USA'),
    (2, 'Jonathan', 'Peru'),
    (3, 'Moustafa', 'Egypt');

insert into product(product_id, description, price)
values
    (10, 'LC Phone', 300),
    (20, 'LC T-Shirt', 10),
    (30, 'LC Book', 45),
    (40, 'LC Keychain', 2);

insert into orders5(order_id, customer_id, product_id, order_date, quantity)
values
    (1, 1, 10, '2020-06-10', 1),
    (2, 1, 20, '2020-07-01', 1),
    (3, 1, 30, '2020-07-08', 2),
    (4, 2, 10, '2020-06-15', 2),
    (5, 2, 40, '2020-07-01', 10),
    (6, 3, 20, '2020-06-24', 2),
    (7, 3, 30, '2020-06-25', 2),
    (9, 3, 30, '2020-05-08', 3);

-- Solution:

select customer_id, name
from (
    select o.customer_id, c.name, month(order_date) as mth,  sum(o.quantity * p.price) as spent
    from orders5 o
    left join customer4 c
    on o.customer_id = c.customer_id 
    left join product p
    on o.product_id = p.product_id
    where year(order_date) = '2020' and 
    month(order_date) in ('6', '7')
    group by o.customer_id, c.name, month(o.order_date)
    having spent >= 100
) as T
group by customer_id, name
having count(*) = 2;
