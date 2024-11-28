SELECT 
    b.booking_id,
    CONCAT(u.first_name, ' ', u.last_name) AS user_name,
    u.email AS user_email,
    b.property_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status
FROM 
    Booking b
INNER JOIN 
    User u ON b.user_id = u.user_id;

SELECT
    py.payment_id,
    CONCAT(u.first_name, ' ', u.last_name) AS user_name,
    p.name AS property_name,
    py.amount,
    py.payment_date,
    py.payment_method
FROM
    Payment py
INNER JOIN
    Booking b ON py.booking_id = b.booking_id
INNER JOIN
    User u ON b.user_id = u.user_id
INNER JOIN
    Property p ON b.property_id = p.property_id
WHERE
    b.status = 'confirmed';
