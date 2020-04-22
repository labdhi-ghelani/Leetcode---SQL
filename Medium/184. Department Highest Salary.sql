My solution:

select distinct d.Name as Department, e.Name as Employee , e.Salary
from Employee e
join Department d
on e.DepartmentId = d.Id
where (e.DepartmentId, e.Salary) in (select DepartmentId, max(Salary)
from Employee
group by DepartmentId)
;

