--Query 1
SELECT * FROM sys.columns
INNER JOIN sys.objects ON sys.columns.object_id=sys.objects.object_id
WHERE type='U'
ORDER BY sys.objects.name;


--Query 2
SELECT * FROM sys.objects
WHERE type_desc='FOREIGN_KEY_CONSTRAINT'


--Query 3
SELECT * FROM sys.user_token


--Query 4
SELECT * FROM sys.objects
WHERE type_desc='USER_TABLE' 