I should have got this!

SELECT customer_id, customer_name
FROM Customers
WHERE customer_id IN (
    SELECT customer_id FROM Orders
    GROUP BY customer_id
    HAVING SUM(product_name='A')>0 
        AND SUM(product_name='B')>0 
        AND SUM(product_name='C')=0
)
ORDER BY customer_id;

Imp tip: you could also place a condition inside sum() in having clause. WOW!!
HAVING SUM(product_name='A')>0 


Or (this is a very basic solution which you should have totally got it!)

select distinct customer_id, customer_name
from Customers
where customer_id in
(
    select customer_id
    from Orders
    where product_name='A'
) and customer_id in
(
    select customer_id
    from Orders
    where product_name='B'
) and customer_id not in
(
    select customer_id
    from Orders
    where product_name='C'
) ;
