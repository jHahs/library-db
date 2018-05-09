USE db_library

DROP TABLE usp_Book_Copies,usp_Book_Loans, usp_Book_Authors,usp_Book,usp_Library_Branch,usp_Borrower,usp_Publisher



CREATE TABLE usp_Publisher (
Name VARCHAR(50) PRIMARY KEY NOT NULL,
Address VARCHAR(50) NOT NULL,
Phone VARCHAR(30) NOT NULL, 
); 

CREATE TABLE usp_Borrower (
CardNo INT PRIMARY KEY IDENTITY (2001,1) NOT NULL,
Name VARCHAR(30) NOT NULL,
Borrow_Address VARCHAR(50) NOT NULL,
Phone VARCHAR(30) NOT NULL
);

CREATE TABLE usp_Library_Branch ( 
Branchid INT PRIMARY KEY IDENTITY (100,1) NOT NULL,
BranchName VARCHAR(50) NOT NULL,
Branch_Address VARCHAR(50) NOT NULL
);

CREATE TABLE usp_Book (
Book_Bookid INT PRIMARY KEY IDENTITY (500,1) NOT NULL, 
Title VARCHAR(50) NOT NULL, 
PublisherName VARCHAR(50) NOT NULL CONSTRAINT fk_Name FOREIGN KEY REFERENCES usp_Publisher(Name) ON UPDATE CASCADE ON DELETE CASCADE
);

  
 
CREATE TABLE usp_Book_Authors (
Bookid INT NOT NULL CONSTRAINT fk_Bookid FOREIGN KEY REFERENCES usp_Book(Book_Bookid) ON UPDATE CASCADE ON DELETE CASCADE,
AuthorName VARCHAR(30) NOT NULL 
);

