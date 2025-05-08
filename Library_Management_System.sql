-- Database: Library Management System

-- 1. Create the database
CREATE DATABASE IF NOT EXISTS LibraryManagementSystem;

-- 2. Use the database
USE LibraryManagementSystem;

-- 3. Create tables and insert data

-- Table: Authors
CREATE TABLE Authors (
    AuthorID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Biography TEXT
);

-- Insert data into Authors table
INSERT INTO Authors (FirstName, LastName, Biography) VALUES
('John', 'Smith', 'John Smith is a bestselling author of thrillers.'),
('Jane', 'Doe', 'Jane Doe writes popular romance novels.'),
('David', 'Johnson', 'David Johnson is known for his science fiction works.'),
('Emily', 'Brown', 'Emily Brown writes historical fiction.'),
('Michael', 'Wilson', 'Michael Wilson is a renowned mystery writer.'),
('Sarah', 'Garcia', 'Sarah Garcia is a celebrated fantasy author.'),
('Robert', 'Anderson', 'Robert Anderson writes contemporary fiction.'),
('Linda', 'Thomas', 'Linda Thomas is known for her children books.'),
('Christopher', 'Jackson', 'Christopher Jackson writes horror novels.'),
('Angela', 'White', 'Angela White is a poet and author.');


-- Table: Publishers
CREATE TABLE Publishers (
    PublisherID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Address VARCHAR(255),
    ContactNumber VARCHAR(20)
);

-- Insert data into Publishers table
INSERT INTO Publishers (Name, Address, ContactNumber) VALUES
('Acme Books', '123 Main St, Anytown, USA', '555-1234'),
('Beta Publications', '456 Oak Ave, Anytown, USA', '555-5678'),
('Gamma Publishing', '789 Pine Ln, Anytown, USA', '555-9012'),
('Delta Books', '111 First St, Anytown, USA', '555-2222'),
('Epsilon Publishers', '222 Second Ave, Anytown, USA', '555-3333'),
('Zeta Publications', '333 Third Ln, Anytown, USA', '555-4444'),
('Eta Books', '444 Fourth St, Anytown, USA', '555-5555'),
('Theta Publishers', '555 Fifth Ave, Anytown, USA', '555-6666'),
('Iota Publications', '666 Sixth Ln, Anytown, USA', '555-7777'),
('Kappa Books', '777 Seventh St, Anytown, USA', '555-8888');

-- Table: Books
CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    ISBN VARCHAR(255) NOT NULL UNIQUE,
    PublishedDate DATE,
    Genre VARCHAR(100),
    AuthorID INT, -- Foreign key to Authors table
    PublisherID INT, -- Foreign key to Publishers table
    CopiesAvailable INT NOT NULL DEFAULT 0,
    CHECK (CopiesAvailable >= 0)
);

-- Insert data into Books table
INSERT INTO Books (Title, ISBN, PublishedDate, Genre, AuthorID, PublisherID, CopiesAvailable) VALUES
('The Thriller', '978-1234567890', '2020-01-15', 'Thriller', 1, 1, 3),
('The Romance', '978-2345678901', '2019-08-20', 'Romance', 2, 2, 1),
('The Sci-Fi', '978-3456789012', '2021-03-10', 'Science Fiction', 3, 3, 0),
('The History', '978-4567890123', '2018-11-01', 'Historical Fiction', 4, 4, 2),
('The Mystery', '978-5678901234', '2022-05-05', 'Mystery', 5, 5, 5),
('The Fantasy', '978-6789012345', '2017-09-25', 'Fantasy', 6, 6, 0),
('The Contemporary', '978-7890123456', '2023-02-18', 'Contemporary', 7, 7, 4),
('The Childrens Book', '978-8901234567', '2016-07-01', 'Children', 8, 8, 3),
('The Horror', '978-9012345678', '2024-04-01', 'Horror', 9, 9, 1),
('The Poetry', '978-0123456789', '2015-12-01', 'Poetry', 10, 10, 2);


-- Table: Members
CREATE TABLE Members (
    MemberID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    DateOfBirth DATE,
    Email VARCHAR(255) NOT NULL UNIQUE,
    MembershipDate DATE NOT NULL,
    Address VARCHAR(255),
    ContactNumber VARCHAR(20)
);

