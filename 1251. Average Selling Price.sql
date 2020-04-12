select p.product_id, round(sum(p.price*u.units)/sum(u.units),2) as average_price
from Prices p join UnitsSold u
on p.product_id = u.product_id
where u.purchase_date BETWEEN p.start_date AND p.end_date
group by p.product_id
;

Understand : Since it is grouped by product ids, the sum will be corresponding to the exact rows. 

