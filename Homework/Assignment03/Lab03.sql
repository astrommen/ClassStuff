-- Try to recreate this table using queries.
--CREATE TABLE taverns (
	--ID int,
	--Name varchar(200),
	--LocationId int,
	--Description varchar(200),
	--ownerId int
--);

SELECT * FROM INFORMATION_SCHEMA.COLUMNS;

--id int
select CONCAT(COLUMN_NAME, ' ', DATA_TYPE) AS Taverns FROM INFORMATION_SCHEMA.COLUMNS 
WHERE COLUMN_NAME='id' AND TABLE_NAME = 'tavern' 
UNION ALL

--name varchar(128),
select CONCAT(COLUMN_NAME, ' ', DATA_TYPE, '(', CHARACTER_MAXIMUM_LENGTH, '),') 
AS Taverns FROM INFORMATION_SCHEMA.COLUMNS 
WHERE COLUMN_NAME='name' AND TABLE_NAME='tavern'
UNION ALL

--state_id,
select CONCAT(COLUMN_NAME, ' ', DATA_TYPE, ',')
AS Taverns FROM INFORMATION_SCHEMA.COLUMNS 
WHERE COLUMN_NAME='state_id' AND TABLE_NAME='tavern'
UNION ALL

--description varchar(128),
select CONCAT(COLUMN_NAME, ' ', DATA_TYPE, '(', CHARACTER_MAXIMUM_LENGTH, '),')
AS Taverns FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME='description' AND TABLE_NAME='roles'
UNION ALL

--owner_id int
SELECT CONCAT(roles.name, '_id', ' int')
AS Taverns
FROM roles WHERE roles.id='1';
