/*
	Select Statement Problems
*/

/**  1  ***************************************************

For event requests, list the event number, event date
(eventrequest.dateheld), and count of the event plans. Only
include event requests in the result if the event request
has more than one related event plan with a work date in
December 2018.

***********************************************************/
SELECT eventrequest.eventno, dateheld, COUNT(*) AS 'num_event_plans'
FROM eventrequest, eventplan
WHERE eventrequest.eventno = eventplan.eventno
AND workdate BETWEEN '2018-12-01' AND '2018-12-31'
GROUP BY eventno
HAVING COUNT(*) > 1;

/**  2  ***************************************************

List the plan number, event number, work date, and activity
of event plans meeting the following two conditions: (1)
the work date is in December 2018 and (2) the event is held
in the “Basketball arena”.  Your query must not use the
facility number (“F101”) of the basketball arena in the
WHERE clause. Instead, you should use a condition on the
FacName column for the value of “Basketball arena”.

***********************************************************/
SELECT planno, eventplan.eventno, workdate, activity
FROM facility, eventrequest, eventplan
WHERE facility.facno = eventrequest.facno
AND eventrequest.eventno = eventplan.eventno
AND facname = 'Basketball arena'
AND workdate BETWEEN '2018-12-01' AND '2018-12-31';

/**  3  ***************************************************

List the event number, event date, status, and estimated
cost of events where there is an event plan managed by Mary
Manager and the event is held in the basketball arena in
the period October 1 to December 31, 2018.  Your query must
not use the facility number (“F101”) of the basketball
arena or the employee number (“E101”) of “Mary Manager” in
the WHERE clause. Thus, the WHERE clause should not have
conditions involving the facility number or employee number
compared to constant values.

***********************************************************/
SELECT eventrequest.eventno, dateheld, status, estcost
FROM eventrequest, facility, eventplan, employee
WHERE eventrequest.facno = facility.facno
AND eventrequest.eventno = eventplan.eventno
AND eventplan.empno = employee.empno
AND facname = 'Basketball arena'
AND empname = 'Mary Manager'
AND dateheld BETWEEN '2018-10-01' AND '2018-12-31';

/**  4  ***************************************************

List the plan number, line number, resource name, number of
resources (eventplanline.number), location name, time
start, and time end where the event is held at the
basketball arena, the event plan has activity of activity
of “Operation”, and the event plan has a work date in the
period October 1 to December 31, 2018.  Your query must not
use the facility number (“F101”) of the basketball arena in
the WHERE clause. Instead, you should use a condition on
the FacName column for the value of “Basketball arena”.

***********************************************************/
SELECT eventplanline.planno, lineno, resname, numberfld,
	   locname, timestart, timeend
FROM eventplanline, eventplan, resourcetbl, location,
     facility
WHERE eventplanline.planno = eventplan.planno
AND eventplanline.resno = resourcetbl.resno
AND eventplanline.locno = location.locno
AND location.facno = facility.facno
AND facname = 'Basketball arena'
AND activity = 'Operation'
AND workdate BETWEEN '2018-10-01' AND '2018-12-31';




/*
	Database Modification Problems
*/

/**  1  ***************************************************

Insert a new row into the Facility table with facility name
“Swimming Pool”.

***********************************************************/
INSERT INTO facility (facno, facname)
VALUES ('F104', 'Swimming Pool');

/**  2  ***************************************************

Insert a new row in the Location table related to the
Facility row in modification problem 1. The new row should
have “Door” for the location name.

***********************************************************/
INSERT INTO location (locno, facno, locname)
VALUES ('L107', 'F104', 'Door');

/**  3  ***************************************************

Insert a new row in the Location table related to the
Facility row in modification problem 1. The new row should
have “Locker Room” for the location name.

***********************************************************/
INSERT INTO location (locno, facno, locname)
VALUES ('L108', 'F104', 'Locker Room');

/**  4  ***************************************************

Change the location name of “Door” to “Gate” for the row
inserted in modification problem 2.

***********************************************************/
UPDATE location
SET locname = 'Gate'
WHERE locno = 'L107';

/**  5  ***************************************************

Delete the row inserted in modification problem 3.

***********************************************************/
DELETE FROM location
WHERE locno = 'L108';
