select distinct viewer_id
from Views
group by view_date, viewer_id
having count(distinct article_id) > 1
order by 1 desc, viewer_id
;

Imp: to add "distinct" viewer_id
also one more imp thing you need not have subquery to count count first, can simply have it in the having clause eve n if the
column is not present in the selectv clause
