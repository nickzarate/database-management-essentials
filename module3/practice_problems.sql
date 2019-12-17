/**  1  ***************************************************

Write a CREATE TABLE statement for the Customer table.
Choose data types appropriate for the DBMS used in your
course. All columns are required (not null).

***********************************************************/
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


/**  2  ***************************************************

Write a CREATE TABLE statement for the Facility table.
Choose data types appropriate for the DBMS used in your
course. All columns are required (not null).

***********************************************************/
CREATE TABLE facility(
  facno VARCHAR(10) NOT NULL,
  facname VARCHAR(30) NOT NULL,
  CONSTRAINT pkFacNo PRIMARY KEY (facno)
);


/**  3  ***************************************************

Write a CREATE TABLE statement for the Location table.
Choose data types appropriate for the DBMS used in your
course. LocName column is required (not null).

***********************************************************/
CREATE TABLE location(
  locno VARCHAR(10) NOT NULL,
  facno VARCHAR(10),
  locname VARCHAR(30) NOT NULL,
  CONSTRAINT pkLocNo PRIMARY KEY (locno)
);


/**  4  ***************************************************

Identify the foreign key(s) and 1-M relationship(s) among
the Customer, Facility, and Location tables. For each
relationship, identify the parent table and the child
table.

ANSWER:

  There is only one foreign key among the three tables
created above. This foreign key is located in the location
table, and references the primary key of the facility
table. This is because each location name is associated
with only one facility. However, each facility has multiple
locations. The facility is therefore the parent table, and
the location is the child table.

***********************************************************/


/**  5  ***************************************************

Extend your CREATE TABLE statement from problem (3) with
referential integrity constraints.

***********************************************************/
CREATE TABLE location(
  locno VARCHAR(10) NOT NULL,
  facno VARCHAR(10),
  locname VARCHAR(30) NOT NULL,
  CONSTRAINT pkLocNo PRIMARY KEY (locno),
  CONSTRAINT fkFacNo  FOREIGN KEY (facno) REFERENCES facility (facno)
);


/**  6  ***************************************************

From examination of the sample data and your common
understanding of scheduling and operation of events, are
null values allowed for the foreign key in the Location
table?  Why or why not? Extend the CREATE TABLE statement
in problem (5) to enforce the null value restrictions if
any.

ANSWER:

  Null values are not allowed for the foreign key in the
location table, because a location will always have an
associated facility.

***********************************************************/
CREATE TABLE location(
  locno VARCHAR(10) NOT NULL,
  facno VARCHAR(10) NOT NULL,
  locname VARCHAR(30) NOT NULL,
  CONSTRAINT pkLocNo PRIMARY KEY (locno),
  CONSTRAINT fkFacNo  FOREIGN KEY (facno) REFERENCES facility (facno)
);


/**  7  ***************************************************

Extend your CREATE TABLE statement for the Facility table
(problem 2) with a unique constraint for FacName. Use an
external named constraint clause for the unique constraint.

***********************************************************/
CREATE TABLE facility(
  facno VARCHAR(10) NOT NULL,
  facname VARCHAR(30) NOT NULL,
  CONSTRAINT pkFacNo PRIMARY KEY (facno),
  CONSTRAINT ucFacName UNIQUE(facname)
);
