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

--2 query for guests classes
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

--3 query of guests, classes, & lvls, sorted by name asc
select g.Name as Guest, c.Name as Class, gc.Level as Level,
	(case
	when Level >= 1 and Level < 5
		then 'begginer'
	when Level >= 5 and Level < 10
		then 'intermediate'
	when Level >=10
		then 'expert'
	end) as ClassLabel
from GuestClass gc
inner join Guests g on gc.GuestID = g.ID
inner join Class c on gc.ClassID = c.ID
order by Guest asc;
GO

--4 function of lvl and returns grouping
create function dbo.ClassLabel(@lvl int)
returns nvarchar(16)
as
begin

declare @label nvarchar

return 
	case
		when @lvl >= 1 and @lvl < 5
			then 'begginer'
		when @lvl >= 5 and @lvl < 10
			then 'intermediate'
		when @lvl >=10
			then 'expert'
	end 
end;
GO

select dbo.ClassLabel(2) as ClassLabel;
GO

--5 function report for open rooms on a date
create function Vacancies(@date date)
returns table
as
return(
	select distinct t.name as Tavern, r.roomNumber as Room# 
	from sales s
	inner join tavern t on s.tavern_id = t.id
	inner join roomStays rs on s.roomStay_id = rs.id
	inner join rooms r on rs.room_id = r.id
	where (stayStart > '@date' and stayEnd > '@date')
	or (stayStart < '@date' and stayEnd < '@date')
);
GO

select * from dbo.Vacancies('20200624')
GO

--6 like #5 but return report using price range