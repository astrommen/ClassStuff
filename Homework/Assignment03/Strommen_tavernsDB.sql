--CREATE TABLE taverns (
	--ID int,
	--Name varchar(200),
	--LocationId int,
	--Description varchar(200),
	--ownerId int
--);

SELECT 
-- create table tavern ( 
CONCAT('CREATE TABLE ', TABLE_NAME, ' (') as queryPiece 
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_NAME = 'tavern'
UNION ALL
SELECT CONCAT(COLUMN_NAME, ' ', DATA_TYPE,
( --iterate through all cols where char max has val
	CASE
		When CHARACTER_MAXIMUM_LENGTH IS NOT NULL 
		-- replace varchar(x) with varchar(100)...didnt work for me
		Then CONCAT('(', CAST(CHARACTER_MAXIMUM_LENGTH as varchar(200)), '),') 
		-- otherwise tag ',' at end
		Else ',' 
	END)
) FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'tavern' AND COLUMN_NAME IN ('id', 'name', 'state_id') --look only for thos cols
UNION ALL
-- description
SELECT CONCAT(COLUMN_NAME, ' ', DATA_TYPE,
 CONCAT('(', CAST(CHARACTER_MAXIMUM_LENGTH as varchar(200)), '),') 
) FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'roles' AND COLUMN_NAME IN ('description')
UNION ALL
--owner_id
SELECT CONCAT(roles.name, '_id', ' int', ')')
AS Taverns
FROM roles WHERE roles.id='1';


--1. new room and room stays tables with seed. 
CREATE TABLE rooms (
	id int NOT NULL PRIMARY KEY IDENTITY(1,1),
	roomNumber int NOT NULL,
	tavern_id int FOREIGN KEY REFERENCES tavern(id),
	status_id int FOREIGN KEY REFERENCES status(id)
);

INSERT INTO status VALUES 
('vacant'),
('occupied');

INSERT INTO rooms VALUES 
(101, 1, 1),
(102, 1, 1),
(103, 1, 1),
(104, 1, 1),
(105, 1, 1),
(201, 1, 1),
(301, 1, 1),
(401, 1, 1);

CREATE TABLE roomStays (
	id int NOT NULL PRIMARY KEY IDENTITY(1,1),
	room_id int NOT NULL FOREIGN KEY REFERENCES rooms(id),
	rate float NOT NULL
)

INSERT INTO roomStays VALUES
(101, 50.00),
(102, 50.00),
(103, 50.00),
(104, 50.00),
(105, 50.00),
(201, 150.00),
(301, 200.00),
(401, 500.00);

--2. query guests with birthday < 2000
	select name from guests where birthday<'2000';

--3. query rooms rate 
	select number from rooms where rate>100.00;

-- 4. query unique guest names
	select distinct names from guests;

-- 5 query all guest names ordered asc or desc
	select * from guests order by name asc;

--6 query returns top 10 highest price sales
	select top 10 *
		from (
			select sales.id, services.name, services.price, sales.created 
			from sales
			inner join services on sales.services_id=services.id
			) services order by price desc;

--7 query for all lookup table values
-- not sure how to remove tavern, supplies, guests, or users
select table_name, column_name, ORDINAL_POSITION, DATA_TYPE 
from INFORMATION_SCHEMA.Columns
except 
	select table_name, column_name, ordinal_position, DATA_TYPE
	from INFORMATION_SCHEMA.Columns
	where ordinal_position > 2
except
	select table_name, column_name, ordinal_position, DATA_TYPE
	from INFORMATION_SCHEMA.Columns
	where data_type='int';

--8 query guest classes with level grouping
select ( 
	case 
	when lvl >= 1 and lvl < 10 
	then 'Apprentice' 
	else 'Journeyman' 
	end) 
as ClassTitle, 
* from (
	select guests.name, guestClasses.lvl, class.type
	from guestClasses
	inner join guests on guestClasses.guest_id=guests.id
	inner join class on guestClasses.class_id=class.id
) guestClasses;

--9 select insert commands
