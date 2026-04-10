DROP TABLE IF EXISTS netflix;
CREATE TABLE netflix
(
	show_id varchar(10),
	type varchar(10),
	title varchar(150),
	director varchar(210),
	casts varchar(1000),
	country varchar(150),
	date_added varchar(50),
	release_year INT,
	rating varchar(10),
	duration varchar(15),
	listed_in varchar(150),
	description varchar(260)
);

SELECT * FROM netflix;

SELECT COUNT(*) TOTAL
FROM netflix

SELECT distinct(type) Genre FROM netflix;

--- Business Questions

--- 1. Count of number of movies vs TV Shows

SELECT type, COUNT(*) Total_Content
FROM netflix
GROUP BY type;

--- 2. Find the most common rating for movies and tv shows 

SELECT type, rating
FROM 
(
	SELECT type, rating , COUNT(*),
	RANK( )OVER(PARTITION BY type order by count(*) desc) RANKING
	FROM netflix
	group by type, rating
) AS t1
WHERE RANKING = 1;

--- 3. List all movies list in a specific year ( e.g 2020)

SELECT title
FROM netflix
WHERE type = 'Movie' and release_year = 2020;

--- 4. Find the top 5 countries with the most content on netflix

SELECT
	UNNEST(STRING_TO_ARRAY(country, ',')) AS new_country
FROM netflix

SELECT UNNEST(STRING_TO_ARRAY(country, ',')) AS new_country, count(show_id) Content_on_netflix
FROM netflix
WHERE country IS NOT NULL
GROUP BY 1
ORDER BY count(show_id) DESC
LIMIT 5;

--- 5. Identify the longest movie

SELECT title, MAX(duration) AS duration 
from netflix
where type = 'Movie' AND duration  IS NOT NULL
GROUP BY title
order by duration desc
LIMIT 1;

--- 6. Find the content added in last five years

SELECT title, date_added
from netflix
WHERE date_added IS NOT NULL AND EXTRACT(YEAR FROM TO_DATE(date_added, 'Month DD, YYYY' ))  >= EXTRACT(YEAR FROM CURRENT_DATE) - 5
;


--- 7. Find all the movies/tv shows by director 'Rajiv Chilaka'

SELECT *
FROM netflix
WHERE director ILIKE '%Rajiv Chilaka%';

--- 8. List all the tv shows with more than 5 seasons 

SELECT *
FROM netflix
WHERE type = 'TV Show' AND SPLIT_PART(duration, ' ', 1) :: numeric > 5;

--- 9. Count the number of content items in each genre 

SELECT UNNEST(STRING_TO_ARRAY(listed_in, ',')) AS Genre, COUNT(*) AS Total_Content
FROM netflix
group by Genre
Order by Total_Content desc;

--- 10. Find each year and the avg numbers of content release by india on netflix. Return top 5 year with highest avg content release

SELECT 
EXTRACT(YEAR FROM TO_DATE(date_added, 'Month DD, YYYY' )) AS Year, count(*) AS Yearly_Content, 
ROUND(count(*) :: numeric / (SELECT count(*) FROM netflix WHERE country = 'India')::numeric * 100, 2) AS Avg_content_release
FROM netflix
GROUP BY Year
Order by Avg_content_release desc
LIMIT 5;

--- 11. List all the movies that are documentaries 

SELECT * 
FROM 
(
	SELECT *, UNNEST(STRING_TO_ARRAY(listed_in, ',')) AS Genre
	FROM netflix
	WHERE type = 'Movie' 
)t1 
WHERE Genre ILIKE '%documentaries%'

--- 12. Find all content without a director

SELECT *
FROM netflix
WHERE director IS NULL;

--- 13. Find how many movies actor 'Salman Khan' appeared in last 10 years 

SELECT * 
FROM netflix
WHERE casts ILIKE '%Salman Khan%' AND release_year >= EXTRACT(YEAR FROM CURRENT_DATE) - 10;

--- 14. Find the top 10 actors who have appeared in the highest number of movies produced in India 

SELECT UNNEST(STRING_TO_ARRAY(Casts, ',')) AS Actors, COUNT(*) AS Number_of_Apperance
FROM netflix
WHERE country ILIKE '%India%'
GROUP BY Actors 
order by Number_of_Apperance desc
limit 10;

--- 15. Categorize the content  based on the presence of the keywords 'kill' and 'Violence' in the description field. Lable content containing these keywords as 'Bad' and all the content and 'Good'. Count how many items fall into each category

SELECT Content_Categorization, COUNT(*) as count 
FROM 
(
	SELECT *,
			CASE 
				WHEN description ILIKE '%KILL%' OR description ILIKE '%VIOLENCE%' THEN 'BAD'
				ELSE 'GOOD'
			END Content_Categorization
		FROM netflix
) as t1
Group by Content_Categorization
order by count desc
 

