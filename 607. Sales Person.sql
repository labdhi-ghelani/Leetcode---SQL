select name from salesperson
where sales_id NOT IN
(select o.sales_id
from company c join orders1 o
on c.com_id = o.com_id
where c.name = 'RED');

https://leetcode.com/problems/sales-person/solution/


select salesperson.name
from orders o join company c on (o.com_id = c.com_id and c.name = 'RED')
right join salesperson on salesperson.sales_id = o.sales_id
where o.sales_id is null
