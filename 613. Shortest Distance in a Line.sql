My solution:

select min(abs(p1.x - p2.x)) as shortest
from point p1 join point p2 
where p1.x != p2.x;

The trick here is to self join rows which are not equal and find the absolute subtracted values. 
