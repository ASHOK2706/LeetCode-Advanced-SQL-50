
-- LeetCode - 1741. Find Total Time Spent by Each Employee
/*
    Write a solution to calculate the total time in minutes spent by each employee on each 
    day at the office. Note that within one day, an employee can enter and leave more than once. 
    The time spent in the office for a single entry is out_time - in_time.
*/

create table employees1(
    emp_id int,
    event_day date,
    in_time int,
    out_time int,
    primary key (emp_id, event_day, in_time)
);

insert into employees1(emp_id, event_day, in_time, out_time)
values
    (1, '2020-11-28', 4 , 32 ),
    (1, '2020-11-28', 55, 200),
    (1, '2020-12-03', 1 , 42 ),
    (2, '2020-11-28', 3 , 33 ),
    (2, '2020-12-09', 47, 74 );


-- Solution:

select 
    event_day as day, 
    emp_id, 
    sum(out_time - in_time) as total_time
from employees1
group by event_day, emp_id;
