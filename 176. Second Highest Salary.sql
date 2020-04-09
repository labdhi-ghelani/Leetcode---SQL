My Submission (Using NOT IN Operator)

select max(Salary) as SecondHighestSalary
from Employee
where Salary not in (Select max(Salary) from Employee);

Other Solutions (Using Sub Query and < Operator)

select max(salary) as SecondHighestSalary
from Employee
where salary < (select max(salary) from Employee)

SELECT
    IFNULL(
      (SELECT DISTINCT Salary
       FROM Employee
       ORDER BY Salary DESC
        LIMIT 1 OFFSET 1),
    NULL) AS SecondHighestSalary
    

The IFNULL() function returns a specified value if the expression is NULL. 
select 100 as sum;
