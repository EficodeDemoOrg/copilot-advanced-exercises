-- Library Management System Database Schema

-- Create schema if it doesn't exist
-- MySQL equivalent to schema is database, already created in docker-compose.yml

-- Drop tables if they exist to allow re-running this script
DROP TABLE IF EXISTS book_returns;
DROP TABLE IF EXISTS book_loans;
DROP TABLE IF EXISTS book_copies;
DROP TABLE IF EXISTS book_authors;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS authors;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS user_roles;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS publishers;

-- Create table for user roles (admin, librarian, member)
CREATE TABLE user_roles (
    role_id INT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(50) NOT NULL UNIQUE,
    description TEXT
);

-- Create table for users
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    role_id INTEGER REFERENCES user_roles(role_id),
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone_number VARCHAR(20),
    address TEXT,
    date_of_birth DATE,
    membership_date DATE NOT NULL DEFAULT (CURRENT_DATE),
    membership_expiry DATE,
    username VARCHAR(50) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Create table for book categories/genres
CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT
);

-- Create table for publishers
CREATE TABLE publishers (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    publisher_name VARCHAR(255) NOT NULL UNIQUE,
    address TEXT,
    phone_number VARCHAR(20),
    email VARCHAR(255),
    website VARCHAR(255)
);

-- Create table for authors
CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    date_of_death DATE,
    biography TEXT,
    nationality VARCHAR(100),
    UNIQUE(first_name, last_name)
);

-- Create table for books
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    isbn VARCHAR(20) UNIQUE,
    title VARCHAR(255) NOT NULL,
    subtitle VARCHAR(255),
    publisher_id INTEGER REFERENCES publishers(publisher_id),
    publication_date DATE,
    category_id INTEGER REFERENCES categories(category_id),
    language VARCHAR(50),
    page_count INTEGER,
    description TEXT,
    cover_image_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Create junction table for books and authors (many-to-many)
CREATE TABLE book_authors (
    book_id INTEGER,
    author_id INTEGER,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id) ON DELETE CASCADE,
    FOREIGN KEY (author_id) REFERENCES authors(author_id) ON DELETE CASCADE
);

-- Create table for physical copies of books
CREATE TABLE book_copies (
    copy_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INTEGER,
    copy_number VARCHAR(50) NOT NULL,
    acquisition_date DATE NOT NULL,
    price DECIMAL(10, 2),
    `condition` VARCHAR(50), -- New, Good, Fair, Poor
    location VARCHAR(100), -- Shelf location in the library
    status VARCHAR(50) NOT NULL DEFAULT 'Available', -- Available, Loaned, Reserved, Under Repair, Lost
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE(book_id, copy_number),
    FOREIGN KEY (book_id) REFERENCES books(book_id) ON DELETE CASCADE
);

-- Create table for book loans
CREATE TABLE book_loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    copy_id INTEGER,
    user_id INTEGER,
    checkout_date DATE NOT NULL DEFAULT (CURRENT_DATE),
    due_date DATE NOT NULL,
    return_date DATE,
    renewed_count INTEGER DEFAULT 0,
    fine_amount DECIMAL(10, 2) DEFAULT 0.00,
    fine_paid BOOLEAN DEFAULT FALSE,
    librarian_id INTEGER, -- Librarian who processed the loan
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (copy_id) REFERENCES book_copies(copy_id) ON DELETE RESTRICT,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE RESTRICT,
    FOREIGN KEY (librarian_id) REFERENCES users(user_id)
);

-- Create table for book returns (could be used for audit purposes)
CREATE TABLE book_returns (
    return_id INT AUTO_INCREMENT PRIMARY KEY,
    loan_id INTEGER,
    return_date DATE NOT NULL DEFAULT (CURRENT_DATE),
    condition_on_return VARCHAR(50),
    librarian_id INTEGER, -- Librarian who processed the return
    fine_assessed DECIMAL(10, 2) DEFAULT 0.00,
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (loan_id) REFERENCES book_loans(loan_id) ON DELETE CASCADE,
    FOREIGN KEY (librarian_id) REFERENCES users(user_id)
);

-- Insert default user roles
INSERT INTO user_roles (role_name, description) VALUES
('admin', 'Full system access with all privileges'),
('librarian', 'Can manage books, loans, and members'),
('member', 'Regular library member who can borrow books');

