My solution:

select t.country_name, case
when t.weather_type <= 15 then 'Cold'
when t.weather_type >= 25 then 'Hot'
else 'Warm'
end as weather_type
from
(select country_name, avg(weather_state) as weather_type from Countries c, Weather w where c.country_id = w.country_id and month(day) = 11
group by country_name) as t;

Can also be done using joins instead of sub queries:

select a.country_name,(case when b.average <=15 then 'Cold' 
                                  when b.average >=25 then 'Hot'
                                  else 'Warm' end
 )as weather_type
from countries a
join
(select country_id,avg(weather_state) as average 
from weather 
where month(day)=11
group by country_id) b
on a.country_id=b.country_id;
