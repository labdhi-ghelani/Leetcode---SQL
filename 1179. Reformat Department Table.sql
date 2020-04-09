#Revise, Solve again
My Solution

select id, 
sum(case when month = 'Jan' then revenue else null end ) as Jan_Revenue,
sum(case when month = 'Feb' then revenue else null end ) as Feb_Revenue,
sum(case when month = 'Mar' then revenue else null end ) as Mar_Revenue, 
sum(case when month = 'Apr' then revenue else null end ) as Apr_Revenue, 
sum(case when month = 'May' then revenue else null end ) as May_Revenue, 
sum(case when month = 'Jun' then revenue else null end ) as Jun_Revenue, 
sum(case when month = 'Jul' then revenue else null end ) as Jul_Revenue, 
sum(case when month = 'Aug' then revenue else null end ) as Aug_Revenue, 
sum(case when month = 'Sep' then revenue else null end ) as Sep_Revenue, 
sum(case when month = 'Oct' then revenue else null end ) as Oct_Revenue, 
sum(case when month = 'Nov' then revenue else null end ) as Nov_Revenue, 
sum(case when month = 'Dec' then revenue else null end ) as Dec_Revenue
from Department
group by id;

Order of SQL Statement Execution
from
where
group
having
select
order by
limit

My assumption:
case
sum 
group by


Other Solution

select id
  , [Jan] as Jan_revenue
  , [Feb] as Feb_revenue
  , [Mar] as Mar_revenue
  , [Apr] as Apr_revenue
  , [May] as May_revenue
  , [Jun] as Jun_revenue
  , [Jul] as Jul_revenue
  , [Aug] as Aug_revenue
  , [Sep] as Sep_revenue
  , [Oct] as Oct_revenue
  , [Nov] as Nov_revenue
  , [Dec] as Dec_revenue
  from(
select * from department
pivot
(
sum(revenue)
for month in ([Jan],[Feb],[Mar],[Apr],[May],[Jun],[Jul],[Aug],[Sep],[Oct],[Nov],[Dec])) as pivot_tble)p


PIVOT operator can convert rows to columns.
nice example : https://databricks.com/blog/2018/11/01/sql-pivot-converting-rows-to-columns.html
https://www.youtube.com/watch?v=ozy31aJpW-o
