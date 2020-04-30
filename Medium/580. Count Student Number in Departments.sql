select dept_name, count(student_id) as student_number
from department d
left join student s
on s.dept_id = d.dept_id
group by dept_name
order by student_number desc, dept_name;

SELECT
    dept_name, COUNT(*) AS student_number
FROM
    department
        LEFT OUTER JOIN
    student ON department.dept_id = student.dept_id
GROUP BY department.dept_name
ORDER BY student_number DESC , department.dept_name
;
https://leetcode.com/problems/count-student-number-in-departments/solution/

A left outer join returns all the values from an inner join plus all values in the left table that do not match to the right table, 
including rows with NULL (empty) values in the link column.
