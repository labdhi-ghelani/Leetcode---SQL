My solution

select t.seller_id from
(select seller_id, sum(price) as total_price
from Sales
group by seller_id
order by total_price desc
limit 2) as t ;

This does not work for all the test cases

Input
{"headers":{"Product":["product_id","product_name","unit_price"],"Sales":["seller_id","product_id","buyer_id","sale_date","quantity","price"]},"rows":{"Product":[[1,"S8",1000],[2,"G4",800],[3,"iPhone",1400]],"Sales":[[1,1,1,"2019-01-21",2,2000],[2,2,3,"2019-06-02",1,800],[3,3,4,"2019-05-13",2,2800]]}}
Output
{"headers": ["seller_id"], "values": [[3], [1]]}
Expected
{"headers":["seller_id"],"values":[[3]]}

Other solution (Which i could not understand) : Why would it not include seller_id 2?

SELECT seller_id
FROM Sales
GROUP BY seller_id
HAVING SUM(price) = (SELECT SUM(price)
					           FROM Sales
                     GROUP BY seller_id
                     ORDER BY 1 DESC
                     LIMIT 1 )
                     
Solution that I understood: Using the all operator
https://www.w3schools.com/sql/sql_any_all.asp
The ANY and ALL operators are used with a WHERE or HAVING clause.
The ALL operator returns true if all of the subquery values meet the condition.

SELECT seller_id
FROM Sales
GROUP BY seller_id
HAVING SUM(PRICE) >= all (
    SELECT SUM(PRICE)
    FROM Sales
    GROUP BY seller_id
)


**You cannot use max(sum()): https://stackoverflow.com/questions/19671763/how-to-use-sql-maxsum-function
**SELECT TOP 1 WITH TIES seller_id
FROM Sales
GROUP BY seller_id
ORDER BY SUM(price) DESC
https://www.geeksforgeeks.org/sql-ties-clause/
