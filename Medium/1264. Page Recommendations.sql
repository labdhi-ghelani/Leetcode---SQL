My solution☺️:

select distinct page_id as recommended_page
from
(select user2_id as user_id
from Friendship
where user1_id = 1 
union
select user1_id
from Friendship
where user2_id = 1) as t
left join Likes
on t.user_id = Likes.user_id
where page_id not in (select page_id from Likes where user_id = 1) and page_id is not null;

Hint: it was important to check if the page_id is not null for all the test cases to pass.

Other solution: No Join, No Union, Only Where Clause.

SELECT DISTINCT page_id AS recommended_page FROM Likes
WHERE user_id IN 
(SELECT CASE WHEN user1_id=1 THEN user2_id WHEN user2_id=1 THEN user1_id ELSE '' END
FROM Friendship WHERE user1_id=1 or user2_id=1)
AND page_id NOT IN 
(SELECT DISTINCT page_id FROM Likes WHERE user_id=1);
