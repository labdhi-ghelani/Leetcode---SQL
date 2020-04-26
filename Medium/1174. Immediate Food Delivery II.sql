My attempt: (Total mess and incomplete)

select count(t.type)
from
(
select Delivery.*,
case when order_date =  customer_pref_delivery_date then 'immediate' else 'scheduled' end as type
from Delivery) as t
group by t.type
having sum(t.type ='immediate');


Other solution:

SELECT
    ROUND(100*SUM(CASE WHEN order_date = customer_pref_delivery_date THEN 1
    ELSE 0 END)/ COUNT(distinct customer_id) ,2) AS immediate_percentage
FROM
    Delivery
WHERE
    (customer_id, order_date)
IN
(SELECT
    customer_id, min(order_date) as min_date
FROM
    Delivery
GROUP BY
    customer_id
);
