Performance rating data
 
#1. Which movies generated the highest revenue?
SELECT revenue, original_title                                                 
FROM movies 
ORDER BY revenue   
DESC LIMIT 5;
 

#2. How many movies has each director made?
SELECT name, 
COUNT(original_title) 
FROM directors 
JOIN movies 
ON directors.uid = movies.uid 
GROUP BY name 
ORDER BY name;

#3. What is the total and average revenue across all movies?
SELECT SUM(revenue), AVG (revenue) 
FROM movies;


Comparison
#1. How do average ratings differ by director?
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

#2. How does total revenue compare across release years?
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

#3. How do average budgets differ by director?
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

#4. Which directors outperform the dataset’s average rating?
 SELECT AVG(vote_average) FROM movies;

 SELECT name, AVG(vote_average)
 FROM directors JOIN movies 
 ON directors.id = movies.director_id 
 GROUP BY name 
 HAVING AVG(vote_average)>(SELECT AVG (vote_average) FROM movies); 

Trend Analysis
#1. How has total revenue changed by release year?
SELECT  SUBSTR(release_date, 1,4) AS release_year, SUM(revenue) 
 FROM movies 
 WHERE release_date IS NOT NULL 
 GROUP BY release_year 
 ORDER BY revenue;
-- From the data movies released >2000 are siginifacntly more likely to generate more revenue than <2000, due to increased revenue sources such as DVD and steaming services.

#2. How has average movie rating changed over time?
SELECT SUBSTR(release_date,1,4) AS release_year, AVG(vote_average) AS average_rating
 FROM movies 
 GROUP BY release_year 
 ORDER BY release_year;
-- With an average movie rating of 6.1, films released in the 1900s are more likely to achieve ratings well above the average and do so more consistently than films released in the 2000s.

#3. How has audience engagement (vote_count) evolved over time?
SELECT SUBSTR(release_date, 1,4) AS release_year, SUM(vote_count) 
 FROM movies 
 GROUP BY release_year
 ORDER BY release_year 
 DESC
-- Audience engagement has grown exponentially over time, but experienced the largest increases after 2000 because of larger digital adoption and accessibility.

 Financial / ROI Analysis
#1. Which movies earned less than their budget?
SELECT original_title, budget, revenue, (revenue-budget) AS profit_loss 
 FROM movies 
 WHERE revenue<budget AND budget>1 
 ORDER BY profit_loss ASC;
-- The movie with the largest negative ROI was The Lone Ranger with a loss of $165,710,090

#2. Which directors generate the highest total profit?
SELECT name AS director, SUM(revenue-budget) AS total_profit 
 FROM movies 
 JOIN directors ON movies.director_id = directors.id 
 WHERE revenue IS NOT NULL AND budget IS NOT NULL
 GROUP BY director
 ORDER BY total_profit DESC;
-- The top directors that geterated the highest total profit are Steven Spielberg, Peter Jackson, James Cameron, Michael Bay, and Christopher Nolan.

#3. Which years had the strongest average ROI?
SELECT SUBSTR(release_date,1,4) AS release_year, AVG(revenue-budget) AS avg_roi 
 FROM movies 
 GROUP BY release_year 
 ORDER BY avg_roi DESC;
-- Movies from 1970-1990 tend to have the highest average ROI.

Qualifications
#1. Which directors have made at least 5 movies?
SELECT name AS director_name, 
 COUNT(movies.id) AS total_movies 
 FROM movies 
 JOIN directors 
 ON movies.director_id = directors.id 
 GROUP BY direcotr_name 
 HAVING total_movies>=5
 ORDER BY total_movies DESC;
-- Of directors having made at least 5 movies Steven Spielberg has made the most with 27 movies.

#2. Which directors have an average rating ≥ 7.5 with at least 3 movies?
SELECT name AS director_name, AVG(vote_average) AS avg_rating, 
 COUNT(movies.id) total_movies 
 FROM movies 
 JOIN directors 
 ON movies.director_id = directors.id 
 GROUP BY director_name 
 HAVING avg_rating>=7.5 AND total_movies>=3
 ORDER BY avg_rating DESC;

#3. Which directors have total revenue above $1B?
 SELECT name AS movie_director, SUM(revenue) AS movie_revenue 
 FROM movies 
 JOIN directors 
 ON movies.director_id = directors.id 
 GROUP BY movie_director
 HAVING movie_revenue > 1000000000
 ORDER BY movie_revenue DESC;

Insight and Decision making
#1. Which directors balance high ratings and strong revenue?
SELECT 
   name, 
   AVG(vote_average) AS avg_rating, 
   SUM(revenue) AS total_revenue
 FROM movies 
 JOIN directors ON movies.director_id = directors.id 
 GROUP BY name 
 HAVING avg_rating >6.12 AND movies.id>3 AND total_revenue>82777095
 ORDER BY avg_rating DESC, total_revenue DESC;
-- The conditions to qualify for high ratings and strong revnue are to be above the average movie rating of 6.12, average total revenue of 82777095, and having made at least 3 movies, both averages derived from the dataset.

#2. Which directors are the safest investment based on consistency?


#3. Who produces above-average ratings without requiring above-average budgets?

#4. Which movies exceeded what we would normally expect from that director?




