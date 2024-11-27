-- 1 - NOT FINISHED
SELECT DISTINCT b.cust_name
FROM restBill b
WHERE b.bill_total > 450.00 AND b.waiter_no IN (
    SELECT s.staff_no
    FROM restStaff s
    WHERE s.headwaiter = (
        SELECT s2.staff_no
        FROM restStaff s2
        WHERE s2.first_name = 'Charles'
    )
);

-- 2
SELECT s.first_name, s.surname
FROM restStaff s
WHERE s.staff_no = (
    SELECT rm.headwaiter
    FROM restRoom_management rm
    WHERE rm.room_name = (
        SELECT rt.room_name
        FROM restRest_table rt
        WHERE rt.table_no = (
            SELECT b.table_no
            FROM restBill b
            WHERE b.cust_name = 'Nerida Smith'
              AND b.bill_date = 160111
        )
    )
    AND room_date = 160111
);

-- 3
SELECT b.cust_name
FROM restBill b
WHERE b.bill_total = (
    SELECT MIN(bill_total)
    FROM restBill
);

-- 4
SELECT s.first_name, s.surname
FROM restStaff s
WHERE s.staff_no NOT IN (
    SELECT DISTINCT b.waiter_no
    FROM restBill b
);

-- 5
SELECT b1.cust_name, s.first_name, s.surname, rm.room_name
FROM restBill b1
JOIN restRest_table rt ON b1.table_no = rt.table_no
JOIN restRoom_management rm ON rm.room_name = rt.room_name AND rm.room_date = b1.bill_date
JOIN restStaff s ON rm.headwaiter = s.staff_no
WHERE b1.bill_total = (
    SELECT MAX(b2.bill_total)
    FROM restBill b2
);