Performance rating data
```sql
1. Which movies generated the highest revenue?

SELECT revenue, original_title                                                 
FROM movies 
ORDER BY revenue   
DESC LIMIT 5;
 

2. How many movies has each director made?

SELECT name, 
COUNT(original_title) 
FROM directors 
JOIN movies 
ON directors.uid = movies.uid 
GROUP BY name 
ORDER BY name;

3. What is the total and average revenue across all movies?
SELECT SUM(revenue), AVG (revenue) 
FROM movies;

Comparison

1. How do average ratings differ by director?

SELECT
    name AS director_name,
    AVG(vote_average) AS avg_rating,
    COUNT(movies.id) AS movie_count
FROM movies
JOIN directors 
    ON movies.director_id = directors.id
WHERE vote_average IS NOT NULL
GROUP BY name
HAVING COUNT(movies.id) >= 3
ORDER BY avg_rating DESC;

2. How does total revenue compare across release years?
SELECT 
    SUBSTR(release_date,1,4) AS release_year, 
    SUM(revenue) AS total_revenue, 
    COUNT(id) AS movie_count 
FROM movies 
GROUP BY release_year 
ORDER BY total_revenue DESC; 
release_year  total_revenue  movie_count
------------  -------------  -----------
2012          24141710246    207        
2014          24120490589    234        
2013          23411493295    230        
2015          22775024221    210        
2009          21072651506    245   

3. How do average budgets differ by director?
SELECT 
    name, 
    AVG(budget) AS average_budget 
FROM movies 
JOIN directors ON movies.director_id = directors.id 
GROUP BY name 
ORDER BY average_budget 
DESC LIMIT 5;
name            average_budget  
--------------  ----------------
Byron Howard    260000000.0     
Lee Unkrich     200000000.0     
Dan Scanlon     200000000.0     
David Yates     193333333.333333
Brenda Chapman  185000000.0   
- movies.director_id is a foreign key to directors.id that is why they can join
  -“For each movie, find the director whose id matches the movie’s director_id.”
```














