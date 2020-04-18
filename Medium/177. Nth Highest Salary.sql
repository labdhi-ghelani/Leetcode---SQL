My solution:


Other solution:

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
DECLARE M INT;
SET M=N-1;
  RETURN (
      # Write your MySQL query statement below.
      SELECT DISTINCT Salary FROM Employee ORDER BY Salary DESC LIMIT M, 1
  );
END

select top 1 result.Salary from
(select Salary, DENSE_RANK() over (order by salary DESC) as dnrank
from Employee) RESULT
where RESULT.dnrank = @N

https://www.guru99.com/sql-server-variable.html
https://stackoverflow.com/questions/1180279/when-do-i-need-to-use-begin-end-blocks-and-the-go-keyword-in-sql-server
