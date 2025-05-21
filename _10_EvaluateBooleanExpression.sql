
-- LeetCode - 1440 - Evaluate Boolean Expression
/*
    Evaluate thr Boolean Expression in `expression` table.
*/

create table variables(
    name varchar(100) primary key,
    value int
);

create table expression(
    left_operand varchar(100),
    operator enum('<','>','='),
    right_operand varchar(100)
);

insert into variables(name, value)
values
    ('x', 66),
    ('y', 77);

insert into expression(left_operand, operator, right_operand)
values
    ('x', '>', 'y'),
    ('x', '<', 'y'),
    ('x', '=', 'y'),
    ('y', '>', 'x'),
    ('y', '<', 'x'),
    ('x', '=', 'x');


-- Solution:

select v1.value as left_operand, e.operator, v2.value as right_operand,
case 
    when 
        case 
            when e.operator = '>' then v1.value > v2.value
            when e.operator = '<' then v1.value < v2.value
            when e.operator = '=' then v1.value = v2.value
            else null
        end
    then 'true'
    else 'false'
end as value
from variables v1
left join expression e
on v1.name = e.left_operand
left join variables v2
on v2.name = e.right_operand;
