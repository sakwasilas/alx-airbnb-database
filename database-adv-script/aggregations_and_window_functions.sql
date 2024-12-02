SELECT b.user_id, COUNT(b.booking_id) AS total_bookings
FROM Booking b
GROUP BY b.user_id;

SELECT p.property_id, p.name, p.location, COUNT(b.booking_id) AS total_bookings,
       RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM Property p
LEFT JOIN Booking b ON p.property_id = b.property_id
GROUP BY p.property_id, p.name, p.location
ORDER BY booking_rank;
