CREATE SCHEMA IF NOT EXISTS library;

CREATE TABLE IF NOT EXISTS library.book (
    book_id         serial PRIMARY KEY ,
    title           VARCHAR(255) NOT NULL,
    publisher_name  VARCHAR(50),
    delete_me       VARCHAR(4)
);

