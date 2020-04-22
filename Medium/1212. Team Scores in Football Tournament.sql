My solution:

select team_id, team_name, 
sum(case when team_id = host_team and host_goals > guest_goals then 3 else 0 end)+
sum(case when team_id = guest_team and guest_goals > host_goals then 3 else 0 end)+
sum(case when team_id = host_team and host_goals = guest_goals then 1 else 0 end)+
sum(case when team_id = guest_team and guest_goals = host_goals then 1 else 0 end)
as num_points 
from Teams
left join Matches
on team_id = host_team or team_id = guest_team
group by team_id, team_name
order by num_points DESC, team_id ASC;


It was important to consider all the types of cases. 
and sum()+sum()+sum()+sum() as num_points and not sum(sum(),sum(),sum(),sum())
Also important to consider the OR condition in the key match 


Other solution:

WITH cte AS
(
SELECT match_id, guest_team as t1, host_team as t2, guest_goals as g1, host_goals as g2 FROM Matches 
UNION ALL
SELECT match_id, host_team as t1, guest_team as t2, host_goals as g1, guest_goals as g2 FROM Matches 
)
SELECT team_id, team_name,
SUM(CASE WHEN g1 > g2 THEN 3
    WHEN g1 = g2 THEN 1 ELSE 0 END) AS num_points    
FROM cte
Right join Teams t on cte.t1 = t.team_id 
GROUP BY team_id, team_name 
ORDER BY num_points DESC;