-- Insert some sample categories
INSERT INTO categories (category_name, description) VALUES
('Fiction', 'Literary works created from the imagination'),
('Non-fiction', 'Based on facts and real events'),
('Science Fiction', 'Fiction dealing with scientific concepts and technology'),
('Mystery', 'Fiction dealing with the solution of a crime or puzzle'),
('Biography', 'Written account of another person''s life'),
('History', 'Study of past events'),
('Science', 'Study of the natural world');

-- Add some indexes for performance
CREATE INDEX idx_books_title ON books(title);
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_name ON users(last_name, first_name);
CREATE INDEX idx_book_loans_user ON book_loans(user_id);
CREATE INDEX idx_book_loans_due_date ON book_loans(due_date);
CREATE INDEX idx_book_copies_status ON book_copies(status);

-- -----------------------------
-- Test Data for Library System
-- -----------------------------

-- Insert sample publishers
INSERT INTO publishers (publisher_name, address, phone_number, email, website) VALUES
('Penguin Random House', '1745 Broadway, New York, NY 10019', '212-782-9000', 'info@penguinrandomhouse.com', 'https://www.penguinrandomhouse.com'),
('HarperCollins', '195 Broadway, New York, NY 10007', '212-207-7000', 'info@harpercollins.com', 'https://www.harpercollins.com'),
('Simon & Schuster', '1230 Avenue of the Americas, New York, NY 10020', '212-698-7000', 'info@simonandschuster.com', 'https://www.simonandschuster.com'),
('Oxford University Press', 'Great Clarendon Street, Oxford, OX2 6DP, UK', '+44 1865 556767', 'info@oup.com', 'https://global.oup.com'),
('Macmillan Publishers', '120 Broadway, New York, NY 10271', '646-307-5151', 'info@macmillan.com', 'https://us.macmillan.com');

-- Insert sample authors
INSERT INTO authors (first_name, last_name, date_of_birth, date_of_death, biography, nationality) VALUES
('George', 'Orwell', '1903-06-25', '1950-01-21', 'English novelist and essayist.', 'British'),
('Jane', 'Austen', '1775-12-16', '1817-07-18', 'English novelist known for her six major novels.', 'British'),
('Isaac', 'Asimov', '1920-01-02', '1992-04-06', 'Prolific science fiction writer.', 'American'),
('Agatha', 'Christie', '1890-09-15', '1976-01-12', 'Queen of Mystery.', 'British'),
('Stephen', 'Hawking', '1942-01-08', '2018-03-14', 'Theoretical physicist and author.', 'British'),
('Walter', 'Isaacson', '1952-05-20', NULL, 'American author and journalist.', 'American'),
('Yuval', 'Harari', '1976-02-24', NULL, 'Israeli public intellectual, historian and professor.', 'Israeli'),
('J.K.', 'Rowling', '1965-07-31', NULL, 'British author, best known for Harry Potter.', 'British'),
('Mary', 'Shelley', '1797-08-30', '1851-02-01', 'English novelist, best known for Frankenstein.', 'British'),
('Arthur', 'Clarke', '1917-12-16', '2008-03-19', 'British science fiction writer.', 'British');

