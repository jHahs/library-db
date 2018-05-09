USE db_library
GO

CREATE PROCEDURE getborrowerscheckout
AS 
SELECT 
 Name , Bookid
 FROM usp_Borrower
 LEFT JOIN usp_Book_Loans on usp_Borrower.CardNo = usp_Book_Loans.Loan_CardNo;