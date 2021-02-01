-- #1 query for admin users
insert into tavernUsers values
(2, 2, 7),
(10, 1, 7),
(18, 3, 7);

insert into roles values
('admin', 'administrative users');

insert into users values 
('Cheryl Tunt'),
('Sterling Archer'),
('Malory Archer'),
('Lana Kane'),
('Pam Poovey'),
('Dr. Krieger'),
('Cyril Figgis'),
('Woodhouse'),
('Ray Gillette'),
('Ron Cadillac'),
('Barry Dillon'),
('Rip Riley'),
('Burt Reynolds');

select * from users;
select * from tavernUsers;
select * from roles;

select users.name as Users, roles.name as Roles
from ((tavernUsers tu
inner join users on tu.user_id=users.id) 
inner join roles on tu.role_id=roles.id)
where role_id = 7;

--2 query admin users with tavern info
select users.name as Users, roles.name as Roles, tavern.*
from tavernUsers tu
join tavern on tu.tavern_id=tavern.id
inner join users on tu.user_id=users.id
inner join roles on tu.role_id=roles.id
where role_id = 7;

--3 query all guests
select * from guestClasses;
select * from guests;
select * from class;

select g.name as Guests, c.type as Class, gc.lvl
from guestClasses gc
inner join guests g on gc.guest_id = g.id
inner join class c on gc.class_id = c.id
order by Guests asc;

--4 query top 10 sales in terms of price and services
select * from sales;
select * from services;

select top 10 s.price as Price, s.name as Services
from sales sa
inner join services s on sa.services_id = s.id
order by Price desc;

--5 query guests with 2 or more classes
insert into guestClasses values
(1, 200, 4),
(1, 2, 1),
(3, 1, 5),
(5, 15, 3),
(6, 5, 2);

select * from guestClasses;

select g.name as Guest, count(class_id) as ClassQty
from guestClasses gc    
inner join guests g on gc.guest_id = g.id
group by g.name
having count(class_id) >= 2;

--6 query guests with 2 or more classes and lvl > 5
select g.name as Guest, count(class_id) as ClassQty
from guestClasses gc
inner join guests g on gc.guest_id = g.id
where lvl > 5
group by g.name
having count(class_id) >= 2

--7 query guests with highest lvl
--having trouble getting the class.type to show 
--get msg 8120
select g.name as Guest, max(gc.lvl) as ClassLvl
--, c.type as Class
from guestClasses gc
inner join guests g on gc.guest_id = g.id
--join class c on gc.class_id = c.id
group by g.name

--8 query guest