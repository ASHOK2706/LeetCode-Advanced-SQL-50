
-- LeetCode - 512. Game Play Analysis II
/*
    Write a SQL query that reports the device that is first logged in for each player.
*/

create table activity2(
    player_id int,
    device_id int,
    event_date date,
    games_played int,
    primary key(player_id, event_date)
);

insert into activity2(player_id, device_id, event_date, games_played)
values
    (1, 2, '2016-03-01', 5),
    (1, 2, '2016-05-02', 6),
    (2, 3, '2017-06-25', 1),
    (3, 1, '2016-03-02', 0),
    (3, 4, '2018-07-03', 5);

-- Solution1:

select 
    a1.player_id,
    a1.device_id
from activity2 a1
join (
    select 
    player_id,
    min(event_date) as event_date
from activity2
group by player_id
) as a2
using(player_id, event_date);


-- Solution2:

select player_id, device_id
from (
    select *, 
        dense_rank() over(partition by player_id order by event_date desc) as `rank`
    from activity2
) t
where `rank` = 1;


