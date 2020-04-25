My solution:

select round(count(b.player_id)  / count(distinct a.player_id) ,2) as fraction
from Activity a
left join Activity b
on a.player_id = b.player_id and a.event_date = b.event_date - 1
;

Does not pass all the test cases because i completely disregarded the first login aspect of the players.

Other solution (correct):

select round(count(t2.player_id) / count( t1.player_id),2) as fraction 
from 
(select player_id, min(event_date) as first_login from Activity group by player_id) t1 left join Activity t2 
on t1.player_id = t2.player_id 
and t1.first_login = t2.event_date - 1  


