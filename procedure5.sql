USE db_library
GO

CREATE PROCEDURE getbranchnametotalbookloan
AS 
SELECT
BranchName, Bookid
FROM usp_Library_Branch
LEFT JOIN usp_Book_Loans ON  usp_Library_Branch.Branchid = usp_Book_Loans.Branchid;