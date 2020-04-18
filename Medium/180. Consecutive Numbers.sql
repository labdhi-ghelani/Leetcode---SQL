First try to understand 

#Select distinct numbers that appear consecutively twice
select distinct a.Num as ConsecutiveNums
from Logs a join Logs b
on a.Num = b.Num and a.Id  = b.Id -1;

#Now for distinct numbers that appear consecutively thrice

select distinct a.Num as ConsecutiveNums 
from Logs a join Logs b
on a.Num = b.Num and a.Id  = b.Id -1
join Logs c
on b.Num = c.Num and b.Id = c.Id -1;

https://nifannn.github.io/2017/10/27/SQL-Notes-Leetcode-180-Consecutive-Numbers/#analysis
