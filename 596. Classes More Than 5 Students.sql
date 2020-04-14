My solution: Wrong because it does not account for distinct student taking the class (does not pass all the test cases)

select class
from courses
group by class
having count(class) >=5 
;

Correct Solution:

SELECT
    class
FROM
    courses
GROUP BY class
HAVING COUNT(DISTINCT student) >= 5
;
