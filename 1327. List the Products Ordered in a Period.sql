My solution:

select t.product_name, t.sumofunit as unit from (
select p.product_id, p.product_name, sum(o.unit) as sumofunit
from Products p join Orders o
on p.product_id = o.product_id and month(o.order_date) = 02 
group by p.product_id, p.product_name) 
as t
having sumofunit  >= 100
;

Could have also done without a subquery. Also should have added the year. 

select p.product_name as Product_name, sum(o.unit) as unit
from Products p 
left join Orders o on p.product_id = o.product_id
where month(o.order_date) = 02 and year(o.order_date) = 2020
group by product_name
having sum(o.unit) >= 100
order by unit Desc;
