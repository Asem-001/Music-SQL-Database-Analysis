-- Querey 1 in slide 1:
SELECT 
	ROW_NUMBER() OVER (ORDER BY Songs DESC) AS '#',
	*
FROM( SELECT 
		g.name genre_name,
		COUNT(t.GenreId) Songs
	FROM Track t
	JOIN Genre g
	ON g.GenreId = t.GenreId
	GROUP BY 1
	ORDER BY 2 DESC) t1
LIMIT 10;


-- Querey 2 in slide 2:
SELECT 
	g.Name,
	COUNT(g.Name)
FROM Track t
JOIN Genre g
ON g.GenreId = t.GenreId
WHERE t.Milliseconds > (SELECT  AVG(Milliseconds) FROM track) 
GROUP BY 1 
ORDER BY 2 DESC
LIMIT 10;


-- Querey 3 in slide 3:
SELECT m.name type_name, count(*) number_of_songs
FROM Track t
JOIN MediaType m
ON  t.MediaTypeId = m.MediaTypeId
GROUP BY 1;


-- Querey 4 in slide 4:
SELECT t.Composer ,COUNT(*) songs
FROM Track t
WHERE t.Composer NOT null
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;


