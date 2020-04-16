My solution:

select extra as report_reason, count(distinct post_id) as report_count
from Actions
where action_date = '2019-07-04' and action = 'report'
group by extra;

I was trying to group it by post_id as well which is wrong because it will count all 3 different post_ids as a single occurence

Other solution:

SELECT extra as report_reason, COUNT(DISTINCT post_id) AS report_count
FROM Actions
WHERE extra IS NOT NULL
AND action = 'report'
AND action_date = DATE_ADD('2019-07-05', INTERVAL -1 DAY)
GROUP BY extra

for the date:
DATE_ADD()
DATE_ADD(date, INTERVAL value addunit)
https://www.w3schools.com/sql/func_mysql_date_add.asp
