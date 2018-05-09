USE db_library
GO

CREATE PROCEDURE  getstephkingbookcentral
AS
SELECT
No_Of_Copies, AuthorName, BranchName, Title
FROM usp_Book_Copies
LEFT JOIN usp_Book_Authors ON usp_Book_Copies.Bookid =usp_Book_Authors.Bookid
LEFT JOIN usp_Library_Branch ON usp_Book_Copies.Branchid = usp_Library_Branch.Branchid
LEFT JOIN usp_Book ON usp_Book_Copies.Bookid =usp_Book.Book_Bookid
WHERE AuthorName = 'Stephen King' AND BranchName = 'Central';