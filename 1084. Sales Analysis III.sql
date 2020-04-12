SELECT product_id, product_name
FROM Sales 
JOIN Product 
Using(product_id)
GROUP BY product_id
HAVING MIN(sale_date) >= '2019-01-01' AND MAX(sale_date) <= '2019-03-31' 

The MIN(), MAX() logic is crucial here. It will help to sepearate S8 and G4. Without using min() and max() if you try it 
with simple where clause you will get both S8 and G4. hence since you have to use min and max with the group by and having clause.

Another great solution,

SELECT Product.product_id, Product.product_name
FROM Product
WHERE product_id NOT IN (SELECT product_id FROM Sales WHERE sale_date NOT BETWEEN '2019-01-01' AND '2019-03-31');

The second solution is intuitive, smart and fast. 


Also, if you are not doing any aggregation of columns in the select clause then
All column names in SELECT list must appear in GROUP BY
https://stackoverflow.com/questions/5986127/do-all-columns-in-a-select-list-have-to-appear-in-a-group-by-clause
