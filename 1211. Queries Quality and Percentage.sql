My solution(completely wrong)

select q.query_name, round(sum(q.rating/q.position)/count(q.query_name),2) as quality, 
case
when q.rating < 3 then count(q.rating)/count(q.query_name) 
end as poor_query_percentage 
from Queries q
group by q.query_name, q.rating;

Other solution:

SELECT query_name, 
ROUND(sum(rating/position) / count(*), 2) AS quality,    
ROUND(sum(case when rating <3 then 1 else 0 end) / count(*) * 100, 2) AS poor_query_percentage
FROM Queries 
GROUP BY query_name


break down the problem by group by query_name, we treat each group individually
calculate individual rating/ position, then sum it up and divided by the total counts, that gives as individual group quality
set up a new variable when rating is less than 3 have it to be 1 else to be 0, sum this varaible up as count of ratings < 3 and divided by the count times 100 gives us poor_query_percentage