-- Insert 30 books (with various categories, publishers, and authors)
INSERT INTO books (isbn, title, subtitle, publisher_id, publication_date, category_id, language, page_count, description, cover_image_url) VALUES
('9780451524935', '1984', NULL, 1, '1949-06-08', 1, 'English', 328, 'Dystopian social science fiction novel.', NULL),
('9780141439518', 'Pride and Prejudice', NULL, 1, '1813-01-28', 1, 'English', 279, 'Classic romantic novel.', NULL),
('9780553293357', 'Foundation', NULL, 2, '1951-06-01', 3, 'English', 255, 'Science fiction classic.', NULL),
('9780062073488', 'Murder on the Orient Express', NULL, 2, '1934-01-01', 4, 'English', 256, 'Detective novel.', NULL),
('9780553380163', 'A Brief History of Time', NULL, 3, '1988-04-01', 7, 'English', 212, 'Popular-science book on cosmology.', NULL),
('9781501127625', 'Steve Jobs', NULL, 3, '2011-10-24', 5, 'English', 656, 'Biography of Steve Jobs.', NULL),
('9780062316097', 'Sapiens', 'A Brief History of Humankind', 4, '2011-01-01', 6, 'English', 443, 'History of humankind.', NULL),
('9780747532743', 'Harry Potter and the Philosopher''s Stone', NULL, 1, '1997-06-26', 1, 'English', 223, 'First book in the Harry Potter series.', NULL),
('9780141439471', 'Frankenstein', NULL, 2, '1818-01-01', 3, 'English', 280, 'Gothic science fiction novel.', NULL),
('9780345331359', '2001: A Space Odyssey', NULL, 5, '1968-07-01', 3, 'English', 297, 'Science fiction novel.', NULL),
('9780140449136', 'Crime and Punishment', NULL, 1, '1866-01-01', 1, 'English', 671, 'Psychological fiction.', NULL),
('9780140449267', 'The Brothers Karamazov', NULL, 1, '1880-01-01', 1, 'English', 796, 'Philosophical novel.', NULL),
('9780140449182', 'War and Peace', NULL, 2, '1869-01-01', 6, 'English', 1225, 'Historical novel.', NULL),
('9780140449274', 'Anna Karenina', NULL, 2, '1877-01-01', 1, 'English', 864, 'Tragic romance.', NULL),
('9780140449199', 'The Idiot', NULL, 1, '1869-01-01', 1, 'English', 656, 'Psychological novel.', NULL),
('9780140449205', 'Notes from Underground', NULL, 1, '1864-01-01', 1, 'English', 136, 'Philosophical novella.', NULL),
('9780140449212', 'Demons', NULL, 1, '1872-01-01', 1, 'English', 768, 'Political novel.', NULL),
('9780140449229', 'The Gambler', NULL, 1, '1867-01-01', 1, 'English', 246, 'Psychological novel.', NULL),
('9780140449236', 'The Double', NULL, 1, '1846-01-01', 1, 'English', 160, 'Psychological novella.', NULL),
('9780140449243', 'White Nights', NULL, 1, '1848-01-01', 1, 'English', 112, 'Short story.', NULL),
('9780140449250', 'The Eternal Husband', NULL, 1, '1869-01-01', 1, 'English', 176, 'Psychological novella.', NULL),
('9780140449268', 'The Village of Stepanchikovo', NULL, 1, '1859-01-01', 1, 'English', 320, 'Comic novel.', NULL),
('9780140449275', 'Uncle''s Dream', NULL, 1, '1859-01-01', 1, 'English', 128, 'Satirical novella.', NULL),
('9780140449281', 'The House of the Dead', NULL, 1, '1861-01-01', 1, 'English', 352, 'Semi-autobiographical novel.', NULL),
('9780140449298', 'Poor Folk', NULL, 1, '1846-01-01', 1, 'English', 176, 'Epistolary novel.', NULL),
('9780140449304', 'Netochka Nezvanova', NULL, 1, '1849-01-01', 1, 'English', 192, 'Unfinished novel.', NULL),
('9780140449311', 'The Landlady', NULL, 1, '1847-01-01', 1, 'English', 96, 'Short story.', NULL),
('9780140449328', 'A Gentle Creature', NULL, 1, '1876-01-01', 1, 'English', 64, 'Short story.', NULL),
('9780140449335', 'The Dream of a Ridiculous Man', NULL, 1, '1877-01-01', 1, 'English', 48, 'Short story.', NULL),
('9780140449342', 'Bobok', NULL, 1, '1873-01-01', 1, 'English', 32, 'Short story.', NULL),
('9780140449359', 'The Peasant Marey', NULL, 1, '1876-01-01', 1, 'English', 24, 'Short story.', NULL);

-- Link books to authors (book_authors)
INSERT INTO book_authors (book_id, author_id) VALUES
(1, 1), -- 1984 by George Orwell
(2, 2), -- Pride and Prejudice by Jane Austen
(3, 3), -- Foundation by Isaac Asimov
(4, 4), -- Murder on the Orient Express by Agatha Christie
(5, 5), -- A Brief History of Time by Stephen Hawking
(6, 6), -- Steve Jobs by Walter Isaacson
(7, 7), -- Sapiens by Yuval Harari
(8, 8), -- Harry Potter by J.K. Rowling
(9, 9), -- Frankenstein by Mary Shelley
(10, 10), -- 2001: A Space Odyssey by Arthur Clarke
(11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1), (17, 1), (18, 1), (19, 1), (20, 1), (21, 1), (22, 1), (23, 1), (24, 1), (25, 1), (26, 1), (27, 1), (28, 1), (29, 1), (30, 1);

