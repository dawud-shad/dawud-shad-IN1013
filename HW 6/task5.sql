-- 1
SELECT s.first_name, s.surname, b.bill_date, COUNT(b.bill_no) AS bill_count
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
GROUP BY s.first_name, s.surname, b.bill_date
HAVING COUNT(b.bill_no) >= 2;

-- 2
SELECT r.room_name, COUNT(*) AS table_count
FROM restRest_table r
WHERE r.no_of_seats > 6
GROUP BY r.room_name;

-- 3
SELECT r.room_name, SUM(b.bill_total) AS total_bill
FROM restBill b
JOIN restRest_table t ON b.table_no = t.table_no
JOIN restRoom_management r ON t.room_name = r.room_name
GROUP BY r.room_name;

-- 4
SELECT hs.first_name AS headwaiter_first, hs.surname AS headwaiter_last, SUM(b.bill_total) AS total_bill
FROM restBill b
JOIN restStaff ws ON b.waiter_no = ws.staff_no
JOIN restStaff hs ON ws.headwaiter = hs.staff_no
GROUP BY hs.first_name, hs.surname
ORDER BY total_bill DESC;

-- 5
SELECT b.cust_name, AVG(b.bill_total) AS avg_spent
FROM restBill b
GROUP BY b.cust_name
HAVING AVG(b.bill_total) > 400.00;

-- 6
SELECT s.first_name, s.surname, COUNT(b.bill_no) AS bill_count
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
GROUP BY s.first_name, s.surname, b.bill_date
HAVING COUNT(b.bill_no) >= 3;
