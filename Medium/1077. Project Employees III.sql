select project_id, employee_id
from
(
select project_id, e.employee_id,
rank() over (partition by project_id order by experience_years desc) as rank
from Project p
left join Employee e
on p.employee_id = e.employee_id
) as t
where rank = 1;

Easy subquery:

select p.project_id, p.employee_id
from Project p join Employee e
on p.employee_id = e.employee_id
where (p.project_id, e.experience_years) in (
    select a.project_id, max(b.experience_years)
    from Project a join Employee b
    on a.employee_id = b.employee_id
    group by a.project_id);


Imp: Cannot use where caluse with window function. have to create a subquery for where clause. 
Since where clause will be executed first so it wont find the column rank.
https://stackoverflow.com/questions/13997177/why-no-windowed-functions-in-where-clauses

https://leetcode.com/problems/project-employees-iii/discuss/369363/Three-straightforward-solutions-(window-function-and-subquery)
