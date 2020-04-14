select p.product_id as product_id, sum(s.quantity) as total_quantity
from Product as p join Sales as s
on p.product_id = s.product_id
group by p.product_id;

Other solution:
Could have also done it without the join but also (https://leetcode.com/problems/product-sales-analysis-ii/discuss/305881/Why-they-provide-the-second-table)


select product_id, sum(quantity) as total_quantity from Sales 
group by product_id
