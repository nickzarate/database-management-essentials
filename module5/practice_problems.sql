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
AND eventrequest.facno = facility.facno;

/**  3  ***************************************************

List the customer number, customer name, and total
estimated costs for Approved events. The total amount of
events is the sum of the estimated cost for each event.
Group the results by customer number and customer name.

***********************************************************/

/**  4  ***************************************************

Insert yourself as a new row in the Customer table.

***********************************************************/

/**  5  ***************************************************

Increase the rate by 10 percent of nurse resource in the
resource table.

***********************************************************/

/**  6  ***************************************************

Delete the new row added to the Customer table.

***********************************************************/