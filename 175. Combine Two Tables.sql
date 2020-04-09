
My Solution

Explicit Join

select p.FirstName, p.LastName, a.City, a.State from Person p left join Address a
on p.PersonId = a.PersonId ;

Other Solutions
Implicit Join

select a.FIRSTNAME, a.LASTNAME, b.CITY, b.STATE from PERSON a, ADDRESS b where a.PERSONID = b.PERSONID;

Avoid using implicit join using where clause because it might create cartesian product across both the tables
(every possible combination of records between both)and then filter it based on the WHERE. 





