
-- LeetCode - 1501. Countries You can Safely Invest In
/*
    A telecomunication company wants to inverst in new countries. the company intends to inverst in the 
    countries where the average call duration of the calls in this country is strictky grater than the 
    global average call duration.

    write a solution to find the countries where this company can invest.
*/

create table person2(
    id int primary key,
    name varchar(100),
    phone_number varchar(100)
);

create table country(
    name varchar(100),
    country_code varchar(100) primary key
);

create table calls1(
    caller_id int, 
    callee_id int,
    duration int
);

insert into person2(id, name, phone_number)
values
    (3, 'Jonathan', '051-1234567'),
    (12, 'Elvis', '051-7654321'),
    (1, 'Moncef', '212-1234567'),
    (2, 'Maroua', '212-6523651'),
    (7, 'Meir', '972-1234567'),
    (9, 'Rachel', '972-0011100');

insert into country(name, country_code)
values
    ('Peru', '051'),
    ('Israle', '972'),
    ('Morocco', '212'),
    ('Germany', '049'),
    ('Ethiopia', '251');

insert into calls1(caller_id, callee_id, duration)
values
    (1, 9, 33),
    (2, 9, 4),
    (1, 2, 59),
    (3, 12, 102),
    (3, 12, 330),
    (12, 3, 5),
    (7, 9, 13),
    (7, 1, 3),
    (9, 7, 1),
    (1, 7, 7);

-- Solution:


select co.name as country
from person2 p
left join calls1 c
on p.id in (c.caller_id, callee_id)
left join country co 
on left(p.phone_number, 3) = co.country_code
group by co.name
having avg(c.duration) > (select avg(duration) from calls1);