-- Insert users (admin, librarian, members)
INSERT INTO users (role_id, first_name, last_name, email, phone_number, address, date_of_birth, membership_date, membership_expiry, username, password_hash, is_active) VALUES
(1, 'Alice', 'Admin', 'alice.admin@library.com', '555-0001', '1 Admin St', '1980-01-01', '2020-01-01', '2030-01-01', 'aliceadmin', 'hash1', TRUE),
(2, 'Bob', 'Librarian', 'bob.librarian@library.com', '555-0002', '2 Library Ave', '1985-02-02', '2021-01-01', '2031-01-01', 'boblibrarian', 'hash2', TRUE),
(3, 'Charlie', 'Member', 'charlie.member@library.com', '555-0003', '3 Member Rd', '1990-03-03', '2022-01-01', '2027-01-01', 'charliemember', 'hash3', TRUE),
(3, 'Diana', 'Member', 'diana.member@library.com', '555-0004', '4 Member Rd', '1992-04-04', '2022-06-01', '2027-06-01', 'dianamember', 'hash4', TRUE),
(3, 'Eve', 'Member', 'eve.member@library.com', '555-0005', '5 Member Rd', '1995-05-05', '2023-01-01', '2028-01-01', 'evemember', 'hash5', TRUE);

-- Insert book copies (2 copies per book)
INSERT INTO book_copies (book_id, copy_number, acquisition_date, price, condition, location, status, notes) VALUES
(1, 'C1', '2023-01-01', 20.00, 'New', 'A1', 'Available', NULL),
(1, 'C2', '2023-01-01', 20.00, 'New', 'A1', 'Loaned', NULL),
(2, 'C1', '2023-01-01', 18.00, 'Good', 'A2', 'Available', NULL),
(2, 'C2', '2023-01-01', 18.00, 'Good', 'A2', 'Available', NULL),
(3, 'C1', '2023-01-01', 22.00, 'New', 'A3', 'Available', NULL),
(3, 'C2', '2023-01-01', 22.00, 'New', 'A3', 'Loaned', NULL),
(4, 'C1', '2023-01-01', 15.00, 'Good', 'A4', 'Available', NULL),
(4, 'C2', '2023-01-01', 15.00, 'Good', 'A4', 'Available', NULL),
(5, 'C1', '2023-01-01', 25.00, 'New', 'A5', 'Available', NULL),
(5, 'C2', '2023-01-01', 25.00, 'New', 'A5', 'Loaned', NULL),
(6, 'C1', '2023-01-01', 30.00, 'New', 'A6', 'Available', NULL),
(6, 'C2', '2023-01-01', 30.00, 'New', 'A6', 'Available', NULL),
(7, 'C1', '2023-01-01', 19.00, 'Good', 'A7', 'Available', NULL),
(7, 'C2', '2023-01-01', 19.00, 'Good', 'A7', 'Loaned', NULL),
(8, 'C1', '2023-01-01', 21.00, 'New', 'A8', 'Available', NULL),
(8, 'C2', '2023-01-01', 21.00, 'New', 'A8', 'Available', NULL),
(9, 'C1', '2023-01-01', 17.00, 'Good', 'A9', 'Available', NULL),
(9, 'C2', '2023-01-01', 17.00, 'Good', 'A9', 'Loaned', NULL),
(10, 'C1', '2023-01-01', 23.00, 'New', 'A10', 'Available', NULL),
(10, 'C2', '2023-01-01', 23.00, 'New', 'A10', 'Available', NULL),
(11, 'C1', '2023-01-01', 20.00, 'Good', 'B1', 'Available', NULL),
(11, 'C2', '2023-01-01', 20.00, 'Good', 'B1', 'Available', NULL),
(12, 'C1', '2023-01-01', 20.00, 'Good', 'B2', 'Available', NULL),
(12, 'C2', '2023-01-01', 20.00, 'Good', 'B2', 'Available', NULL),
(13, 'C1', '2023-01-01', 20.00, 'Good', 'B3', 'Available', NULL),
(13, 'C2', '2023-01-01', 20.00, 'Good', 'B3', 'Available', NULL),
(14, 'C1', '2023-01-01', 20.00, 'Good', 'B4', 'Available', NULL),
(14, 'C2', '2023-01-01', 20.00, 'Good', 'B4', 'Available', NULL),
(15, 'C1', '2023-01-01', 20.00, 'Good', 'B5', 'Available', NULL),
(15, 'C2', '2023-01-01', 20.00, 'Good', 'B5', 'Available', NULL),
(16, 'C1', '2023-01-01', 20.00, 'Good', 'B6', 'Available', NULL),
(16, 'C2', '2023-01-01', 20.00, 'Good', 'B6', 'Available', NULL),
(17, 'C1', '2023-01-01', 20.00, 'Good', 'B7', 'Available', NULL),
(17, 'C2', '2023-01-01', 20.00, 'Good', 'B7', 'Available', NULL),
(18, 'C1', '2023-01-01', 20.00, 'Good', 'B8', 'Available', NULL),
(18, 'C2', '2023-01-01', 20.00, 'Good', 'B8', 'Available', NULL),
(19, 'C1', '2023-01-01', 20.00, 'Good', 'B9', 'Available', NULL),
(19, 'C2', '2023-01-01', 20.00, 'Good', 'B9', 'Available', NULL),
(20, 'C1', '2023-01-01', 20.00, 'Good', 'B10', 'Available', NULL),
(20, 'C2', '2023-01-01', 20.00, 'Good', 'B10', 'Available', NULL),
(21, 'C1', '2023-01-01', 20.00, 'Good', 'C1', 'Available', NULL),
(21, 'C2', '2023-01-01', 20.00, 'Good', 'C1', 'Available', NULL),
(22, 'C1', '2023-01-01', 20.00, 'Good', 'C2', 'Available', NULL),
(22, 'C2', '2023-01-01', 20.00, 'Good', 'C2', 'Available', NULL),
(23, 'C1', '2023-01-01', 20.00, 'Good', 'C3', 'Available', NULL),
(23, 'C2', '2023-01-01', 20.00, 'Good', 'C3', 'Available', NULL),
(24, 'C1', '2023-01-01', 20.00, 'Good', 'C4', 'Available', NULL),
(24, 'C2', '2023-01-01', 20.00, 'Good', 'C4', 'Available', NULL),
(25, 'C1', '2023-01-01', 20.00, 'Good', 'C5', 'Available', NULL),
(25, 'C2', '2023-01-01', 20.00, 'Good', 'C5', 'Available', NULL),
(26, 'C1', '2023-01-01', 20.00, 'Good', 'C6', 'Available', NULL),
(26, 'C2', '2023-01-01', 20.00, 'Good', 'C6', 'Available', NULL),
(27, 'C1', '2023-01-01', 20.00, 'Good', 'C7', 'Available', NULL),
(27, 'C2', '2023-01-01', 20.00, 'Good', 'C7', 'Available', NULL),
(28, 'C1', '2023-01-01', 20.00, 'Good', 'C8', 'Available', NULL),
(28, 'C2', '2023-01-01', 20.00, 'Good', 'C8', 'Available', NULL),
(29, 'C1', '2023-01-01', 20.00, 'Good', 'C9', 'Available', NULL),
(29, 'C2', '2023-01-01', 20.00, 'Good', 'C9', 'Available', NULL),
(30, 'C1', '2023-01-01', 20.00, 'Good', 'C10', 'Available', NULL),
(30, 'C2', '2023-01-01', 20.00, 'Good', 'C10', 'Available', NULL);

