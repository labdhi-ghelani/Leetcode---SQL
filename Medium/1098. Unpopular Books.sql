select b.book_id, b.name from Books as b 
left join Orders as o
 on b.book_id=o.book_id and dispatch_date between '2018-06-23' and '2019-06-23' 
where datediff('2019-06-23',b.available_from)>30
group by book_id, name
having sum(IFNULL(o.quantity, 0)) <10 ;


select b.book_id, b.name from
(select * from books where available_from < '2019-05-23') b
left join
(select * from Orders where dispatch_date > '2018-06-23') o
on b.book_id = o.book_id
group by b.book_id, b.name
having sum(o.quantity) is null or sum(o.quantity) <10;


https://leetcode.com/problems/unpopular-books/discuss/361617/Three-MySQL-solutions-with-explanations

It is important to cater to conditions in the where clause and then use the filtered table for further operations. 
