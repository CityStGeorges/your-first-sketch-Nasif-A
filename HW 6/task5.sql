--------1
SELECT restStaff.first_name, restStaff.surname, restBill.bill_date, COUNT(restBill.bill_no)
FROM restStaff
JOIN restBill ON restStaff.staff_no = restBill.waiter_no
GROUP BY restStaff.first_name, restStaff.surname, restBill.bill_date
HAVING COUNT(restBill.bill_no) >= 2

--------2
SELECT room_name, COUNT(table_no)
FROM restRest_table
WHERE no_of_seats >= 6
GROUP BY room_name

--------3
SELECT restRest_table.room_name, COUNT(restBill.bill_no)
FROM restRest_table
JOIN restBill ON restRest_table.table_no = restBill.table_no
GROUP BY restRest_table.room_name

--------4
SELECT restStaff.first_name, restStaff.surname, SUM(restBill.bill_total)
FROM restStaff
JOIN restBill ON restStaff.staff_no = restBill.waiter_no
GROUP BY restStaff.headwaiter
ORDER BY SUM(restBill.bill_total) DESC

--------5
SELECT cust_name
FROM restBill
GROUP BY cust_name
HAVING AVG(bill_total) > 400.00

--------6
SELECT restStaff.first_name, restStaff.surname, COUNT(restBill.bill_no)
FROM restStaff
JOIN restBill ON restStaff.staff_no = restBill.waiter_no
GROUP BY restStaff.first_name, restStaff.surname, restBill.bill_date
HAVING COUNT(restBill.bill_no) >= 3