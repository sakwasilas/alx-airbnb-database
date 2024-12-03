 # user

### most used column

. userid

. email

# booking

### most used column

. booking id  

. user _id

. property_id

. start date

# property 

### most used column 

. property_id

. location


-- User Table Indexes
## CREATE INDEX idx_user_email ON User(email);

 CREATE INDEX idx_user_id ON User(id);

## Booking Table Indexes

CREATE INDEX idx_booking_user_id ON Booking(user_id);

CREATE INDEX idx_booking_property_id ON Booking(property_id);

CREATE INDEX idx_booking_booking_date ON Booking(booking_date);

## Property Table Indexes

CREATE INDEX idx_property_location ON Property(location);

CREATE INDEX idx_property_id ON Property(id);

. Save the above SQL commands in database_index.sql.

