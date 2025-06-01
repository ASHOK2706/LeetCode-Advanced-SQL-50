
-- LeetCode - 534. Game Play Analysis III
/*
    Write an SQL query that reports for each player and date, how many games played so far by the player. 
    That is, the total number of games played by the player until that date. Check the example for clarity.
*/

create table activity1(
    player_id int,
    device_id int,
    event_date date,
    games_played int,
    primary key(player_id, event_date)
);

insert into activity1(player_id, device_id, event_date, games_played)
values
    (1, 2, '2016-03-01', 5),
    (1, 2, '2016-05-02', 6),
    (1, 3, '2017-06-25', 1),
    (3, 1, '2016-03-02', 0),
    (3, 4, '2018-07-03', 5);

-- Solution:

select 
    player_id,
    event_date,
    sum(games_played) over(partition by player_id order by event_date) as games_played_so_far
from activity1;