
-- LeetCode - 1873. Calculate Special Bonus
/*
    Write a solution to calculate the bonus of each employee. The bonus of an employee is 100% of their salary if the 
    ID of the employee is an odd number and the employee's name does not start with the character 'M'. The bonus of an 
    employee is 0 otherwise.

    Return the result table ordered by employee_id.
*/

create table employees(
    employee_id int primary key,
    name varchar(100),
    salary int
);

insert into employees(employee_id, name, salary) 
values
    (2, 'Meir', 3000),
    (3, 'Michael', 3800),
    (7, 'Addilyn', 7400),
    (8, 'Juan', 6100),
    (9, 'Kannon' , 7700);

--Solution:

select 
    employee_id,
    case
        when employee_id % 2 = 1 and name not like 'M%' then salary
        else 0
    end as bonus
from employees
order by employee_id;