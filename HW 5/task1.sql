--1
SELECT bill_date, bill_total
FROM restBill
WHERE cust_name = "Bob Crow";
--2
SELECT DISTINCT cust_name
FROM restBill
WHERE cust_name LIKE "% Smith"
ORDER BY cust_name ASC;
--3
SELECT DISTINCT cust_name
FROM restBill
WHERE cust_name LIKE "% C%";
--4
SELECT



--5
SELECT *
FROM restBill
WHERE bill_date BETWEEN 010216 AND 290216;
--6
SELECT DISTINCT bill_date
FROM restBill
WHERE bill_date BETWEEN 010115 AND 311215
ORDER BY bill_date;