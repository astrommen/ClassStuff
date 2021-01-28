0. Complete the lab to create the SELECT CREATE query!
Reproduce the output:

CREATE TABLE Taverns (
ID int,
Name varchar(100),
Floors int,
LocationID int,
OwnerID int,
)

1. The system should also be able to track Rooms. Rooms should have a status and an associated tavern. There should be a way to track Room Stays which will contain a sale, guest, room, the date it was stayed in and the rate

2. Write a query that returns guests with a birthday before 2000. 

3. Write a query to return rooms that cost more than 100 gold a night

4. Write a query that returns UNIQUE guest names. 

5. Write a query that returns all guests ordered by name (ascending) Use ASC or DESC after your ORDER BY [col]

6. Write a query that returns the top 10 highest price sales

7. Write a query to return all the values stored in all Lookup Tables - Lookup tables are the tables we reference typically with just an ID and a name. This should be a dynamic combining of all of the tables

8. Write a query that returns Guest Classes with Levels and Generate a new column with a label for their level grouping (lvl 1-10, 10-20, etc)

9. Write a series of INSERT commands that will insert the statuses of one table into another of your choosing using SELECT statements (See our lab in class - The INSERT commands should be generated). It’s ok if the data doesn’t match or make sense! :)
* Remember, INSERT Commands look like: INSERT INTO Table1 (column1, column2) VALUES (column1, column2)