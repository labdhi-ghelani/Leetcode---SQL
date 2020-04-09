My solution 

select distinct Email 
from Person
group by Email
having count(Email)>1;

OR

SELECT DISTINCT p1.Email
FROM Person p1, Person p2
WHERE p1.Email = p2.Email and p1.id != p2.id
;


SQL Execution Order : 
1. FROM and JOINs
2. WHERE
3. GROUP BY
4. HAVING
5. SELECT
6. DISTINCT
7. ORDER BY
8. LIMIT / OFFSET

https://sqlbolt.com/lesson/select_queries_order_of_execution
