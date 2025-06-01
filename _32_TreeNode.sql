
-- LeetCode - 608. Tree Node
/*
    Each node in the tree can be one of three types:

    "Leaf": if the node is a leaf node.
    "Root": if the node is the root of the tree.
    "Inner": If the node is neither a leaf node nor a root node.
    Write a solution to report the type of each node in the tree.
*/

create table tree(
    id int primary key,
    p_id int
);

insert into tree(id, p_id)
values
    (1, null),
    (2, 1),
    (3, 1),
    (4, 2),
    (5, 2);

-- Solution:

select 
    id, 
    case 
        when p_id is null then 'Root'
        when id in (select distinct p_id from tree) then 'Inner'
        else 'Leaf'
    end as type
from tree;