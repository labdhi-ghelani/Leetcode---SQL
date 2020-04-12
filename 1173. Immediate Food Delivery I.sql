SELECT round(avg(CASE WHEN order_date = customer_pref_delivery_date
THEN 1 ELSE 0 END)*100,2) AS immediate_percentage
FROM delivery;

SELECT ROUND(SUM(imm) / COUNT(delivery_id) * 100, 2) immediate_percentage
FROM (SELECT delivery_id, IF(order_date = customer_pref_delivery_date, 1, 0) imm FROM Delivery) AS x;

(Ideally you should have been able to solve using the second approach)
