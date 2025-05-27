
-- LeetCode - 1587. Bank Account Summary II
/*
    write a solution to report the name and balance of users with a balance higher than 10000.
    the balance of an account is equal to the sum of the amounts of all transactions involving 
    that account. 
*/  

create table users1(
    account int primary key,
    name varchar(100)
);

create table transactions(
    trans_id int primary key,
    account int,
    amount int,
    transacted_on date
);

insert into users1(account, name)
values
    (900001, 'Alice'),
    (900002, 'Bob'),
    (900003, 'Charlie');


insert into transactions(trans_id, account, amount, transacted_on)
values
    (1, 900001, 7000, '2020-08-01'),
    (2, 900001, 7000, '2020-09-01'),
    (3, 900001, -3000, '2020-09-02'),
    (4, 900002, 1000, '2020-09-12'),
    (5, 900003, 6000, '2020-08-07'),
    (6, 900003, 6000, '2020-09-07'),
    (7, 900003,-4000, '2020-09-11');


-- Solution:

select u.name, sum(t.amount) as balance
from users1 u
inner join transactions t
on u.account = t.account
group by t.account -- using(account)
having balance > 10000;














