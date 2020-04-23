select f1.followee as follower, count(distinct f1.follower) as num
from follow f1
join follow f2
on f2.follower = f1.followee
group by f1.followee
order by 1;

#☺️
