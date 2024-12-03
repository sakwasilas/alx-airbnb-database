
SELECT p.property_id, p.name, p.description, p.location, p.pricepernight, p.created_at, p.updated_at
FROM property p
WHERE (
    SELECT AVG(r.rating)
    FROM ratings r
    WHERE r.property_id = p.property_id
) > 4.0;

SELECT u.user_id, u.username, u.email
FROM users u
WHERE (
    SELECT COUNT(*)
    FROM bookings b
    WHERE b.user_id = u.user_id
) > 3;
