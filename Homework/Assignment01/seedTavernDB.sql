USE MASTER;
--drops taverns_db if it exists currently
DROP DATABASE IF EXISTS taverns_db;
--create taverns_db database
CREATE DATABASE taverns_db;

USE taverns_db;

CREATE TABLE unit (
  id int NOT NULL IDENTITY(1,1),
  name VARCHAR(128) NOT NULL,
);

CREATE TABLE supplies (
  id int NOT NULL IDENTITY(1,1),
  name VARCHAR(128) NOT NULL,
  unit_id int NOT NULL,
);

CREATE TABLE receivables (
  id int NOT NULL IDENTITY(1,1),
  tavern_id int NOT NULL,
  supply_id int NOT NULL,
  qty int NOT NULL,
  cost float NOT NULL,
  created DATETIME NOT NULL
                DEFAULT CURRENT_TIMESTAMP, 
);

CREATE TABLE inventory (
  id int NOT NULL IDENTITY(1,1),
  tavern_id int NOT NULL,
  receivables_id int NOT NULL,
  current_count int NOT NULL,
  updated DATETIME NOT NULL
                DEFAULT CURRENT_TIMESTAMP,
);

CREATE TABLE status (
  id int NOT NULL IDENTITY(1,1),
  name VARCHAR(128) NOT NULL,
);

CREATE TABLE services (
  id int NOT NULL IDENTITY(1,1),
  name VARCHAR(128) NOT NULL,
  price float NOT NULL,
  status_id int NOT NULL,
);

CREATE TABLE sales (
  id int NOT NULL IDENTITY(1,1),
  tavern_id int NOT NULL,
  user_id int NOT NULL,
  services_id int ,
  cost int NOT NULL,
  created DATETIME NOT NULL
                DEFAULT CURRENT_TIMESTAMP,
);

CREATE TABLE roles (
  id int NOT NULL IDENTITY(1,1),
  name VARCHAR(128) NOT NULL,
  description VARCHAR(225)
);

CREATE TABLE users (
  id int NOT NULL IDENTITY(1,1),
  name VARCHAR(128) NOT NULL,
  role_id int NOT NULL,
  tavern_id int NOT NULL,
);

CREATE TABLE basement_rats (
  id int NOT NULL IDENTITY(1,1),
  name VARCHAR(128) NOT NULL,
  tavern_id int NOT NULL,
);

CREATE TABLE state (
  id int NOT NULL IDENTITY(1,1),
  name VARCHAR(128) NOT NULL,
);

CREATE TABLE tavern (
  id int NOT NULL IDENTITY(1,1),
  name VARCHAR(128) NOT NULL,
  users_id int ,
  address_street VARCHAR(225) NOT NULL,
  address_city VARCHAR(225) NOT NULL,
  state_id int NOT NULL,
  inventory_id int ,
  sales_id int ,
  floors_count int,
  basement_rats_id int,
);

INSERT INTO unit VALUES ('handles');
INSERT INTO unit VALUES ('barrels');
INSERT INTO unit VALUES ('bottles');
INSERT INTO unit VALUES ('ounces');
INSERT INTO unit VALUES ('pounds');

INSERT INTO supplies VALUES ('ale', 2);
INSERT INTO supplies VALUES ('whiskey', 2);
INSERT INTO supplies VALUES ('red wine', 3);
INSERT INTO supplies VALUES ('white wine', 3);
INSERT INTO supplies VALUES ('mead', 25);

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

INSERT INTO services VALUES ('Pool', 1, 1.00);
INSERT INTO services VALUES ('Weapons Sharpening', 1, 50.00);
INSERT INTO services VALUES ('Healing', 1, 80.00);
INSERT INTO services VALUES ('Laundry', 1, 10.00);
INSERT INTO services VALUES ('Bed', 1, 60.00);

INSERT INTO sales VALUES (1, 7, 1, 10.00, CURRENT_TIMESTAMP);
INSERT INTO sales VALUES (1, 6, 2, 150.00, CURRENT_TIMESTAMP);
INSERT INTO sales VALUES (1, 9, 4, 30.00, CURRENT_TIMESTAMP);
INSERT INTO sales VALUES (1, 10, 5, 180.00, CURRENT_TIMESTAMP);
INSERT INTO sales VALUES (1, 8, 3, 80.00, CURRENT_TIMESTAMP);


INSERT INTO roles VALUES ('Owner', 'owns the tavern');
INSERT INTO roles VALUES ('Manager', 'manages employees and daily finances');
INSERT INTO roles VALUES ('Waitress', 'serves beverages and food');
INSERT INTO roles VALUES ('Barkeep', 'serves alcholic beverages');
INSERT INTO roles VALUES ('Janitor', 'cleans of premises');
INSERT INTO roles VALUES ('Guest', 'guest of th tavern');

INSERT INTO users VALUES ('Captain Michael', 1, 1);
INSERT INTO users VALUES ('Hal Bryant', 3, 1);
INSERT INTO users VALUES ('Gail Adams', 4, 1);
INSERT INTO users VALUES ('Robert Murphy', 2, 1);
INSERT INTO users VALUES ('Lieutent Sparks', 5, 1);
INSERT INTO users VALUES ('Scooby', 6, 1);
INSERT INTO users VALUES ('Velma', 6, 1);
INSERT INTO users VALUES ('Shaggy', 6, 1);
INSERT INTO users VALUES ('Daphne', 6, 1);
INSERT INTO users VALUES ('Fred', 6, 1);


INSERT INTO basement_rats VALUES ('Brock Samson', 1);
INSERT INTO basement_rats VALUES ('The Monarch', 1);
INSERT INTO basement_rats VALUES ('Dr. Girlfriend', 1);
INSERT INTO basement_rats VALUES ('Dean Venture', 1);
INSERT INTO basement_rats VALUES ('Rusty Venture', 1);

INSERT INTO state VALUES ('PA');
INSERT INTO state VALUES ('NJ');
INSERT INTO state VALUES ('NY');
INSERT INTO state VALUES ('OH');
INSERT INTO state VALUES ('DE');

GO

INSERT INTO tavern VALUES ('Tavern1', NULL, '1234 Sesame Street', 'Neshaminy', 1, 1, 1, 4, 1);
INSERT INTO tavern VALUES ('Tavern2', NULL, '1234 Main Street', 'Allentown', 2, NULL, NULL, NULL, 2);
INSERT INTO tavern VALUES ('Tavern3', NULL, '1234 Broad Street', 'Johnsstown', 3, NULL, NULL, NULL, 3);
INSERT INTO tavern VALUES ('Tavern4', NULL, '1234 Ralph Street', 'Calypso', 4, NULL, NULL, NULL, 4);
INSERT INTO tavern VALUES ('Tavern5', NULL, '1234 Jam Street', 'Smithfield', 5, NULL, NULL, NULL, 5);





