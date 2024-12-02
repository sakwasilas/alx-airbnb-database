SELECT property_id, name, description, location, pricepernight, created_at, updated_at
FROM property p
WHERE (
    SELECT AVG(r.rating)
    FROM ratings r
    WHERE r.property_id = p.property_id
) > 4.0;


SELECT u.user_id, u.username, u.email
FROM users u
WHERE (
    SELECT COUNT(b.booking_id)
    FROM bookings b
    WHERE b.user_id = u.user_id
) > 3;
