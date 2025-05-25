
-- LeetCode - 1173. Immadiate Food Delivery I
/*
    IF the customer's preferred delivery date is the same as the order date, then the order is called immediate; 
    otherwise it is called sechduled

    write a solution to find the percentage of immediate orders in the table, rounded to 2 decimal places
*/

create table delivery(
    delivery_id int primary key,
    customer_id int,
    order_date date,
    customer_pref_delivery_date date
);

insert into delivery(delivery_id, customer_id, order_date, customer_pref_delivery_date)
values  
    (1, 1, '2019-08-01', '2019-08-02'),
    (2, 5, '2019-08-02', '2019-08-02'),
    (3, 1, '2019-08-11', '2019-08-11'),
    (4, 3, '2019-08-24', '2019-08-26'),
    (5, 4, '2019-08-21', '2019-08-22'),
    (6, 2, '2019-08-11', '2019-08-13');


-- Solution:

select 
    round(
        (
            select count(*) as count1
            from delivery
            where order_date = customer_pref_delivery_date
        ) /
        (
            select count(*) from delivery
        ) * 100, 2
    ) as immediate_percentage;


-- Solution:

select 
    round(sum(if(order_date = customer_pref_delivery_date, 1, 0)) / count(*) * 100, 2) as immediate_percentage
from delivery;