-- Insert data into Members table
INSERT INTO Members (FirstName, LastName, DateOfBirth, Email, MembershipDate, Address, ContactNumber) VALUES
('Alice', 'Johnson', '1990-05-10', 'alice.johnson@example.com', '2020-01-01', '101 Pine St, Anytown, USA', '555-1111'),
('Bob', 'Smith', '1985-08-15', 'bob.smith@example.com', '2019-06-01', '202 Oak Ave, Anytown, USA', '555-2222'),
('Charlie', 'Brown', '1992-03-20', 'charlie.brown@example.com', '2021-02-01', '303 Maple Ln, Anytown, USA', '555-3333'),
('Diana', 'Miller', '1988-11-05', 'diana.miller@example.com', '2018-09-01', '404 Elm St, Anytown, USA', '555-4444'),
('Ethan', 'Davis', '1995-07-22', 'ethan.davis@example.com', '2022-04-01', '505 Willow Ave, Anytown, USA', '555-5555'),
('Fiona', 'Wilson', '1987-02-10', 'fiona.wilson@example.com', '2017-11-01', '606 Birch Ln, Anytown, USA', '555-6666'),
('George', 'Garcia', '1991-09-18', 'george.garcia@example.com', '2020-08-01', '707 Cedar St, Anytown, USA', '555-7777'),
('Hannah', 'Rodriguez', '1989-04-25', 'hannah.rodriguez@example.com', '2019-12-01', '808 Spruce Ave, Anytown, USA', '555-8888'),
('Isaac', 'Martinez', '1993-01-12', 'isaac.martinez@example.com', '2021-07-01', '909 Pine Ln, Anytown, USA', '555-9999'),
('Jessica', 'Anderson', '1986-06-08', 'jessica.anderson@example.com', '2018-03-01', '1010 Oak St, Anytown, USA', '555-0000');

-- Table: Loans
CREATE TABLE Loans (
    LoanID INT AUTO_INCREMENT PRIMARY KEY,
    MemberID INT, -- Foreign key to Members table
    BookID INT, -- Foreign key to Books table
    LoanDate DATE NOT NULL,
    ReturnDate DATE,
    Status ENUM('Active', 'Returned', 'Overdue') NOT NULL DEFAULT 'Active',
    CHECK (LoanDate <= ReturnDate)
);

-- Insert data into Loans table
INSERT INTO Loans (MemberID, BookID, LoanDate, ReturnDate, Status) VALUES
(1, 1, '2024-01-01', '2024-01-15', 'Returned'),
(2, 2, '2024-01-05', '2024-01-20', 'Active'),
(3, 3, '2024-01-10', NULL, 'Active'),
(4, 4, '2024-01-12', '2024-01-26', 'Returned'),
(5, 5, '2024-01-15', NULL, 'Overdue'),
(1, 6, '2024-02-01', '2024-02-15', 'Returned'),
(2, 7, '2024-02-05', NULL, 'Active'),
(6, 8, '2024-02-10', '2024-02-24', 'Returned'),
(7, 9, '2024-02-12', NULL, 'Overdue'),
(8, 10, '2024-03-01', '2024-03-15', 'Returned');


-- Table: Reservations
CREATE TABLE Reservations (
    ReservationID INT AUTO_INCREMENT PRIMARY KEY,
    MemberID INT, -- Foreign key to Members table
    BookID INT, -- Foreign key to Books table
    ReservationDate DATE NOT NULL,
    Status ENUM('Pending', 'Active', 'Cancelled', 'Completed') NOT NULL DEFAULT 'Pending'
);

-- Insert data into Reservations table
INSERT INTO Reservations (MemberID, BookID, ReservationDate, Status) VALUES
(1, 3, '2024-01-20', 'Completed'),
(2, 5, '2024-01-25', 'Pending'),
(3, 1, '2024-02-01', 'Active'),
(4, 2, '2024-02-05', 'Cancelled'),
(5, 4, '2024-02-10', 'Completed'),
(6, 6, '2024-02-15', 'Pending'),
(7, 8, '2024-02-20', 'Active'),
(8, 10, '2024-02-25', 'Cancelled'),
(9, 1, '2024-03-05', 'Completed'),
(10, 2, '2024-03-10', 'Pending');

-- 4. Add foreign key constraints

-- Foreign key constraint for Books table, AuthorID
ALTER TABLE Books
ADD CONSTRAINT FK_Books_Authors
FOREIGN KEY (AuthorID)
REFERENCES Authors(AuthorID);

-- Foreign key constraint for Books table, PublisherID
ALTER TABLE Books
ADD CONSTRAINT FK_Books_Publishers
FOREIGN KEY (PublisherID)
REFERENCES Publishers(PublisherID);

-- Foreign key constraint for Loans table, MemberID
ALTER TABLE Loans
ADD CONSTRAINT FK_Loans_Members
FOREIGN KEY (MemberID)
REFERENCES Members(MemberID);

-- Foreign key constraint for Loans table, BookID
ALTER TABLE Loans
ADD CONSTRAINT FK_Loans_Books
FOREIGN KEY (BookID)
REFERENCES Books(BookID);

-- Foreign key constraint for Reservations table, MemberID
ALTER TABLE Reservations
ADD CONSTRAINT FK_Reservations_Members
FOREIGN KEY (MemberID)
REFERENCES Members(MemberID);

-- Foreign key constraint for Reservations table, BookID
ALTER TABLE Reservations
ADD CONSTRAINT FK_Reservations_Books
FOREIGN KEY (BookID)
REFERENCES Books(BookID);
