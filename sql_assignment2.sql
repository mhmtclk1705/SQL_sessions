-- How many tracks does each album have? Your solution should include Album id and its 
-- number of tracks sorted from highest to lowest.

SELECT AlbumId, count(TrackId) as tracks_number
FROM tracks
GROUP BY AlbumId
ORDER BY tracks_number DESC;



-- Find the album title of the tracks. Your solution should include track name and its 
-- album title.

SELECT tracks.Name,
albums.Title,
tracks.AlbumId
FROM tracks
INNER JOIN albums ON tracks.AlbumId = albums.AlbumId;


-- Find the minimum duration of the track in each album. Your solution should include 
-- album id, album title and duration of the track sorted from highest to lowest.

SELECT tracks.Milliseconds as min_duration,
albums.Title,
tracks.AlbumId
FROM tracks
INNER JOIN albums ON tracks.AlbumId = albums.AlbumId
GROUP BY tracks.AlbumId
ORDER BY min_duration DESC;


-- Find the total duration of each album. Your solution should include album id, album 
-- title and its total duration sorted from highest to lowest.


SELECT sum(tracks.Milliseconds) as total_duration,
albums.Title,
tracks.AlbumId
FROM tracks
INNER JOIN albums ON tracks.AlbumId = albums.AlbumId
GROUP BY tracks.AlbumId
ORDER BY total_duration DESC;


-- Based on the previous question, find the albums whose total duration is higher than 
-- 70 minutes. Your solution should include album title and total duration.

SELECT sum(tracks.Milliseconds) as total_duration,
tracks.AlbumId,
albums.Title
FROM tracks
LEFT JOIN albums on tracks.AlbumId = albums.AlbumId
GROUP BY tracks.AlbumId
HAVING total_duration > 4200000
ORDER BY total_duration DESC;