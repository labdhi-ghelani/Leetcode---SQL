My solution☺️ :

select gender, day, 
sum(score_points) over (partition by gender order by day) as total
from Scores
order by gender, day;


Using Self Join:

Self-join
A typical problem of using self-join to calculate the running aggregated stats.

SELECT s1.gender, s1.day, SUM(s2.score_points) AS total
FROM Scores AS s1,
     Scores AS s2
WHERE s1.gender = s2.gender AND s2.day <= s1.day
GROUP BY s1.gender, s1.day
ORDER BY s1.gender, s1.day
