My solution ☺️ : method 2

select player_id, event_date,
sum(games_played) over (partition by player_id order by event_date) as games_played_so_far
from Activity;

--Method 1: Using Self Join (fastest solution of all the 3)

SELECT a1.player_id, a1.event_date,
SUM(a2.games_played) AS games_played_so_far
FROM activity a1, activity a2
WHERE a1.player_id = a2.player_id
AND a1.event_date >=a2.event_date
GROUP BY a1.player_id, a1.event_date
ORDER BY a1.player_id, a1.event_date;

Method 3: Using correlated sub query

 SELECT a1.player_id, a1.event_date,
 (SELECT sum(a2.games_played) FROM activity a2
 WHERE a1.player_id = a2.player_id AND a1.event_date >=a2.event_date
 GROUP BY a1.player_id)
 AS games_played_so_far
 FROM activity a1 ORDER BY a1.player_id, games_played_so_far;
