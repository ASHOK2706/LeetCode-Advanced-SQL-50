
-- LeetCode - 184. Department Highest Salary
/*
    Write a solution to find employees who have the highest salary in each of the departments.
*/

create table employee1(
    id int primary key,
    name varchar(100),
    salary int,
    department_id int,
    foreign key (department_id) references departments1(id)
);

create table departments1(
    id int primary key,
    name varchar(100)
);

insert into employee1(id, name, salary, department_id)
values
    (1, 'Joe', 70000, 1),
    (2, 'Jim', 90000, 1),
    (3, 'Henry', 80000, 2),
    (4, 'Sam', 60000, 2),
    (5, 'Max', 90000, 1);

insert into departments1(id, name)
values
    (1, 'IT'),
    (2, 'Salaes');


-- Solution:


select 
    Department,
    Employee,
    Salary
from (
    select 
        d.name as Department,
        e.name as Employee,
        e.salary as Salary,
        dense_rank() over(partition by d.id order by e.salary desc) as `rank`
    from departments1 d
    inner join employee1 e 
    on d.id = e.department_id
) T
where `rank` = 1;



