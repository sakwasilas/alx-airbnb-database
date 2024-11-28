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
