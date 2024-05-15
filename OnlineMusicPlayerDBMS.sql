CREATE DATABASE OnlineMusicPlayer;

USE OnlineMusicPlayer;

CREATE TABLE User (
    user_id INT PRIMARY KEY,
    username VARCHAR(50),
    password VARCHAR(50),
    email VARCHAR(100) UNIQUE
);

CREATE TABLE Album_Main (
    id INT PRIMARY KEY,
    Album_Name VARCHAR(50),
    Album_Cover VARCHAR(150)
);

CREATE TABLE Songs (
    SongId INT AUTO_INCREMENT PRIMARY KEY,
    AlbumId INT,
    Song VARCHAR(50),
    Hero VARCHAR(50),
    Singers VARCHAR(50),
    Music_Director VARCHAR(50),
    Song_Link VARCHAR(150),
    Song_Cover VARCHAR(150),
    FOREIGN KEY (AlbumId) REFERENCES Album_Main(id)
);

INSERT INTO User (user_id, username, password, email)
VALUES (1, 'Jeelani', '', 'Jeelani123@gmail.com'),
       (2, 'Hemanjali', '', 'Hema123@gmail.com'),
       (3, 'Avinash', '', 'Avi123@gmail.com'),
       (4, 'Pradeep', '', 'Pradeep123@yahoo.com');

INSERT INTO Album_Main (id, Album_Name, Album_Cover)
VALUES (1, 'Telugu Trending', 'https://is1-ssl.mzstatic.com/image/thumb/Music126/v4/a6/1a/91/a61a913f-b8f1-8336-0925-86979dba1da4/8903431924261_cover.jpg/1200x1200bb.jpg'),
       (2, 'Hindi hits', 'Img_Link'),
       (3, 'Weekly Tops', 'Img_Link');

INSERT INTO Songs (AlbumId, Song, Hero, Singers, Music_Director, Song_Link, Song_Cover)
VALUES 
    (1, 'Nadndanana', 'Vijay Devarakonda', 'Sid Sriram', 'Thaman', 'Song_link', 'Img_link'),
    (1, 'Srivalli', 'Allu Arjun', 'Sid Sriram', 'DSP', 'Song_link', 'Img_link'),
    (1, 'Vinara', 'Prabhas', 'Raghever', 'Ravi Basrur', 'Song_link', 'Img_link'),
    
    (2, 'Sataranga', 'Ranbir Kapoor', 'Arjit Singh', 'Mithoon', 'Song_link', 'Img_link'),
    (2, 'Oo Mahi', 'SRK', 'Arjit Singh', 'Pritam', 'Song_link', 'Img_link'),
    (2, 'Arjun Vallyey', 'Ranbir Kapoor', 'Diljit Singh', 'Harshavardhan', 'Song_link', 'Img_link'),
    
    (3, 'Binding Lights', '-', 'Abel Makkonen', 'The Weekend', 'Song_link', 'Img_link'),
    (3, 'Shape of You', '-', 'Ed Sheeran', 'Ed Sheeran', 'Song_link', 'Img_link'),
    (3, 'Peaches', '-', 'Justin Bieber', 'Justin Bieber', 'Song_link', 'Img_link');
    
select * from User;

select * from Album_Main;

select * from Songs where AlbumId=1;

select * from Songs where Singers='Sid Sriram';

SELECT Album_Main.Album_Name, COUNT(Songs.SongId) AS Song_Count
FROM Album_Main
LEFT JOIN Songs ON Album_Main.Id = Songs.AlbumId
GROUP BY Album_Main.Id;

CREATE VIEW User_Albums_View AS
	SELECT User.Username, Album_Main.Album_Name
FROM User
INNER JOIN Album_Main ON User.user_id = Album_Main.id;

select * from User_Albums_View;

CREATE VIEW Top_Songs_View AS
SELECT *
FROM Songs
ORDER BY Song_Link DESC
LIMIT 10;

select * from Top_Songs_View;

CREATE VIEW Artist_Songs_View AS
SELECT *
FROM Songs
WHERE Hero = 'Allu Arjun';

select * from Artist_Songs_View;

CREATE VIEW Album_Details_View AS
SELECT Album_Main.Album_Name, COUNT(Songs.SongId) AS Song_Count
FROM Album_Main
LEFT JOIN Songs ON Album_Main.id = Songs.AlbumId
GROUP BY Album_Main.id;

select * from Album_Details_View;

CREATE VIEW Total_Users_View AS
SELECT COUNT(user_id) AS Total_Users
FROM User;

select * from Total_Users_View;