My attempt: (Wrong)

select question_id as survey_log
from survey_log
where action = 'answer'
group by question_id
having count(action='answer') = count(answer_id);

Solution:

SELECT question_id as survey_log
FROM
(
	SELECT question_id,
         SUM(case when action="answer" THEN 1 ELSE 0 END) as num_answer,
        SUM(case when action="show" THEN 1 ELSE 0 END) as num_show,    
	FROM survey_log
	GROUP BY question_id
) as tbl
ORDER BY (num_answer / num_show) DESC
LIMIT 1

SELECT 
    question_id AS 'survey_log'
FROM
    survey_log
GROUP BY question_id
ORDER BY COUNT(answer_id) / COUNT(IF(action = 'show', 1, 0)) DESC
LIMIT 1;

WITH cte_tab as(
SELECT question_id, 
(SUM(case when answer_id is not null then 1 else 0 end)*100)/count(*) as answer_rate
FROM 
survey_log
GROUP BY question_id
)
SELECT TOP 1 question_id as survey_log FROM cte_tab ORDER BY answer_rate desc;
