select ifnull(max(n.num),null) as num from 
(
select num
from my_numbers  
group by num
having count(num)=1
)  as n;

 Using subquery and ifnull() and MAX() function
