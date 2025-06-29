# ER Diagram Requirements - Airbnb Clone

This document outlines the entities, attributes, and relationships for the Airbnb clone project, as defined in the database specification.

---

## ✅ Entities and Attributes

### 1. **User**
- `user_id` (Primary Key, UUID)
- `first_name` (VARCHAR, NOT NULL)
- `last_name` (VARCHAR, NOT NULL)
- `email` (VARCHAR, UNIQUE, NOT NULL)
- `password_hash` (VARCHAR, NOT NULL)
- `phone_number` (VARCHAR, NULL)
- `role` (ENUM: guest, host, admin, NOT NULL)
- `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

---

### 2. **Property**
- `property_id` (Primary Key, UUID)
- `host_id` (Foreign Key → User.user_id)
- `name` (VARCHAR, NOT NULL)
- `description` (TEXT, NOT NULL)
- `location` (VARCHAR, NOT NULL)
- `pricepernight` (DECIMAL, NOT NULL)
- `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
- `updated_at` (TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP)

---

### 3. **Booking**
- `booking_id` (Primary Key, UUID)
- `property_id` (Foreign Key → Property.property_id)
- `user_id` (Foreign Key → User.user_id)
- `start_date` (DATE, NOT NULL)
- `end_date` (DATE, NOT NULL)
- `total_price` (DECIMAL, NOT NULL)
- `status` (ENUM: pending, confirmed, canceled, NOT NULL)
- `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

---

### 4. **Payment**
- `payment_id` (Primary Key, UUID)
- `booking_id` (Foreign Key → Booking.booking_id)
- `amount` (DECIMAL, NOT NULL)
- `payment_date` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
- `payment_method` (ENUM: credit_card, paypal, stripe, NOT NULL)

---

### 5. **Review**
- `review_id` (Primary Key, UUID)
- `property_id` (Foreign Key → Property.property_id)
- `user_id` (Foreign Key → User.user_id)
- `rating` (INTEGER, CHECK rating BETWEEN 1 AND 5, NOT NULL)
- `comment` (TEXT, NOT NULL)
- `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

---

### 6. **Message**
- `message_id` (Primary Key, UUID)
- `sender_id` (Foreign Key → User.user_id)
- `recipient_id` (Foreign Key → User.user_id)
- `message_body` (TEXT, NOT NULL)
- `sent_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

---

## 🔗 Relationships Between Entities

- A **User** can be:
  - A **Host** (owns multiple properties)
  - A **Guest** (makes bookings)
- A **Property** is created by a **Host** (`host_id`)
- A **Booking** links a **User** to a **Property**
- A **Payment** is linked to a **Booking**
- A **Review** is written by a **User** for a **Property**
- A **Message** is sent between **Users**

### Relationship Summary

| Relationship         | From Entity | To Entity    | Cardinality     |
|----------------------|-------------|--------------|-----------------|
| Hosts                | User        | Property     | One-to-Many     |
| Makes Booking        | User        | Booking      | One-to-Many     |
| Has Booking          | Property    | Booking      | One-to-Many     |
| Has Payment          | Booking     | Payment      | One-to-One      |
| Writes Review        | User        | Review       | One-to-Many     |
| Reviews Property     | Property    | Review       | One-to-Many     |
| Sends Message        | User        | Message      | One-to-Many     |
| Receives Message     | User        | Message      | One-to-Many     |

---

## 🖼️ ER Diagram

The ER diagram visually represents the entities and their relationships. You can find the visual diagram in the file:  
📍 `ERD/erd.png`

To view or edit this diagram:
- Open [https://draw.io](https://draw.io) or [https://app.diagrams.net](https://app.diagrams.net)
- Import the file or recreate using the entity list above

---

## 📌 Notes

- All primary keys are UUIDs for uniqueness across distributed systems
- Foreign key constraints ensure relational integrity
- ENUMs are used to enforce role and status domain values

