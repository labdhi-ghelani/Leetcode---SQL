My solution:

select activity_date as day, count(distinct user_id) as active_users
from Activity
where activity_date between '2019-06-28' and '2019-07-27' 
group by activity_date
order by activity_date;

Imp: do not count session_id or activity_date

Other Solution:

SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users
FROM Activity
GROUP BY activity_date
HAVING activity_date <= '2019-07-27' AND activity_date > '2019-06-27'

SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date BETWEEN DATE_SUB(DATE("2019-07-27"), INTERVAL 29 DAY) AND DATE("2019-07-27") 
GROUP BY activity_date; 


https://www.w3schools.com/sql/func_mysql_date_sub.asp
