
-- LeeetCode - 1495. Friendly Movies Streamed Last Month
/*
    write a solution to report the distinct titles of the kid-friendly movies streamed in June 2020
*/

create table tv_program(
    program_date date,
    content_id int,
    channel varchar(100),
    primary key(program_date, content_id)
);

create table content(
    content_id int primary key,
    title varchar(100),
    kids_content enum('Y', 'N'),
    content_type varchar(100)
);

insert into tv_program(program_date, content_id, channel)
values
    ('2020-06-10 08:00', 1, 'LC-Channel'),
    ('2020-05-11 12:00', 2, 'LC-Channel'),
    ('2020-05-12 12:00', 3, 'LC-Channel'),
    ('2020-05-13 14:00', 4, 'Disney Ch'),
    ('2020-06-18 14:00', 4, 'Disney Ch'),
    ('2020-07-15 16:00', 5, 'Disney Ch');


insert into content(content_id, title, kids_content, content_type)
values
    (1, 'Leetcode Movie', 'N', 'Movies'),
    (2, 'Alg. for Kids', 'Y', 'Series'),
    (3, 'Database Sols', 'N', 'Series'),
    (4, 'Aladdin', 'Y', 'Movies'),
    (5, 'Cinderella', 'Y', 'Movies');

-- Solution:

select distinct c.title
from tv_program t
left join content c
on c.content_id = t.content_id
where c.kids_content = 'Y' and 
    c.content_type = 'Movies' and
    date_format(program_date, "%Y-%m") = '2020-06';
    
