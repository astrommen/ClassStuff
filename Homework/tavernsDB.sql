--drops taverns_db if it exists currently
DROP DATABASE IF EXISTS taverns_db;
--create taverns_db database
CREATE DATABASE taverns_db;

USE taverns_db;

CREATE TABLE tavern (
  id int NOT NULL IDENTITY(1,1),
  name VARCHAR(128) NOT NULL,
  owner_id int NOT NULL,
  address_street VARCHAR(225) NOT NULL,
  address_city VARCHAR(225) NOT NULL,
  state_id int NOT NULL,
  inventory_id int ,
  sales_id int ,
  floors_count int NOT NULL,
  basement_rats_id int ,
);

CREATE TABLE users (
  id int NOT NULL IDENTITY(1,1),
  name VARCHAR(128) NOT NULL,
  role_id int NOT NULL,
  tavern_id int NOT NULL,
);

CREATE TABLE roles (
  id int NOT NULL IDENTITY(1,1),
  name VARCHAR(128) NOT NULL,
  description VARCHAR(225)
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

CREATE TABLE inventory (
  id int NOT NULL IDENTITY(1,1),
  tavern_id int NOT NULL,
  supply_id int NOT NULL,
  receivables_id int NOT NULL,
  date_updated DATETIME,
  current_count int NOT NULL
);

CREATE TABLE supplies (
  id int NOT NULL IDENTITY(1,1),
  name VARCHAR(128) NOT NULL,
  unit_id int NOT NULL
);

CREATE TABLE unit (
  id int NOT NULL IDENTITY(1,1),
  name VARCHAR(128) NOT NULL,
);

CREATE TABLE receivables (
  id int NOT NULL IDENTITY(1,1),
  tavern_id int NOT NULL,
  supply_id int NOT NULL,
  unit_id smallint NOT NULL,
  cost float NOT NULL
  updated DATETIME,
);

CREATE TABLE sales (
  id int NOT NULL IDENTITY(1,1),
  tavern_id int NOT NULL,
  user_id int NOT NULL,
  services_id int ,
  unit_id smallint NOT NULL,
  cost int NOT NULL
  created DATETIME,
);

CREATE TABLE services (
  id int NOT NULL IDENTITY(1,1),
  name VARCHAR(128) NOT NULL,
  unit_id smallint NOT NULL,
  price float NOT NULL
  status_id int NOT NULL,
);

CREATE TABLE status (
  id int NOT NULL IDENTITY(1,1),
  name VARCHAR(128) NOT NULL,
);

INSERT INTO roles VALUES (1, 'Owner', 'owns the tavern');
INSERT INTO roles VALUES (1, 'Manager', 'manages employees and daily finances');
INSERT INTO roles VALUES (1, 'Waitress', 'serves beverages and food');
INSERT INTO roles VALUES (1, 'Barkeep', 'serves alcholic beverages');