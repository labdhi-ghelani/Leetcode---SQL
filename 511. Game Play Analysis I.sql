My solution:

select distinct player_id , min(event_date) as first_login
from Activity
group by player_id;

Other solution:
Window function using dense_rank()

select a.player_id, a.event_date as first_login 
from 
(select player_id, event_date, dense_rank() over (partition by player_id order by event_date) as Rank from Activity) 
as a 
where Rank < 2 

select player_id, event_date as first_login
from
(select player_id, event_date,
rank() over (partition by player_id order by event_date) as rnk
from Activity1) as temp
where rnk =1;

https://www.sqlservertutorial.net/sql-server-window-functions/sql-server-dense_rank-function/
