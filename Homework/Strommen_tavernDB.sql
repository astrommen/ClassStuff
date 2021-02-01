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