
--  LeetCode - 182. Duplicate 
/*
    Write a solution to report all the duplicate emails. Note that it's guaranteed that the email field is not NULL.
*/

create table person1(
    id int primary key,
    email varchar(100) not null
);

insert into person1(id, email)
values
    (1, 'a@b.com'),
    (2, 'c@d.com'),
    (3, 'a@b.com');

-- Solution:

select lower(email) as Email
from person1 
group by lower(email)select actor_id, director_id
from actor_director
group by actor_id, director_id
having count(timestamp) >= 3;
having count(id) > 1;


