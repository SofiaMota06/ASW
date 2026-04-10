CREATE TABLE Users(
    id_user INT PRIMARY KEY,
    username VARCHAR,
    email VARCHAR,
    bio VARCHAR,
    profile_picture,
    profile_color INT,
    access_level INT,
)



CREATE TABLE Study_sessions(
    id_study INT PRIMARY KEY,
    id_user INT FOREIGN KEY REFERENCES Users(id_user),
    subject VARCHAR,
    date DATETIME,
    duration TIME,
)



CREATE TABLE Posts(
    id_post INT PRIMARY KEY,
    id_user INT FOREIGN KEY REFERENCES Users(id_user),
    title VARCHAR,
    text TEXT,
    post_color INT,
    hashtag VARCHAR,
    date DATETIME,
    attachment_type VARCHAR,
)



CREATE TABLE Comments(
    id_comment INT PRIMARY KEY,
    id_post INT FOREIGN KEY REFERENCES Post(id_post),
    id_user INT FOREIGN KEY REFERENCES Users(id_user),
    text TEXT,
    date DATETIME,
)

  
