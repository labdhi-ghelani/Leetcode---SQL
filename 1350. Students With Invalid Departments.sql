My solution

select s.id, s.name from Students s
left join Departments d
on s.department_id  = d.id
where s.department_id NOT IN (Select id from Departments);

Other way

select s.id,s.name from Students s 
left join Departments d on s.department_id = d.id
where d.id is null

This is an interesting approach rather than complicating it because need to find 
students who are enrolled in departments that no longer exists.

https://tinyurl.com/rv7qwq9
IS NULL operator is used to filter the record where a particular column has null value on which IS NULL operator is applied.

ISNULL() function is used to replace null value from another value

