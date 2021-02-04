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