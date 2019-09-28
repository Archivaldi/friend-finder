CREATE DATABASE IF NOT EXISTS shema;

USE shema;

CREATE TABLE questions(
    question_id INT NOT NULL AUTO_INCREMENT,
    question VARCHAR(200),
    PRIMARY KEY (question_id)
);

CREATE TABLE friends(
    friend_id INT NOT NULL AUTO_INCREMENT,
    friend_name VARCHAR(101),
    picture_link VARCHAR(200),
    PRIMARY KEY (friend_id)
);

CREATE TABLE scores (
    friend_id INT NOT NULL,
    question_id INT NOT NULL,
    score INT NOT NULL,
    FOREIGN KEY (friend_id) REFERENCES friends(friend_id),
    FOREIGN KEY (question_id) REFERENCES questions(question_id)
);