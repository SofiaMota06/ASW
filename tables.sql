
CREATE TABLE Users(
    id_user SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR UNIQUE NOT NULL,
    password VARCHAR(50) NOT NULL,
    bio VARCHAR,
    profile_picture VARCHAR(255), -- Url da Imagem 
    profile_color VARCHAR(25) DEFAULT("terracota"), -- "terracota", "cyan", "verde"
    access_level INT DEFAULT 0 CHECK (access_level IN (0,1)), -- 0 - User, 1 - Moderador
)



CREATE TABLE Study_sessions(
    id_study SERIAL PRIMARY KEY, 
    id_user INT FOREIGN KEY REFERENCES Users(id_user) ON DELETE Cascade,
    subject VARCHAR(50) NOT NULL,
    created_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
    duration INT NOT NULL,
)



CREATE TABLE Posts(
    id_post SERIAL PRIMARY KEY,
    id_user INT NOT NULL FOREIGN KEY REFERENCES Users(id_user) ON DELETE Cascade,
    title VARCHAR(120) NOT NULL,
    text TEXT,
    post_color VARCHAR(25), -- "terracota", "cyan", "verde"
    hashtag VARCHAR(50),
    file_url varchar(255),  /*O link para o PDF no Cloudinary*/
    file_type varchar(20), /*pdf ,image*/
    created_date timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP
)



CREATE TABLE Comments(
    id_comment SERIAL PRIMARY KEY,
    id_post INT FOREIGN KEY NOT NULL REFERENCES Posts(id_post) ON DELETE Cascade,
    id_user INT FOREIGN KEY NOT NULL REFERENCES Users(id_user) ON DELETE Cascade,
    text TEXT NOT NULL,
    created_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
)



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
    id_group SERIAL PRIMARY KEY,
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
    id_message SERIAL PRIMARY KEY,
    id_group int REFERENCES Groups(id_group) ON DELETE Cascade,
    id_user int REFERENCES Users(id_user) ON DELETE Cascade,
    text varchar(9999),
    file_url varchar(255),  /*O link para o PDF no Cloudinary*/
    file_type varchar(20) CHECK (file_type IN ('image', 'document', 'none')), /*pdf ,image*/
    created_date timestamp DEFAULT CURRENT_TIMESTAMP

)
  
