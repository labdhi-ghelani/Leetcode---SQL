
My Solution:

select c.Name as 'Customers' from Customers c
join Orders o 
on c.Id = o.CustomerId and c.Id not in (
    select customerid from orders
);

This is an incorrect query. Retry it again. 

