My solution☺️ : 

select person_name
from(
select person_name, turn, weight, sum(weight) over (order by turn) as sumofweight
from queue
) as t
where sumofweight <= 1000
order by turn desc
limit 1;

OR 


select top 1 person_name
from(
select person_name, turn, weight, sum(weight) over (order by turn) as sumofweight
from queue
) as t
where sumofweight <= 1000
order by turn desc
;

Other join solution:

select q1.person_name from Queue as q1
inner join
Queue as q2
on q1.turn>=q2.turn
group by q1.turn
having sum(q2.weight)<=1000
order by sum(q2.weight) desc
limit 1

Try the join condition on a piece of paper and you will understand why on q1.turn>=q2.turn and why
group by q1.turn
