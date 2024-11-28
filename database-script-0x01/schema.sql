CREATE TABLE user (
    user_id UUID PRIMARY KEY DEFAULT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),  -- Optional field
    role ENUM('guest', 'host', 'admin') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- Timestamp with default value
    INDEX (user_id)  -- Index for user_id
);
CREATE TABLE property (
    property_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),  -- UUID primary key with auto-generation
    host_id UUID,  -- Foreign key referencing the User table
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    pricepernight DECIMAL(10, 2) NOT NULL,  -- Price with two decimal places
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- Timestamp with default value
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,  -- Auto-updated on changes
    INDEX (property_id),  -- Index for property_id
    FOREIGN KEY (host_id) REFERENCES user(user_id)  -- Foreign key constraint to link to User table
);
CREATE TABLE booking (
    booking_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),  -- UUID primary key with auto-generation
    property_id UUID,  -- Foreign key referencing the Property table
    user_id UUID,  -- Foreign key referencing the User table
    start_date DATE NOT NULL,  -- Start date of the booking
    end_date DATE NOT NULL,  -- End date of the booking
    total_price DECIMAL(10, 2) NOT NULL,  -- Total price of the booking
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,  -- Booking status
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- Timestamp when the booking was created
    INDEX (booking_id),  -- Index for booking_id
    FOREIGN KEY (property_id) REFERENCES property(property_id),  -- Foreign key referencing the Property table
    FOREIGN KEY (user_id) REFERENCES user(user_id)  -- Foreign key referencing the User table
);
CREATE TABLE payment (
    payment_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),  -- UUID primary key with auto-generation
    booking_id UUID,  -- Foreign key referencing the Booking table
    amount DECIMAL(10, 2) NOT NULL,  -- Payment amount
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- Timestamp when the payment was made
    payment_method ENUM('credit_card', 'paypal', 'stripe') NOT NULL,  -- Payment method
    INDEX (payment_id),  -- Index for payment_id
    FOREIGN KEY (booking_id) REFERENCES booking(booking_id)  -- Foreign key referencing the Booking table
);
CREATE TABLE review (
    review_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),  -- UUID primary key with auto-generation
    property_id UUID,  -- Foreign key referencing the Property table
    user_id UUID,  -- Foreign key referencing the User table
    rating INTEGER CHECK (rating >= 1 AND rating <= 5) NOT NULL,  -- Rating between 1 and 5
    comment TEXT NOT NULL,  -- The comment left by the user
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- Timestamp when the review was created
    INDEX (review_id),  -- Index for review_id
    FOREIGN KEY (property_id) REFERENCES property(property_id),  -- Foreign key referencing the Property table
    FOREIGN KEY (user_id) REFERENCES user(user_id)  -- Foreign key referencing the User table
);
CREATE TABLE message (
    message_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),  -- UUID primary key with auto-generation
    sender_id UUID,  -- Foreign key referencing the sender's User ID
    recipient_id UUID,  -- Foreign key referencing the recipient's User ID
    message_body TEXT NOT NULL,  -- Message content
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- Timestamp when the message was sent
    INDEX (message_id),  -- Index for message_id
    FOREIGN KEY (sender_id) REFERENCES user(user_id),  -- Foreign key referencing the User table (sender)
    FOREIGN KEY (recipient_id) REFERENCES user(user_id)  -- Foreign key referencing the User table (recipient)
);

