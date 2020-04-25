My solution: (hard coded) - disappointing!!


select activity
from
(select activity, count(activity)
from Friends
group by activity
order by  count(activity)
limit 1 offset 1) as t;


Other solution:


SELECT activity
FROM
(SELECT activity, count(*) as ac, 
       max(count(*)) OVER () as max_num, 
       min(count(*)) OVER () as min_num
FROM Friends
GROUP BY activity ) tablea
WHERE ac not in (max_num, min_num);

Imp: can use min(count(*)) in windows partition

select activity 
from friends
group by activity
having count(*)> (select count(*) from friends group by activity order by 1 limit 1)
and count(*)< (select count(*) from friends group by activity order by 1 desc limit 1)
