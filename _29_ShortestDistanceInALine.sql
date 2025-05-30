
-- LeetCode - Shortest Distance in a Line
/*
    find the shortest distance between any tow position of a point on the x-axis
*/

create table point(
    x int primary key
);

insert into point(x)
values(-1),(0),(2);

-- Solution:

select min(abs(p1.x - p2.x)) as distance
from point p1
left join point p2
on p1.x <> p2.x;

-- if the table is ascending order.

select min(abs(p1.x - p2.x)) as distance
from point p1
left join point p2
on p1.x < p2.x;