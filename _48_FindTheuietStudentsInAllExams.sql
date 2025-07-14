-- LeetCode - 1412. Find the Quiet Students in All Exams
/*
    A "quite" student is the one who took at least one exam and didn't score neither the high score nor the low score.

    Write an SQL query to report the students (student_id, student_name) being "quiet" in ALL exams.

    Don't return the student who has never taken any exam. Return the result table ordered by student_id.
*/

create table students1(
    student_id int primary key,
    student_name varchar(100)
);

create table exam(
    exam_id int,
    student_id int,
    score int,
    primary key (exam_id, student_id)
);

insert into students1 (student_id, student_name)
values
    (1, 'Daniel'),
    (2, 'Jade'),
    (3, 'Stella'),
    (4, 'Jonathan'),
    (5, 'Will');

insert into exam (exam_id, student_id, score)
values
    (10, 1, 70),
    (10, 2, 80),
    (10, 3, 90),
    (20, 1, 80),
    (30, 1, 70),
    (30, 3, 80),
    (30, 4, 90),
    (40, 1, 60),
    (40, 2, 70),
    (40, 4, 80);



-- Solution:

with max_min_cte as (
    select
        *,
        max(score) over(partition by exam_id) as max_score,
        min(score) over(partition by exam_id) as min_score
    from exam
),
scored_min_max as (
    select
        *
    from max_min_cte
    where score = max_score or score = min_score
)
select
    *
from students1
where student_id in (select distinct student_id from exam)
and student_id not in (select distinct student_id from scored_min_max)
order by student_id;





