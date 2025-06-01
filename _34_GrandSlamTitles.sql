
--  LeetCode - 1783. Grand Slam Titles
/*
    Write an SQL query to report the number of grand slam tournaments won by each player. Do not include the players 
    who did not win any tournament.
*/

create table players(
    player_id int primary key,
    player_name varchar(100)
);

create table championships(
    year int primary key,
    wimbledon int,
    fr_open int,
    us_open int,
    au_open int 
);

insert into players(player_id, player_name)
values
    (1, 'Nadal'),
    (2, 'Federer'),
    (3, 'Novak');

insert into championships(year, wimbledon, fr_open, us_open, au_open)
values
    (2018, 1, 1, 1, 1),
    (2019, 1, 1, 2, 2),
    (2020, 2, 1, 2, 2);


--Solution1:

select 
    p.player_id, 
    p.player_name,
    sum(c.wimbledon = p.player_id) + 
        sum(c.fr_open = p.player_id) +
        sum(c.us_open = p.player_id) +
        sum(c.au_open = p.player_id) as grand_slams_count
from players p
cross join championships c
group by p.player_id, p.player_name
having grand_slams_count <> 0;


-- Solution2:

with win_matchs as (

    select p.*, count(c.wimbledon) as grand_slams_count
    from players p
    left join championships c
    on p.player_id = c.wimbledon
    group by p.player_id

    union all

    select p.*, count(c.fr_open) as m2
    from players p
    left join championships c
    on p.player_id = c.fr_open
    group by p.player_id

    union all

    select p.*, count(c.us_open) as m3
    from players p
    left join championships c
    on p.player_id = c.us_open
    group by p.player_id

    union all

    select p.*, count(c.au_open) as m4
    from players p
    left join championships c
    on p.player_id = c.au_open
    group by p.player_id
)
select 
    player_id, 
    player_name,
    sum(grand_slams_count) as grand_slams_count
from win_matchs
group by player_id, player_name
having grand_slams_count <> 0;

