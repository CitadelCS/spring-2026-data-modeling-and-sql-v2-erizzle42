INSERT INTO library.publisher VALUES ('Penguin Books', 'London', '555-0100'), ('HarperCollins', 'New York', '555-0200'), ('Oxford Press', 'Oxford', '555-0300');

INSERT INTO library.library_branch (branch_name, address) VALUES ('Central', '101 Main St'), ('North', '202 High St'), ('West', '303 River Rd');

INSERT INTO library.borrower (name, address, phone) VALUES ('Alice Smith', '123 Maple St', '555-1111'), ('Bob Jones', '456 Oak Ave', '555-2222'), ('Charlie Brown', '789 Pine Ln', '555-3333');

INSERT INTO library.book (title, publisher_name) VALUES ('The Great Gatsby', 'Penguin Books'), ('SQL Basics', 'Oxford Press'), ('The Hobbit', 'HarperCollins');

INSERT INTO library.book_authors VALUES (1, 'F. Scott Fitzgerald'), (2, 'Alan Beaulieu'), (3, 'J.R.R. Tolkien');

INSERT INTO library.book_copies VALUES (1, 1, 5), (2, 2, 2), (3, 3, 10);

INSERT INTO library.book_loans VALUES (1, 1, 1, '2026-02-01', '2026-02-15'), (2, 2, 2, '2026-02-10', '2026-02-24'), (3, 3, 3, '2026-02-15', '2026-03-01');
