
-- LeetCode - 175. Combine Two Tables
/*
    Write a solution to report the first name, last name, city, and state of each person in the Person table. 
    If the address of a personId is not present in the Address table, report null instead.
*/

create table person(
    person_id int primary key,
    last_name varchar(100),
    first_name varchar(100)
);

create table address(
    address_id int primary key,
    person_id int,
    city varchar(100),
    state varchar(100)
);

insert into person(person_id, last_name, first_name)
values 
    (1, 'Wang', 'Allen'),
    (2, 'Alice', 'Bob');

insert into address(address_id, person_id, city, state)
values
    (1, 2, 'New York City', 'New York'),
    (2, 3, 'Leetcode', 'California');

-- Solution:

select p.first_name, p.last_name, a.city, a.state
from person p
left join address a
on p.person_id = a.person_id;