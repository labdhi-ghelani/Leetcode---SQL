My Solution
### CASE FUNCTION ###
SYNTAX
CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    WHEN conditionN THEN resultN
    ELSE result
END;

Remember do not use () after the case keyword.

select x,y,z, case
when x+y>z  and  y+z>x  and x+z>y then 'Yes' else 'No' end as 'triangle'
from triangle;

Remember do not use OR because you want all the three conditions to be satisfied not either of them. 
Because by definition, the sum of any 2 sides of a triangle must be greater than the measure of the third side. 
Note: This rule must be satisfied for all 3 conditions of the sides.

Another Solution by ### IF FUNCTION ###
The IF() function returns a value if a condition is TRUE, or another value if a condition is FALSE.

select *,
    if(x+y>z and x+z>y and y+z>x, 'Yes', 'No') as 'triangle'
from triangle;
