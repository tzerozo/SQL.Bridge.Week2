-- 07/23/22 Week2 of SQL

-- Create a new database (schema) 
DROP SCHEMA IF EXISTS How_To_Videos;
CREATE SCHEMA How_To_Videos;

-- Create table to keep track of videos
-- Unique ID, Title, Lenght, URL
DROP TABLE IF EXISTS videos;
CREATE TABLE videos (
Video_ID int PRIMARY KEY,
Title text,
Length_Min int,
URL text NOT NULL
);

-- Populate table with related videos from internet.
INSERT INTO videos (Video_ID, Title, Length_Min, URL)
VALUES (1, "How to Iie a Tie", 6, "https://www.youtube.com/watch?v=xAg7z6u4NE8");
INSERT INTO videos (Video_ID, Title, Length_Min, URL)
VALUES (2, "8 Different ways to tie a necktie", 12, "https://www.youtube.com/watch?v=X0yh5rKB9lE");
INSERT INTO videos (Video_ID, Title, Length_Min, URL)
VALUES (3, "How to tie a Windsor knot", 5, "https://www.youtube.com/watch?v=23J4O8NvWBs");

-- Create table for reviewers.
-- Name, Rating, Comment(review), Link to videos table
DROP TABLE IF EXISTS reviews;
CREATE TABLE reviews (
Review_ID int PRIMARY KEY,
UserName varchar(255),
Ratings int,
Reviews text NOT NULL,
Video_ID int NOT NULL REFERENCES videos
);

-- Populate table with reviews.
INSERT INTO reviews (Review_ID, UserName, Ratings, Reviews, Video_ID)
VALUES (1, "JOHN", 5, "Good but old", 1);
INSERT INTO reviews (Review_ID, UserName, Ratings, Reviews, Video_ID)
VALUES (2, "JACOB", 9, "Great video, Great Quality", 2);
INSERT INTO reviews (Review_ID, UserName, Ratings, Reviews, Video_ID)
VALUES (3, "JUDITH", 6, "A good video to watch", 3);


-- JOIN statement that shows information from both tables
SELECT * FROM videos JOIN reviews ON videos.Video_ID = reviews.Video_ID;