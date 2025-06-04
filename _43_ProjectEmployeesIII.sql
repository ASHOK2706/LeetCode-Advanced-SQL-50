
-- LeetCode - 1077. Project Employees III
/*
    Write an SQL query that reports the most experienced employees in each project. In case of a tie, 
    report all employees with the maximum number of experience years.
*/

create table project(
    project_id int,
    employee_id int,
    primary key (project_id, employee_id)
);

create table employee2(
    employee_id int primary key,
    name varchar(100),
    experience_years int
);

insert into project(project_id, employee_id)
values
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 4);

insert into employee2(employee_id, name, experience_years)
values
    (1, 'Khaled',  3),
    (2, 'Ali',  2),
    (3, 'John',  3),
    (4, 'Doe',  2);

-- Solution:


select 
    project_id,
    employee_id
from (
    select 
        *,
        dense_rank() over(partition by p.project_id order by e.experience_years desc) as `rank`
    from project p
    left join employee2 e
    using(employee_id)
) t
where `rank` = 1;

