My solution: 

select t.Name from
(
select Candidate.id, Candidate.Name, count(Candidate.id)  as count_of_votes
from Candidate
join Vote
on Candidate.id = Vote.CandidateId
group by Candidate.id, Candidate.Name
order by count_of_votes desc
limit 1) as t;
