
-- LeetCode - 1050. Actors and Directors Who Cooperated At Least Three Times
/*
    Write a solution to find all the pairs (actor_id, director_id) where the actor has cooperated with the director at least three times.
*/

create table actor_director(
    actor_id int,
    director_id int,
    timestamp int primary key
);

insert into actor_director(actor_id, director_id, timestamp)
values
    (1, 1, 0),
    (1, 1, 1),
    (1, 1, 2),
    (1, 2, 3),
    (1, 2, 4),
    (2, 1, 5),
    (2, 1, 6);


-- Solution:

select actor_id, director_id
from actor_director
group by actor_id, director_id
having count(*) >= 3;  