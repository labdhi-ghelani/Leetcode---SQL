Solution:


select results from 
(
    (SELECT u.name as results
  FROM Movie_Rating r 
  LEFT JOIN Users u
  ON (r.user_id = u.user_id)
  group by r.user_id, u.name
  ORDER BY COUNT(r.movie_id) DESC, u.name 
  LIMIT 1)) as first_query 
UNION
select results from
(
    select Movies.title as results, Movies.movie_id
  from Movie_Rating
  join Movies
  on Movie_Rating.movie_id  =Movies.movie_id  
  where month(Movie_Rating.created_at) = 2 and year(Movie_Rating.created_at)=2020
  group by Movies.movie_id, Movies.title
  order by avg(Movie_Rating.rating) desc, Movies.title asc
  limit 1) as second_query;
  
1. When using union use () before and after for each of the queries
2. Query1 : is Daniel has rated the highest number of queries and then Monica not maria*
3. See how they have used an aggregated function count in the order by statement and not in the select statement
3. Imp to order it by movies.title asc as well

