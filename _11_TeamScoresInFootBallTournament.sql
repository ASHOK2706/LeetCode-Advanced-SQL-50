
-- LeetCode - 1212. Team Scores In FootBall Tournament
/*
    You would like to compute the scores of all teams after all matches. Points are awardedd as follows:
    * A team recevies three points if they win a match (i.e, Scored more golas than the opponent team).
    * A team receives one point if they draw a match (i.e, Scored the same number of goals as the opponent team).
    * A team recevies no points if they lose a match (i.e, Scored fewer golas then the opponent team).

    Write a solution that selects the `team_id`, `team_name` and `num_points` of each team int the tournament after all described matches.
    return the result table ordered by num_points in decreasing order. In case of a tie, order the records by team_id in increasing order.
*/

create table teams(
    team_id int ,
    team_name varchar(100)
);

create table matches(
    match_id int,
    host_team int,
    guest_team int,
    host_goals int,
    guest_goals int
);

insert into teams(team_id, team_name)
values
    (10, 'Leetcode FC'),
    (20, 'NewYork FC'),
    (30, 'Atlanta FC'),
    (40, 'Chicago FC'),
    (50, 'Toronto FC');

insert into matches(match_id, host_team, guest_team, host_goals, guest_goals)
values
    (1, 10, 20, 3, 0),
    (2, 30, 10, 2, 2),
    (3, 10, 50, 5, 1),
    (4, 20, 30, 1, 0),
    (5, 50, 30, 1, 0);

-- Solution :

with points_table as (
    select host_team, guest_team, 
        case 
            when host_goals > guest_goals then 3
            when host_goals = guest_goals then 1
            when host_goals < guest_goals then 0
        end as points
    from matches

    union all

    select guest_team, host_team,
        case 
            when guest_goals > host_goals then 3
            when guest_goals = host_goals then 1
            when guest_goals < host_goals then 0
        end as points
    from matches
)
select 
    t.team_id,
    t.team_name,
    sum(case when p.points then p.points else 0 end) as num_points
from teams t
left join points_table p
on t.team_id = p.host_team
group by t.team_id, t.team_name
order by sum(case when p.points then p.points else 0 end) desc, t.team_id asc;


-- Solution :


select 
    team_id, 
    team_name,
    sum(points) as num_points
from (
    select t.team_id, t.team_name,
        case 
            when t.team_id = m.host_team and m.host_goals > m.guest_goals then 3
            when t.team_id = m.guest_team and m.host_goals < m.guest_goals then 3
            when (t.team_id = m.host_team or t.team_id = m.guest_team) and m.host_goals = m.guest_goals then 1
            else 0 
        end as points
    from teams t
    left join matches m
    on t.team_id = m.host_team or t.team_id = m.guest_team
) as points_table
group by t.team_id, t.team_name
order by num_points desc, team_id asc;
















