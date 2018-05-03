CREATE DATABASE BOOKS_DRILL
USE BOOKS_DRILL
USE db_zoo
DROP DATABASE BOOKS_DRILL;


--DATABASE TABLES


CREATE TABLE PUBLISHER (
Name  VARCHAR(50) PRIMARY KEY NOT NULL,
Publisher_Address VARCHAR(50) NOT NULL,
Phone VARCHAR(50) NOT NULL
);


CREATE TABLE BORROWER (
CardNo INT PRIMARY KEY NOT NULL IDENTITY (1,1),
Name VARCHAR (50) NOT NULL,
Borrower_Address VARCHAR(50) NOT NULL,
Phone VARCHAR (50) NOT NULL
);

CREATE TABLE LIBRARY_BRANCH (
Library_BranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
BranchName VARCHAR(50) NOT NULL,
Branch_Address VARCHAR(50) NOT NULL
);

CREATE TABLE BOOKS (
BookID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
Title VARCHAR (50) NOT NULL,
PublisherName VARCHAR(50) NOT NULL
CONSTRAINT fk_PublisherName
FOREIGN KEY REFERENCES PUBLISHER(Name)
ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE BOOK_AUTHORS (
AuthorID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
AuthorName VARCHAR(50) NOT NULL,
BookID INT NOT NULL
CONSTRAINT fk_BookID5
FOREIGN KEY REFERENCES BOOKS(BookID)
ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE BOOK_LOANS (
Loans_Id INT PRIMARY KEY NOT NULL Identity (1,1),
BooKId INT NOT NULL
CONSTRAINT fk_BookId4
FOREIGN KEY REFERENCES BOOKS(BookId)
ON UPDATE CASCADE ON DELETE CASCADE,
BranchID  INT NOT NULL
CONSTRAINT fk_BranchID 
FOREIGN KEY REFERENCES LIBRARY_BRANCH(Library_BranchID)
 ON UPDATE CASCADE ON DELETE CASCADE,
Loans_CardNo INT NOT NULL
CONSTRAINT fk_CardNo
FOREIGN KEY REFERENCES BORROWER(CardNo)
ON UPDATE CASCADE ON DELETE CASCADE,
DateOut DATE NOT NULL,
DueDate DATE NOT NULL
 ); 

CREATE TABLE BOOK_COPIES (
CopiesID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
Copies_BookID INT NOT NULL
CONSTRAINT fk_CopiesBookID3
FOREIGN KEY REFERENCES BOOKS(BookID)
ON UPDATE CASCADE ON DELETE CASCADE,
BranchID INT NOT NULL
CONSTRAINT fk_BranchID2
FOREIGN KEY REFERENCES LIBRARY_BRANCH(Library_BranchID)
ON UPDATE CASCADE ON DELETE CASCADE,
No_Of_Copies INT NOT NULL
);

--DATABASE INSERT STATEMENTS

INSERT INTO PUBLISHER (Name, Publisher_Address, Phone)
VALUES 
('Graywolf Press','16365 James Madison Highway Gordonsville, VA','509-657-7887'),
('Penguin Books','1578 maple st Wenatchee, WA','206-771-8584'),
('Random House','910 larch st Wenatchee, WA','423-448-0990'),
('Tin House','2010 miller st East,Wenatchee, WA','208-488-3230')
;

INSERT INTO BORROWER (Name, Borrower_Address, Phone)
VALUES 
('Emily Carter','1015 clover st Seattle, WA','443-318-1723'),
('Joseph Coral','1020 union st Seattle, WA','443-567-5060'),
('Dexter Diniro','1050 dexter st Seattle, WA','443-679-7190'),
('Alexander vanderwall','950 interlake Seattle, WA','444-890-9134'),
('Joey Blake','900 dennis st Seattle, WA','509-890-9087'),
('Freddy Mullar','999 view st Kirkland, WA ','509-742-5234'),
('Frankie Johnson','818 sandpoint st Kirkland, WA','509-867-7881'),
('Danny Hughes','820 creek st Kirkland, WA','509-232-0789')
;

INSERT INTO LIBRARY_BRANCH (BranchName,Branch_Address)
VALUES
('Sharptown','1011 alki st'),
('Central','2020 poplar st'),
('Pacific','2020 9thst'),
('Coast','3030 4th st')
;

INSERT INTO BOOKS (Title, PublisherName)
VALUES
('The Lost Tribe','Graywolf Press'),
('The Long Walk','Graywolf Press'),
('IT','Graywolf Press'),
('The cruise', 'Graywolf Press'),
('Girl With the Dragon Tattoo','Graywolf Press'),
('The Man in the High Castle','Graywolf Press'),
('The Wisdom of Crowds','Graywolf Press'),
('How To Be Safe','Graywolf Press'),
('Little Fires Everywhere','Graywolf Press'),
('Venus on the Half-Shell','Graywolf Press'),
('Girls Who Code','Penguin Books'),
('The Quantum Thief','Penguin Books'),
('Spy of the First Person','Penguin Books'),
('True Fiction','Penguin Books'),
('Poliltical Science Fiction','Penguin Books'),
('Letters to a Fiction Writer','Penguin Books'),
('How Fiction Works','Random House'),
('A Look at Realistic Fiction','Random House'),
('The Language of fiction','Random House'),
('Death of a Salesman','Random House'),
('The Iliad','Random House'),
('Things Fall Apart','Tin House'),
('The prince','Tin House'),
('Amulet','Tin House')
;
INSERT INTO BOOK_AUTHORS (AuthorName, BookID)
VALUES
('Stephen King',2),
('Stephen King',3),
('Angelina Jolie',14),
('Brad Pitt',4),
('Chris Browm',5),
('Micheal Jackson',6),
('T-Pain',7),
('Willy Nelson',8),
('Denzel Washington',9),
('Matt Damon',11),
('Kanye West',12),
('Russell Wilosn',13)
;

INSERT INTO BOOK_LOANS (BooKId, BranchID, Loans_CardNo, DateOut, DueDate)
VALUES
(2,1,1,'2018-05-01','2018-05-02'),
(3,1,1,'2018-05-01','2018-05-02'),
(4,1,1,'2018-05-01','2018-05-02'),
(5,1,1,'2018-05-01','2018-05-02'),
(10,1,1,'2018-05-01','2018-05-03'),
(7,1,1,'2018-05-01','2018-05-03'),
(8,1,1,'2018-05-01','2018-05-03'),
(1,1,2,'2018-05-01','2018-05-03'),
(9,1,2,'2018-05-01','2018-05-03'),
(10,1,2,'2018-05-01','2018-05-04'),
(5,2,2,'2018-05-01','2018-05-04'),
(2,2,2,'2018-05-01','2018-05-04'),
(13,2,2,'2018-05-01','2018-05-04'),
(1,2,2,'2018-05-01','2018-05-04'),
(14,2,3,'2018-05-01','2018-05-04'),
(3,2,3,'2018-05-01','2018-05-04'),
(16,2,3,'2018-05-01','2018-05-04'),
(17,2,3,'2018-05-01','2018-05-05'),
(1,2,3,'2018-05-01','2018-05-05'),
(6,2,3,'2018-05-01','2018-05-05'),
(1,3,3,'2018-05-01','2018-05-05'),
(3,3,4,'2018-05-01','2018-05-05'),
(4,3,4,'2018-05-01','2018-05-05'),
(5,3,4,'2018-05-01','2018-05-05'),
(6,3,4,'2018-05-01','2018-05-05'),
(10,3,4,'2018-05-01','2018-05-05'),
(8,3,4,'2018-05-01','2018-05-05'),
(9,3,4,'2018-05-01','2018-05-06'),
(10,3,5,'2018-05-01','2018-05-06'),
(11,3,5,'2018-05-01','2018-05-06'),
(1,4,5,'2018-05-01','2018-05-06'),
(12,4,5,'2018-05-01','2018-05-06'),
(13,4,5,'2018-05-01','2018-05-06'),
(14,4,5,'2018-05-01','2018-05-06'),
(15,4,5,'2018-05-01','2018-05-06'),
(16,4,6,'2018-05-01','2018-05-06'),
(17,4,6,'2018-05-01','2018-05-07'),
(18,4,6,'2018-05-01','2018-05-07'),
(19,4,6,'2018-05-01','2018-05-07'),
(10,4,6,'2018-05-01','2018-05-07'),
(1,4,6,'2018-05-01','2018-05-07'),
(2,4,6,'2018-05-01','2018-05-07'),
(3,4,7,'2018-05-01','2018-05-07'),
(4,4,7,'2018-05-01','2018-05-07'),
(5,4,7,'2018-05-01','2018-05-07'),
(6,4,7,'2018-05-01','2018-05-07'),
(7,4,7,'2018-05-01','2018-05-08'),
(8,4,7,'2018-05-01','2018-05-08'),
(9,4,7,'2018-05-01','2018-05-08'),
(10,4,7,'2018-05-01','2018-05-08')
;

INSERT INTO BOOK_COPIES (Copies_BookID, BranchID, No_Of_Copies)
VALUES 
(1,1,2),
(4,1,2),
(5,1,2),
(6,1,2),
(7,1,2),
(8,1,2),
(9,1,2),
(10,1,2),
(11,1,2),
(12,1,2),
(2,2,2),
(3,2,2),
(13,2,2),
(14,2,2),
(15,2,2),
(16,2,2),
(17,2,2),
(18,2,2),
(19,2,2),
(20,2,2),
(21,3,2),
(22,3,2),
(23,3,2),
(24,3,2),
(1,3,2),
(8,3,2),
(11,3,2),
(4,3,2),
(5,3,2),
(6,3,2),
(7,4,2),
(8,4,2),
(9,4,2),
(10,4,2),
(11,4,2),
(12,4,2),
(13,4,2),
(14,4,2),
(15,4,2),
(16,4,2)
;

-- STORED PROCEDURES

--	SP ONE

CREATE PROCEDURE dbo.GetBookCopies
AS
SELECT BOOKS.Title, BOOK_COPIES.No_Of_Copies
FROM BOOKS
INNER JOIN BOOK_COPIES 
ON BOOKS.BookID = BOOK_COPIES.Copies_BookID
WHERE BOOKS.Title = 'The Lost Tribe' AND BranchID = 1;

EXEC dbo.GetBookCopies;

-- SP TWO

CREATE PROCEDURE dbo.GetBranchCopies
AS
SELECT BOOKS.Title, BOOK_COPIES.No_Of_Copies, LIBRARY_BRANCH.BranchName
FROM BOOKS
INNER JOIN BOOK_COPIES 
ON BOOKS.BookID = BOOK_COPIES.Copies_BookID
INNER JOIN LIBRARY_BRANCH
ON LIBRARY_BRANCH.Library_BranchID = BOOK_COPIES.BranchID
WHERE BOOKS.Title = 'The Lost Tribe';

EXEC dbo.GetBranchCopies;

--	SP THREE

CREATE PROCEDURE dbo.RetrieveNames
AS
SELECT *
FROM BORROWER
FULL OUTER JOIN BOOK_LOANS
ON BORROWER.CardNo = BOOK_LOANS.Loans_CardNo
WHERE DateOut IS NULL;

EXEC dbo.RetrieveNames;

-- SP FOUR

CREATE PROCEDURE dbo.Loanedoutbooks
AS
SELECT
t1.DueDate,
t2.BranchName,
t3.Title,
t4.Name,
t4.Borrower_Address
FROM BOOK_LOANS t1 
INNER JOIN LIBRARY_BRANCH t2 ON t2.Library_BranchID = t1.BranchId
INNER JOIN BOOKS t3 ON t3.BookID = t1.Loans_Id
INNER JOIN BORROWER t4 ON t4.CardNo = t1.Loans_CardNo
WHERE BranchName = 'Sharptown' AND DueDate = '2018-05-02';

EXEC dbo.Loanedoutbooks;

--SP FIVE

CREATE PROCEDURE dbo.Grouploans
AS
SELECT 
Library_Branch.BranchName,
COUNT(BookID) AS "Total Books Loaned"
FROM BOOK_LOANS 
INNER JOIN LIBRARY_BRANCH
ON LIBRARY_BRANCH.Library_BranchID = BOOK_LOANS.BranchID
GROUP BY BranchName;

EXEC dbo.Grouploans;

--SP SIX
CREATE PROCEDURE dbo.sixbooks
AS
SELECT 
T1.Name, 
T1.Borrower_Address,
COUNT(T2.BooKId) AS "BORROWERS BOOKS"
FROM BORROWER T1
INNER JOIN BOOK_LOANS T2
ON T2.Loans_CardNo = T1.CardNo
GROUP BY T1.Name, T1.Borrower_Address
HAVING COUNT(T2.BooKId) >= 6;

EXEC dbo.sixbooks;

-- SP SEVEN

CREATE PROCEDURE dbo.Stephenkingbooks
AS
SELECT 
T2.Title,
T4.AuthorName,
T3.Library_BranchID,
T1.No_Of_Copies
FROM Book_Copies T1
INNER JOIN BOOKS T2 ON T2.BookID = T1.Copies_BookID
INNER JOIN LIBRARY_BRANCH T3 ON T3.Library_BranchID = T1.BranchID
INNER JOIN BOOK_AUTHORS T4 ON T4.BookID = T1.Copies_BookID
WHERE AuthorName = 'Stephen King';

EXEC dbo.Stephenkingbooks;


SELECT * FROM BOOKS;
SELECT * FROM BOOK_AUTHORS;
SELECT * FROM PUBLISHER;
SELECT * FROM BOOK_LOANS;
SELECT * FROM BOOK_COPIES;
SELECT * FROM BORROWER;
SELECT * FROM LIBRARY_BRANCH;
