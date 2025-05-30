
-- LeetCode - 1264. Page Recommendations
/*
    Write a solution to recommend pages to the user with user_id = 1 using the pages that your friends 
    liked. it should not recommend pages you already liked.
*/

create table friendship(
    user1_id int,
    user2_id int,
    primary key (user1_id, user2_id)
);

create table likes(
    user_id int,
    page_id int,
    primary key (user_id, page_id)
);

insert into friendship(user1_id, user2_id)
values
    (1, 2),
    (1, 3),
    (1, 4),
    (2, 3),
    (2, 4),
    (2, 5),
    (6, 1);

insert into likes(user_id, page_id)
values
    (1, 88),
    (2, 23),
    (3, 24),
    (4, 56),
    (5, 11),
    (6, 33),
    (2, 77),
    (3, 77),
    (6, 88);

-- solution:


select distinct user1_friends_liked.page_id as recommended_page
from (
    select 
        greatest(user1_id, user2_id) as friend
    from friendship
    where least(user1_id, user2_id) = 1
) as user1_friends
left join (
    select user_id, page_id
    from likes
    where page_id not in (
        select page_id
        from likes
        where user_id = 1
    )
) as user1_friends_liked
on user1_friends.friend = user1_friends_liked.user_id;










