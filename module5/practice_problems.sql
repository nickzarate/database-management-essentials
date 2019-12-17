/**  1  ***************************************************

List the event number, date held, customer number, customer
name, facility number, and facility name of 2018 events
placed by Boulder customers.

***********************************************************/
SELECT eventno, dateheld, customer.custno, custname,
       facility.facno, facname
FROM eventrequest, customer, facility
WHERE eventrequest.custno = customer.custno
AND eventrequest.facno = facility.facno
AND YEAR(dateheld) = 2018
AND city = 'Boulder';


/**  2  ***************************************************

List the customer number, customer name, event number, date
held, facility number, facility name, and estimated
audience cost per person (EstCost / EstAudience) for events
held on 2018, in which the estimated cost per person is
less than $0.2

***********************************************************/
SELECT customer.custno, custname, eventno, dateheld,
       facility.facno, facname, (estcost / estaudience) AS
       'costperperson'
FROM customer, eventrequest, facility
WHERE customer.custno = eventrequest.custno
AND eventrequest.facno = facility.facno
AND YEAR(dateheld) = 2018
AND (estcost / estaudience) < 0.2;


/**  3  ***************************************************

List the customer number, customer name, and total
estimated costs for Approved events. The total amount of
events is the sum of the estimated cost for each event.
Group the results by customer number and customer name.

***********************************************************/
/*
Problem statement above has some typos, but I'm pretty
sure it's asking to find the total estimated cost by each
customer, excluding events not yet approved.
*/
SELECT customer.custno, custname, SUM(estcost)
FROM customer, eventrequest
WHERE customer.custno = eventrequest.custno
AND status = 'Approved'
GROUP BY customer.custno, custname;


/**  4  ***************************************************

Insert yourself as a new row in the Customer table.

***********************************************************/
INSERT INTO customer (custno, custname, address, Internal,
					  contact, phone, city, state, zip)
VALUES ('C106', 'Nick Zarate', '123 Pleasant View', 'N',
 		'Nick Zarate', '5551234', 'Roy', 'UT', '84067');


/**  5  ***************************************************

Increase the rate by 10 percent of nurse resource in the
resource table.

***********************************************************/
UPDATE resourcetbl
SET rate = rate * 1.1
WHERE resno = 'R103';


/**  6  ***************************************************

Delete the new row added to the Customer table.

***********************************************************/
DELETE FROM customer
WHERE custno = 'C106';
