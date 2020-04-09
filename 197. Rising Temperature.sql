My solution

select a.id from weather a
where a.temperature > (select b.temperature from weather b where b.recorddate=a.recorddate-1)

Consider b = previous and a = next while reading it aloud especially for the subquery. 
This is a valid solution for Oracle and not MySQL because in MySQL,
you can't simply 'minus' or 'plus' one on a datetime format data. But it works for Oracle

For MySQL you can use DATEDIFF(),
MySQL DATEDIFF() returns the number of days between two dates or datetimes. 
This function only calculates the date portion from each expression.

SELECT
    a.id AS 'Id'
FROM
    weather a
        JOIN
    weather b ON DATEDIFF(a.date, b.date) = 1
        AND a.Temperature > b.Temperature
;

