
-- LeetCode - 1112 - Highest Grade For Each Student
/*
    write a solution to find the highest grade with its corresponding course for each student.
    In case of a tie, you should find the course with the smallest course_id.
    return the result order by student id in ascending order.
*/

create table enrollments(
    student_id int,
    course_id int,
    grade int not null,
    primary key (student_id, course_id)
);

insert into enrollments(student_id, course_id, grade)
values
    (2, 2, 95),
    (2, 3, 95),
    (1, 1, 90),
    (1, 2, 99),
    (3, 1, 80),
    (3, 2, 75),
    (3, 3, 82);

-- Solution:

select 
    student_id,
    course_id,
    grade
from (
    select
        *,
        row_number() over (partition by student_id order by grade desc, course_id asc) as student_rank
    from enrollments
) as highest_grade_by_course
where student_rank = 1
order by student_id;

