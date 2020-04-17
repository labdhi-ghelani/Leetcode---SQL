My solution:

select t.actor_id, t.director_id
from 
(select actor_id, director_id,sum( if((actor_id = director_id),1,0) ) as coop_count
from ActorDirector
group by actor_id, director_id
having coop_count >= 3) as t;

But, Does not pass all the test cases. check why. 


Other solution:

select actor_id as ACTOR_ID, director_id as DIRECTOR_ID from ActorDirector
group by actor_id,director_id
having count(1) >= 3;

select distinct actor_id, director_id from (
select actor_id, director_id, count(*) over (partition by actor_id, director_id) as co
from actorDirector) as summary 
where summary.co >= 3

select
    actor_id as ACTOR_ID
    ,director_id as DIRECTOR_ID
from (
select
    actor_id
    ,director_id
    ,count(*) as count
from
    ActorDirector
group by
    actor_id, director_id
) t
where
    t.count >=3
