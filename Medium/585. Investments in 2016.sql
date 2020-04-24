
select sum(TIV_2016) as TIV_2016
from insurance
where TIV_2015 in (
select TIV_2015
from insurance
group by TIV_2015
having count(TIV_2015) > 1)
and 
concat(lat,lon) in
(select concat(lat,lon)
from insurance
where concat(lat,lon) in (select concat(i.lat,i.lon) from insurance i group by i.lat,i.lon having count(concat(i.lat,i.lon))=1)
)
;


#Two different where conditions to be satisfied together by AND operator
#you can combine two columns by using concat
#notice the group by i.lat,i.lon
