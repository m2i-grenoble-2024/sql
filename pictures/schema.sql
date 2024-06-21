DROP TABLE IF EXISTS follow_user;
DROP TABLE IF EXISTS like_user_picture;
DROP TABLE IF EXISTS comment;
DROP TABLE IF EXISTS picture;
DROP TABLE IF EXISTS user;
CREATE TABLE user (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at DATETIME NOT NULL DEFAULT NOW()
);

CREATE TABLE picture (
    id INT PRIMARY KEY AUTO_INCREMENT,
    image VARCHAR(255) NOT NULL,
    description TEXT,
    visible BOOLEAN NOT NULL DEFAULT TRUE,
    allow_comments BOOLEAN NOT NULL DEFAULT TRUE,
    posted_at DATETIME NOT NULL DEFAULT NOW(),
    author_id INT REFERENCES user(id) ON DELETE CASCADE
);

CREATE TABLE comment(
    id INT PRIMARY KEY AUTO_INCREMENT,
    content TEXT NOT NULL,
    posted_at DATETIME NOT NULL DEFAULT NOW(),
    picture_id INT REFERENCES picture(id) ON DELETE CASCADE,
    author_id INT REFERENCES user(id) ON DELETE CASCADE
);

CREATE TABLE like_user_picture(
    picture_id INT REFERENCES picture(id) ON DELETE CASCADE,
    user_id INT REFERENCES user(id) ON DELETE CASCADE,
    PRIMARY KEY(picture_id,user_id)
);

CREATE TABLE follow_user(
    follower_id INT REFERENCES user(id) ON DELETE CASCADE,
    user_id INT REFERENCES user(id) ON DELETE CASCADE,
    PRIMARY KEY(follower_id, user_id)
);
