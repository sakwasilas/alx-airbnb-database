SELECT 
    user_id,
    COUNT(*) AS total_bookings
FROM 
    bookings
GROUP BY 
    user_id;

SELECT 
    properties.id AS property_id,
    properties.name AS property_name,
    COUNT(bookings.id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(bookings.id) DESC) AS rank
    ROW_NUMBER() OVER (ORDER BY COUNT(bookings.id) DESC) AS row_number
FROM 
    properties
LEFT JOIN 
    bookings ON properties.id = bookings.property_id
GROUP BY 
    properties.id;
