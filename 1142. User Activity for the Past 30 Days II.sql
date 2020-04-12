My solution

select round(ifnull(avg(a.count_session_id),0),2) as average_sessions_per_user
from (
select count(distinct session_id) as count_session_id
from Activity 
where activity_date between '2019-06-28' and '2019-07-27' 
group by user_id
having count_session_id>= 1 ) as a;

Mistakes i made in my first attempt:

-Forgot to include ifnull() and messed up the activity dates.
-IMP* (The caveat here is you need a subquery to calculate your average from)
https://stackoverflow.com/questions/26377254/sql-select-average-from-distinct-column-of-table
