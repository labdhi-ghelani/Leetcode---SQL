my solution:

select viewer_id as id
from Views
where viewer_id = author_id
group by viewer_id
having count(viewer_id)>=1;


other solutions:

1. If with distinct keyword,

SELECT DISTINCT author_id AS id FROM Views 
where author_id = viewer_id 
ORDER BY id

2.If order by first, we need another Select and alias
SELECT id from (SELECT author_id AS id FROM Views 
where author_id = viewer_id 
ORDER BY id)a
GROUP BY id


3.If just with group by (automatically sorted by id)
SELECT author_id AS id FROM Views 
where author_id = viewer_id 
GROUP BY id
