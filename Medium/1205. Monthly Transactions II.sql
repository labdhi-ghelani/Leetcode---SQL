SELECT month, 
country, 
SUM(CASE WHEN state = "approved" THEN 1 ELSE 0 END) AS approved_count, 
SUM(CASE WHEN state = "approved" THEN amount ELSE 0 END) AS approved_amount, 
SUM(CASE WHEN state = "chargeback" THEN 1 ELSE 0 END) AS chargeback_count, 
SUM(CASE WHEN state = "chargeback" THEN amount ELSE 0 END) AS chargeback_amount
from
(
SELECT trans_id as id, LEFT(chargebacks.trans_date, 7) AS month, country, "chargeback" AS state, amount
FROM chargebacks
JOIN transactions ON chargebacks.trans_id = transactions.id
UNION ALL
SELECT id,LEFT(trans_date, 7) AS month, country, state, amount
FROM transactions
WHERE state = "approved") as t
GROUP BY month, country;  


Similar to the previous Question MontSetting the value of a column in select hly Transactions I, the trick over here is "chargeback" AS state.

And also using union to get all the months required.
