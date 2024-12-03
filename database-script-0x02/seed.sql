
INSERT INTO user (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES(
'Sakwa', 'Silas', 'sakwa.silas@gmail.com', 'hashed_password_123', '555-0101', 'guest', CURRENT_TIMESTAMP)
'Jane', 'ouma', 'janeouma2010@gmail.com', 'hashed_password_456', '555-0102', 'host', CURRENT_TIMESTAMP),
'Michael', 'Johnson', 'michael.johnson@yahoo.com', 'hashed_password_789', '555-0103', 'admin', CURRENT_TIMESTAMP);

-- Inserting sample properties
INSERT INTO property (property_id, host_id, name, description, location, pricepernight, created_at, updated_at)
VALUES
  (SELECT user_id FROM user WHERE email = 'sakwa.silas@gmail.com'), 'Sunny Beach House', 'A cozy beach house with ocean views.', 'Mombasa, Kenya', 150.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

   -- Inserting sample bookings
INSERT INTO booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES
                   (SELECT property_id FROM property WHERE name = 'Sunny Beach House'), (SELECT user_id FROM user WHERE email = 'sakwa.silas@gmail.com'), '2024-12-01', '2024-12-07', 900.00, 'confirmed', CURRENT_TIMESTAMP);

-- Inserting sample payments
INSERT INTO payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
             (SELECT booking_id FROM booking WHERE total_price = 900.00), 900.00, CURRENT_TIMESTAMP, 'credit_card');


-- Inserting sample reviews
INSERT INTO review (review_id, property_id, user_id, rating, comment, created_at)
VALUES
                  (SELECT property_id FROM property WHERE name = 'Sunny Beach House'), (SELECT user_id FROM user WHERE email = 'sakwa.sila@gmail.com'), 5, 'Amazing stay! The view was breathtaking, and the house was cozy.', CURRENT_TIMESTAMP);


