IF OBJECT_ID('triggername') IS NOT NULL
	DROP TRIGGER triggername
GO

CREATE TRIGGER triggername
ON tablename
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
	PRINT 'message'
END

GO

SELECT *
FROM tablename

INSERT INTO tablename (col, col)
VALUES ('', '');
GO