----------1
SELECT DISTINCT restStaff.first_name, restStaff.surname
FROM restStaff
JOIN restBill ON restStaff.staff_no = restBill.waiter_no
WHERE restStaff.cust_name = "Tanya Singh"

-----------2
SELECT restRoom_management.room_date
FROM restRoom_management
JOIN restStaff ON restRoom_management.headwaiter = restStaff.headwaiter
WHERE restRoom_management.room_name = "Green" AND restRoom_management.headwaiter = "Charles" AND restRoom_management.room_date BETWEEN 160201 AND 160229

-----------3
SELECT DISTINCT restStaff.first_name, restStaff.surname
FROM restStaff 
JOIN restStaff ON restStaff.staff_no = restStaff.headwaiter
WHERE restStaff.first_name = "Zoe" AND restStaff.surname = "Ball"

-----------4
SELECT restBill.cust_name, restBill.bill_total, restStaff.first_name, restStaff.surname
FROM restBill
JOIN restStaff ON restBill.waiter_no = restStaff.staff_no
ORDER BY restBill.bill_total DESC

-----------5
SELECT DISTINCT restStaff.first_name, restStaff.surname
FROM restStaff
JOIN restBill ON restStaff.staff_no = restBill.waiter_no
WHERE restBill.bill_no = 00014 AND restBill.bill_no = 00017

-----------6
SELECT DISTINCT restStaff.first_name, restStaff.surname, restRoom_management.headwaiter
FROM restStaff
JOIN restRoom_management ON restStaff.headwaiter = restRoom_management.headwaiter
WHERE restRoom_management.room_name = "Blue" AND restRoom_management.room_date = 160312
