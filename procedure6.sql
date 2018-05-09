USE db_library
GO

CREATE PROCEDURE getborrowedbookmorethan5
AS
SELECT  
Name, Borrow_Address,  Bookid, CardNo 
FROM usp_Borrower
LEFT JOIN usp_Book_Loans ON usp_Borrower.CardNo = usp_Book_Loans.Loan_CardNo
 WHERE Name IN ('Billy Frank', 'Ted Cruz');
