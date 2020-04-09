My Solution

Explicit Join

select e2.Name as Employee 
from Employee e1 join Employee e2
on e1.Id = e2.ManagerId 
where e1.Salary < e2.Salary;

Using self join, the LHS of the table would be the manager details and the RHS employee details. And e2.Name since you want Employee name. 

Other Solution

SELECT
    a.Name AS 'Employee'
FROM
    Employee AS a,
    Employee AS b
WHERE
    a.ManagerId = b.Id
        AND a.Salary > b.Salary
        
 Joining by using the where clause will create a cartesian product. Avoid this approach. 
