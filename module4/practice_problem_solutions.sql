-- 1 --
SELECT custno, custname, phone, city
FROM customer;

-- 2 --
SELECT custno, custname, phone, city
FROM customer
WHERE state = 'CO';

-- 3 --
SELECT *
FROM eventrequest
WHERE estcost > 4000
ORDER BY dateheld;

-- 4 --
SELECT eventno, dateheld, estaudience
FROM eventrequest
WHERE (status = 'Approved' AND estaudience > 9000)
OR (status = 'Pending' AND estaudience > 7000);

-- 5 --
SELECT customer.custno, custname, eventno, dateheld
FROM customer, eventrequest
WHERE customer.custno = eventrequest.custno
AND city = 'Boulder'
AND YEAR(dateheld) = 2018
AND MONTH(dateheld) = 1;

-- 6 --
SELECT planno, AVG(numberfld) AS 'avg_resources'
FROM eventplanline
WHERE locno = 'L100'
GROUP BY planno;

-- 7 --
SELECT planno, AVG(numberfld) AS 'avg_resources', COUNT(*) AS 'num_event_lines'
FROM eventplanline
WHERE locno = 'L100'
GROUP BY planno
HAVING COUNT(*) > 1;
