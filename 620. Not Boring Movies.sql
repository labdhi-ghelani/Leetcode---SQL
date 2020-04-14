My solution:

select id, movie, description, rating
from cinema
where mod(id,2)<>0 and description <> 'boring'
order by rating desc;

Other solutions:

select id, movie, description, rating from cinema 
where id%2!=0 and description!='boring'
order by rating DESC

select id,movie ,description,rating from cinema WHERE id%2 <> 0 AND description NOT LIKE 'boring'
ORDER BY rating DESC;

