---- Create and use database

CREATE DATABASE grpby;
USE grpby;

---- Create Tables

CREATE TABLE Actor
(
Actor_ID int,
Actor_name varchar(30),
Gender varchar (10),
debut_year int
);

CREATE TABLE Director
(
Director_ID int,
Director_name varchar(30),
no_of_movies int
);

CREATE TABLE Movie
(
Movie_name varchar(30),
release_year int,
genre varchar(15),
lead_1 int,
lead_2 int,
director_id int,
box_collection int
);

CREATE TABLE DVD
(
DVD_id int,
Movie_name varchar(30),
sale int
);

---- Inserting values into tables

INSERT INTO actor VALUES
(1, 'Aamir Khan', 'male', 1988),
(2, 'Shahrukh Khan', 'male', 1992),
(3, 'Kareena Kapoor', 'female', 2000),
(4, 'Kajol', 'female', 1992),
(5, 'Anushka Sharma', 'female', 2008),
(6, 'Ranbir Kapoor', 'male', 2007),
(7, 'Alia Bhatt', 'female', 2012),
(8, 'Ranveer Singh', 'male', 2010),
(9, 'Deepika Padukone', 'female', 2006),
(10, 'Shahid Kapoor', 'male', 2003),
(11, 'Katrina Kaif', 'female', 2003),
(12, 'Varun Dhawan', 'male', 2012);


insert into director values(1,'Rajkumar Hirani',10);
insert into director values(2,'Sanjay Leela Bhansali',8);
insert into director values(3,'Aditya Chopra',6);
insert into director values(4,'Zoya Akhtar',3);
insert into director values(5,'Imtiaz Ali',5);
insert into director values(6,'Ayan Mukerji',4);
insert into director values(7,'Santosh Sivan',9);
insert into director values(8,'Farah Khan',4);


insert into movie values('3 Idiots',2009,'comedy',1,3,1,989600000),
('PK',2014,'satire',1,5,1,789600000),
('Bajirao Mastani',2015,'historic',8,9,2,68960000),
('Rab ne bana di jodi',2008,'romance',2,5,3,48960000),
('Gully boy',2019,'Musical drama',8,7,4,28950000),
('Jab we met',2007,'romance',10,3,5,18980000),
('Padmavat',2018,'historic',8,9,2,38460000),
('Yeh jawani hai deewani',2013,'romance',6,9,6,581600000),
('Ashoka',2001,'historic',2,3,7,8796000),
('Happy new year',2014,'comedy',2,9,8,68960000);

insert into DVD values(1,'3 Idiots',8890);
insert into DVD values(2,'PK',8790);
insert into DVD values(3,'Bajirao Mastani',6810);
insert into DVD values(4,'Rab ne bana di jodi',7920);
insert into DVD values(5,'Gully boy',870);
insert into DVD values(6,'Jab we met',4792);
insert into DVD values(7,'Padmavat',590);
insert into DVD values(8,'Yeh jawani hai deewani',2890);
insert into DVD values(9,'Ashoka',730);
insert into DVD values(10,'Happy new year',1690);

---- TASKS

---- 1. Display the count of actor and actresses.
SELECT gender, COUNT(gender) AS number FROM Actor
GROUP BY gender;

---- 2. Display the count of movies of each genre
SELECT genre, count(genre) as count FROM Movie
GROUP BY genre;

---- 3. Calculate the oldest released movie of each genre
SELECT genre, MIN(release_year) as 'oldest release' FROM Movie
GROUP BY genre;

---- 4. Calculate the total box office collection of movies of each genre.
SELECT * FROM Movie

SELECT genre, SUM(box_collection) AS 'total box office collection' FROM Movie
GROUP BY genre;


---- Display the name of director, current count of movies and 
--- total count of movies directed by him/her

SELECT * FROM Director

SELECT Director_name, COUNT(movie_name) as 'current count', no_of_movies as 'total count' 
FROM Movie, Director
WHERE Movie.director_id = Director.Director_ID
GROUP BY Movie.director_id, Director_name, no_of_movies;

---- Diplay the name of lead_1 actors, their count of movies and their total DVD Sales
SELECT * from DVD
SELECT * FROM Movie

SELECT lead_1, COUNT(DVD.Movie_name) as 'no. of movies', sum(sale) as 'total sales'
FROM Movie, DVD
WHERE Movie.Movie_name = DVD.Movie_name
GROUP BY lead_1;

--- since movie_name is present in both tables, we need to specify the table also.

--- 7. Show the release year and number of movies released in each year only if 
--- more than 1 movie is released each year

SELECT * FROM Movie

SELECT release_year, COUNT(Movie_name) as 'no. of movies'
FROM Movie
GROUP BY release_year
HAVING count(movie_name)>1;

---- Display the director name and their total box office collection which should be
--- greater than 50 crores.

SELECT * FROM Director
SELECT * FROM Movie


SELECT Director_name, SUM(box_collection) as 'total box office collection'
FROM Director, Movie
WHERE Director.Director_ID = Movie.director_id
GROUP BY Director_name
HAVING SUM(box_collection) > 500000000;


---- 9. Give the count of movies of each genre in decreasing order of count

SELECT * FROM Movie

SELECT genre, COUNT(Movie_name) as 'count of movie' 
FROM Movie
GROUP BY genre
ORDER BY 'count of movie' DESC;

---- 10. Sort the movie names based on director names
SELECT Director_name, Movie_name
FROM DIRECTOR, MOVIE
WHERE Director.Director_ID = Movie.director_id
ORDER BY Director_name;