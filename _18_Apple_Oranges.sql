
-- LeetCode - 1445. Apples & Oranges
/*
    write a solution to report the difference between the number of appples and oranges 
    sold each day.
    return the resule table order by sale_date
*/

create table sales(
    sales_date date,
    fruit enum('apples', 'oranges'),
    sold_num int,
    primary key (sales_date, fruit)
);

insert into sales(sale_date, fruit, sold_num)
values
    ('2020-05-01', 'apples', 10),
    ('2020-05-01', 'oranges', 8),
    ('2020-05-02', 'apples', 15),
    ('2020-05-02', 'oranges', 15),
    ('2020-05-03', 'apples', 20),
    ('2020-05-03', 'oranges', 0),
    ('2020-05-04', 'apples', 15),
    ('2020-05-04', 'oranges', 16);

-- Solution:

select 
    apple_table.sale_date , 
    apple_table.apple -
    orange_table.orange as diff
from 
(
    select sale_date, sum(sold_num) as apple from sales where  fruit = 'apples'
    group by sale_date
) apple_table 
join 
(
    select sale_date, sum(sold_num) as orange from sales where  fruit = 'oranges'
    group by sale_date
) orange_table
on apple_table.sale_date = orange_table.sale_date;


-- Solution:

select 
    sale_date, 
    sum(if(fruit = 'apples', sold_num, 0)) - sum(if(fruit = 'oranges', sold_num, 0)) as diff
from sales
group by sale_date;
        

        
