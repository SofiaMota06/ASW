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



import timestamp
CREATE TABLE Friends (
    /*No vosso código Node.js, antes de inserirem na tabela, podem fazer um pequeno truque:
const [user1, user2] = [idA, idB].sort();*/
    id_user1 int REFERENCES Users(id_user) ON DELETE cascade,
    id_user2 int REFERENCES Users(id_user) ON DELETE cascade,
    PRIMARY KEY (id_user1, id_user2) ,
    state varchar(16) DEFAULT 'pending' CHECK (state IN ('pending', ' accepted')), /* pending ou accepted -  Para prevenir que entrem outros estados além de pending e accepted */
    CONSTRAINT users_must_be_different CHECK (id_user1 <> id_user2) /*Para que o mesmo utilizador não se peça em amizade consigo próprio*/
)

CREATE TABLE Groups (
    id_group int PRIMARY KEY,
    name varchar(25) NOT NULL,
    created_date timestamp DEFAULT CURRENT_TIMESTAMP
)

CREATE TABLE Groups_Members (
    id_group int REFERENCES Groups(id_group) ON DELETE Cascade,
    id_user int REFERENCES Users(id_user) ON DELETE Cascade,
    level int DEFAULT 0 CHECK (level IN (0, 1)),
    PRIMARY KEY (id_group, id_user) 
    
)


CREATE TABLE Groups_Messages(
    id_message int PRIMARY KEY,
    id_group int REFERENCES Groups(id_group) ON DELETE Cascade,
    id_user int REFERENCES Users(id_user) ON DELETE Cascade,
    text varchar(9999),
    file_url varchar(255),  /*O link para o PDF no Cloudinary*/
    file_type varchar(20), /*pdf ,image*/
    created_date timestamp DEFAULT CURRENT_TIMESTAMP

)
  
