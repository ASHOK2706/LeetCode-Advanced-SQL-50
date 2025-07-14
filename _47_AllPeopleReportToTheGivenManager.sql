-- LeetCode - 1270. All People Report to the Given Manager
/*
    Write an SQL query to find employee_id of all employees that directly or indirectly report their work to the head of the company.

    The indirect relation between managers will not exceed 3 managers as the company is small.

    Return result table in any order without duplicates.
*/

create table employees3(
     int,
    employee_name varchar(100),
    manager_id int
);

insert into employees3(employee_id, employee_name, manager_id)
values 
    (1 , 'Boss', 1),
    (3 , 'Alice', 3),
    (2 , 'Bob' , 1),
    (4 , 'Daniel', 2),
    (7 , 'Luis', 4),
    (8 , 'Jhon', 3),
    (9 , 'Angela', 8),
    (77, 'Robert', 1);



-- Solution:
-- Recursive Common Table Expression:
with recursive cte as (
    -- Anchor member
    union / union all
    -- recursive member
)
select * from cte;



with recursive cte as (
    select employee_id 
    from employees3
    where manager_id = 1 and employee_id <> 1

    union 

    select e.employee_id 
    from employees3 as e
    inner join cte as c
    on e.manager_id = c.employee_id
)
select * from cte;


