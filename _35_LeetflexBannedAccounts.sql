
-- LeetCode - 1747. Leetflex Banned Accounts
/*
    Write an SQL query to find the account_id of the accounts that should be banned from Leetflex. 
    An account should be banned if it was logged in at some moment from two different IP addresses.
*/

create table login_info(
    account_id int,
    ip_address int,
    login datetime,
    logout datetime
);

insert into login_info(account_id, ip_address, login, logout)
values
    (1, 1, '2021-02-01 09:00:00', '2021-02-01 09:30:00'),
    (1, 2, '2021-02-01 08:00:00', '2021-02-01 11:30:00'),
    (2, 6, '2021-02-01 20:30:00', '2021-02-01 22:00:00'),
    (2, 7, '2021-02-02 20:30:00', '2021-02-02 22:00:00'),
    (3, 9, '2021-02-01 16:00:00', '2021-02-01 16:59:59'),
    (3, 13, '2021-02-01 17:00:00', '2021-02-01 17:59:59'),
    (4, 10, '2021-02-01 16:00:00', '2021-02-01 17:00:00'),
    (4, 11, '2021-02-01 17:00:00', '2021-02-01 17:59:59');

-- Solution:

select distinct l1.account_id
from login_info l1
inner join login_info l2
on l1.account_id = l2.account_id 
and l1.ip_address <> l2.ip_address
where (l1.login between l2.login and l2.logout) or
(l1.logout between l2.login and l2.logout);


