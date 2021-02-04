-- I used the Fantasy Tavern DB provided in class

--1 report for users and roles
create function UserReport()
returns table
as
return (
	select u.Name as UserName, r.Name as RoleName, r.Description
	from Users u
	join Roles r on u.RoleId = r.ID
);
Go

select * from dbo.UserReport()
	order by RoleName asc;

--2 report for guests classes
insert into GuestClass values 
(1, 1, 3),
(3, 1, 15),
(2, 2, 6),
(3, 3, 50),
(4, 4, 10),
(5, 4, 2),
(1, 5, 25),
(2, 6, 5),
(5, 7, 12);

select * from GuestClass;

select c.Name as Class, count(gc.GuestID) as Guests
from GuestClass gc
inner join Class c on gc.ClassID = c.ID
group by c.Name;