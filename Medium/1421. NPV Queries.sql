select  q.id,
q.year,
ifnull(NPV.npv, 0) AS npv
from Queries q left join NPV
on q.id = NPV.id and q.year=NPV.year
order by q.id,
q.year;
