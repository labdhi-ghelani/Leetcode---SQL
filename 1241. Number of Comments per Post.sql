select distinct s1.sub_id as post_id, (select count( distinct s2.sub_id) 
from submissions s2
where parent_id = post_id
) as  number_of_comments

from submissions s1
where s1.parent_id IS NULL
group by s1.sub_id;


