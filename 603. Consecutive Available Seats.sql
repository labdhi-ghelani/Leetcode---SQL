My Solution

select distinct a.seat_id
from cinema a join
cinema b on a.seat_id = b.seat_id + 1
where a.free = 1;

(basically identified the pattern with seats as result 3,4,5 (a)and  self joined it with seats 2,3,4 (b) and filter out the free=1 seats)

Although provides the correct answer but does not stand correct for other test cases. 
For example,
Wrong Answer:
Input
{"headers":{"cinema":["seat_id","free"]},"rows":{"cinema":[[1,1],[2,1]]}}
Output
{"headers": ["seat_id"], "values": [[2]]}
Expected
{"headers":["seat_id"],"values":[[1],[2]]}

Accepted Solution:

select distinct a.seat_id
from cinema a join
cinema b on a.seat_id = b.seat_id + 1
or a.seat_id = b.seat_id-1
where a.free = 1 and b.free = 1
order by a.seat_id;

in either of the cases the seats should not be occupied and hence it should satisfy both, a.free = 1 and b.free = 1
also you would want distinct seats
