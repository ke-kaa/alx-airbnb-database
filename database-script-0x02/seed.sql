-- Enable UUID extension if not already enabled
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- ===================
-- Insert Users
-- ===================
INSERT INTO "User" (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
(uuid_generate_v4(), 'Alice', 'Johnson', 'alice@example.com', 'hashed_pwd1', '1234567890', 'host'),
(uuid_generate_v4(), 'Bob', 'Smith', 'bob@example.com', 'hashed_pwd2', '2345678901', 'guest'),
(uuid_generate_v4(), 'Carol', 'Davis', 'carol@example.com', 'hashed_pwd3', '3456789012', 'host'),
(uuid_generate_v4(), 'David', 'Brown', 'david@example.com', 'hashed_pwd4', '4567890123', 'guest');

-- ===================
-- Insert Properties
-- ===================
-- Note: Replace host_id with actual UUIDs from your "User" table if running manually
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES
(uuid_generate_v4(), (SELECT user_id FROM "User" WHERE email = 'alice@example.com'), 'Cozy Cottage', 'A cozy cottage in the mountains.', 'Asheville, NC', 120.00),
(uuid_generate_v4(), (SELECT user_id FROM "User" WHERE email = 'carol@example.com'), 'Urban Loft', 'Modern loft in the city center.', 'New York, NY', 200.00);

-- ===================
-- Insert Bookings
-- ===================
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
(
    uuid_generate_v4(),
    (SELECT property_id FROM Property WHERE name = 'Cozy Cottage'),
    (SELECT user_id FROM "User" WHERE email = 'bob@example.com'),
    '2025-07-01', '2025-07-05',
    480.00,
    'confirmed'
),
(
    uuid_generate_v4(),
    (SELECT property_id FROM Property WHERE name = 'Urban Loft'),
    (SELECT user_id FROM "User" WHERE email = 'david@example.com'),
    '2025-07-10', '2025-07-12',
    400.00,
    'pending'
);

-- ===================
-- Insert Payments
-- ===================
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
(
    uuid_generate_v4(),
    (SELECT booking_id FROM Booking WHERE total_price = 480.00),
    480.00,
    'credit_card'
);

-- ===================
-- Insert Reviews
-- ===================
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
(
    uuid_generate_v4(),
    (SELECT property_id FROM Property WHERE name = 'Cozy Cottage'),
    (SELECT user_id FROM "User" WHERE email = 'bob@example.com'),
    5,
    'Wonderful experience! Highly recommended.'
);

-- ===================
-- Insert Messages
-- ===================
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
(
    uuid_generate_v4(),
    (SELECT user_id FROM "User" WHERE email = 'bob@example.com'),
    (SELECT user_id FROM "User" WHERE email = 'alice@example.com'),
    'Hi Alice, is the Cozy Cottage available in August?'
),
(
    uuid_generate_v4(),
    (SELECT user_id FROM "User" WHERE email = 'alice@example.com'),
    (SELECT user_id FROM "User" WHERE email = 'bob@example.com'),
    'Hi Bob, yes, it is available for most of August!'
);
