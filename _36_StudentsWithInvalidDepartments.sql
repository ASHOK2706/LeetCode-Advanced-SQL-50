
-- LeetCode - 1350. Students With Invalid Departments
/*
    Find the id and the name of all students who are enrolled in departments that no longer exist.
*/

create table departments(
    id int primary key, 
    name varchar(100)
);

create table students(
    id int primary key,
    name varchar(100),
    department_id int
);

insert into departments(id, name)
values
    (1, 'Electrical Engineering'),
    (7, 'Computer Engineering'),
    (13, 'Bussiness Administration');

insert into students(id, name, department_id)
values
    (23, 'Alice', 1 ),
    (1, 'Bob', 7 ),
    (5, 'Jennifer' , 13),
    (2, 'John', 14),
    (4, 'Jasmine', 77),
    (3, 'Steve', 74),
    (6, 'Luis', 1 ),
    (8, 'Jonathan', 7 ),
    (7, 'Daiana', 33),
    (11, 'Madelynn', 1 );

-- Solution:


select *
from students 
where department_id not in (
    select id from departments
);

