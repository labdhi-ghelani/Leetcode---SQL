My solution: wrong, since you need to update the values without using the select statement 

select id, name, (case
when sex = 'm' then 'f' 
when sex = 'f' then 'm'
end ) as sex, salary
from salary;

Right solution:

UPDATE salary
  SET sex = 
    CASE sex 
        when 'f' then 'm' 
        when 'm' then 'f' 
        else sex    -- just in case it contains a new value, we keep it
    END
  ;
  
  
 update salary
    set sex = 
    case when sex = 'm' then 'f'
    else 'm' end 
    
    
    The second solution is a smarter way.
