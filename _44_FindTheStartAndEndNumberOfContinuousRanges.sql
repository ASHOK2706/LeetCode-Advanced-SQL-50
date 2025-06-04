
-- LeetCode - 1285. Find the Start and End Number of Continuous Ranges
/*
    Since some IDs have been removed from Logs. Write an SQL query to find the start and end number of continuous 
    ranges in table Logs.
    Order the result table by start_id.
*/

create table logs(
    log_id int primary key
);

insert into logs(log_id)
values
    (1 ),
    (2 ),
    (3 ),
    (7 ),
    (8 ),
    (10);

-- Solution:

