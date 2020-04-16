My solution:

select employee_id, count(employee_id) over (partition by team_id) as team_size
from Employee1
order by employee_id;

Although it generates a syntax error on leetcode but works fine on sql workbench (O_o)
https://leetcode.com/problems/find-the-team-size/discuss/468768/Simple-three-line-solution

Other smart solution with join and subquery:

SELECT e.employee_id, t.team_size FROM Employee e JOIN
(SELECT team_id, COUNT(DISTINCT employee_id) as team_size FROM Employee GROUP BY team_id) t
ON t.team_id = e.team_id
