USE db_library
GO

CREATE PROCEDURE getsharpstownduedatetoday
AS
SELECT 
DueDate,Title ,Name , Borrow_Address , BranchName  
FROM usp_Book_Loans
LEFT JOIN usp_Book ON usp_Book_Loans.Bookid = usp_Book.Book_Bookid 
LEFT JOIN usp_Borrower ON usp_Book_Loans.Loan_CardNo = usp_Borrower.CardNo
LEFT JOIN usp_Library_Branch ON usp_Book_Loans.Branchid = usp_Library_Branch.Branchid
WHERE DueDate = '5-8-2018'