
--LeetCode - 1699. Number Of Calls Between Two Persons 
/*
    write a solution to report the number of calls and the total call duration between each pair of distinct persons (`person1` 
    `person2`)  where person1 < person2
*/

create table calls(
    from_id int,
    to_id int,
    duration int
);

insert into calls(from_id, to_id, duration)
values
    (1, 2, 59),
    (2, 1, 11),
    (1, 3, 20),
    (3, 4, 100),
    (3, 4, 200),
    (3, 4, 200),
    (4, 3, 499);

-- Solution 1:

select 
    least(from_id, to_id) as person1,
    greatest(from_id, to_id) as person2,
    count(*) as call_count,
    sum(duration) as total_duration
from calls
group by person1, person2;


-- Solution 2:

select 
    person1, 
    person2,
    count(duration) as call_count,
    sum(duration) as total_duration
from (
    select 
        if(from_id < to_id, from_id, to_id )  as person1,
        if(from_id < to_id, to_id, from_id) as person2,
        duration
    from calls
) as calls_table
group by person1, person2;

  