CREATE TABLE usp_Book_Loans (
Bookid INT NOT NULL CONSTRAINT fk_Bookidloan FOREIGN KEY (Bookid) REFERENCES usp_Book(Book_Bookid) ON UPDATE CASCADE ON DELETE CASCADE,
Branchid INT NOT NULL CONSTRAINT fk_branchid FOREIGN KEY REFERENCES usp_Library_Branch(branchid) ON UPDATE CASCADE ON DELETE CASCADE,
Loan_CardNo INT NOT NULL CONSTRAINT fk_CardNo FOREIGN KEY REFERENCES usp_Borrower(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
Dateout VARCHAR(100) NOT NULL,
DueDate VARCHAR(100) NOT NULL 
);

CREATE TABLE usp_Book_Copies (
Bookid INT NOT NULL CONSTRAINT fk_Bookidcopie FOREIGN KEY REFERENCES usp_Book(Book_Bookid) ON UPDATE CASCADE ON DELETE CASCADE,
Branchid INT NOT NULL CONSTRAINT fk_branchidcopies FOREIGN KEY REFERENCES usp_Library_Branch(branchid) ON UPDATE CASCADE ON DELETE CASCADE,
No_Of_Copies INT NOT NULL
);


INSERT INTO usp_Publisher
(Name,Address,Phone)
VALUES
('Scholastic','Schol Ave','425-910-2666'),
('Pearson','3rd St','510-224-5132'),
('Godfrey','Maine St','661-510-2458'),
('Wolters KLuwer','Meridian St','360-520-1625'),
('Wiley','Fruitvale dr','810-389-7541'),
('Joffrey','GOT cir','510-666-777')
;

SELECT * FROM usp_Publisher

INSERT INTO usp_Borrower
(Name,Borrow_Address,Phone)
VALUES
('Billy Frank','Ocean Ave','360-599-8572'),
('Bob Jenkins','Old st','325-546-8745'),
('Al Sharpton','Hair dr','756-498-5416'),
('Donald Trump','Gold Ave','899-426-7894'),
('Ted Cruz','Cruze lane','815-634-4524'),
('Wiley Coyote','Taz ave','510-410-4879'),
('Nathan Drake','Uncharted Ave','192-485-7859'),
('Kratos Spartan','Sparta cir','656-666-4278')
;

SELECT * FROM usp_Borrower;

INSERT INTO usp_Library_Branch
(BranchName,Branch_Address)
VALUES
('Sharpstown','Tunic Way'),
('Central','Blank st'),
('Rosedale','Oildale ln'),
('Downtown','19th st')
;

SELECT * FROM usp_Library_Branch;


INSERT INTO usp_Book
(Title,PublisherName)
VALUES
('IT','Scholastic'),
('The Shining','Scholastic'),
('Bill Goat','Godfrey'),
('GOT','Joffrey'),
('GooseWeeze','Wiley'),
('BFG','Scholastic'),
('Doom','Wolters KLuwer'),
('Magic Tree House','Pearson'),
('Halo','Wiley'),
('Hunger Games','Pearson'),
('The Lost Tribe','Joffrey'),
('Star Wars','Wolters KLuwer'),
('The Hobbit','Wiley'),
('Spider Man','Scholastic'),
('Batman','Scholastic'),
('Coding for Noobs','Joffrey'),
('Fahrenheit 451','Pearson'),
('God of War','Wiley'),
('Avengers','Scholastic'),
('Book of Dogs','Godfrey')
;

SELECT * FROM usp_Book

INSERT INTO usp_Book_Authors
(Bookid,AuthorName)
VALUES
(500,'Stephen King'),
(501,'Stephen King'),
(502,'Bob Beeg'),
(503,'George RR Martin'),
(504,'Jones Jones'),
(505,'Roald Dahl'),
(506,'Mick Thompson'),
(507,'Jane Foster'),
(508,'Marty O''Donnel'),
(509, 'Suzanne Collins'),
(510, 'Tim LaHaye'),
(511, 'George Lucas'),
(512, 'J.R.R. Tolkien'),
(513, 'Stan Lee'),
(514, 'Bill FInger'),
(515, 'Bill Gates'),
(516, 'Ray Bradbury'),
(517, 'Cory Barlog'),
(518, 'Russo Bros'),
(519, 'Alex Pacheco')
;

SELECT * FROM usp_Book_Authors

INSERT INTO usp_Book_Loans 
(Bookid,Branchid,Loan_CardNo,DateOut,DueDate)
VALUES
(500,100,2001,'5-1-2018','5-8-2018'),
(501,100,2001,'8-10-2017','8-20-2017'),
(502,100,2001,'8-10-2017','8-20-2017'),
(503,100,2001,'8-10-2017','8-20-2017'),
(504,100,2001,'8-10-2017','8-20-2017'),
(505,100,2001,'8-10-2017','8-20-2017'),
(506,100,2001,'8-10-2017','8-20-2017'),
(507,100,2001,'8-10-2017','8-20-2017'),
(508,100,2001,'8-10-2017','8-20-2017'),
(509,100,2001,'8-10-2017','8-20-2017'),
(510,100,2001,'8-10-2017','8-20-2017'),
(500,101,2005,'8-11-2017','8-21-2017'),
(512,101,2005,'8-11-2017','8-21-2017'),
(513,101,2005,'8-11-2017','8-21-2017'),
(514,101,2005,'8-11-2017','8-21-2017'),
(515,101,2005,'8-11-2017','8-21-2017'),
(516,101,2005,'8-11-2017','8-21-2017'),
(517,101,2005,'8-11-2017','8-21-2017'),
(518,101,2005,'8-11-2017','8-21-2017'),
(519,101,2005,'8-11-2017','8-21-2017'),
(500,102,2003,'7-10-2017','7-20-2017'),
(501,102,2003,'7-10-2017','7-20-2017'),
(502,102,2003,'7-10-2017','7-20-2017'),
(503,102,2003,'7-10-2017','7-20-2017'),
(504,102,2003,'7-10-2017','7-20-2017'),
(505,102,2004,'6-10-2017','6-20-2017'),
(506,102,2004,'6-10-2017','6-20-2017'),
(507,102,2004,'6-10-2017','6-20-2017'),
(508,102,2004,'6-10-2017','6-20-2017'),
(509,102,2004,'6-10-2017','6-20-2017'),
(510,103,2006,'5-11-2017','5-21-2017'),
(511,103,2006,'8-11-2017','8-21-2017'),
(512,103,2006,'8-11-2017','8-21-2017'),
(513,103,2006,'8-11-2017','8-21-2017'),
(514,103,2006,'8-11-2017','8-21-2017'),
(515,103,2007,'8-11-2017','8-21-2017'),
(516,103,2007,'8-11-2017','8-21-2017'),
(517,103,2007,'8-11-2017','8-21-2017'),
(518,103,2007,'8-11-2017','8-21-2017'),
(519,103,2007,'8-11-2017','8-21-2017'),
(500,102,2001,'7-10-2017','7-20-2017'),
(501,102,2001,'7-10-2017','7-20-2017'),
(502,102,2001,'7-10-2017','7-20-2017'),
(503,102,2001,'7-10-2017','7-20-2017'),
(504,102,2001,'7-10-2017','7-20-2017'),
(505,102,2001,'6-10-2017','6-20-2017'),
(506,102,2002,'6-10-2017','6-20-2017'),
(507,102,2002,'6-10-2017','6-20-2017'),
(508,102,2002,'6-10-2017','6-20-2017'),
(509,102,2002,'6-10-2017','6-20-2017'),
(510,103,2005,'5-1-2018','5-8-2018')
;

SELECT * FROM usp_Book_Loans

INSERT INTO usp_Book_Copies
(Bookid,Branchid,No_Of_Copies)
VALUES
(500,100,2),
(501,100,2),
(502,100,2),
(503,100,2),
(504,100,2),
(505,100,2),
(506,100,2),
(507,100,2),
(508,100,2),
(509,100,2),
(510,100,2),
(500,101,2),
(501,101,2),
(502,101,2),
(503,101,2),
(504,101,2),
(505,101,2),
(506,101,2),
(507,101,2),
(508,101,2),
(509,101,2),
(510,102,2),
(511,102,2),
(512,102,2),
(513,102,2),
(514,102,2),
(515,102,2),
(516,102,2),
(517,102,2),
(518,102,2),
(519,102,2),
(510,103,2),
(511,103,2),
(512,103,2),
(513,103,2),
(514,103,2),
(515,103,2),
(516,103,2),
(517,103,2),
(518,103,2),
(519,103,2)

;




-- 1

SELECT 
a1.Bookid, a2.Title, a3.BranchName,
a1.No_Of_Copies
FROM usp_Book_Copies a1
INNER JOIN usp_Book a2 ON a2.Book_Bookid = a1.Bookid
INNER JOIN usp_Library_Branch a3 ON a3.Branchid = a1.Branchid
WHERE Title = 'The Lost Tribe' and BranchName = 'Sharpstown';
-- 2

SELECT 
a1.Bookid, a2.Title, a3.BranchName,
a1.No_Of_Copies
FROM usp_Book_Copies a1
INNER JOIN usp_Book a2 ON a2.Book_Bookid = a1.Bookid
INNER JOIN usp_Library_Branch a3 ON a3.Branchid = a1.Branchid
WHERE Title = 'The Lost Tribe' ;
--3

 SELECT 
 Name , Bookid
 FROM usp_Borrower
 LEFT JOIN usp_Book_Loans on usp_Borrower.CardNo = usp_Book_Loans.Loan_CardNo;

 --4
 SELECT 
DueDate,Title ,Name , Borrow_Address , BranchName  
FROM usp_Book_Loans
LEFT JOIN usp_Book ON usp_Book_Loans.Bookid = usp_Book.Book_Bookid 
LEFT JOIN usp_Borrower ON usp_Book_Loans.Loan_CardNo = usp_Borrower.CardNo
LEFT JOIN usp_Library_Branch ON usp_Book_Loans.Branchid = usp_Library_Branch.Branchid
WHERE DueDate = '5-8-2018'
 
--5 
SELECT
BranchName, Bookid
FROM usp_Library_Branch
LEFT JOIN usp_Book_Loans ON  usp_Library_Branch.Branchid = usp_Book_Loans.Branchid

--6
SELECT  
Name, Borrow_Address,  Bookid, CardNo 
FROM usp_Borrower
LEFT JOIN usp_Book_Loans ON usp_Borrower.CardNo = usp_Book_Loans.Loan_CardNo
 WHERE Name IN ('Billy Frank', 'Ted Cruz') 

--7
SELECT
No_Of_Copies, AuthorName, BranchName, Title
FROM usp_Book_Copies
LEFT JOIN usp_Book_Authors ON usp_Book_Copies.Bookid =usp_Book_Authors.Bookid
LEFT JOIN usp_Library_Branch ON usp_Book_Copies.Branchid = usp_Library_Branch.Branchid
LEFT JOIN usp_Book ON usp_Book_Copies.Bookid =usp_Book.Book_Bookid
WHERE AuthorName = 'Stephen King' AND BranchName = 'Central'
 


 











	
   














	


