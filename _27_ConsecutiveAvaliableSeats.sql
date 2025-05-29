
-- LeetCode - 630.Consecutive Avaliable Seats
/*
    find all the consecutive avaliable seats in the cinema.
    return the result table ordered by seat_id in ascending order.
    the test case are generated so that more than tow seats are consecutively avaliable 
*/

create table cinema(
    seat_id int primary key auto_increment,
    free boolean
);

insert into cinema(free)
values
    (1), (0), (1), (1), (1);

-- Solution:

select seat_id
from  (
    select 
        *,
        lag(free) over(order by seat_id asc) as befor,
        lead(free) over(order by seat_id asc) as aftr
    from cinema
) as seats_information
where (free = 1 and befor = 1) or (free = 1 and aftr = 1)
order by seat_id;



