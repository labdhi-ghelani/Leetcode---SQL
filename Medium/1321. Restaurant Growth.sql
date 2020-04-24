select a.visited_on, sum(b.amount) as amount, round(sum(b.amount)/7,2) as average_amount
from
(select visited_on,sum(amount) as amount
from Customer
group by visited_on) as a
left join (select visited_on,sum(amount) as amount from Customer
group by visited_on) as b
on b.visited_on between subdate(a.visited_on,6)
and a.visited_on
group by a.visited_on
having count(b.visited_on)=7;

difficult problem to understand, solve again on your own later
imp: on b.visited_on between subdate(a.visited_on,6)
try exporting the data in an excel sheet to understand how the join was executed
