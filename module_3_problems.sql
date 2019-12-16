CREATE TABLE customer(
  custno VARCHAR(10) NOT NULL,
  custname VARCHAR(40) NOT NULL,
  address VARCHAR(40) NOT NULL,
  Internal CHAR(1) NOT NULL,
  contact VARCHAR(30) NOT NULL,
  phone INTEGER NOT NULL,
  city VARCHAR(15) NOT NULL,
  state CHAR(2) NOT NULL,
  zip INTEGER NOT NULL,
  CONSTRAINT pkCustNo PRIMARY KEY (custno)
);

