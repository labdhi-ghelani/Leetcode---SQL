select Name
from Employee
where Id in (
select ManagerId
from Employee
group by ManagerId
having count(ManagerId) >= 5 and ManagerId is not null);

SELECT
    Name
FROM
    Employee AS t1 JOIN
    (SELECT
        ManagerId
    FROM
        Employee
    GROUP BY ManagerId
    HAVING COUNT(ManagerId) >= 5) AS t2
    ON t1.Id = t2.ManagerId
;
