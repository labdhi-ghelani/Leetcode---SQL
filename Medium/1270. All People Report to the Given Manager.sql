My solution:

select e1.employee_id
from Employees e1
join Employees e2
on e1.employee_id = e2.manager_id
where e1.manager_id in (select employee_id
from Employees
where manager_id = 1 and employee_id <> 1)
union 
select e2.employee_id from Employees e1
join Employees e2
on e1.employee_id = e2.manager_id
where e1.manager_id in (select employee_id
from Employees
where manager_id = 1 and employee_id <> 1)
union
select employee_id
from Employees
where manager_id = 1 and employee_id <> 1
;


My solution is very much hardcoded and very inefficient. The key here is to understand how the tables are being joined with each other.
Once the tables are joined, identify a common pattern and place it as a condition.
Your que to joining tables with the On condition was :
The employee with employee_id 4 report his work indirectly to the head of the company 4 --> 2 --> 1. 
The employee with employee_id 7 report his work indirectly to the head of the company 7 --> 4 --> 2 --> 1.

employee table -> manager table -> super manager table

Important solution:

select e1.employee_id from Employees e1 
join Employees e2 on e1.manager_id = e2.employee_id
join Employees e3 on e2.manager_id = e3.employee_id
where e3.manager_id = 1 and e1.employee_id !=1;
