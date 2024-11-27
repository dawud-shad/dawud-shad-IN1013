-- 1
SELECT DISTINCT s.first_name
FROM restStaff s
INNER JOIN restBill b ON b.waiter_no = s.staff_no
WHERE b.cust_name = "Tanya Singh";

-- 2
SELECT room.room_date
FROM restRoom_management room
JOIN restStaff s ON room.headwaiter = s.staff_no
WHERE room.room_name = 'Green'
  AND s.first_name = 'Charles'
  AND room.room_date BETWEEN 160201 AND 160229;

-- 3
SELECT s1.first_name, s1.surname
FROM restStaff s1
JOIN restStaff s2 ON s1.headwaiter = s2.headwaiter
WHERE s2.first_name = "Zoe" AND s2.surname = "Ball" AND s1.staff_no != s2.staff_no;

-- 4
SELECT b.cust_name, b.bill_total, s.first_name
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
ORDER BY b.bill_total DESC;

-- 5
SELECT s1.first_name, s1.surname
FROM restStaff s1
JOIN restStaff s2 ON s1.headwaiter = s2.headwaiter
JOIN restBill b ON b.waiter_no = s2.staff_no
WHERE b.bill_no IN (14,17)

-- 6
SELECT DISTINCT s1.first_name, s1.surname
FROM restStaff s1
JOIN restStaff s2 ON s1.headwaiter = s2.staff_no OR s1.staff_no = s2.staff_no
JOIN restRoom_management rm ON rm.headwaiter = s2.staff_no
WHERE rm.room_name = 'Blue' AND rm.room_date = 160312;
