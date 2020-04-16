My solution: 

select s.student_id, s.student_name , sub.subject_name, ifnull(count( e.subject_name),0) as attended_exams
 from Students s join Subjects sub
 left join Examinations e
 on s.student_id = e.student_id and e.subject_name = sub.subject_name
 group by s.student_id,s.student_name, sub.subject_name
 order by s.student_id, s.student_name;

Imp: Did not include 2 conditions while joining which was the tricky part. You need them to be true together or else you will get duplicate values

Other solution:

SELECT student_id, student_name, subject_name, 
(
    SELECT ifnull(COUNT(*),0)
    FROM examinations e
    WHERE e.student_id = st.student_id and e.subject_name = s.subject_name
) AS attended_exams
FROM students st, subjects s
GROUP BY student_id, subject_name
