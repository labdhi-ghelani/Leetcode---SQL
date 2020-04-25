SELECT min(log_id) as start_id, max(log_id) as end_id
FROM
(SELECT log_id, ROW_NUMBER() OVER(ORDER BY log_id) as num
FROM Logs) a
GROUP BY log_id - num;

Imp to understand how the group by works in this case. Difficult problem. DIY next time. 

Self Join:


select L1.log_id as START_ID, min(L2.log_id) as END_ID
from 
	(select log_id from Logs 
	where log_id-1 not in (select log_id from Logs)) L1,
	(select log_id from Logs 
	where log_id+1 not in (select log_id from Logs)) L2
where L1.log_id <= L2.log_id
group by L1.log_id
