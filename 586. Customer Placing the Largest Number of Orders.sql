My solution:

select customer_number
from
(select customer_number, count(customer_number) as cnt
from orders
group by customer_number) as t
order by cnt desc
limit 1;


Other solutions:

select customer_number from orders 
group by customer_number
order by count(*) DESC Limit 1

select customer_number from orders 
group by customer_number
having count(customer_number) >= all 
(select count(customer_number) from orders group by customer_number)
;

select customer_number from orders
group by customer_number
having count(order_number) = 
(
select max(count) from 
    ( 
     select count(order_number) as count, customer_number from orders group by customer_number
     ) sub1
)
