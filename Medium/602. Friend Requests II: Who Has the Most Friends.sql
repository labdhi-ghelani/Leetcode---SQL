My solution: (Totally wrong and horrible)

select requester_id, sum(count(requester_id)+count(accepter_id)) as numcount
from
(
select requester_id, count(requester_id)
from request_accepted
group by requester_id) as a
left join 
(select accepter_id, count(accepter_id)
from request_accepted
group by accepter_id
) as b
on a.requester_id = b.accepter_id
group by requester_id
;
                                                   
#Cannot use sum(Count())
                
Other smart solution:
                
SELECT ids as id , COUNT(*) as num
FROM 
  (SELECT requester_id as ids FROM request_accepted
   UNION ALL
   SELECT accepter_id as ids FROM request_accepted) AS u
GROUP BY ids
ORDER BY COUNT(*) DESC
LIMIT 1             
                                                   
