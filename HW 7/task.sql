-- 1
CREATE VIEW samsBills AS
SELECT 
    s.first_name, 
    s.surname, 
    b.bill_date, 
    b.cust_name, 
    b.bill_total
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
WHERE s.first_name = 'Sam' AND s.surname = 'Pitt';

-- 2
SELECT * 
FROM samsBills
WHERE bill_total > 400.00;

-- 3
CREATE VIEW roomTotals AS
SELECT 
    r.room_name, 
    SUM(b.bill_total) AS total_sum
FROM restBill b
JOIN restRest_table t ON b.table_no = t.table_no
JOIN restRoom_management r ON t.room_name = r.room_name
GROUP BY r.room_name;

-- 4
CREATE VIEW teamTotals AS
SELECT 
    CONCAT(hs.first_name, ' ', hs.surname) AS headwaiter_name, 
    SUM(b.bill_total) AS total_sum
FROM restBill b
JOIN restStaff ws ON b.waiter_no = ws.staff_no
JOIN restStaff hs ON ws.headwaiter = hs.staff_no
GROUP BY hs.first_name, hs.surname;
