My solution:

select score ,dense_rank() over(order by score DESC) as Rank
from Scores 
order by rank

DENSE_RANK() OVER (
	PARTITION BY expression1, expression2,...
	ORDER BY expression1 [ASC | DESC], expression2,..
)

**The PARTITION BY clause divides the result set into partitions to which the function applies. 
If you omit the PARTITION BY clause, the function treats the whole result set as a single partition.
The ORDER BY specifies the order of rows in each partition to which the function applies.
The DENSE_RANK() function applies to each partition separately and recomputes the rank for each partition.

https://www.sqlitetutorial.net/sqlite-window-functions/sqlite-dense_rank/

Other solution:

SELECT s.Score, COUNT(t.Score) AS Rank FROM
(SELECT DISTINCT Score FROM Scores) AS t, Scores AS s
WHERE s.Score <= t.Score
GROUP BY s.Id, s.Score
ORDER BY s.Score DESC;

Explained very well here, but do not understand it
https://nifannn.github.io/2017/10/27/SQL-Notes-Leetcode-178-Rank-Scores/
