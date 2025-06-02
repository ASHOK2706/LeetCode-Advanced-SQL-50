
-- LeetCode - 1303. Find the Team Size
/*
    Write an SQL query to find the team size of each of the employees.
*/

create table employee(
    employee_id int primary key,
    team_id int
);

insert into employee(employee_id, team_id)
values  
    (1, 8),
    (2, 8),
    (3, 8),
    (4, 7),
    (5, 9),
    (6, 9);

-- Solution1:

select 
    employee_id,
    count(employee_id) over(partition by team_id) as team_size
from employee
order by employee_id;



-- Solution2:

with no_of_employee as (
    select 
        team_id, 
        count(employee_id) as team_size
    from employee
    group by team_id
)
select e.employee_id, t.team_size
from employee e
join no_of_employee t
using(team_id);


