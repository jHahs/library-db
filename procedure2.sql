USE db_library
GO

CREATE PROCEDURE getlosttribelibrarybranches 
AS
SELECT 
a1.Bookid, a2.Title, a3.BranchName,
a1.No_Of_Copies
FROM usp_Book_Copies a1
INNER JOIN usp_Book a2 ON a2.Book_Bookid = a1.Bookid
INNER JOIN usp_Library_Branch a3 ON a3.Branchid = a1.Branchid
WHERE Title = 'The Lost Tribe' ;