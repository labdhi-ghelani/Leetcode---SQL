select product_id,year as first_year, quantity, price
from(
select product_id,year, quantity, price,
 rank() over (partition by product_id order by year) as rnk
from Sales
) as t
where rnk = 1;

select product_id, year as first_year, quantity, price from sales 
where (product_id, year) in (select product_id,min(year) as year from Sales
                            group by product_id);

#Can use window function as well us combined columns in( where and in)
