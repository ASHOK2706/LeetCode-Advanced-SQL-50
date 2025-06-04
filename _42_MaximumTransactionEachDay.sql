
-- LeetCode - 1831. Maximum Transaction Each Day
/*
    Write an SQL query to report the IDs of the transactions with the maximum amount on their respective day. 
    If in one day there are multiple such transactions, return all of them.

    Return the result table in ascending order by transaction_id.
*/

create table transactions1(
    transaction_id int primary key,
    day datetime,
    amount int
);

insert into transactions1(transaction_id, day, amount)
values
    (8, '2021-4-3 15:57:28' , 57),
    (9, '2021-4-28 08:47:25', 21),
    (1, '2021-4-29 13:28:30', 58),
    (5, '2021-4-28 16:39:59', 40),
    (6, '2021-4-29 23:39:28', 58);


-- Solution:

select 
    transaction_id
from (
    select 
        *,
        dense_rank() over(partition by date_format(day, "%Y-%m-%d") order by amount desc) as `rank`
    from transactions1
) as max_transaction
where `rank` = 1
order by transaction_id;
