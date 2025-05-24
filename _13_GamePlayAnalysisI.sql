
-- LeetCode - 511. Game Play Analysis I
/*
    Write a solution to find the first login date for each player.
*/

create table activity(
    player_id int,
    device_id int,
    event_date date,
    games_played int,
    primary key (player_id, event_date)
);

insert into activity(player_id, device_id, event_date, games_played)
values 
    (1, 2, '2016-03-01', 5),
    (1, 2, '2016-05-02', 6),
    (2, 3, '2017-06-25', 1),
    (3, 1, '2016-03-02', 0),
    (3, 4, '2018-07-03', 5);

-- Solution:

select 
    player_id, 
    min(event_date) as first_login
from activity
group by player_id;
