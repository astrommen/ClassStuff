USE taverns_db;

INSERT INTO unit VALUES ('handles');
INSERT INTO unit VALUES ('barrels');
INSERT INTO unit VALUES ('bottles');
INSERT INTO unit VALUES ('ounces');
INSERT INTO unit VALUES ('pounds');

--GO

INSERT INTO supplies VALUES ('ale', 2);
INSERT INTO supplies VALUES ('whiskey', 2);
INSERT INTO supplies VALUES ('red wine', 3);
INSERT INTO supplies VALUES ('white wine', 3);
INSERT INTO supplies VALUES ('mead', 2);

INSERT INTO state VALUES ('PA');
INSERT INTO state VALUES ('NJ');
INSERT INTO state VALUES ('NY');
INSERT INTO state VALUES ('OH');
INSERT INTO state VALUES ('DE');

GO

--INSERT INTO tavern VALUES ('Tavern1', '1234 Sesame Street', 'Neshaminy', 1, 1, 4);
INSERT INTO tavern VALUES ('Tavern1', '1234 Sesame Street', 'Neshaminy', 1, NULL, NULL);
INSERT INTO tavern VALUES ('Tavern2', '1234 Main Street', 'Allentown', 2, NULL, NULL);
INSERT INTO tavern VALUES ('Tavern3', '1234 Broad Street', 'Johnstown', 3, NULL, NULL);
INSERT INTO tavern VALUES ('Tavern4', '1234 Ralph Street', 'Calypso', 4, NULL, NULL);
INSERT INTO tavern VALUES ('Tavern5', '1234 Jam Street', 'Smithfield', 5, NULL, NULL);

GO

INSERT INTO receivables VALUES (1, 1, 5, 25.00, CURRENT_TIMESTAMP);
INSERT INTO receivables VALUES (1, 2, 5, 35.00, CURRENT_TIMESTAMP);
INSERT INTO receivables VALUES (1, 3, 25, 20.00, CURRENT_TIMESTAMP);
INSERT INTO receivables VALUES (1, 4, 25, 20.00, CURRENT_TIMESTAMP);
INSERT INTO receivables VALUES (1, 5, 35, 40.00, CURRENT_TIMESTAMP);

INSERT INTO inventory VALUES (1, 1, 20, CURRENT_TIMESTAMP);
INSERT INTO inventory VALUES (1, 1, 25, CURRENT_TIMESTAMP);
INSERT INTO inventory VALUES (1, 1, 15, CURRENT_TIMESTAMP);
INSERT INTO inventory VALUES (1, 1, 15, CURRENT_TIMESTAMP);
INSERT INTO inventory VALUES (1, 1, 20, CURRENT_TIMESTAMP);

INSERT INTO status VALUES ('active');
INSERT INTO status VALUES ('inactive');
INSERT INTO status VALUES ('out of stock');
INSERT INTO status VALUES ('discontinued');
INSERT INTO status VALUES ('sick');
INSERT INTO status VALUES ('fine');
INSERT INTO status VALUES ('hangry');
INSERT INTO status VALUES ('raging');
INSERT INTO status VALUES ('placid');

GO

INSERT INTO services VALUES ('Pool', NULL, 1.00, 1);
INSERT INTO services VALUES ('Weapons Sharpening', NULL,  50.00, 1);
INSERT INTO services VALUES ('Healing', NULL, 80.00, 1);
INSERT INTO services VALUES ('Laundry', NULL, 10.00, 1);
INSERT INTO services VALUES ('Bed', NULL, 60.00, 1);

insert into class values
('mage', 'like a wizard'),
('cleric', 'hardcore priest'),
('bard', 'makes ladies swoon'),
('knight', 'marine like tank'),
('rogue', 'ninja like thief'),
('witcher', 'super op knight');

INSERT INTO guests VALUES 
('Brock Samson', 19770101,  8, 1, CURRENT_TIMESTAMP),
('The Monarch', 19510101, 7, 1, CURRENT_TIMESTAMP),
('Dr. Girlfriend', 19790101, 6, 1, CURRENT_TIMESTAMP),
('Dean Venture', 19940101, 9, 1, CURRENT_TIMESTAMP),
('Rusty Venture', 19610101, 5, 1, CURRENT_TIMESTAMP),
('Donnie Darko', 20010119, 8, 2, 20190619),
('Jessica Hyde', 20010925, 5, 3, 20051025);

insert into guestClasses values
(1, 40, 6),
(2, 20, 1),
(3, 50, 5),
(4, 2, 3),
(5, 10, 2),
(6, 1000, 1),
(7, 100, 5);

GO

INSERT INTO sales VALUES (1, 1, 1, CURRENT_TIMESTAMP);
INSERT INTO sales VALUES (1, 2, 2, CURRENT_TIMESTAMP);
INSERT INTO sales VALUES (1, 3, 4, CURRENT_TIMESTAMP);
INSERT INTO sales VALUES (1, 4, 5, CURRENT_TIMESTAMP);
INSERT INTO sales VALUES (1, 5, 3, CURRENT_TIMESTAMP);


INSERT INTO roles VALUES ('Owner', 'owns the tavern');
INSERT INTO roles VALUES ('Manager', 'manages employees and daily finances');
INSERT INTO roles VALUES ('Waitress', 'serves beverages and food');
INSERT INTO roles VALUES ('Barkeep', 'serves alcholic beverages');
INSERT INTO roles VALUES ('Janitor', 'cleans of premises');
INSERT INTO roles VALUES ('Guest', 'guest of th tavern');

INSERT INTO users VALUES ('Captain Michael');
INSERT INTO users VALUES ('Hal Bryant');
INSERT INTO users VALUES ('Gail Adams');
INSERT INTO users VALUES ('Robert Murphy');
INSERT INTO users VALUES ('Lieutent Sparks');

INSERT INTO tavernUsers VALUES 
(1,1,1), 
(2,1,2),
(3,1,3),
(4,1,4),
(5,1,5);
