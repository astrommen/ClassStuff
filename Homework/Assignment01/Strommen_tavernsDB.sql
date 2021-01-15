--drops taverns_db if it exists currently
DROP DATABASE IF EXISTS taverns_db;
--create taverns_db database
CREATE DATABASE taverns_db;

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
  created DATETIME,
);

CREATE TABLE inventory (
  id int NOT NULL IDENTITY(1,1),
  tavern_id int NOT NULL,
  receivables_id int NOT NULL,
  current_count int NOT NULL,
  updated DATETIME,
);

CREATE TABLE status (
  id int NOT NULL IDENTITY(1,1),
  name VARCHAR(128) NOT NULL,
);

CREATE TABLE services (
  id int NOT NULL IDENTITY(1,1),
  name VARCHAR(128) NOT NULL,
  unit_id smallint NOT NULL,
  price float NOT NULL,
  status_id int NOT NULL,
);

CREATE TABLE sales (
  id int NOT NULL IDENTITY(1,1),
  tavern_id int NOT NULL,
  user_id int NOT NULL,
  services_id int ,
  cost int NOT NULL,
  created DATETIME,
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
  users_id int NOT NULL,
  address_street VARCHAR(225) NOT NULL,
  address_city VARCHAR(225) NOT NULL,
  state_id int NOT NULL,
  inventory_id int ,
  sales_id int ,
  floors_count int NOT NULL,
  basement_rats_id int ,
);
