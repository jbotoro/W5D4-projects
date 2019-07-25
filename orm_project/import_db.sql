
PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS questions_follows;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;



CREATE TABLE users(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  fname VARCHAR NOT NULL,
  lname VARCHAR NOT NULL
);

CREATE TABLE questions(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title VARCHAR NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER REFERENCES users(id)
);

CREATE TABLE questions_follows(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  questions_id INTEGER REFERENCES questions(id),
  users_id INTEGER REFERENCES users(id)
);

CREATE TABLE replies(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  body TEXT NOT NULL,
  question_id INTEGER REFERENCES questions(id),
  reply_id INTEGER REFERENCES replies(id),
  reply_author_id INTEGER REFERENCES users(id)
);

CREATE TABLE question_likes(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  user_likes_id INTEGER REFERENCES users(id),
  question_likes_id INTEGER REFERENCES questions(id)
);


INSERT INTO users (fname, lname) VALUES ('Jordan', 'Black');
INSERT INTO users (fname, lname) VALUES ('Mitchell', 'Reiss');

INSERT INTO questions(title, body, author_id) VALUES ( '?', 'What the hell is thisssss?', 1 );
INSERT INTO replies(body, question_id, reply_author_id) VALUES ( 'I don''t know', 1, 2 );
INSERT INTO question_likes(user_likes_id, question_likes_id) VALUES (2, 1);

