
-- 1407 - Top Traavellers
/*
    Write a solution to report the distance traveled by each user.
    Return the result table ordered by `travelled_distance` in descending order, if two or more users traveled 
    the same distance, order them by their name in ascending order.
*/

create table users(
    id int primary key, 
    name varchar(100)
);

create table rides(
    id int primary key,
    user_id int,
    distance int
);

insert into users(id, name)
values
    (1, 'Alice'),
    (2, 'Bob'),
    (3, 'Alex'),
    (4, 'Donald'),
    (7, 'Lee'),
    (13, 'Jonathan'),
    (19, 'Elvis');

insert into rides(id, user_id, distance)
values
    (1, 1, 120),
    (2, 2, 317),
    (3, 3, 222),
    (4, 7, 100),
    (5, 13, 312),
    (6, 19, 50 ),
    (7, 7, 120),
    (8, 19, 400),
    (9, 7, 230);

-- Solution:

select u.name , ifnull(sum(r.distance), 0) as travelled_distance
from users u
left join rides r
on u.id = r.user_id
group by u.id
order by travelled_distance desc, u.name asc;