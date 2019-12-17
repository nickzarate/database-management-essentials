/**  1  ***************************************************

List the customer number, the name, the phone number, and
the city of customers.

***********************************************************/
SELECT custno, custname, phone, city
FROM customer;

/**  2  ***************************************************

List the customer number, the name, the phone number, and
the city of customers who reside in Colorado (State is CO).

***********************************************************/
SELECT custno, custname, phone, city
FROM customer
WHERE state = 'CO';

/**  3  ***************************************************

List all columns of the EventRequest table for events
costing more than $4000.  Order the result by the event
date (DateHeld).

***********************************************************/
SELECT *
FROM eventrequest
WHERE estcost > 4000
ORDER BY dateheld;

/**  4  ***************************************************

List the event number, the event date (DateHeld), and the
estimated audience number with approved status and audience
greater than 9000 or with pending status and audience
greater than 7000.

***********************************************************/
SELECT eventno, dateheld, estaudience
FROM eventrequest
WHERE (status = 'Approved' AND estaudience > 9000)
OR (status = 'Pending' AND estaudience > 7000);

/**  5  ***************************************************

List the event number, event date (DateHeld), customer
number and customer name of events placed in January 2018
by customers from Boulder.

***********************************************************/
SELECT customer.custno, custname, eventno, dateheld
FROM customer, eventrequest
WHERE customer.custno = eventrequest.custno
AND city = 'Boulder'
AND YEAR(dateheld) = 2018
AND MONTH(dateheld) = 1;

/**  6  ***************************************************

List the average number of resources used (NumberFld) by
plan number. Include only location number L100.

***********************************************************/
SELECT planno, AVG(numberfld) AS 'avg_resources'
FROM eventplanline
WHERE locno = 'L100'
GROUP BY planno;

/**  7  ***************************************************

List the average number of resources used (NumberFld) by
plan number. Only include location number L100. Eliminate
plans with less than two event lines containing location
number L100.

***********************************************************/
SELECT planno, AVG(numberfld) AS 'avg_resources', COUNT(*) AS 'num_event_lines'
FROM eventplanline
WHERE locno = 'L100'
GROUP BY planno
HAVING COUNT(*) > 1;
