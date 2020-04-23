select round(avg(t.percentage_removed),2) as average_daily_percent
from (
select Actions.action_date, round(count(distinct Removals.post_id)/count(distinct Actions.post_id)*100,2) as percentage_removed
from Actions
left join Removals
on Actions.post_id = Removals.post_id
where extra = 'spam'
group by Actions.action_date) as t

☺️
