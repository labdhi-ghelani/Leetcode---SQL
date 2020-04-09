select distinct s1.sub_id as post_id, (select count( distinct s2.sub_id) 
from submissions s2
where parent_id = post_id
) as  number_of_comments

from submissions s1
where s1.parent_id IS NULL
group by s1.sub_id;


First, you filter data for the post_id column where you satisfy the NULL condition and group it
Second, you figure out the condition to count the number of comments. ie count the number of comments for every post id which you 
you can get it from the outer query
Third, you do not want to count the comments based on parent_id. since that would result into 
{"headers": ["post_id", "number_of_comments"], "values": [[1, 4], [2, 2], [12, 0]]} -> 4,2,0 if you use it without distinct
Fourth, hence you want to count the DISTINCT sub_id
                                                                           
 Also keep in mind, 
It is not possible to test for NULL values with comparison operators, such as =, <, or <>.
We will have to use the IS NULL and IS NOT NULL operators instead.                                                                          
                                                                           
                                                                          

