
-- LeetCode - 1965. Employees With Missing Information
/*
    Write a solution to report the IDs of all the employees with missing information. The information of an employee is missing if:
        The employee's name is missing, or
        The employee's salary is missing.
        Return the result table ordered by employee_id in ascending order.
*/

create table employees2(
    employee_id int primary key,
    name varchar(100)
);

create table salaries(
    employee_id int primary key,
    salary int
);

insert into employees2(employee_id, name)
values
    (2, 'Crew'     ),
    (4, 'Haven'    ),
    (5, 'Kristian' );

insert into salaries(employee_id, salary)
values
    (5, 76071),
    (1, 22517),
    (4, 63539);

-- Solution:

select e.employee_id
from employees2 e
left join salaries s
on e.employee_id = s.employee_id
where s.employee_id is null

union

select s.employee_id
from employees2 e
right join salaries s
on e.employee_id = s.employee_id
where e.employee_id is null

order by employee_id;
