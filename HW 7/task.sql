-------1
CREATE VIEW samsBills 
AS
(SELECT restStaff.first_name, restStaff.surname, restBill.bill_date, restBill.custname, restBill.bill_total
FROM restStaff
JOIN restBill ON restStaff.staff_no = restBill.waiter_no
WHERE restStaff.first_name = "Sam" AND restStaff.surname = "Pitt")
-------2
SELECT *
FROM samsBills
WHERE bill_total > 400.00
-------3
CREATE VIEW roomTotals
AS
(SELECT restRest_table.room_name, SUM(restBill.bill_total) AS total_sum
FROM restRest_table
JOIN restBill ON restRest_table.table_no = restBill.table_no
GROUP BY restRest_table.room_name)  
-------4
CREATE VIEW teamTotals
AS
(SELECT CONCAT(restStaff.first_name, restStaff.surname) AS headwaiter_name, SUM(restBill.bill_total) AS total_sum
FROM restStaff
JOIN restStaff ON restStaff.headwaiter = restStaff.staff_no
JOIN restBill ON restStaff.staff_no = restBill.waiter_no
GROUP BY restStaff.headwaiter_name)
