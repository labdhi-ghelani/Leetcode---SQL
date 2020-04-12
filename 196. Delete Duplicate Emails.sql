DELETE FROM Person WHERE Id NOT IN 
(SELECT * FROM(
    SELECT MIN(Id) FROM Person GROUP BY Email) as p);
    
  Since you want to retain the smallest id of all the duplicate email ids. 
  
  Delete Syntax:
  DELETE FROM table_name WHERE condition;
  
  Another solution:
  
  DELETE p1 FROM Person p1,
    Person p2
WHERE
    p1.Email = p2.Email AND p1.Id > p2.Id
    
    Delete the table where the id is greater than its corresponding table id given the email are the same.
