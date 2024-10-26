** Задание 2 **

select name_, duration from tracks
WHERE duration = (SELECT MAX(duration) FROM tracks);

select name_ from tracks
where duration > '00:03:30';

select name_ from collections c 
where release_year > 2017 and release_year < 2021;

select name_ from artists
WHERE (LENGTH(name_) - LENGTH(replace(name_, ' ', ''))) = 0;

select name_ from tracks t 
where name_ like '%my%';
	

** Задание 3 **

select genres.name_, count(ag.artist_id) FROM genres
LEFT JOIN artists_genres ag ON genres.genre_id = ag.genre_id
LEFT join artists a on ag.artist_id = a.artist_id 
GROUP BY genres.name_ 

SELECT albums.name_, COUNT(tracks.track_id) from albums
LEFT JOIN tracks ON tracks.album_id = albums.album_id
WHERE albums.release_year > 2018 and albums.release_year < 2021
GROUP BY albums.name_ 


SELECT albums.name_, AVG(duration) FROM albums
LEFT JOIN tracks on tracks.album_id = albums.album_id
GROUP BY albums.name_
ORDER BY AVG(duration) DESC;


SELECT artists.name_, albums.name_, albums.release_year  FROM artists
LEFT JOIN albums_artists on artists.artist_id = albums_artists.artist_id
LEFT JOIN albums on albums_artists.album_id = albums.album_id
WHERE albums.release_year != 2020
GROUP BY artists.name_, albums.name_, albums.release_year


SELECT collections.name_ FROM artists
LEFT JOIN albums_artists on artists.artist_id = albums_artists.artist_id
LEFT JOIN albums on albums_artists.album_id = albums.album_id
LEFT JOIN tracks on albums.album_id= tracks.album_id
LEFT JOIN tracks_collections on tracks.track_id= tracks_collections.track_id
LEFT JOIN collections on tracks_collections.collection_id = collections.collection_id
WHERE artists.name_ = 'Metallica'
GROUP BY collections.name_