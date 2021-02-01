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

select tavernUsers.user_id, users.name, tavernUsers.role_id, roles.name
from ((tavernUsers
inner join users on tavernUsers.user_id=users.id) 
inner join roles on tavernUsers.role_id=roles.id)
where role_id = 7;