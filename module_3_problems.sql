-- 1 --
CREATE TABLE customer(
  custno VARCHAR(10) NOT NULL,
  custname VARCHAR(40) NOT NULL,
  address VARCHAR(40) NOT NULL,
  Internal CHAR(1) NOT NULL,
  contact VARCHAR(30) NOT NULL,
  phone VARCHAR(11) NOT NULL,
  city VARCHAR(20) NOT NULL,
  state CHAR(2) NOT NULL,
  zip VARCHAR(10) NOT NULL,
  CONSTRAINT pkCustNo PRIMARY KEY (custno)
);

-- 2 --
CREATE TABLE facility(
  facno VARCHAR(10) NOT NULL,
  facname VARCHAR(30) NOT NULL,
  CONSTRAINT pkFacNo PRIMARY KEY (facno)
);

-- 3 --
CREATE TABLE location(
  locno VARCHAR(10) NOT NULL,
  facno VARCHAR(10),
  locname VARCHAR(30) NOT NULL,
  CONSTRAINT pkLocNo PRIMARY KEY (locno),
  CONSTRAINT fkFacNo  FOREIGN KEY (facno) REFERENCES facility (facno)
);

/* -- 4 --

  There is only one foreign key among the three tables created above.
This foreign key is located in the location table, and references
the primary key of the facility table. This is because each location
name is associated with only one facility. However, each facility
has multiple locations. The facility is therefore the parent table, and
the location is the child table.

*/

-- 5 -- Go back and add referential integrity constraints to problem 3.
CREATE TABLE location(
  locno VARCHAR(10) NOT NULL,
  facno VARCHAR(10),
  locname VARCHAR(30) NOT NULL,
  CONSTRAINT pkLocNo PRIMARY KEY (locno),
  CONSTRAINT fkFacNo  FOREIGN KEY (facno) REFERENCES facility (facno)
    ON DELETE CASCADE ON UPDATE CASCADE
);

/* -- 6 --

  Null values are not allowed for the foreign key in the location table,
  because a location will never not have a facility. Every location is
  always located at a facility.

*/
CREATE TABLE location(
  locno VARCHAR(10) NOT NULL,
  facno VARCHAR(10) NOT NULL,
  locname VARCHAR(30) NOT NULL,
  CONSTRAINT pkLocNo PRIMARY KEY (locno),
  CONSTRAINT fkFacNo  FOREIGN KEY (facno) REFERENCES facility (facno)
    ON DELETE CASCADE ON UPDATE CASCADE
);

-- 7 -- Extend table from problem 2 with an external unique constraint for facname
CREATE TABLE facility(
  facno VARCHAR(10) NOT NULL,
  facname VARCHAR(30) NOT NULL,
  CONSTRAINT pkFacNo PRIMARY KEY (facno),
  CONSTRAINT ucFacName UNIQUE(facname)
);
