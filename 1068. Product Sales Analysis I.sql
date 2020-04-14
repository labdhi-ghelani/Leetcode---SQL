select product_name, year, price
from Product  join Sales 
using(product_id)
order by year;


select Product.product_name, Sales.year, Sales.price
from Product, Sales
where Product.product_id = Sales.product_id
