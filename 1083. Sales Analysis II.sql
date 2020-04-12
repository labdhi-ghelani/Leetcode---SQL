select distinct buyer_id from Sales 
join Product using(product_id)
where product_name = 'S8'
and buyer_id not in (select buyer_id from Sales s
                    join Product p on s.product_id = p.product_id
                 where product_name ='Iphone'
                  ) 
                  
 The challenge here is to remove buyers who are not exclusive buyers of S8
                  
                  
The USING clause is something we don't need to mention in the JOIN condition when we are retrieving data from multiple tables. 
When we use USING clause, that particular column name should be present in both tables, 
and the SELECT query will automatically join those tables using the given column name in USING clause.

for e.g. if there are two common column names in the table, then Mention the desired common column name in the USING clause

The USING clause: This allows you to specify the join key by name.
The ON clause: This syntax allows you to specify the column names for join keys in both tables.

