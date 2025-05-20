
-- 607. Sales Person
/*
    Write a solution to find the names of all the salespersons who did not have any orders related to the company with the name "RED".
    Return the result table in any order.
*/

create table sales_person(
    sales_id int primary key,
    name varchar(100),
    salary int,
    commission_rate int,
    hire_date date
);

create table company(
    com_id int primary key,
    name varchar(100),
    city varchar(100)
);

create table orders3(
    order_id int primary key,
    order_date date,
    com_id int,
    sales_id int,
    amount int,
    foreign key (com_id) references company(com_id),
    foreign key (sales_id) references sales_person(sales_id)
);

insert into sales_person(sales_id, name, salary, commission_rate, hire_date)
values
    (1, 'John', 100000, 6, STR_TO_DATE('4/1/2006', '%m/%d/%Y')),
    (2, 'Amy', 12000, 5, STR_TO_DATE('5/1/2010', '%m/%d/%Y')),
    (3, 'Mark', 65000, 12, STR_TO_DATE('12/25/2008', '%m/%d/%Y')),
    (4, 'Pam', 25000, 25, STR_TO_DATE('1/1/2005', '%m/%d/%Y')),
    (5, 'Alex', 5000, 10, STR_TO_DATE('2/3/2007', '%m/%d/%Y'));


insert into company(com_id, name, city)
values 
    (1, 'RED'   , 'Boston'  ),
    (2, 'ORANGE', 'New York'),
    (3, 'YELLOW', 'Boston'  ),
    (4, 'GREEN' , 'Austin'  );

insert into orders3(order_id, order_date, com_id, sales_id, amount)
values 
(1, STR_TO_DATE('1/1/2014', '%m/%d/%Y'), 3, 4, 10000),
(2, STR_TO_DATE('2/1/2014', '%m/%d/%Y'), 4, 5, 5000),
(3, STR_TO_DATE('3/1/2014', '%m/%d/%Y'), 1, 1, 50000),
(4, STR_TO_DATE('4/1/2014', '%m/%d/%Y'), 1, 4, 25000);

-- Solution 1:

select s.name
from sales_person s 
left join orders3 o
on s.sales_id = o.sales_id
left join company c
on o.com_id = c.com_id
group by s.sales_id
having sum(if (c.name = 'RED', 1, 0)) != 1;


-- Solution 2:

SELECT name 
FROM SalesPerson 
WHERE sales_id NOT IN (
    SELECT DISTINCT sales_id 
    FROM Orders 
    WHERE com_id IN (
        SELECT com_id 
        FROM Company 
        WHERE name = 'RED'
    )
);




