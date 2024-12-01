-------1
SELECT DISTINCT restBill.cust_name
FROM restBill
JOIN restRest_table ON restBill.table_no = restRest_table.table_no
JOIN restRoom_management ON restRest_table.room_name = restRoom_management.room_name
WHERE restBill.bill_total > 450.00 AND restRoom_management.headwaiter = "Charles"

-------2
SELECT restStaff.first_name, restStaff.surname
FROM restStaff
JOIN restRoom_management ON restStaff.headwaiter = restRoom_management.headwaiter
JOIN restRest_table ON restRoom_management.room_name = restRest_table.room_name
JOIN restBill ON restBill.table_no = restRest_table.table_no
WHERE restBill.cust_name LIKE "Nerida %" AND bill_date = 160111

-------3
SELECT cust_name
FROM restBill
WHERE bill_total = (SELECT MIN(bill_total) FROM restBill)

-------4
SELECT restStaff.first_name, restStaff.surname
FROM restStaff
JOIN restBill ON restStaff.staff_no = restBill.waiter_no
WHERE restStaff.staff_no NOT IN (SELECT restBill.waiter_no FROM restBill)

-------5
SELECT restBill.cust_name, restStaff.first_name, restStaff.surname, restRoom_management.room_name
FROM restBill
JOIN restRest_table ON restBill.table_no = restRest_table.table_no 
JOIN restRoom_management ON restRest_table.room_name = restRoom_management.room_name
JOIN restStaff ON restRoom_management.headwaiter = restStaff.headwaiter
WHERE restBill.bill_total = (SELECT MAX(bill_total) FROM restBill)