My solution:


select distinct student_id, min(course_id) as course_id , grade
from Enrollments
where (student_id,grade) in 
(select e.student_id, max(e.grade) as grade
from Enrollments e
group by e.student_id)
group by student_id, grade
order by student_id;

Similar to find the highest salary from each departemnt. It was imp to include both the columns student_id and grade in the where condition.
This can also be solved using rank().

with cte as (
select student_id, course_id, grade, rank() over(partition by student_id order by grade desc, course_id asc) 'grade_rank'
from Enrollments
)

select distinct cte.student_id, cte.course_id, cte.grade
from cte
where cte.grade_rank = 1
order by cte.student_id asc;
