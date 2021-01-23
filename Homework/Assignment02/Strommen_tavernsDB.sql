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

ALTER TABLE unit ADD PRIMARY KEY (id);

CREATE TABLE supplies (
  id int NOT NULL IDENTITY(1,1),
  name VARCHAR(128) NOT NULL,
  unit_id int NOT NULL,
);

ALTER TABLE supplies ADD PRIMARY KEY (id);
ALTER TABLE supplies ADD FOREIGN KEY (unit_id) REFERENCES unit(id);


CREATE TABLE receivables (
  id int NOT NULL IDENTITY(1,1),
  tavern_id int NOT NULL,
  supply_id int NOT NULL,
  qty int NOT NULL,
  cost float NOT NULL,
  created DATETIME NOT NULL
    DEFAULT CURRENT_TIMESTAMP, 
);

ALTER TABLE receivables ADD PRIMARY KEY (id);
--ALTER TABLE receivables ADD FOREIGN KEY (tavern_id) REFERENCES tavern(id);
ALTER TABLE receivables ADD FOREIGN KEY (supply_id) REFERENCES supplies(id);



CREATE TABLE inventory (
  id int NOT NULL IDENTITY(1,1),
  tavern_id int NOT NULL,
  receivables_id int NOT NULL,
  current_count int NOT NULL,
  updated DATETIME NOT NULL
    DEFAULT CURRENT_TIMESTAMP,
);

ALTER TABLE inventory ADD PRIMARY KEY (id);
ALTER TABLE inventory ADD FOREIGN KEY (receivables_id) REFERENCES receivables(id);

CREATE TABLE status (
  id int NOT NULL IDENTITY(1,1),
  name VARCHAR(128) NOT NULL,
);

ALTER TABLE status ADD PRIMARY KEY (id);

CREATE TABLE serviceSupplies (
  id int NOT NULL IDENTITY(1,1),
  supply_id int NOT NULL,
  qty int NOT NULL,
);

ALTER TABLE serviceSupplies ADD PRIMARY KEY (id);
ALTER TABLE serviceSupplies ADD FOREIGN KEY (supply_id) REFERENCES supplies(id);

CREATE TABLE services (
  id int NOT NULL IDENTITY(1,1),
  name VARCHAR(128) NOT NULL,
  serviceSupplies_id int,
  price float NOT NULL,
  status_id int NOT NULL,
);

ALTER TABLE services ADD PRIMARY KEY (id);
ALTER TABLE services ADD FOREIGN KEY (serviceSupplies_id) REFERENCES serviceSupplies(id);
ALTER TABLE services ADD FOREIGN KEY (status_id) REFERENCES status(id);

CREATE TABLE sales (
  id int NOT NULL IDENTITY(1,1),
  tavern_id int NOT NULL,
  guests_id int NOT NULL,
  services_id int,
  created DATETIME NOT NULL
    DEFAULT CURRENT_TIMESTAMP,
);

ALTER TABLE sales ADD PRIMARY KEY (id);
-- ALTER TABLE sales ADD FOREIGN KEY (guests_id) REFERENCES guests(id);
ALTER TABLE sales ADD FOREIGN KEY (services_id) REFERENCES services(id);

CREATE TABLE class (
  id int NOT NULL IDENTITY(1,1),
  name VARCHAR(128) NOT NULL,
  description VARCHAR(255),
);

ALTER TABLE class ADD PRIMARY KEY (id);

CREATE TABLE guests (
  id int NOT NULL IDENTITY(1,1),
  name VARCHAR(128) NOT NULL,
  birthday DATETIME NOT NULL,
  status_id int NOT NULL,
  tavern_id int NOT NULL,
  cakeday DATETIME NOT NULL 
    DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE guests ADD PRIMARY KEY (id);
ALTER TABLE guests ADD FOREIGN KEY (status_id) REFERENCES status(id);
ALTER TABLE sales ADD FOREIGN KEY (guests_id) REFERENCES guests(id);

CREATE TABLE guestClasses (
  id int NOT NULL IDENTITY(1,1),
  guest_id int NOT NULL,
  lvl int NOT NULL,
  class_id int NOT NULL 
)

ALTER TABLE guestClasses ADD PRIMARY KEY (id);
ALTER TABLE guestClasses ADD FOREIGN KEY (guest_id) REFERENCES guests(id);
ALTER TABLE guestClasses ADD FOREIGN KEY (class_id) REFERENCES class(id);

CREATE TABLE tavernGuests (
  id int NOT NULL IDENTITY(1,1),
  tavern_id int NOT NULL,
  guest_id int NOT NULL,
)

ALTER TABLE tavernGuests ADD PRIMARY KEY (id);
ALTER TABLE tavernGuests ADD FOREIGN KEY (guest_id) REFERENCES guests(id);

CREATE TABLE roles (
  id int NOT NULL IDENTITY(1,1),
  name VARCHAR(128) NOT NULL,
  description VARCHAR(225)
);

ALTER TABLE roles ADD PRIMARY KEY (id);

CREATE TABLE users (
  id int NOT NULL IDENTITY(1,1),
  name VARCHAR(128) NOT NULL,
  -- role_id int NOT NULL,
  -- tavern_id int NOT NULL,
);

ALTER TABLE users ADD PRIMARY KEY (id);

CREATE TABLE tavernUsers (
  id int NOT NULL IDENTITY(1,1),
  user_id int NOT NULL,
  tavern_id int NOT NULL,
  role_id int NOT NULL,
)

ALTER TABLE tavernUsers ADD PRIMARY KEY (id);
ALTER TABLE tavernUsers ADD FOREIGN KEY (user_id) REFERENCES users(id);
ALTER TABLE tavernUsers ADD FOREIGN KEY (role_id) REFERENCES roles(id);

CREATE TABLE state (
  id int NOT NULL IDENTITY(1,1),
  name VARCHAR(128) NOT NULL,
);

ALTER TABLE state ADD PRIMARY KEY (id);

CREATE TABLE tavern (
  id int NOT NULL IDENTITY(1,1),
  name VARCHAR(128) NOT NULL,
  -- users_id int ,
  address_street VARCHAR(225) NOT NULL,
  address_city VARCHAR(225) NOT NULL,
  state_id int NOT NULL,
  inventory_id int ,
  sales_id int ,
);

ALTER TABLE tavern ADD PRIMARY KEY (id);
ALTER TABLE tavern ADD FOREIGN KEY (state_id) REFERENCES state(id);
ALTER TABLE tavern ADD FOREIGN KEY (inventory_id) REFERENCES inventory(id);
ALTER TABLE tavern ADD FOREIGN KEY (sales_id) REFERENCES sales(id);

--Adding in FK for tavern_id for above tables
ALTER TABLE receivables ADD FOREIGN KEY (tavern_id) REFERENCES tavern(id);
ALTER TABLE inventory ADD FOREIGN KEY (tavern_id) REFERENCES tavern(id);
ALTER TABLE sales ADD FOREIGN KEY (tavern_id) REFERENCES tavern(id);
ALTER TABLE guests ADD FOREIGN KEY (tavern_id) REFERENCES tavern(id);
ALTER TABLE tavernGuests ADD FOREIGN KEY (tavern_id) REFERENCES tavern(id);
ALTER TABLE tavernUsers ADD FOREIGN KEY (tavern_id) REFERENCES tavern(id);