-- Insert book loans (some books loaned to members)
INSERT INTO book_loans (copy_id, user_id, checkout_date, due_date, return_date, renewed_count, fine_amount, fine_paid, librarian_id, notes) VALUES
(2, 3, '2025-05-01', '2025-05-15', NULL, 0, 0.00, FALSE, 2, 'First loan for Charlie'),
(6, 4, '2025-05-02', '2025-05-16', NULL, 0, 0.00, FALSE, 2, 'First loan for Diana'),
(9, 5, '2025-05-03', '2025-05-17', NULL, 0, 0.00, FALSE, 2, 'First loan for Eve'),
(14, 3, '2025-05-04', '2025-05-18', NULL, 0, 0.00, FALSE, 2, NULL),
(17, 4, '2025-05-05', '2025-05-19', NULL, 0, 0.00, FALSE, 2, NULL),
(21, 5, '2025-05-06', '2025-05-20', NULL, 0, 0.00, FALSE, 2, NULL);

-- Insert book returns (for some loans)
INSERT INTO book_returns (loan_id, return_date, condition_on_return, librarian_id, fine_assessed, notes) VALUES
(1, '2025-05-10', 'Good', 2, 0.00, 'Returned on time'),
(2, '2025-05-18', 'Good', 2, 0.00, 'Returned late, but no fine'),
(3, '2025-05-20', 'Fair', 2, 1.00, 'Returned with minor damage');



