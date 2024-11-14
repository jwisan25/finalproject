---This finds the top 5 highest-rated movies released after the year 2000
SELECT title, releaseYear, imdbAverageRating
FROM "data" 
WHERE releaseYear > 2000
ORDER BY imdbAverageRating DESC
LIMIT 5;

---This calculate the average imdb rating for each genre
SELECT genres, AVG(imdbAverageRating) AS average_rating
FROM "data"
GROUP BY genres
ORDER BY average_rating DESC;

---This calculates the average imdb rating for each director (but only for movies available in Japan. There was more data from the imdb data set about Japan)
SELECT imbddata.Director, AVG(imbddata.IMDB_Rating) AS Avg_Rating
FROM imbddata
INNER JOIN data ON imbddata.Series_Title = data.title
WHERE data.availableCountries = 'JP'
GROUP BY imbddata.Director
ORDER BY Avg_Rating DESC;a


---This uses an inner join to find movies available in Japan with a rating above 8
SELECT imbddata.Series_Title, imbddata.IMDB_Rating, data.availableCountries
FROM imbddata
INNER JOIN data ON imbddata.Series_Title = data.title
WHERE imbddata.IMDB_Rating > 8.0 AND data.availableCountries = 'JP'
ORDER BY imbddata.IMDB_Rating DESC;


---This finds movies with a higher rating than the average rating. 
SELECT title, 
       releaseYear, 
       imdbAverageRating,
       (SELECT AVG(imdbAverageRating) FROM data) AS imdbAverageRating
FROM data
WHERE imdbAverageRating > (SELECT AVG(imdbAverageRating) FROM data)
ORDER BY imdbAverageRating DESC;




---I noticed that a lot of "classic" movies were rated a lot higher and I wonder if that is correlation or causation (i.e. the high ratings make the movies popularity or the popularity of the movies creates high ratings)
---There weren't any crazy unexpected findings. The only thing was that the directors with the highest ratings were people I didn't really know. 
---I have a pretty high threshold for what I consider a good movie, so I was really curious to see what a lot of people thought were really good movies. For the most part it matched up pretty well. 
