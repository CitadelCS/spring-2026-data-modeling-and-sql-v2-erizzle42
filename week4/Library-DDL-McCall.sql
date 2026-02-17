CREATE SCHEMA IF NOT EXISTS library;

CREATE TABLE IF NOT EXISTS library.publisher (
    name            VARCHAR(100) PRIMARY KEY,
    address         VARCHAR(200),
    phone           VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS library.book (
    book_id        serial PRIMARY KEY,
    title          VARCHAR(255) NOT NULL,
    publisher_name VARCHAR(100),

    FOREIGN KEY (publisher_name)
        REFERENCES library.publisher (name)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS library.book_authors (
    book_id         serial PRIMARY KEY,
    author_name     VARCHAR(50),

    FOREIGN KEY (book_id)
        REFERENCES library.book(book_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS library.book_copies (
    book_id         INTEGER NOT NULL,
    branch_id       INTEGER NOT NULL,
    no_of_copies    INTEGER NOT NULL CHECK (no_of_copies >= 0),

    PRIMARY KEY (book_id, branch_id),

    FOREIGN KEY (book_id)
        REFERENCES library.book(book_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    FOREIGN KEY (branch_id)
        REFERENCES library.library_branch(branch_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS library.book_loans (
    book_id     INTEGER NOT NULL,
    branch_id   INTEGER NOT NULL,
    card_no     INTEGER NOT NULL,
    date_out    DATE NOT NULL,
    due_date    DATE NOT NULL,

    PRIMARY KEY (book_id, branch_id, card_no, date_out),

    FOREIGN KEY (book_id)
        REFERENCES library.book(book_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    FOREIGN KEY (branch_id)
        REFERENCES library.library_branch(branch_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    FOREIGN KEY (card_no)
        REFERENCES library.borrower(card_no)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CHECK (due_date >= date_out)
);

CREATE TABLE IF NOT EXISTS library.library_branch (
    branch_id       serial PRIMARY KEY,
    branch_name     VARCHAR(100) NOT NULL UNIQUE,
    address         VARCHAR(200)
);

CREATE TABLE IF NOT EXISTS library.borrower (
    card_no         serial PRIMARY KEY,
    name            VARCHAR(100) NOT NULL,
    address         VARCHAR(200),
    phone           VARCHAR(20)
);

