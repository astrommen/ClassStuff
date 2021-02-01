1. Write a query to return users who have admin roles
2. Write a query to return users who have admin roles and information about their taverns
3. Write a query that returns all guests ordered by name (ascending) and their classes and corresponding levels
4. Write a query that returns the top 10 sales in terms of sales price and what the services were
5. Write a query that returns guests with 2 or more classes
6. Write a query that returns guests with 2 or more classes with levels higher than 5
7. Write a query that returns guests with ONLY their highest level class
8. Write a query that returns guests that stay within a date range. Please remember that guests can stay for more than one night AND not all of the dates they stay have to be in that range (just some of them)
9. Using the additional queries provided, take the lab’s SELECT ‘CREATE query’ and add any IDENTITY and PRIMARY KEY constraints to it.

For Number 9: 
---
select sysObj.name, sysCol.name, *
from sys.objects sysObj inner join sys.columns sysCol on sysObj.object_id = sysCol.object_id