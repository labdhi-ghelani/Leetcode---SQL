select e.name, b.bonus from Employee e
left join Bonus b on e.empID = b.empID 
where b.bonus < 1000 or b.bonus is null;


Other solution:
with COALESCE
SELECT
e.name,
b.bonus
FROM Employee e
LEFT JOIN Bonus b
ON e.empId = b. empId
WHERE COALESCE(b.bonus, 0) < 1000

COALESCE
https://www.w3schools.com/sql/func_sqlserver_coalesce.asp
