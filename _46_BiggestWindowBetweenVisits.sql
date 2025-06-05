
-- LeetCode - 1709. Biggest Window Between Visits
/*
    Assume today's date is '2021-1-1'.
    Write an SQL query that will, for each user_id, find out the largest window of days between each visit and the one 
    right after it (or today if you are considering the last visit).
    Return the result table ordered by user_id.
*/

create table user_visits(
    user_id int,
    visit_date date
);

insert into user_visits(user_id, visit_date)
values
    (1, '2020-11-28'),
    (1, '2020-10-20'),
    (1, '2020-12-3'),
    (2, '2020-10-5'),
    (2, '2020-12-9'),
    (3, '2020-11-11');

-- Solution:

with cte as (
    select 
        *,
        lead(visit_date, 1, '2021-1-1') over (partition by user_id order by visit_date) as next
    from user_visits
)
select 
    user_id,
    max(datediff(next, visit_date)) as biggest_window
from cte
group by user_id;
